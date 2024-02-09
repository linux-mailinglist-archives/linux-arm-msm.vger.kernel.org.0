Return-Path: <linux-arm-msm+bounces-10391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3D84FE6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98CE0283D33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04E824A1C;
	Fri,  9 Feb 2024 21:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qC+7pgNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0E3DBBE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513015; cv=none; b=KA6W79qC3rxXR2MAZ3Tddp2sI7W2UB4kGigKfn7J3fbZ+vPBO46JzGCVO2tqNhds3oYxrkBE/Hnb84ziErvys4XHRsn6GL6suNyN0BSWyOQ/sNLlCuMUoHJdmaoET6Uo1nZxZkLdkjIY+n2yZuBNQ5bRn324LCYiuu9j5WdB8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513015; c=relaxed/simple;
	bh=/kFnbapgubNRtfX1KEblqNgRWZdEMPDSWK83uPCG7ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6lkKO4dJ2Xo9MVZqfJ5T1Bo8FGg8NLJE4gzJe434S0ExK9LwDg0RBpJiX8Q5ZV3UpTWYIwsYQTHx+Mdr1cSl1/M5ExtbpsxEa6EdijRQNe9TDLTUKbZmrvbR9RrPhBLjyGLEDWMIqjUbfBS/C5J6Lsuw/pFzDTD7/A+383TIZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qC+7pgNL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51171c9f4c0so1677173e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513009; x=1708117809; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8GIqzjr5F0muhdfu+nSlnTYCrXU9jfYOiTVyQ6Sb9U=;
        b=qC+7pgNL2hqTjlyL0taRYFtGe700EWUItg4BXiyX93XWpv1eemsCeLdlJrWgk1WA+y
         B+yXAwliaTjSYMldnkhxlAZWZjzDCIIE9zohzoAXL3ibCGXhlpjNtHdY/AujqE/g779l
         qZSifBUe5tFfLm9eIiNUqvfr5DrFzDbATFcFrvRGVc1abnBwdKzNVEqKTeX0NRfctXdu
         ds5jtJcw+jJ2Pc208J3tv7k4mrR8PrasoWlwQYbg600B3gWxXWr5Wgx2G1A5BeV2TYMZ
         KEdh3B6Gf3KssYdELpBDWlb0f8jH4kviPjRS0tEEEFhb9EaTl2E0vlWTF9sZZgh/heMN
         uGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513009; x=1708117809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8GIqzjr5F0muhdfu+nSlnTYCrXU9jfYOiTVyQ6Sb9U=;
        b=ZehGcGZrqY6J+DAt6VFq/D1OH6MU2fTfgXQ75P6+vUf6VkABRUCw8ijwt+8Uyukrzi
         hYpdI6VPlNh6sMiF/RQ0eDvGR1Y0T6OBUyzEGH0VKP5ersg0Hnqjjc2ux8rrHhupzGep
         BUiWq5GSAgyFLwMIeZTCOO5y2y0VwrEmwK8Vp5ECW59cCWBhyVBsfceu6xXyw2dV9iIe
         TSD8KX+c/MiZMOj92TSSt9seuW6F01B/hxO7AlJfeyfn+AHgTupBjnXNgymq2WMrUQEN
         qAR9zd6fHwDpC+26OGcySUsJH8FfDPhPXrzz8t8B2Sr/hX1O5n7Fb+z45C1KGcWHSohA
         LOTg==
X-Gm-Message-State: AOJu0Yz7YupFjZBOv4ZKAB6a8AvOEpQcv3l63YaSx4DfF+4ScKQvj5Ig
	ecmi4ytblbm9SxFTEv8BNoh5hdNeOGxwpda2uTN0NY9hCcVycJMcihS4e9Y5Q5E=
X-Google-Smtp-Source: AGHT+IFXV3KzQwy58rEP2blWOY14Ikqpib0euEGzIkKjV/J4kBP2N2s4twAQCqgmVWtRV1Jq+SXPXg==
X-Received: by 2002:a19:ee09:0:b0:511:494b:c483 with SMTP id g9-20020a19ee09000000b00511494bc483mr118496lfb.31.1707513009461;
        Fri, 09 Feb 2024 13:10:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoFd23U02RRkhlYViO40gpOFYMCnq7G/cfZ0MZFVFnjHbrNv11wygCqcW+U/f8KFUpjBx8RaHsNERMwGIRWJp00rpzbtxi/MNYPSQ4wpHFIB3hbnIhJV24O7JbN6XT1T31RFaQoOfbb9R6/68uiw/yMqH+EzS2WlOygEGsAqUefY/p1v44PW/dffgdwVqQ3A6UxiQdBHJEmTzMoB0UtYruPdqOTc2UPWbL6vPL8LtalR2mukGZorQ9XUzi01PNhup3ZLlXhCu72g+hbZc33Fc9aDf7AaVjg9vEErr/gxJAPOudKqQuYm/fyItv2AD3F1E4pPWuLF0sXmf3hGEttM/6H5RuHQGr9QaYdDt2nvaUelta2QAhWDU91EiuRf3YNpz7NpEFKUW8nydd9BI73GVchzYddFVga0iRPlA/U8vbF8Zzea8FNvAzkiyyG6RFmNsJkf6BHzmafw9IQ+ts5GE+eSohjm6pWNqBjacWVBDzkarqcoIl215LF6Y1kpG+yabohg==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:56 +0100
Subject: [PATCH v2 12/20] media: venus: core: Remove cp_start
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-12-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512986; l=3274;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=/kFnbapgubNRtfX1KEblqNgRWZdEMPDSWK83uPCG7ls=;
 b=XjNO/TzZnniFSFa+959SHOc3p3ge3qqR+DGSwZyLfroBs3WCkm3oMoczUsS1gsC6BlPMDBGTZ
 xYIgwPIWAcrCFu2HvHqfMCDbLcyvH6GxscR+pstT5S2CYm526//SOmR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

It's hardcoded to be zero. Always. Ever since msm-3.10. Or maybe
even before. Remove it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c     | 4 ----
 drivers/media/platform/qcom/venus/core.h     | 1 -
 drivers/media/platform/qcom/venus/firmware.c | 3 +--
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 06b78e98cebd..65a9e815e6ba 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -647,7 +647,6 @@ static const struct venus_resources sdm660_res = {
 	.vcodec_clks_num = 1,
 	.max_load = 1036800,
 	.hfi_version = HFI_VERSION_3XX,
-	.cp_start = 0,
 	.cp_size = 0x79000000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x28000000,
@@ -716,7 +715,6 @@ static const struct venus_resources sdm845_res_v2 = {
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
 	.dma_mask = GENMASK(31, 29) - 1,
-	.cp_start = 0,
 	.cp_size = 0x70800000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
@@ -760,7 +758,6 @@ static const struct venus_resources sc7180_res = {
 	.hfi_version = HFI_VERSION_4XX,
 	.vpu_version = VPU_VERSION_AR50,
 	.dma_mask = GENMASK(31, 29) - 1,
-	.cp_start = 0,
 	.cp_size = 0x70800000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
@@ -869,7 +866,6 @@ static const struct venus_resources sc7280_res = {
 	.vpu_version = VPU_VERSION_IRIS2_1,
 	.num_vpp_pipes = 1,
 	.dma_mask = GENMASK(31, 29) - 1,
-	.cp_start = 0,
 	.cp_size = 0x25800000,
 	.cp_nonpixel_start = 0x1000000,
 	.cp_nonpixel_size = 0x24800000,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index b1d0687d294f..9dacf533c7ad 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,7 +80,6 @@ struct venus_resources {
 	const enum vpu_version vpu_version;
 	const u8 num_vpp_pipes;
 	const u32 max_load;
-	const u32 cp_start;
 	const u32 cp_size;
 	const u32 cp_nonpixel_start;
 	const u32 cp_nonpixel_size;
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index fe7da2b30482..16e578780be7 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -245,7 +245,6 @@ int venus_boot(struct venus_core *core)
 	if (core->use_tz && res->cp_size) {
 		/*
 		 * Clues for porting using downstream data:
-		 * cp_start = 0
 		 * cp_size = venus_ns/virtual-addr-pool[0] - yes, address and not size!
 		 *   This works, as the non-secure context bank is placed
 		 *   contiguously right after the Content Protection region.
@@ -253,7 +252,7 @@ int venus_boot(struct venus_core *core)
 		 * cp_nonpixel_start = venus_sec_non_pixel/virtual-addr-pool[0]
 		 * cp_nonpixel_size = venus_sec_non_pixel/virtual-addr-pool[1]
 		 */
-		ret = qcom_scm_mem_protect_video_var(res->cp_start,
+		ret = qcom_scm_mem_protect_video_var(0,
 						     res->cp_size,
 						     res->cp_nonpixel_start,
 						     res->cp_nonpixel_size);

-- 
2.43.0


