Return-Path: <linux-arm-msm+bounces-73915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E60B7E934
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C544F520F04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 12:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89AA337EAE;
	Wed, 17 Sep 2025 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sbPRnCzS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95A30CB38
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113338; cv=none; b=t3+Upprj85MtTnNTKML0Sqg8Dj5/pFNkDftgWOKR1po7fiz3uX1IGUvQlFc3lGfQFO3bLZfhzpw0LEDCZHZikHrQ/5LNhhMs6qb1khwPJgFADbUpuElqeCOy55Lslk070e2q/zaIgnygKu4UHb9kV9l2Asjr5U9df38EAw0r/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113338; c=relaxed/simple;
	bh=k6s8eMZvnhOVR/zXL7wOLhhDxYW9Jx2QLAQ3+tURXt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/NMQSbXlj/40w5Abv3Yxyf56MGam/+ymG37FKnZXkBDq2th1QZZ/5beI1TpyqfKeNH+NNjhpKLyKohyPWNbTrCEigAMHHY3EicIHbNezyJ51K3x57rQ46+pfo48/27PQ8+yVu6ycMOB3rJ9DIZEzvTDtAU6K9MLVtUDun9Y8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sbPRnCzS; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758113335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TiaWWMmA4l2mfP0OCdPgQRCb3x/JTIPqidsTLh1XN9s=;
	b=sbPRnCzSsxxCrzazynSe3H4/b8rEeOMKddP2ipR3Tp80bBarLrRs44lF8/Y6AUeDSLcZ26
	v++lr0DMKLkvgujFYOzfLWo45B2DPQkLl95HuPxipNSGbG6O/yUQ/IOZM5tD4V9KiHt7XD
	hl5hMNfLdMhlgfTbZl/+rObFa9FeeJ4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] accel/qaic: Replace kcalloc + copy_from_user with memdup_array_user
Date: Wed, 17 Sep 2025 14:48:06 +0200
Message-ID: <20250917124805.90395-4-thorsten.blum@linux.dev>
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace kcalloc() followed by copy_from_user() with memdup_array_user()
to improve and simplify both __qaic_execute_bo_ioctl() and
qaic_perf_stats_bo_ioctl().

In __qaic_execute_bo_ioctl(), return early if an error occurs and remove
the obsolete 'free_exec' label.

Since memdup_array_user() already checks for multiplication overflow,
remove the manual check in __qaic_execute_bo_ioctl(). Remove any unused
local variables accordingly.

Since 'ret = copy_from_user()' has been removed, initialize 'ret = 0' to
preserve the same return value on success.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/accel/qaic/qaic_data.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 202bdca58847..adabc4028bb2 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1295,8 +1295,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	int usr_rcu_id, qdev_rcu_id;
 	struct qaic_device *qdev;
 	struct qaic_user *usr;
-	u8 __user *user_data;
-	unsigned long n;
 	u64 received_ts;
 	u32 queue_level;
 	u64 submit_ts;
@@ -1309,20 +1307,12 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	received_ts = ktime_get_ns();
 
 	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
-	n = (unsigned long)size * args->hdr.count;
-	if (args->hdr.count == 0 || n / args->hdr.count != size)
+	if (args->hdr.count == 0)
 		return -EINVAL;
 
-	user_data = u64_to_user_ptr(args->data);
-
-	exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
-	if (!exec)
-		return -ENOMEM;
-
-	if (copy_from_user(exec, user_data, n)) {
-		ret = -EFAULT;
-		goto free_exec;
-	}
+	exec = memdup_array_user(u64_to_user_ptr(args->data), args->hdr.count, size);
+	if (IS_ERR(exec))
+		return PTR_ERR(exec);
 
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
@@ -1383,7 +1373,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 unlock_usr_srcu:
 	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
-free_exec:
 	kfree(exec);
 	return ret;
 }
@@ -1736,7 +1725,8 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 	struct qaic_device *qdev;
 	struct qaic_user *usr;
 	struct qaic_bo *bo;
-	int ret, i;
+	int ret = 0;
+	int i;
 
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
@@ -1757,18 +1747,12 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 		goto unlock_dev_srcu;
 	}
 
-	ent = kcalloc(args->hdr.count, sizeof(*ent), GFP_KERNEL);
-	if (!ent) {
-		ret = -EINVAL;
+	ent = memdup_array_user(u64_to_user_ptr(args->data), args->hdr.count, sizeof(*ent));
+	if (IS_ERR(ent)) {
+		ret = PTR_ERR(ent);
 		goto unlock_dev_srcu;
 	}
 
-	ret = copy_from_user(ent, u64_to_user_ptr(args->data), args->hdr.count * sizeof(*ent));
-	if (ret) {
-		ret = -EFAULT;
-		goto free_ent;
-	}
-
 	for (i = 0; i < args->hdr.count; i++) {
 		obj = drm_gem_object_lookup(file_priv, ent[i].handle);
 		if (!obj) {
-- 
2.51.0


