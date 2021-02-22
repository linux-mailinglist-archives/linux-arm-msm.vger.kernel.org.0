Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF82B321C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 17:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhBVQFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 11:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhBVQE2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 11:04:28 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E1FC0698C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:02:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id t15so19567726wrx.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 08:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfIMQmRvBRAsHIKgJ62jXmImUTOOwe3Pc0x2EfcpNSk=;
        b=hEWXWKPhDeSfVWHshGNtOUU0iYsSSAJfvvHBAyhfWUaMFiktvGTYz9OPLIt00QnLGo
         pVFoI6APUSXZ8xpc9YvJM6NoV9WepPewHba6D+1e5G0i2gegskNlHzLbRDgyTC4KfTSl
         HkHfMi9I+jqtov1QFysGkz2QuWnHXA4VaQXriGk1nl+kyzcS+VHef7y/0yDBP06ylNkC
         gRMEbKGt3P5k6aGnfExKr7x2ztgIJWJCeyWPNADEB+3TDH1Mm3AV2jcgCFOyp4SNmBL1
         QFsuDbf1xTHpo8Esr5k4fP0yDvyRt2bnLoUiuSHyVEcu9ylf8ZAaEYZCL8tQcB1bj2cC
         GawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfIMQmRvBRAsHIKgJ62jXmImUTOOwe3Pc0x2EfcpNSk=;
        b=dIsiLJ2F6sx3r/kh99GRMZXwzyveGEp2kSwuC9h/6bWo98rtwjUcab9TXr9b3+szAT
         Ohmr/tgcTz/pZYD8P5LtA+zZk/d3Liz3jIbDrcTF82OIKSQRi885U+j+objUqsVXW7+m
         TBhi+COIjOllcYmUk+O9xOyuhtjr87Cl2uunRjJiDSFcutPe3H0b4LbwS53lW5x6n0l/
         czlcfyQYH1EJMmQKF1H8ZqQ+Rt8fVt4aREEiZsYKov4fmlBH2I0XfemY1eqRpvPUTiM0
         RWmYTkzrQHLaWmNyeBNGFbkLu33N4tTvLPOuiHciq0oPbavSS0SOmxcFlUd/4rmhQgMq
         UOYA==
X-Gm-Message-State: AOAM53031yEVsEr1Q6aDewDClqUDNnHvU+4ZkNBHFd1TGqV6bvoFalY/
        1Ga39/uMHNzRmdNK69V7vgpVVA==
X-Google-Smtp-Source: ABdhPJxLn5XjxUZXLPTzoNobEktJl6yih4eCxQiU8JO4eWo93BogPLHqHN0uaifeVUsFRC1J2OtB5g==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr22778610wrv.70.1614009721696;
        Mon, 22 Feb 2021 08:02:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:02:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 24/25] media: venus: helper: Decide work mode
Date:   Mon, 22 Feb 2021 16:02:59 +0000
Message-Id: <20210222160300.1811121-25-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Decide work mode for encoder and decoder based on different
use-cases.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 31 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/helpers.h |  2 +-
 drivers/media/platform/qcom/venus/vdec.c    |  2 +-
 drivers/media/platform/qcom/venus/venc.c    |  2 +-
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 49c52ef1084a..49f2667ac5fa 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -18,6 +18,9 @@
 #include "hfi_platform.h"
 #include "hfi_parser.h"
 
+#define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
+#define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
+
 struct intbuf {
 	struct list_head list;
 	u32 type;
@@ -1100,14 +1103,40 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_output_resolution);
 
-int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
+static u32 venus_helper_get_work_mode(struct venus_inst *inst)
+{
+	u32 mode;
+	u32 num_mbs;
+
+	mode = VIDC_WORK_MODE_2;
+	if (IS_V6(inst->core)) {
+		if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+			num_mbs = (ALIGN(inst->height, 16) * ALIGN(inst->width, 16)) / 256;
+			if (inst->hfi_codec == HFI_VIDEO_CODEC_MPEG2 ||
+			    inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ||
+			    num_mbs <= NUM_MBS_720P)
+				mode = VIDC_WORK_MODE_1;
+		} else {
+			num_mbs = (ALIGN(inst->out_height, 16) * ALIGN(inst->out_width, 16)) / 256;
+			if (inst->hfi_codec == HFI_VIDEO_CODEC_VP8 &&
+			    num_mbs <= NUM_MBS_4K)
+				mode = VIDC_WORK_MODE_1;
+		}
+	}
+
+	return mode;
+}
+
+int venus_helper_set_work_mode(struct venus_inst *inst)
 {
 	const u32 ptype = HFI_PROPERTY_PARAM_WORK_MODE;
 	struct hfi_video_work_mode wm;
+	u32 mode;
 
 	if (!IS_V4(inst->core) && !IS_V6(inst->core))
 		return 0;
 
+	mode = venus_helper_get_work_mode(inst);
 	wm.video_work_mode = mode;
 	return hfi_session_set_property(inst, ptype, &wm);
 }
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 98106e6eee85..e6269b4be3af 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -32,7 +32,7 @@ int venus_helper_set_input_resolution(struct venus_inst *inst,
 int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
-int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
+int venus_helper_set_work_mode(struct venus_inst *inst);
 int venus_helper_set_format_constraints(struct venus_inst *inst);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 88ac40ce12e6..903443a7a757 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -647,7 +647,7 @@ static int vdec_output_conf(struct venus_inst *inst)
 	u32 ptype;
 	int ret;
 
-	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
+	ret = venus_helper_set_work_mode(inst);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 6976ed553647..4b5ab0c790c9 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -550,7 +550,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	u32 profile, level;
 	int ret;
 
-	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
+	ret = venus_helper_set_work_mode(inst);
 	if (ret)
 		return ret;
 
-- 
2.29.2

