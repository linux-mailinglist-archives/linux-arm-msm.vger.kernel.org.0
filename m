Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 948C1352971
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234911AbhDBKFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbhDBKFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:41 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F94C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:40 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id j7so4326175wrd.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wJQGwwenDE4M9hF0EuZkXWJRv0JXArf59fuYPMuIEUY=;
        b=fGBQ6tGjniRbyk5Ru/L07+G7FxCdFBx7NIKdnTLLi7r5Y5bmb+nLnpjdu8T1R4swS7
         YJrzYdyF5I7YxugYx8FT9maxoA58rIGZgZTbG254a68WhgpPxVkSi2uNWgM8bqeGQcLV
         1+uO4+kwTz8cPtQT0/MDXVmwN5azRblS4Y9ZobTUcNILhHJT6VvNsFpvB638ahy30hVZ
         fCrZ8e31Ga5bR1BBo3OlWlmBhiC2JIx/XmedATiVQkpGApBbkKNJqcLJNISCkM+u4SSh
         dwS3YK9Sn9XtOUes2ujSBCebk7tS1RahXh6PW1ZJl0JDoxws3VlCgaXyVWZ+Q7LO97zb
         3FUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJQGwwenDE4M9hF0EuZkXWJRv0JXArf59fuYPMuIEUY=;
        b=t6KAkXgEWvXU58o3uvswwhAVfGx0FJhZrUwJl0ePLfFxWFpbAMIq4tmYAiRQMMZql3
         kMuEIlNDwXyUgpOqe7pOtycM/SAbdqTD4gXl11aGXRDl4XUeHS0knobqbK1IK0ZEWG9R
         6q6pbafbFQuX2cCKOS2NBI5y3/oWzNw55VeDrFEmz5dqRJ6xVt93mAFb6od3S183Guiu
         o9NOp4HVPv5b94jovfW3yniMiOy8rwzoDqsYY/gZPsDm5p/JNAvVYgbj4fMwPoZCNfvl
         UcEIqBu5kxew+gbTgdkqSO39Nb9mbKv77CvuhxIvN4Ha4zBzNjFZs7GbhKwLj7izig8J
         JFKw==
X-Gm-Message-State: AOAM532RFksiJyHhGT20ajfsERZ+l+cgW1GAoUr/A2SiO+CcE27M6yNf
        WFFzXT/7A4XlwioDBghlPdxnNw==
X-Google-Smtp-Source: ABdhPJx8JOE7Y6vwSveoCRdo2dkDnsn2iAlX2k7kCJgCT9hRJzRrt/9BQYxlIJAOfHu5Frc6e1uIzg==
X-Received: by 2002:adf:9261:: with SMTP id 88mr14135985wrj.270.1617357939429;
        Fri, 02 Apr 2021 03:05:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:39 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 22/25] media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
Date:   Fri,  2 Apr 2021 11:06:45 +0100
Message-Id: <20210402100648.1815854-23-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Set actual plane alignments to FW with
HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO to calculate
correct buffer size.

bod: Fixed fall-through error in pkt_session_set_property_6xx() switch
     Ensure setting format constraints on 6xx only

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c  | 24 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h  |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c | 13 +++++++++++
 drivers/media/platform/qcom/venus/vdec.c     |  4 ++++
 4 files changed, 42 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8b08632b0296..77ffb8fbb47f 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1103,6 +1103,30 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
+int venus_helper_set_format_constraints(struct venus_inst *inst)
+{
+	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
+	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
+
+	if (!IS_V6(inst->core))
+		return 0;
+
+	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
+	pconstraint.num_planes = 2;
+	pconstraint.plane_format[0].stride_multiples = 128;
+	pconstraint.plane_format[0].max_stride = 8192;
+	pconstraint.plane_format[0].min_plane_buffer_height_multiple = 32;
+	pconstraint.plane_format[0].buffer_alignment = 256;
+
+	pconstraint.plane_format[1].stride_multiples = 128;
+	pconstraint.plane_format[1].max_stride = 8192;
+	pconstraint.plane_format[1].min_plane_buffer_height_multiple = 16;
+	pconstraint.plane_format[1].buffer_alignment = 256;
+
+	return hfi_session_set_property(inst, ptype, &pconstraint);
+}
+EXPORT_SYMBOL_GPL(venus_helper_set_format_constraints);
+
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs)
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 351093845499..98106e6eee85 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -33,6 +33,7 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
+int venus_helper_set_format_constraints(struct venus_inst *inst);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs);
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 558510a8dfc8..0bcd434e7876 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1249,6 +1249,19 @@ pkt_session_set_property_6xx(struct hfi_session_set_property_pkt *pkt,
 	pkt->data[0] = ptype;
 
 	switch (ptype) {
+	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO: {
+		struct hfi_uncompressed_plane_actual_constraints_info *in = pdata;
+		struct hfi_uncompressed_plane_actual_constraints_info *info = prop_data;
+
+		info->buffer_type = in->buffer_type;
+		info->num_planes = in->num_planes;
+		info->plane_format[0] = in->plane_format[0];
+		if (in->num_planes > 1)
+			info->plane_format[1] = in->plane_format[1];
+
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		break;
+	}
 	case HFI_PROPERTY_CONFIG_HEIC_FRAME_QUALITY: {
 		struct hfi_heic_frame_quality *in = pdata, *cq = prop_data;
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 5cefa396f2b5..fdc9984acb70 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -706,6 +706,10 @@ static int vdec_output_conf(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	ret = venus_helper_set_format_constraints(inst);
+	if (ret)
+		return ret;
+
 	if (inst->dpb_fmt) {
 		ret = venus_helper_set_multistream(inst, false, true);
 		if (ret)
-- 
2.30.1

