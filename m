Return-Path: <linux-arm-msm+bounces-18943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E428B7522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 14:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A03286434
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EC613D288;
	Tue, 30 Apr 2024 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AonwpukB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED0A13D270
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478467; cv=none; b=OVovFeuqp5XDTYkgGDUoT/1CtgC5YOfrH3/ugT9kc0tA2FWsDRIq5OerVz1XvLYoyZ7Rx6osgz7OeW/ZZx/GhELfOjFGOhAZx4Fglt+7SZjOnJ53nvcc7WU67O3EtdEdxCNXGGTBehWitiqkD4Tw6Fhf3I0b290cJxLjPeUI9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478467; c=relaxed/simple;
	bh=epvHPddoW8cTahPJ8pPZg8pvrnB/jzMqDAMM7RoD2Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMVC9LuOvVioeY7d7hYXPBOWVbp2BEkN/lCIYY5r5HOOB38ysz4pPkFVrbTqKxpaXFj8droDxTWaPRCW0T1CP3bCWczj7538qpZlh1DVnpfuJYF4gTZV7ep+BAUfm7ByPChlSeESdBIj1LBtPeTzPEVO+S/EGqU3P5MjEYmjRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AonwpukB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1q2ejO6T6rBtag1x93WXJsog9Oya4RWvl6aoqimdi9U=; b=Aonwpu
	kBL6N/oL0WSZFupxdnK9liqWdgKdzRe3nr1AgxubtB517kloaCDKmy2xlyoO6DcW
	n1VL0dOKmnql1ki4SXySGXDkbJdwOYIOHlQuiw9WWPF8c/zF+oEUlYi6bKEvpbUE
	JRLpwRabvYsL06cDzNcEqevjdcwrG4yaKqlr4gJTOr0l3bDhoH0nUHgToa/xT7S8
	dmgouclEqVV3/M3eraUrWwf4g5GPSmabiQph3eJlacf13F0XhD1xGGLX0MBBM56K
	Mi9rxOml5Iu0xyi+WS98vDYQG9qOAWKrMSSEBryQzhNz2kiMZDIlU5EmRLuJYg/s
	tb5ad/LRGpRsRFLA==
Received: (qmail 2623489 invoked from network); 30 Apr 2024 14:01:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2024 14:01:04 +0200
X-UD-Smtp-Session: l3s3148p1@y4bSH08XnJZehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] slimbus: qcom-ctrl: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 14:01:00 +0200
Message-ID: <20240430120102.29459-3-wsa+renesas@sang-engineering.com>
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
 drivers/slimbus/qcom-ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 400b7b385a44..c613c7517f99 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -330,7 +330,8 @@ static int qcom_xfer_msg(struct slim_controller *sctrl,
 	void *pbuf = slim_alloc_txbuf(ctrl, txn, &done);
 	unsigned long ms = txn->rl + HZ;
 	u8 *puc;
-	int ret = 0, timeout, retries = QCOM_BUF_ALLOC_RETRIES;
+	int ret = 0, retries = QCOM_BUF_ALLOC_RETRIES;
+	unsigned long time_left;
 	u8 la = txn->la;
 	u32 *head;
 	/* HW expects length field to be excluded */
@@ -374,9 +375,9 @@ static int qcom_xfer_msg(struct slim_controller *sctrl,
 		memcpy(puc, txn->msg->wbuf, txn->msg->num_bytes);
 
 	qcom_slim_queue_tx(ctrl, head, txn->rl, MGR_TX_MSG);
-	timeout = wait_for_completion_timeout(&done, msecs_to_jiffies(ms));
+	time_left = wait_for_completion_timeout(&done, msecs_to_jiffies(ms));
 
-	if (!timeout) {
+	if (!time_left) {
 		dev_err(ctrl->dev, "TX timed out:MC:0x%x,mt:0x%x", txn->mc,
 					txn->mt);
 		ret = -ETIMEDOUT;
-- 
2.43.0


