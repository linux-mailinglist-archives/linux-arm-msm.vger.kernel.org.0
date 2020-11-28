Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8F92C7390
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgK1Vt4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733051AbgK1TFK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 14:05:10 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0D4C08E9AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:39:58 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w202so6316640pff.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 22:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+PjjMNWnQqLDnUR6fnAoKWV02RdoJuew9jsZKELaNg=;
        b=cneVrfCDK/noHc25kznwhuAPvpDD9uvhG3sZZFhAaMfOOle5wF+DJuLIgvO+UNGAwJ
         5kbRszeKTgimtJqalm8oPpnfH9zwNp7XQdzgzBlv+D3vkEWvj+IdJUEExo74j41w7yWT
         PjU1JAgYR5N0Ds55lRFLLcKPzGmRPm9Kp6RAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a+PjjMNWnQqLDnUR6fnAoKWV02RdoJuew9jsZKELaNg=;
        b=trC8Qf0q0D2cVyo60fry1D0i1Lg9ock13SrhQrsQbicNlL4wCZEPpEQTSDc63VmQpv
         u3DD2DKlVJvBJb7BtD4dyp+yBfng2JdeG30mMNpKvY3XbjmDX2cTCOg4ZQSB+k+i9GbV
         oL2dwp/KdCvsf5X1C0Ika/Z5LcLbosjSWub0bb8FW2Sr4OsCoAMHjdRQtWZd8o7ekmZg
         MHtToBJkcU8AQgPRRqTzf684EVuoXe+eUSfxD9rZfiFPkVHdmLiK97SSP5NGB+u1WDTz
         agZovuT2BQoOf2AAoihzuyuRkea+iAgGDeNszJjchNCjyBNoFh7+Nsqp/KmAPU/r8bE/
         4eJw==
X-Gm-Message-State: AOAM531HwN6i6eMc+xA8C5TEftauqusmdPsr/ZfWf5N7UOqYq+xWaW9b
        en9tRnnt0ikS8akIlCS3abR83A==
X-Google-Smtp-Source: ABdhPJxCcibo1ZR86OW9T96Z5wpejOumnpTZgUCw0xAe8HbpYVTWLgRf/S/kKsGfAQQSPopIXCZcIw==
X-Received: by 2002:a65:64c9:: with SMTP id t9mr7455023pgv.418.1606545597516;
        Fri, 27 Nov 2020 22:39:57 -0800 (PST)
Received: from localhost (56.72.82.34.bc.googleusercontent.com. [34.82.72.56])
        by smtp.gmail.com with ESMTPSA id j69sm9255942pfd.37.2020.11.27.22.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 22:39:56 -0800 (PST)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stanimir.varbanov@linaro.org, vgarodia@codeaurora.org,
        mansur@codeaurora.org, acourbot@chromium.org
Cc:     Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] venus: vdec: Handle DRC after drain
Date:   Sat, 28 Nov 2020 06:36:30 +0000
Message-Id: <20201128063629.1830702-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the DRC is near the end of the stream the client
may send a V4L2_DEC_CMD_STOP before the DRC occurs.
V4L2_DEC_CMD_STOP puts the driver into the
VENUS_DEC_STATE_DRAIN state.  DRC must be aware so
that after the DRC event the state can be restored
correctly.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>

---

This is an attempt to fix the logic for when a DRC occurs
after the driver is in VENUS_DEC_STATE_DRAIN state.  This
works for me, but I'm not sure if I covered all the cases.
Specifically I'm not sure if I reset |drain_active| in all
the right places.

 drivers/media/platform/qcom/venus/core.h |  1 +
 drivers/media/platform/qcom/venus/vdec.c | 19 +++++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 2b0899bf5b05f..1680c936c06fb 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -406,6 +406,7 @@ struct venus_inst {
 	unsigned int core_acquired: 1;
 	unsigned int bit_depth;
 	bool next_buf_last;
+	bool drain_active;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 5671cf3458a68..7edbefbd75210 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -523,8 +523,10 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		ret = hfi_session_process_buf(inst, &fdata);
 
-		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
+		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING) {
 			inst->codec_state = VENUS_DEC_STATE_DRAIN;
+			inst->drain_active = true;
+		}
 	}
 
 unlock:
@@ -976,10 +978,14 @@ static int vdec_start_capture(struct venus_inst *inst)
 
 	inst->codec_state = VENUS_DEC_STATE_DECODING;
 
+	if (inst->drain_active)
+		inst->codec_state = VENUS_DEC_STATE_DRAIN;
+
 	inst->streamon_cap = 1;
 	inst->sequence_cap = 0;
 	inst->reconfig = false;
 	inst->next_buf_last = false;
+	inst->drain_active = false;
 
 	return 0;
 
@@ -1105,6 +1111,7 @@ static int vdec_stop_capture(struct venus_inst *inst)
 		/* fallthrough */
 	case VENUS_DEC_STATE_DRAIN:
 		inst->codec_state = VENUS_DEC_STATE_STOPPED;
+		inst->drain_active = false;
 		/* fallthrough */
 	case VENUS_DEC_STATE_SEEK:
 		vdec_cancel_dst_buffers(inst);
@@ -1304,8 +1311,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 
 			v4l2_event_queue_fh(&inst->fh, &ev);
 
-			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
+			if (inst->codec_state == VENUS_DEC_STATE_DRAIN) {
+				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
+			}
 		}
 
 		if (!bytesused)
@@ -1429,11 +1438,17 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 	case EVT_SYS_EVENT_CHANGE:
 		switch (data->event_type) {
 		case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
+			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
+				inst->codec_state = VENUS_DEC_STATE_DECODING;
 			vdec_event_change(inst, data, true);
 			break;
 		case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
+			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
+				inst->codec_state = VENUS_DEC_STATE_DECODING;
 			vdec_event_change(inst, data, false);
 			break;
+		// TODO(fritz) : does HFI_EVENT_RELEASE_BUFFER_REFERENCE also need to
+		// change the codec_state to VENUS_DEC_STATE_DECODING?
 		case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
 			venus_helper_release_buf_ref(inst, data->tag);
 			break;
-- 
2.29.2.454.gaff20da3a2-goog

