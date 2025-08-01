Return-Path: <linux-arm-msm+bounces-67398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A75B184A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D17A81AFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 15:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D5727381C;
	Fri,  1 Aug 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HC9dgprM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFE12701CE
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754060926; cv=none; b=ZXbyoVMyR57uedJZ4MZEtwebYoTxHomUsAnrATemsOcfHsIY6bGOV2VVMWMqIxNUVtoTTTNLLrl7mF0fTu0+LBHaNLJ2H2tWoA8BTTcR3JTyEqOQjpYp32Nf1Hye47y14eFWFva9sBN8hotqp9ZNvaRsomHgWoxceOcaZb3zMbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754060926; c=relaxed/simple;
	bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EHoSrcsjI1apUqRuXGZWEieVsUQr6Wwq3uJInskt94KgWWCElGh8hz5yJDlC9szAozP2wr5hvjPF3agoFSLd9YLlME6oRagNaCu4IRErfMpyYWK2Y7BnY3UTl0h+jktNUqDrJ+8Z1QT7t2ZIlsANkQF9+rB2OeuK/CKbTwG/UMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HC9dgprM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2401b855635so14638985ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754060924; x=1754665724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=HC9dgprMTnPspTaSdJseibHLteOuIx4LRTwnOA1DLycfygzEEA2mSdiTgDdITJ73JU
         yNUK8tA+/E8T4nF7D+kjaKoHe4Mf+JBRGZR0ZLQCkCzl+sRRXhoYca26zur2Br3BeVwb
         pShGGLM4FzSpU/wrR3FWcsPsc/rBojoKMpgELn6pC712AyeBhQbBMvQrMPEk9thtz7TR
         THfG+Ht+cdM8cx/8HhULC3kFIn+IG3wiTFZcQRCcacJMEMZWb2YKjAdQ43JQDCZhZ4n0
         YHdRc0wUii6nBd3n2FmaxSVHDVQAu5OXTIfWzw72stT1wkxxpt6BKb+66RN9VLNqxzYe
         KW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754060924; x=1754665724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=NjFVhUfhjT82Nf175GiCPuBigoqEeIHlLDd40su8qyp4O0X42gRHGOtT0s/iAtFgmG
         jbyGxgr/L5RWKszPrxrET7OFIVqpNwI8sulKS6Mdgy8G7C9b/VT+FaRPVKFS/rFGPm5O
         6WtE4G7Z71RORmyHrfrqGhEWyIJ/2MP3exF3TQO19lQpXYXQZNYO6UO+qaewv2QswuRu
         3YahOeeTIw9ln+vHxXirWNhjKFX1oqXBNIMPYTs0s6e5f8Y7+0rg7+4b3fVVRB+pO6Le
         im1IT9IFRRwnkA/tX9OwlNdat39ObOl1w3EnH8V+b/WtPzw+yUND2IwJREPN+EORjxYq
         eAFw==
X-Gm-Message-State: AOJu0YxuGNR3GPVTynqjFPacY9WZlWOzx/ysttrOaqjdLpMjoX5TyPfE
	uQUHhAphnr5rV0FpAZMFs5RSDJvVhN/oz4y0Gc1VIhVX2DpHoww+2wXQ2f62oj3dzaGxeqqaau1
	HeWqOIKUL7Q==
X-Gm-Gg: ASbGncsCYvFK0vo4scPXsnEyrJvhqVa9fzbfCYdYpDyBeWIL21U8dUANi8udvPHZw/J
	PtvqpneduSK2LJWSVBR0Aqx/VclpEogBF48AaCmJqUD431JQuLAP7iLB3p2/qt4uy3kWidz6Qwy
	C0EhTFZSKlnSdtmF6V6UKz+P987QBFTjtdo80iIZl7G3WyVGVMGsTm0d+xiISYztA9yllZxKqqz
	RiqoYfyfXoN4ub0tLrNTkaeRXqZ9Pdg85THBa5OUMD7qsfZujyERKYNXg8fWmgE1QU4wWpwW3tz
	sFF9pckPkDAVp3n+jcw87Ugbn4cVCXYCkNWzW1iFKwwIz22nDJpumLPmHrRob7vo80ZRlR4nZWi
	tEOP5kct6u+NBVOEYaR5J4eIl0vih
X-Google-Smtp-Source: AGHT+IE9UAyxTpK4FvWv3OXz+ocPajVif5bxOvOmnO1SWRMqXt2SsxSVT4XeHmgC4TDkosdykSCiGw==
X-Received: by 2002:a17:903:1b45:b0:23e:3c33:6be8 with SMTP id d9443c01a7336-24096a636bbmr158574575ad.8.1754060923651;
        Fri, 01 Aug 2025 08:08:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:08:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:33 +0800
Subject: [PATCH v14 09/13] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-9-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=Z+E7gfuNEZEyh4WTb79WFYqsnLg0ICLcdnjakTmbZ7RdMP3xs/RcV6+pAzmWVDpHSDX7boNRx
 ItHtGmVpMIDCSCe80J0k77eKAwbUpP/rS2yqTla9dZhdnhtR3pwPrMR
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
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
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
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1


