Return-Path: <linux-arm-msm+bounces-42746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CC9F7618
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57F8F188FB4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A53C2163B8;
	Thu, 19 Dec 2024 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOoDAwa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94235157A72
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594582; cv=none; b=ojkY6Q/lBQ+I01rVvao+ke8mYZTpZs8wKray4E2P0AByFU9o58Jx3982Ee1QxughF0JZIYDq3uEIzehWf7D+rRKlGCC8grJ0Y5pqJPfLOd4bnwEPJoU7w+tSKXFVBVZNRc7jk1dE6G6J8bQ6w9FLFsQjd0KwYNNw7R5nCA0R3i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594582; c=relaxed/simple;
	bh=H71UugjG5IQJFjXijgWx29ezewCBoV9AAKOOrWRKHwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jR8yUyQoMCTW5+2PeD6Rx+Cv+3CyKQAecALmD1U+nRCTemIQhzHwGkC8+wzmvQVy18lZHn6EzTaqFPo0embdRObeymcBwfs8WubD/9xmTbfL+PdPVmYzovTqpvrBAyQG92raJzQj3bnpWpa3U5EmGeRvBUrCwCPYuhHaD2WJRoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOoDAwa9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21644aca3a0so5549335ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594580; x=1735199380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KnECnBShXY3h8fLirhSC2vujN3PJRN+mScj8HCQ30M=;
        b=QOoDAwa9OoC64KDYxt5fBism4rBuNNGg+MO3vRnBZ8+rDwvvgj1QGqoM48MLAEFbHn
         k5CRkm8mzRddXYSt4NZFqlGPxFu6fNP5loCqpXF+rbOTXb8SJzkQ4mtVu8D1ElInp82v
         FMoLP9XckmAZAlYw173D1vm+8lG9FxPc8ofmRbbT1RPuf2XVXbOSJTZHndual1QP5yKd
         qB8/AhOazsMXiXAtr1qfgFchhgFFH4MfLwllLZ7+GrqlmUgh093m5/6nDfaM8+7ZqzlJ
         p4tGLL8XxtXYgXowdZ1PnzOniSsGgvP7BhIDG/zHChSWSbIWJttXnDMovFPHw2CP5lFC
         0Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594580; x=1735199380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KnECnBShXY3h8fLirhSC2vujN3PJRN+mScj8HCQ30M=;
        b=BccD+EyOABA9xMdHhDgnTKciafR+1nxGwZaYscj6f66HdjJXRIRw80kVeJOvFZ/gtN
         T1ucyWt9lPazIfyQUexRzTfMqNmO9FcnXuZtJo5JL5Lz/oqS7+C8ZmvbVO1T4y8IIjuY
         5K0RGgQDW0o3rvtj7L1dMYQKAdE2OsoO974/PND4hPklb47howBz452Loz1A0E0tsAm0
         SS4OK22Zj4ieRtg0XO0OCK4H07bp3Bsmb97fLW1x3it9SOnt+ByRoogUi9zy37lSJ8eF
         dAOhp3S9wLlQESOU/WkCQxTH/5jtLrqb6S4V7pJfo9trh4Th7IqRIC3edhaO0bhf6kGa
         I8pg==
X-Gm-Message-State: AOJu0Yw072vzqXDjTIEBGa6nyRG9ibl1tppRjRpudaXspkFrKeVlAE+S
	w8Ta15Kchg5vsXNm75l8Ix3JgeS7yXe2JKOVhusVM1Xkj4lLSKBBZFzpa/Td03dWn82udxrsEAL
	+0rAdUg==
X-Gm-Gg: ASbGncuMcwX+fGOOeOed2ptilL1IUMGvE7PZmvYmin8eDCzZGirrEo0H4T7O3aOMK97
	vv8D339CRMDNxLSoN/zYyw/e8mJMHK+QOAenMYgRWJkm1AhhB3t4oCOzXi53vXNzaXa5k+iDl2T
	1B2K8pnSvRmg87tp0VULr4L2Huq/EDENQqIX6URQVvwpV7TkN4WzPwE26LlJdUXlCuZ+vgRU1f0
	fT1hA//H3ys80c+BgykCdS8pFScaUoQe1XYGX6GtBKnxe0swfPK7A==
X-Google-Smtp-Source: AGHT+IEabF9aXtQp3aenhR64WxS1g9cOj/1L2FSLUAESIqxrn8JkRWX1Txmn+76M6Wb3sexpEyps+Q==
X-Received: by 2002:a17:902:d483:b0:216:3c36:69a7 with SMTP id d9443c01a7336-219d96e8fb1mr29034205ad.45.1734594579793;
        Wed, 18 Dec 2024 23:49:39 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:49:39 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:19 +0800
Subject: [PATCH v3 01/15] drm/msm/dpu: Do not fix number of DSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-1-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594567; l=1800;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=H71UugjG5IQJFjXijgWx29ezewCBoV9AAKOOrWRKHwk=;
 b=dUzlSdGY5e36I0gVxFwpQEvjNoLa0A1wdKlZECUaxHkjySXlll3b9Uyws+NzCj8x2f+Y9BgKm
 sggNoaJFPFdAts/tP1G4bwB5pARZ8tdxN6l7vnKa8WC8Acwxaq2KQoZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

If DSC is enabled, the only case is with 2 DSC engines so far. More
usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
So get real number of DSCs to decide whether DSC merge is needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ddc60e658d63f..650df585138cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,6 +164,7 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @num_dscs:			Number of DSCs in use
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
@@ -204,6 +205,7 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+	u32 num_dscs;
 
 	bool wide_bus_en;
 
@@ -622,9 +624,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
 		if (dpu_enc->phys_encs[i])
 			intf_count++;
 
-	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
 	if (dpu_enc->dsc)
-		num_dsc = 2;
+		num_dsc = dpu_enc->num_dscs;
 
 	return (num_dsc > 0) && (num_dsc > intf_count);
 }
@@ -1261,6 +1262,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
+	dpu_enc->num_dscs = num_dsc;
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||

-- 
2.34.1


