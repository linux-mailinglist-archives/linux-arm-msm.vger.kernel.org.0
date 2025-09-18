Return-Path: <linux-arm-msm+bounces-74084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00EFB84D5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA8E7C0ED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6162130CB25;
	Thu, 18 Sep 2025 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAr1G4IH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DBD30CB5C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202191; cv=none; b=HCcQxDtKvkTgiAkPMwdykFezbUt0szodsr2GZgK3BcbU8tsNAVSge8um9fDJEBwkFj7B9B1iFfSp5GruCGmIn5Uhq8x4WUGVrH7saZ0DvNQc0xIFVR7CJLPr6bdX+M6JANpbH8nRWUNbzeXlATMYYtjTF3ttkyH0Z84c8WhL4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202191; c=relaxed/simple;
	bh=PRJ+au3DI7HiuWEGK005K0r17ABM8j6SQDUJwlnMCMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGqxNNYMskzC84+uf9o0vkqKJhNnNpehICKdRCdWDzLDu717OGlV3hPLsDgKhAWisZHt81LXnAJD7VPEfj7vKv82n8b6ag2kSLBXXe+5F3oJNNAbYbTvq2zJjD99lwK/vvbftULUuyXjD/8iz7eRKLFPlZZc5CMPb2Yq+Qj26EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bAr1G4IH; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-323266d6f57so980995a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202189; x=1758806989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuRBfqh8CopNeGj4s9JcPIl8SA4pKW/98Tru8VZbruE=;
        b=bAr1G4IHwFwqIfP8XiqxOjqrQOKDyCmF2OyeVQPO1ptRu0jyZ/uWKjcb+ychnESd7u
         SlQjq4mY6QRVIp6blNxHSnKiTfqvp1qbCg8bGDLJ4QxJuzFbIftFg8a2lEdXNTxqq1nG
         Paeagaehi0+IqKZQYzM7wTFHmunwaKbNtTQ16FLZmHoZHzX8FwNwuT86MMEHyg39rKMM
         wLKOg30/EFRZG9nPC/nVMaR0sPCao0v55cV9S6FE72SNayfW9mKyzdrv/2k4xUOzzEg4
         +ZeifKtH6nRnN5yfvb2DmgKqlyDV/X7ZPlNdGOgOoNfhJumTdHd8P8NJTYwSn7Y9URKC
         bDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202189; x=1758806989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuRBfqh8CopNeGj4s9JcPIl8SA4pKW/98Tru8VZbruE=;
        b=DTdRMWsybcUcPksD+IZ2UctIqiekcU/eiYmqmykh9Sx/TPiI+BaXm3poIrp+vGLU1i
         9ZSfiq4fsAW1xH0BcjS4M1EbP933mIDuOIPS7HY6aqYsnfHrnMyPStuakxxzG0rg6+sS
         YaTLjfvEeLbzyvxFZcK0bShex19wjFqdyty/HEmVWKQ0fWV4tFam4UC4ZIrfTqIdKdcS
         46V7ZqeGN77Ro96/mPpPyWO5nd0hxB52/hmzG2S4XRRPhxnV1h+wLimYW+A1RSg1vln4
         FDZ1wLAqlVOx2TbXHGzn97GZLjdzTOlN4ftZXnEAwo8A6y7lmqeqqmyhxQl41WHMqLZK
         E5qw==
X-Gm-Message-State: AOJu0YysFP920VMvth2t65tYhBzIOzOaRctP7TbvQdME1g+tamFMbuvR
	h8AeQiktf5eD0oapH+2Jauyo8CJAuyLAjrujr/pZ8kikAQJNNiD/znVMOJbLwSwjGBI=
X-Gm-Gg: ASbGncvAvWMF1pNn48eayCNa+cZNktTWpw7nJ+jOB/WYzT92bzsbV1C9kUc4PLFaE9V
	NA//SpscqRKNE9HAN2/8vxGQusohB9/sm4XzhrCt+7Y3Vj6LSgB3/x3HVV0kyzwUlPEHTJKCkuG
	6ZSnJu4hE7847CvrW+99TV1w3w2kd9ZQyJbwcWPC6SDoHCyB+8Z2JnazKf66EeI1Afj/SREYrQt
	9qtjU02LvSEXnObE+jUEHrz3JBBf8hKjft+84N6ePxqFvcIeQE9XfRb/EjQu2FnuiNqRBGIxvrE
	g7yPiWN6Zhd/9KY2js8RKvHyjMA7xgDqNzyQVtcoPfrdaPYYimUx4FvZ6suaPV+fyrlnxNQRaOO
	Y+mYaoRzCZjWpKFKwz1Ck+ChuZE9aZ3yZkZTZnIsQyP0A1w==
X-Google-Smtp-Source: AGHT+IHFJ1UXuMDIcizq+VwgouZRP1MpzHNb3lgea1Tc65YVimECTE5UfJoCwJJFEWAwPnexmrET2A==
X-Received: by 2002:a17:90b:4c4c:b0:32e:3e2c:8ad8 with SMTP id 98e67ed59e1d1-32ee3f73a0amr7783868a91.20.1758202188968;
        Thu, 18 Sep 2025 06:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:29:48 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:58 +0800
Subject: [PATCH v16 06/10] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-6-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=PRJ+au3DI7HiuWEGK005K0r17ABM8j6SQDUJwlnMCMI=;
 b=LCib+BVV8wTLxZd2X7O64JU7UwWu9AMDspmPEKtl2onfR7RP0tAEONojfQ5IvOsin/POXyC4Y
 Ua4gKxQopuLDEQAr5K4RUIKczTuh4iGAR4E1AoEZREolcmSf0bb7Cd9
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1318f9e63ef1e7bab078ae17e39d9ed19c04f465..55b83ba6102d38a9ec97bc4d12ad31810e4b261a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2389,7 +2390,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


