Return-Path: <linux-arm-msm+bounces-27599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E896D943B89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 02:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9127E1F21A22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F270189BA0;
	Thu,  1 Aug 2024 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0+K7Ee3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7491D148FF7;
	Thu,  1 Aug 2024 00:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722471296; cv=none; b=WZx+TZ4JNRvVXKhZyMdDksoKHtVnvmfvev5qoO6UP2tSVafe5r51vlTvk4ky+hxsEKyvKQK/eaSiQCJ91YN9lYPtDqjbz6eIq+zsZ2Hul/ieQgtvPE05Q5ARgh4/pOGIhzZa6Vc3Mu4hQmeqoZkWj4sYw0/LBIynb4kHdOLxA6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722471296; c=relaxed/simple;
	bh=yNDcf1nz/viUCSt2Z2NLgPlIUq8zT9C4d3KpnzW1hhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t12VvFa3n++66vnoTp8weQJwmKJJLcQroBin/M7KBT1tKN92iqXfhEgnq83wc9uhskh9c1H2+N9LeCzxK+uqxGS9Vnl211LFR4UUHF/vu8tjX9mcd9Q87QPhVtQinII9uRuXdoQYzWo6Ocnh58i0x+MPxqKGqwKFjxEXg68Tllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0+K7Ee3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60140C32786;
	Thu,  1 Aug 2024 00:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722471296;
	bh=yNDcf1nz/viUCSt2Z2NLgPlIUq8zT9C4d3KpnzW1hhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0+K7Ee3jjeMxOc4X1uYqnKiQvKiLfGJ3jIgdJwiYVpqa1zsXVWIZ4U4m0NGlWVZP
	 882XopvuuLo3wfHYezB28njQhmqyc27VAYtj2SZ8UKQ2RfK9Cg+ZchkQgy/ykStrDk
	 NqdYe22+Fy/izPa2wkX5K4XrvK3c0auHoq/LOW0fGN4BgV8nwF7n27FldNnSzM/obM
	 B4z+1RvMar+BLPOedN4d9nUsL2HHoPTIrO3OmA09kSq5hk9Eh+r5yqZYNs2++Tdtuj
	 G11F4X8Qr0wqcaic29HEtj+AcBMKVLmqJc/uIxBPtKYeqAShKjXQ+hiF16fiRU/g2t
	 +lyY1YK42D9ZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chris Lew <quic_clew@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 060/121] soc: qcom: smem: Add qcom_smem_bust_hwspin_lock_by_host()
Date: Wed, 31 Jul 2024 19:59:58 -0400
Message-ID: <20240801000834.3930818-60-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
Content-Transfer-Encoding: 8bit

From: Chris Lew <quic_clew@quicinc.com>

[ Upstream commit 2e3f0d693875db698891ffe89a18121bda5b95b8 ]

Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
hwspin_lock owned by smem. In the event the remoteproc crashes
unexpectedly, the remoteproc driver can invoke this API to try and bust
the hwspin_lock and release the lock if still held by the remoteproc
device.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Link: https://lore.kernel.org/r/20240529-hwspinlock-bust-v3-3-c8b924ffa5a2@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 7191fa0c087f2..50039e983ebaa 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -359,6 +359,32 @@ static struct qcom_smem *__smem;
 /* Timeout (ms) for the trylock of remote spinlocks */
 #define HWSPINLOCK_TIMEOUT	1000
 
+/* The qcom hwspinlock id is always plus one from the smem host id */
+#define SMEM_HOST_ID_TO_HWSPINLOCK_ID(__x) ((__x) + 1)
+
+/**
+ * qcom_smem_bust_hwspin_lock_by_host() - bust the smem hwspinlock for a host
+ * @host:	remote processor id
+ *
+ * Busts the hwspin_lock for the given smem host id. This helper is intended
+ * for remoteproc drivers that manage remoteprocs with an equivalent smem
+ * driver instance in the remote firmware. Drivers can force a release of the
+ * smem hwspin_lock if the rproc unexpectedly goes into a bad state.
+ *
+ * Context: Process context.
+ *
+ * Returns: 0 on success, otherwise negative errno.
+ */
+int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
+{
+	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
+	if (host == SMEM_HOST_APPS || host >= SMEM_HOST_COUNT)
+		return -EINVAL;
+
+	return hwspin_lock_bust(__smem->hwlock, SMEM_HOST_ID_TO_HWSPINLOCK_ID(host));
+}
+EXPORT_SYMBOL_GPL(qcom_smem_bust_hwspin_lock_by_host);
+
 /**
  * qcom_smem_is_available() - Check if SMEM is available
  *
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index a36a3b9d4929e..03187bc958518 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -14,4 +14,6 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
 
+int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
+
 #endif
-- 
2.43.0


