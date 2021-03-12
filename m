Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB113394E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhCLR37 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:29:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbhCLR3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:35 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23839C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:35 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id b18so5237934wrn.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 09:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/1m3DWd44KCU/zJg1w1e4xe6C62w7x/Ijni5XUJONA=;
        b=FNuYEYjDs1UT59nWsAKz9Lg4Jz8xgrT5SkAoHr1/wu6p2w3HyunTxx3fsrk8uZuvay
         1P19KDaIMbkkLySOqaNZkkkq1I4NYKd01UaRJ1a6ExAV3bi2/pi9TGfjmWCkgf0BeaWm
         fVB8ulPD3aqs63ICpiykYthyBksI8s3lgVLF6wsPnEEvMHbYwJelhMwvC9hPjnWKn+Bn
         13AgUOdPbCPaXyhNDjfCqC8VeXwJWGWkJaxq9Mol8kh4ui3tqKC6VsWcJGfjyDiHGoke
         1/Oa2oFXwb6GbuFLcQj2yfTd3KHcQrO3nCXVPk6fThO5yNt7xIPqeB3uclMEmxSFuVxg
         Xiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/1m3DWd44KCU/zJg1w1e4xe6C62w7x/Ijni5XUJONA=;
        b=n158av84vVMdch8y/87I7qlBVdxyNU055DtnNPnSApp8wJ4PaJ95+ocv6kpUPPPCU3
         Jo986AXB33ppPjo7BeltYG1V62GgMsIsKquIXkp4BsXgaRsGxuBrp0FKgGSLLXz+94Pb
         PvycrGLWvuD/FD785B5OUiCKDfLlAbx6hlAnmzUfJj24IieO4jqa26AM8Rx87l0ab7G4
         hcc0NQAnO7obQcNm/d51bxOoB1uoZRydWY0O+17YvFFwnKWIg3GXk3hbsRrGFG2RbQRF
         MF5Yr85BhHSDIdImQ+fU+chJP2VjxLKE6nWWeZof344JabQq/2PFScAvMbK5AMxF0WD9
         XvdA==
X-Gm-Message-State: AOAM532fk5cgi1eYyyfLQ6qRaCE4DzokbJtVfcEwF/+RS4jLiLD/iIbZ
        yZVskaqR5lnRU+tDAkq+1PSO1pBKAPo1K4EM
X-Google-Smtp-Source: ABdhPJwqnzM6/MjhX3uQPVJnfItZsgWrdBVMO7JzqVrmnZuc5Lg49wOrNX1DCpOp/elrHgUanNBAKw==
X-Received: by 2002:a05:6000:188b:: with SMTP id a11mr14903239wri.151.1615570173869;
        Fri, 12 Mar 2021 09:29:33 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:33 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 22/25] media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
Date:   Fri, 12 Mar 2021 17:30:36 +0000
Message-Id: <20210312173039.1387617-23-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

