Return-Path: <linux-arm-msm+bounces-66854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB0B13B48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7E01899943
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B70A26980B;
	Mon, 28 Jul 2025 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtsnJDXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACCD269CF1
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753708536; cv=none; b=botKOwKBtwezP93TSnlTdRDcQFnAOwZI9Wt2EcRKVIRRS3Da61razCnmUcF/zta3L3T7/AY97sPJ3uIReh6It53rJFrx/N7Cp4xaL19TGRy7FyHV4AteNYvaC10vDb0OQ/bZAHAbg0yKZrIouVOBrXcg3ybaogWeBxhhRaVa7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753708536; c=relaxed/simple;
	bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNdaRJNY5CrFIvM0+Iibx8tTF+u3efSqLMRcVvmkddnsQX3/iPdWllWQwxqiHrGo7j/Mr26O7vdCRL9+jBwWhtA4OoH9AhSNLczSi51fflqVDRFaM6hCiM+oJP4BIffAJ1pN8d7RJF9LWhgf5/5BWiWunJm6d8gUFYP/XE9tk64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtsnJDXz; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748f5a4a423so2960569b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753708534; x=1754313334; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=JtsnJDXzK3DubCNucdEPk0Y7JvNjptojQV0sb5T5T3k9NRqaEwGmJmHGZ2KlFANqLi
         85ouy0v8lpsKPc6cnymU2+NGMihLIfXUfI1W1ZkXVvlWUNMBoO1u1yNx23MAHffea4rS
         6xTJaoD37cdN9P/Y2284wolh5YD3aO78nzWyTPY7mISZFKIoa4fsl+IUPsSZapHDPsSp
         VPgkOj51Yc0Rf49P7pTFMM5VGojLoFYfFJnLOd9/vFpzNhwvJvuRwQvaLsBeuz96Skyc
         8ssBISwHlkFmYEwOFvfoYDpMB+PfMlbBh+x/VoHrJF7bB/AMojw4/HZ31igfjhbG0WjI
         sO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753708534; x=1754313334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=lrPGvvV3v+HGTrUZaoLvqSR69+5zV1fiHKpP6GPjFR7zGeITCuvEyhP76pkwbyb9Vh
         oLsb8NUgfcNS+0nw2CtJZRV3KUMMYH/o6QXNDRHOQ/7GIYPOszO978qe4SNKTgUuufhv
         LMFHs/psqPDgkzdZ3GZ7O0STL+MVEUz3Z2ESvcROn6K5zH8oYifkVECvdvSWlWJPe3LR
         +uIJnUKQT13uFVSHBfaNy1ongHEt82pB9GD8gUrgG5zw0nPwJ4gL947ns+jeq0dfn+cA
         rNHKYv0HxYoVSf2fKOidVsDqtDu+tiB0C8dsdl9BE80uzonQmEVot9bhtGeTAMPWvJL7
         qdUA==
X-Gm-Message-State: AOJu0YwhNg05+tleWiS52TgCqscbrdyyyKVum4YGmaE/zmEBy+M4rVDl
	GO/lr/Cp50PlAcvc0VYayX5qIc416DLRwyG8q19prA8HoM+Xy3Lw3PRYotNiWpUR8Ps=
X-Gm-Gg: ASbGncsXRc6MRn+oeoq1DkeY0ZSSXKJT84FUdIVGBugVUepNfnwx1HXBmK1CH4xoBZs
	fS++DPwJ5Ht6jybkmyIse92IFfyyM8tmuCPoXsoce/bTbcKl8gc9dYIKxU10Ic/zzsMc1ovoqLQ
	svlTu5AEY3YruXdM0D49iqe2ji/vRYc/TwPnrUoSAY+M9DT+Hn8wF6RdN8wig9sXXvCDnauh+Fz
	qyTKQEub4sBhbk6N/lBvxvboOSaYC6Od9r0xkp1APFwBuZjn/I2TxzQx60R4mOlGc7MCOGcncjM
	txxwqFCHqoI3LuTVXQtGDcLAx8TmTGvU1ZtaoOYm0WOWRMOvUUFPxD99leWZe/OoHrJEJiEbMBw
	+EyrL1/V87uOANuwlAQ==
X-Google-Smtp-Source: AGHT+IElrHLNSRkpp4TakILrjVkGR3hmg5svUQ09qVc4AkdHMg4ce49+EeLlHcIrX1twXM5xf+MZYQ==
X-Received: by 2002:a05:6a00:84d:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-763345c684cmr16447602b3a.5.1753708532589;
        Mon, 28 Jul 2025 06:15:32 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 06:15:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:32 +0800
Subject: [PATCH v13 08/12] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-8-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=xe1ZNuk2g1U5vK3Ph3VfwdF2b6l7drvSd2mIRWLMeIWDq2L02tMs0TBCIuNmzVK6YMSZ5DLJG
 4/13SEi/vvUB+fEMRFsAovtZCSEuvCFTCsIGTdwHQXd/zYCgDuRsLG8
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


