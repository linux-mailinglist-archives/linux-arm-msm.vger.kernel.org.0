Return-Path: <linux-arm-msm+bounces-78027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24335BF1E1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D21923AC062
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB57E20ADD6;
	Mon, 20 Oct 2025 14:37:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF56720E011;
	Mon, 20 Oct 2025 14:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971045; cv=none; b=urywQ3TaZS+41Pb878fkp3Yw5SZfcAaqk4yG+UOgpSf5HpN7wJWcEK1F9Y6xbHia2c1SpVtG4HIMxXWDs2CywyY2AOnX7+9hdv/Txf5O9xHxA4Pn0Ttryw8yQJ44jx7Oe+NFin8cNmKkgtFHMWMI6/smvT62kgUlLzz2a1ItENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971045; c=relaxed/simple;
	bh=iqkHEBCpELLMuqOPgBOttQb8bsGShLPfWOHh9IOLhis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYtDZTfrXNmOjQ4mESWzV9t8tKLlxCQrkgKk/4DunPwOrRJp9ZjdPnRKByWrNb7dJABRxINGpOwH08xULpOC9sG5AaMbYCRS9mfIV7bXd7hvgW9oazjS6sz9UDmMcwIazRVSU1aFX/UzgDS1joA/EsO8pilz0j2BOhM7Bq3zBck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2222A1063;
	Mon, 20 Oct 2025 07:37:13 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95D9D3F63F;
	Mon, 20 Oct 2025 07:37:20 -0700 (PDT)
Date: Mon, 20 Oct 2025 15:37:18 +0100
From: Leo Yan <leo.yan@arm.com>
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] coresight: ETR: Fix ETR buffer use-after-free issue
Message-ID: <20251020143718.GH281971@e132581.arm.com>
References: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com>

On Mon, Oct 20, 2025 at 05:06:46PM +0800, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.

I struggled to understand how to reproduce the issue under the condition
"if the buffer size is changed and enabled again."

I don't think the flow below where the trace is re-enabled would cause
an issue:

  - Step 1: Enable trace path between ETM0 -> ETR0;
  - Step 2: Change the buffer size for ETR0;
  - Step 3: Disable trace path between ETM0 -> ETR0;
  - Step 4: Enable again trace path between ETM0 -> ETR0.

In this case, step3 releases the buffer and update "drvdata->etr_buf" to
NULL, and step 4 allocates a new buffer and assign it to
"drvdata->etr_buf".

The problem should occur when operating on two trace paths, E.g.,

  - Step 1: Enable trace path between ETM0 -> ETR0;
  - Step 2: Change the buffer size for ETR0;
  - Step 3: Enable trace path between ETM1 -> ETR0;

In step3, the driver releases the existed buffer and allocate a new one.
At the meantime, "drvdata->etr_buf" still holds the buffer allocated in
step 1.

> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Given that we now have a couple of reported issues related to ETR mode,
I'd like to refactor the ETR mode handling and its reference counting
thoroughly.  I've drafted a large change (it's quite big, but we can
split it into small patches if we agree to proceed).

Thanks for reporting the issue!

Leo

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..d0fac958c614 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1241,6 +1241,8 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_buf *sysfs_buf = NULL, *new_buf = NULL, *free_buf = NULL;
 
+	WARN_ON(coresight_get_mode(csdev) != CS_MODE_SYSFS);
+
 	/*
 	 * If we are enabling the ETR from disabled state, we need to make
 	 * sure we have a buffer with the right size. The etr_buf is not reset
@@ -1263,7 +1265,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	}
 
-	if (drvdata->reading || coresight_get_mode(csdev) == CS_MODE_PERF) {
+	if (drvdata->reading) {
 		ret = -EBUSY;
 		goto out;
 	}
@@ -1292,30 +1294,14 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 	int ret = 0;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct etr_buf *sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
+	struct etr_buf *sysfs_buf;
 
+	sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
 	if (IS_ERR(sysfs_buf))
 		return PTR_ERR(sysfs_buf);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-
-	/*
-	 * In sysFS mode we can have multiple writers per sink.  Since this
-	 * sink is already enabled no memory is needed and the HW need not be
-	 * touched, even if the buffer size has changed.
-	 */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		csdev->refcnt++;
-		goto out;
-	}
-
 	ret = tmc_etr_enable_hw(drvdata, sysfs_buf);
-	if (!ret) {
-		coresight_set_mode(csdev, CS_MODE_SYSFS);
-		csdev->refcnt++;
-	}
-
-out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (!ret)
@@ -1735,11 +1721,6 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	 /* Don't use this sink if it is already claimed by sysFS */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		rc = -EBUSY;
-		goto unlock_out;
-	}
 
 	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
 		rc = -EINVAL;
@@ -1759,18 +1740,14 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	 * No HW configuration is needed if the sink is already in
 	 * use for this session.
 	 */
-	if (drvdata->pid == pid) {
-		csdev->refcnt++;
+	if (drvdata->pid == pid)
 		goto unlock_out;
-	}
 
 	rc = tmc_etr_enable_hw(drvdata, etr_perf->etr_buf);
 	if (!rc) {
 		/* Associate with monitored process. */
 		drvdata->pid = pid;
-		coresight_set_mode(csdev, CS_MODE_PERF);
 		drvdata->perf_buf = etr_perf->etr_buf;
-		csdev->refcnt++;
 	}
 
 unlock_out:
@@ -1778,17 +1755,76 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	return rc;
 }
 
+static int tmc_acquire_mode(struct coresight_device *csdev, enum cs_mode mode)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	if (mode != CS_MODE_SYSFS && mode != CS_MODE_PERF)
+		return -EINVAL;
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
+
+	if (coresight_get_mode(csdev) == CS_MODE_DISABLED) {
+		if (!csdev->refcnt)
+			coresight_set_mode(csdev, mode);
+		csdev->refcnt++;
+	} else if (coresight_get_mode(csdev) != mode) {
+		ret = -EBUSY;
+	}
+
+	return csdev->refcnt;
+}
+
+static void tmc_release_mode(struct coresight_device *csdev, enum cs_mode mode)
+{
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
+
+	if (WARN_ON(coresight_get_mode(csdev) != mode))
+		return;
+
+	csdev->refcnt--;
+	if (!csdev->refcnt)
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+}
+
 static int tmc_enable_etr_sink(struct coresight_device *csdev,
 			       enum cs_mode mode, void *data)
 {
+	unsigned long flags;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
+
+	ret = tmc_acquire_mode(csdev, mode);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * For sysfs mode, the higher level mutex ensures exclusively
+	 * enabling sink, it is safe to bail out if this is not the
+	 * first time to enable sink.
+	 *
+	 * A perf session can enable the same sink simultaneously, fall
+	 * through to call tmc_enable_etr_sink_perf() to ensure the sink
+	 * has been enabled.
+	 */
+	if (mode == CS_MODE_SYSFS && ret > 1)
+		return 0;
+
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		return tmc_enable_etr_sink_sysfs(csdev);
+		ret = tmc_enable_etr_sink_sysfs(csdev);
 	case CS_MODE_PERF:
-		return tmc_enable_etr_sink_perf(csdev, data);
+		ret = tmc_enable_etr_sink_perf(csdev, data);
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
+
+	if (ret)
+		tmc_release_mode(csdev, mode);
+
+	return ret;
 }
 
 static int tmc_disable_etr_sink(struct coresight_device *csdev)
@@ -1796,30 +1832,20 @@ static int tmc_disable_etr_sink(struct coresight_device *csdev)
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
-	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	tmc_release_mode(csdev, mode);
 
-	if (drvdata->reading) {
-		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EBUSY;
-	}
+	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock);
 
-	csdev->refcnt--;
-	if (csdev->refcnt) {
-		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	if (csdev->refcnt || drvdata->reading)
 		return -EBUSY;
-	}
 
-	/* Complain if we (somehow) got out of sync */
-	WARN_ON_ONCE(coresight_get_mode(csdev) == CS_MODE_DISABLED);
+	if (drvdata->pid == -1)
+		return 0;
+
 	tmc_etr_disable_hw(drvdata);
-	/* Dissociate from monitored process. */
-	drvdata->pid = -1;
-	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	/* Reset perf specific data */
 	drvdata->perf_buf = NULL;
 
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-
 	dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
 	return 0;
 }

