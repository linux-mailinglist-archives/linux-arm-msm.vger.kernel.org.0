Return-Path: <linux-arm-msm+bounces-18944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245268B7523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 14:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CF331C22819
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AEB13D26E;
	Tue, 30 Apr 2024 12:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N0haDqpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF95A13F014
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478468; cv=none; b=KjT5tLa6P+zvmKT+JSjYDjFunnpMyAhIqgMTdn9JkYD8ZFKZY6TkjhwJ6Rs53YSv5xPEV9ztRcF+oYZQNtfvBXBgoD9PfS8CWtn2XGNhxc0bgu+zxyRgDAb0abgP9739IkLFYr+qj42hmDJJqjZmrHjl/nIDR1YvArV8AEqgllo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478468; c=relaxed/simple;
	bh=gDpT6Hc1jPudL9uBZtdVkdWFHK/SVqgJ6+WeFAVOPnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+guxcv0MkkA41W3GRD9ADmemPBJb32bsIWDdo/UdqLNb8mQRJPpqTn0mSGNF/nZ8ZCO5KdD7NdSNllLu2+TuoNNwbNQcuTk4XzlftoN5+d1tccBWA9ayKRU+Btjy8SQ3PC6NPzi8FDk3Lzp5tlC+lY6/pOQbk0XVL3ELLX5obU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N0haDqpx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=owc6KVsVgzzTz/FV7NYmF6XOfOcxz0hvsD0eutcgSVw=; b=N0haDq
	pxWXb+XdO8iIPJiHIgxZU8eG9QqxT1yjkGPCZTyFr9Y1BMdQ2m0s/VHsIVnwXdth
	Ak8WrCciQ0AD3lHH7vJKoFvSyczumHHfDfd6FWs7JqLcMuceOffzsaY1/BSOYH2R
	XT0f8ZYRHtyE1go4qbEGMFLy3ymcqoM85XOgi+SBg4XA1ZpbwdWQid1vs6OrxfH8
	1anisMLPNnmD4wygYCbDAbSuxVJWfxOxjNmBn27z2YRMfzFakyxjEeImBSZKW5sj
	wsmT2/W0oenRuM6mCay3F48kqrHQfQze3Zga9gh0phC80vfl5jOPxcPHKHK/Joec
	4CFUWyIoje9PcgaA==
Received: (qmail 2623526 invoked from network); 30 Apr 2024 14:01:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2024 14:01:05 +0200
X-UD-Smtp-Session: l3s3148p1@eA3fH08XoJZehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] slimbus: qcom-ngd-ctrl: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:01:01 +0200
Message-ID: <20240430120102.29459-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index efeba8275a66..21b4008de4f3 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -789,7 +789,8 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	struct qcom_slim_ngd_ctrl *ctrl = dev_get_drvdata(sctrl->dev);
 	DECLARE_COMPLETION_ONSTACK(tx_sent);
 	DECLARE_COMPLETION_ONSTACK(done);
-	int ret, timeout, i;
+	int ret, i;
+	unsigned long time_left;
 	u8 wbuf[SLIM_MSGQ_BUF_LEN];
 	u8 rbuf[SLIM_MSGQ_BUF_LEN];
 	u32 *pbuf;
@@ -891,8 +892,8 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 		return ret;
 	}
 
-	timeout = wait_for_completion_timeout(&tx_sent, HZ);
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(&tx_sent, HZ);
+	if (!time_left) {
 		dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 					txn->mt);
 		mutex_unlock(&ctrl->tx_lock);
@@ -900,8 +901,8 @@ static int qcom_slim_ngd_xfer_msg(struct slim_controller *sctrl,
 	}
 
 	if (usr_msg) {
-		timeout = wait_for_completion_timeout(&done, HZ);
-		if (!timeout) {
+		time_left = wait_for_completion_timeout(&done, HZ);
+		if (!time_left) {
 			dev_err(sctrl->dev, "TX timed out:MC:0x%x,mt:0x%x",
 				txn->mc, txn->mt);
 			mutex_unlock(&ctrl->tx_lock);
@@ -917,7 +918,8 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 				       struct slim_msg_txn *txn)
 {
 	DECLARE_COMPLETION_ONSTACK(done);
-	int ret, timeout;
+	int ret;
+	unsigned long time_left;
 
 	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0)
@@ -929,8 +931,8 @@ static int qcom_slim_ngd_xfer_msg_sync(struct slim_controller *ctrl,
 	if (ret)
 		goto pm_put;
 
-	timeout = wait_for_completion_timeout(&done, HZ);
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(&done, HZ);
+	if (!time_left) {
 		dev_err(ctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 				txn->mt);
 		ret = -ETIMEDOUT;
@@ -1169,11 +1171,12 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 	enum qcom_slim_ngd_state cur_state = ctrl->state;
 	struct qcom_slim_ngd *ngd = ctrl->ngd;
 	u32 laddr, rx_msgq;
-	int timeout, ret = 0;
+	int ret = 0;
+	unsigned long time_left;
 
 	if (ctrl->state == QCOM_SLIM_NGD_CTRL_DOWN) {
-		timeout = wait_for_completion_timeout(&ctrl->qmi.qmi_comp, HZ);
-		if (!timeout)
+		time_left = wait_for_completion_timeout(&ctrl->qmi.qmi_comp, HZ);
+		if (!time_left)
 			return -EREMOTEIO;
 	}
 
@@ -1218,8 +1221,8 @@ static int qcom_slim_ngd_power_up(struct qcom_slim_ngd_ctrl *ctrl)
 				ngd->base + NGD_RX_MSGQ_CFG);
 	qcom_slim_ngd_setup(ctrl);
 
-	timeout = wait_for_completion_timeout(&ctrl->reconf, HZ);
-	if (!timeout) {
+	time_left = wait_for_completion_timeout(&ctrl->reconf, HZ);
+	if (!time_left) {
 		dev_err(ctrl->dev, "capability exchange timed-out\n");
 		return -ETIMEDOUT;
 	}
-- 
2.43.0


