Return-Path: <linux-arm-msm+bounces-108993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGD9NhXRDmrOCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:32:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5001B5A2642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42ECD30D3C26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D2D3769F7;
	Thu, 21 May 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnr77VPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8102C377EBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355510; cv=none; b=eTu8GW98IqaB5t5dwMpttR83Hf9/wi+Oyqec/l7UAIdc0Ed10yRxT+9wP1xZaZliZu869xShNP2zpqLr5U+pUPU2xjCF2p12uKhY5TjNtTCDr1F/s7CfRSVJjslN9diQ6wMj4DZaxtzzVBliLi5z3g6vgYy7bz4l1CpR8QjVCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355510; c=relaxed/simple;
	bh=CTFTmouZYmRT/XjZjK1PSK6/Ti4OEFzaln+Rasgs8So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGSDFB5urxew9o2hjPq8iQfwkkggCtom32Pe9OcMs9UEtW+hl6GP7/7Of/CJ2i5JsrEh30a0gyVUuBvouZYdFq1F5P9aJP8xPHuvSN9+vVX7Hl1Gc8Nnvipa3srLNaCWdz/D/1Z5v58WzZXv+gbr2ytrOR0B/HVplkKjG5QkqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnr77VPf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so33570955e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355505; x=1779960305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tT5b2xPFTEeIqCWOktjj/HJHE/WMC6br0sd4CSAIaRQ=;
        b=nnr77VPf3bxQ6X71jJTaYX1dv6TXE5Ewr5ZxdLI/pInz8ahOHbDfS4b9BOlAnXkBpy
         +1lyTe3CRz4Fi8Sd8s70HQavTEiHlR+HIT2/BfK6OUFB87kT1xzi3ntGXu00zVf1Ph7j
         afeA4Zx/VITnFp6axsy3FPpfQs97yQdVbA8H29/YOLa3OM9740NrFElUHCyxM0VRBWB/
         cr0Ajn2O7A1s7LSfYwK7EFN7tO/Z8cK7iCZ2Z2Mo5AO0zZ3HccRlNLHNfH0Gm6TcfJuN
         hsTzATv9voEBZjw0yFgkmHJ9+I9eDdj0Q8O6RCcmQkt5NdyRDHmEk8nRgIggVSRarx0B
         LFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355505; x=1779960305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tT5b2xPFTEeIqCWOktjj/HJHE/WMC6br0sd4CSAIaRQ=;
        b=PTMGYxY9f4eMuESAcVQJ+v7gmzeSnNftngo8+pYBqwAAoITRcVZgYmmzkCvtO680ah
         Yu098l8PADYHaV1K5ahbWMlrUIlG5h0Es8noQb9MDLY9jjnZKNbYyGTImNEAaHMeOVA/
         UjKs4GgBvZ2UyFVSBt21m70EYwsHvKC0NQIvIH/R2FeDCNiHNhCuwU1iDuTIQQCXA0p4
         PJLS1jFOw+MljStVxbPGQg5Y2f9utsZXQva9K+doX7MgXju4E2voeZ4lhy+EEQY9/gg6
         2h81c47Oku4jW8AKRiqMu6qkaEyl4UmDkYiigYpX1fUKDZbwqoAl6Xc/7rWBhsYTzSgR
         E8CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LMP/Rc4Se9KKhaGOmlcVzHf19nhKGycKGRkJi7gz8/qBc+Z5GC51BaqMFNXpMk5IEULir8+WfLCy5HB2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl1vNgb1OQe05v5vCn//RCeHzIf2ksv0x+B1EiztSgE1MGpuj7
	dcCS9mHHOdWx+eBA3R0unpZbpzzAgxDG5CSah6QFWRkyYUzt4QjAIQ8StAmuXGjqf1ps08EPzl+
	B1zZF
X-Gm-Gg: Acq92OEbcUFbzhERaUzQlGmudVuqxUaC+9E0u1jYfQwYYqxfyuPn2wqK6r6jKNpCEfh
	JnOblwajj651yMI5s+76lb1HtUGYpQ5JLm5KCrgveOYakCFowZ1FAjjnZppmBGsj5M+4FCL4W5f
	Xr79Je7NY46epz9IpgLyEdFPXHOwT9gKUG7TzqMlq1VqgRcrLG1WtBjxmilcgif5Z504TgNixtY
	vlHd8X791BfhpSj7lETD1s3czGhbMyjXRO0l9YU+QmNWicdaKb2CqS1KW2F9GbHOY0/rvtgFNJi
	axm+bKuDCq2/rjLtbhqLduJjyCYor4DmnAFv3c8TwrXajloHFheHO2c+BcTuNfjCexHkCVi9kwS
	wvMPaR9oyBwfCZUx6LDdtErzOl0GIUcUdrO5EzeqAQ9R8vjh4n6D5wRaKQ1tyiFRuhwJq4SrxQI
	yaT1qp9BUT574qlYBDUuekTz5graJp5YgYhzY2vU1hK3jTKL2/bIZbJCU=
X-Received: by 2002:a05:600d:8496:20b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490360dc195mr14506795e9.15.1779355505388;
        Thu, 21 May 2026 02:25:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:25:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 May 2026 11:24:59 +0200
Subject: [PATCH v4 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-6-8ff8fce3f904@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
In-Reply-To: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4879;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CTFTmouZYmRT/XjZjK1PSK6/Ti4OEFzaln+Rasgs8So=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9rs//0uISzent47leU0Cz7PuewC6ya3ZgPCKDs
 2WDWH9KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PawAKCRB33NvayMhJ0cveEA
 CSQZ751E4lrzZ9hdi45ncUrcovP/5omhVdN65qiuk6KAGiQXb24jY/DFK3VGWqxetdPzkOsDpPvU8I
 SbhA9tX2HNsSy6he2I7raNmoBPqDT7rN1c6gCtkoYLx2LAGfPEHuSUiTTx3N1tVe6XHBmxzS7gYCmJ
 cw/YbgHCLFFprLjAhrhwnoFCvYoKhKH0Lw1icV89TpButo1kryN2sP151vIzvB/cczPtkYG63NMDHZ
 +sTAEI5Ery91fOeUcTVQ0uljwph6WAjmN2tK1VVdTsZcKrxTbSo+pwxPXHF9Fxwm80kGCJ8DGfc8QF
 KLS/odLei3JT6lJYJjfAlFMJ0J9jJnNf11/0SZoKxVmlwriQwNuNBvG9Wpl+j/vxiBHJvn2Pk7WCGU
 FVeGcsY5COe4I8HZZE9fyhhqo7J5O6YQpf0aKTl9xee4Z0tzyIRy4qdNceaQxwdoPzS/MTjaM+k2mB
 0OZ1shooxhBW9xaD+61RXq5qCrkHKbuipEti5mif4NpDNrfWFx4Kqy4ZSR3ADnJuNCckCmiFjN8vnH
 JC8axg8RiyOPTYTG/0upNfOLX12HhC+vqItI4B6v4TMZvXYxmjIoJTErXzYLfwRVNlS9gcrTx7cKqa
 tuZvCGNJI+NI6TSAXHl6q0NsCk1vjLc804XDIGVmmWjXWZMyW6qCs+Uj9fJg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108993-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 5001B5A2642
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the necessary bits into the gen2 platforms tables and handlers
to allow decoding streams into 10bit pixel formats.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         |  8 +++++---
 .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
 drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
 drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index ce8490d64854..88c338e64e0d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -31,9 +31,10 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_HEVC,
 		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
 		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
 		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
 		.hfi_id = HFI_PROP_PROFILE,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
@@ -262,7 +263,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = BIT_DEPTH,
 		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
+		.max = BIT_DEPTH_10,
 		.step_or_mask = 1,
 		.value = BIT_DEPTH_8,
 		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
@@ -774,6 +775,7 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_OPB_ENABLE,
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_UBWC_STRIDE_SCANLINE,
 };
 
 static const u32 sm8550_venc_output_config_params[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index aca90aab8548..25162ae71357 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	pixmp_ip->width = width;
 	pixmp_ip->height = height;
 
+	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
+	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
+	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
+		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
+	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
+		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
+		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
+		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
+
 	switch (pixmp_op->pixelformat) {
 	case V4L2_PIX_FMT_P010:
 		pixmp_op->width = ALIGN(width, 128);
@@ -625,7 +634,12 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
 	inst->fw_caps[TIER].value = subsc_params.tier;
 
-	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
+	if (subsc_params.bit_depth == BIT_DEPTH_8)
+		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_8;
+	else
+		inst->fw_caps[BIT_DEPTH].value = BIT_DEPTH_10;
+
+	if ((subsc_params.bit_depth != BIT_DEPTH_8 && subsc_params.bit_depth != BIT_DEPTH_10) ||
 	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
 		dev_err(core->dev, "unsupported content, bit depth: %x, pic_struct = %x\n",
 			subsc_params.bit_depth, subsc_params.coded_frames);
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 352af99699dd..672f02b8f8f8 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -27,6 +27,8 @@ enum iris_fmt_type_out {
 enum iris_fmt_type_cap {
 	IRIS_FMT_NV12,
 	IRIS_FMT_QC08C,
+	IRIS_FMT_TP10,
+	IRIS_FMT_QC10C,
 };
 
 struct iris_fmt {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index f1366a1865c1..39a02d4e5379 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -76,6 +76,14 @@ static const struct iris_fmt iris_vdec_formats_cap[] = {
 		.pixfmt = V4L2_PIX_FMT_QC08C,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 	},
+	[IRIS_FMT_TP10] = {
+		.pixfmt = V4L2_PIX_FMT_P010,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	[IRIS_FMT_QC10C] = {
+		.pixfmt = V4L2_PIX_FMT_QC10C,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
 };
 
 static const struct iris_fmt *

-- 
2.34.1


