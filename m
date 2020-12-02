Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A4D2CB489
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 06:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgLBFfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 00:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgLBFfR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 00:35:17 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBF0C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 21:34:31 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q22so503574pfk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 21:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sik+f/8dnNc/1d+9ZjFIrdy+AbOu+lGJYDKoQ11nPsM=;
        b=cF2fB0qSj0Qccv1ckETTttkVFWJQCbFazEin2dD5sm/QaCmzuwNCeeDjdJEjQ3LB2R
         tNaRfRjvv/Th39pNUwNRM2rCe1fDJ3zQVrwXd3NqUOQWrTeMBJPHp+OnHhhWO5BLOamo
         SUHd7xnm6xOGTuJeJ8VV9zq7OQOAJXIxNQCnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sik+f/8dnNc/1d+9ZjFIrdy+AbOu+lGJYDKoQ11nPsM=;
        b=Hs8llULdbkm4pIRt9fsvLqPhzwR+wkJo16mT9odvBXLp3G15rOlRLaRuYZHdrsoXZW
         OAH2vlUN5w+h6TEcXL/BCzRYsShmel1/ISFB7QwT6ti0GvVGPas9uPJhiY/3/cMl3EzW
         +2RJSKtIFQikm1uON+dTAGmjjfB3vqNNFxRT2TtyzMmMAtpjr8upaplKgGQ8v/bgDdqW
         AFqJOEvU7eh7+SMHToNMNAlWcQQcIMYrWE0q+tr7t540XXCMsWBpruqy1KD+8L3CmeyB
         YcbkhfSlUPSvngIabL/qfVQb3hTZF8oPakCPjGuKrwrNwCiP6+AZyluJ8ez1BZ6Qw3c+
         nD5A==
X-Gm-Message-State: AOAM53049QJ0SLFi5vOHqcjTEsxzvgicf0SDYgjVkX0hxXOjMsPJEGct
        drvtlee4Al3rWkd4icRE2Ghj6g==
X-Google-Smtp-Source: ABdhPJxdZFeHcsUj2az7xMc4Wqg07Kz3W6hTK0O+GYr2ac5nwRTIxLVDdIw45TSLZOhK9xMGYAz7ow==
X-Received: by 2002:a62:a11a:0:b029:18a:df9e:f537 with SMTP id b26-20020a62a11a0000b029018adf9ef537mr1036557pff.29.1606887270467;
        Tue, 01 Dec 2020 21:34:30 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id q72sm730790pfq.62.2020.12.01.21.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 21:34:29 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH] media: venus: preserve DRC state across seeks
Date:   Wed,  2 Dec 2020 14:34:24 +0900
Message-Id: <20201202053424.3286774-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DRC events can happen virtually at anytime, including when we are
starting a seek. Should this happen, we must make sure to return to the
DRC state, otherwise the firmware will expect buffers of the new
resolution whereas userspace will still work with the old one.

Returning to the DRC state upon resume for seeking makes sure that the
client will get the DRC event and will reallocate the buffers to fit the
firmware's expectations.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 8488411204c3..e3d0df7fd765 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -972,7 +972,10 @@ static int vdec_start_output(struct venus_inst *inst)
 
 	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
 		ret = venus_helper_process_initial_out_bufs(inst);
-		inst->codec_state = VENUS_DEC_STATE_DECODING;
+		if (inst->next_buf_last)
+			inst->codec_state = VENUS_DEC_STATE_DRC;
+		else
+			inst->codec_state = VENUS_DEC_STATE_DECODING;
 		goto done;
 	}
 
@@ -1077,8 +1080,10 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
 		fallthrough;
 	case VENUS_DEC_STATE_DRAIN:
-		vdec_cancel_dst_buffers(inst);
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
+		fallthrough;
+	case VENUS_DEC_STATE_SEEK:
+		vdec_cancel_dst_buffers(inst);
 		break;
 	case VENUS_DEC_STATE_DRC:
 		WARN_ON(1);
@@ -1102,6 +1107,7 @@ static int vdec_stop_output(struct venus_inst *inst)
 	case VENUS_DEC_STATE_DECODING:
 	case VENUS_DEC_STATE_DRAIN:
 	case VENUS_DEC_STATE_STOPPED:
+	case VENUS_DEC_STATE_DRC:
 		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
 		inst->codec_state = VENUS_DEC_STATE_SEEK;
 		break;
@@ -1371,6 +1377,7 @@ static void vdec_event_change(struct venus_inst *inst,
 			dev_dbg(dev, VDBGH "flush output error %d\n", ret);
 	}
 
+	inst->next_buf_last = true;
 	inst->reconfig = true;
 	v4l2_event_queue_fh(&inst->fh, &ev);
 	wake_up(&inst->reconf_wait);
-- 
2.29.2.454.gaff20da3a2-goog

