Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3E027B22D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 18:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgI1QpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 12:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgI1QpA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 12:45:00 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B01C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 09:44:59 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n22so2107467edt.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2020 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pNVoDDa73nLv4JDe00OIrDQno9iqywhjci+yCQnsgFM=;
        b=tpOXtrfJ6VqKQbgemY+gWrkkQCg60SFpahEx9UlUfOhYznIaJBHKAbmD86vO8D9gjW
         hbTzMywGKfc5142bxSp8+CKOk+zrz2lCn3l7X1ltMDfbDCbQow65cXIMp1vOJYxjGh4u
         wApZ2aX/WzHbv2Tx6FUiiXpZUVScY6FX+kVjtWG+iGhPoysVdt1z8YCQm0e5GMoe8tpF
         dJn7aJ/92C2WXAL2xRIKmS3Tjiv4CzEqc83fF9JaoKSGm8M2LFeWSEDNwsCg46v+n2Rz
         o+ok4U7iN83/jquRfOaOJ8dQHN713fE3u4Zsu0j3sZt6uCftmfj3Kceqyfr4gVedSENw
         +rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pNVoDDa73nLv4JDe00OIrDQno9iqywhjci+yCQnsgFM=;
        b=Lu6NB/z3+T2sQhgXs2h85EcBfwPqIW+9XxUGqwTj3I50eEKUigleCcqRfKLVaCkWEU
         uQ/jHCGEIbC+f6dfADW1I89hk+CVqln3REX/0X/G/wswDBAjTxJeC2lDppPrzGTMSa2K
         /3krEBZvMsB9k88Q67LwuktHFG1FZQ9MytnG3ejYZVFKdBf3XY7t1RAfgyGM/1kuNoUw
         TKV0VvA7taOt6rYkqz+UwM5okI7od3bpZcAL4hkZuYTsXEVoe6hn+eYx2XXuOTb+i8iA
         5t7mQCbqtcqOF5uTCgESaETecZFzDLJ/YxxDNmtVj9ioQH0gvq4HstoUNjvT08EqQuUr
         USug==
X-Gm-Message-State: AOAM531YAWGn4jtFTKDPlGmvmMPa1plBxH2E5PnUM441jNMg8/vh9fpg
        2kUKQoHHKEhGCNx7B4GItn4F7g==
X-Google-Smtp-Source: ABdhPJzGN/BdbHToPVEP3Bq5YaaCW7Rm5XJzg8OCwOnaScyigFfzB88+QpaFm1QnzMtleDWBxdP/AA==
X-Received: by 2002:a05:6402:10c6:: with SMTP id p6mr2804428edu.76.1601311498558;
        Mon, 28 Sep 2020 09:44:58 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id nh1sm1912594ejb.21.2020.09.28.09.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:44:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] venus: vdec: Make decoder return LAST flag for sufficient event
Date:   Mon, 28 Sep 2020 19:44:30 +0300
Message-Id: <20200928164431.21884-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
References: <20200928164431.21884-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes the decoder to behaives equally for sufficient and
insufficient events. After this change the LAST buffer flag will be set
when the new resolution (in dynamic-resolution-change state) is smaller
then the old bitstream resolution.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 41 ++++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index c11bdf3ca21b..c006401255dc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -634,6 +634,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
 	struct hfi_enable en = { .enable = 1 };
+	struct hfi_buffer_requirements bufreq;
 	u32 width = inst->out_width;
 	u32 height = inst->out_height;
 	u32 out_fmt, out2_fmt;
@@ -709,6 +710,22 @@ static int vdec_output_conf(struct venus_inst *inst)
 	}
 
 	if (IS_V3(core) || IS_V4(core)) {
+		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
+		if (ret)
+			return ret;
+
+		if (bufreq.size > inst->output_buf_size)
+			return -EINVAL;
+
+		if (inst->dpb_fmt) {
+			ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT2, &bufreq);
+			if (ret)
+				return ret;
+
+			if (bufreq.size > inst->output2_buf_size)
+				return -EINVAL;
+		}
+
 		if (inst->output2_buf_size) {
 			ret = venus_helper_set_bufsize(inst,
 						       inst->output2_buf_size,
@@ -1327,19 +1344,15 @@ static void vdec_event_change(struct venus_inst *inst,
 	dev_dbg(dev, VDBGM "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
-	if (sufficient) {
-		hfi_session_continue(inst);
-	} else {
-		switch (inst->codec_state) {
-		case VENUS_DEC_STATE_INIT:
-			inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
-			break;
-		case VENUS_DEC_STATE_DECODING:
-			inst->codec_state = VENUS_DEC_STATE_DRC;
-			break;
-		default:
-			break;
-		}
+	switch (inst->codec_state) {
+	case VENUS_DEC_STATE_INIT:
+		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
+		break;
+	case VENUS_DEC_STATE_DECODING:
+		inst->codec_state = VENUS_DEC_STATE_DRC;
+		break;
+	default:
+		break;
 	}
 
 	/*
@@ -1348,7 +1361,7 @@ static void vdec_event_change(struct venus_inst *inst,
 	 * itself doesn't mark the last decoder output buffer with HFI EOS flag.
 	 */
 
-	if (!sufficient && inst->codec_state == VENUS_DEC_STATE_DRC) {
+	if (inst->codec_state == VENUS_DEC_STATE_DRC) {
 		struct vb2_v4l2_buffer *last;
 		int ret;
 
-- 
2.17.1

