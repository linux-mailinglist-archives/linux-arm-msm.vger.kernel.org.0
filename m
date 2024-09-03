Return-Path: <linux-arm-msm+bounces-30439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421D9691E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A975328428B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582731CDFD4;
	Tue,  3 Sep 2024 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UterggER"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD90433BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333779; cv=none; b=IpSyOhKXhI2Cq2nM01J0D0flrfdOR66EJD9qvi6tqvFWj1jLrZs7Wee+qT1iUi4arp/E1lVQBc5KFjSqudyty0WRikQED8dhZTLmNaBVfbpSDks/Id7Z1aQpiZ57LzuSwiDEkmz29LkAW6iqE65TxXn+L8+4eeIs90Wqe3VzBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333779; c=relaxed/simple;
	bh=9hiBNik93uZFwi3I0kzx7lGjwl8YmM6Oy86cQrRvVmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=svtP0YRitTgb8GgYGgSqCMgbi1m459JdVUyTICGM18t85FUtGx7e/jtq/ZHdwuNAiELrjXTsVSaOleOdfkBm832uAfiYzTCiPvZbW9V0dsrNXzr/OET3UkujkkggSBQVgZOuo/27XtjhU4MZBd06fwAJGz9pQvy7sNUaXKrteYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UterggER; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f4f2868710so51723431fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333775; x=1725938575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8t12yUPj7e8mb7vqEqGXgnNpICOFF3VwhWmBnR3jP0=;
        b=UterggERPFuHzFaDeR1C9LqTVraP1EIEj1Qrq4+ti3KW1L3zlZCs8jhFfDHzYiWedD
         gC3U3bckR/JfEcZzRhIIh5W4GMvqP4UUVZPJByoMtD2ZJXT4JybdbweFvxPbmyb6QV6w
         yLyHpQ0YqLw4+LbuVJ4vHt5xFQpEgISgO0xCG+WxGRgSmyfpod0yutTrEIxZkZAwly85
         C+p1rywoOgwuNlCpUPRJ4k+F//zdBZs/8eBFKFpeChrSHwkuS2Gr9jmb6VhnjAJKdQSP
         EveIVKPNSbXgsxpWMjM8ocuBCdeRL0l68IJnIOnpiI/zJ7zujEgqqp29RlzVaq0sBZgJ
         NEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333775; x=1725938575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8t12yUPj7e8mb7vqEqGXgnNpICOFF3VwhWmBnR3jP0=;
        b=ooyiI3PBC1kwywHPMtrYb5po4bA8nwmUuBW/KNSy95fNzIzetcwtIy4yy9BjSqK9LZ
         qoEYYvuwrGZJayk1Bakcht5pilqmp21Xp1lfMhLv8aPckWFN0ahaZZuwQ3xmV9c11C+9
         1WQ4XhXroOTOCNI7doyJ5nNfi2T831Ha2fg4qhznp/8nv5a2qdEkkqqisLeR2XPdHjLl
         zRsIQZVI7EkPLXVJ/GiYzexZPh/sLT983VL/cEFhUWBMzp29+7zwmI1ZebhtVKd80r9x
         YzPKncBceaiz3dy7Lmku1qfFB5ougQzvfSRz5pt233UOoHgW16Ir/9u0XGfaEUFmO2F+
         jQXw==
X-Forwarded-Encrypted: i=1; AJvYcCXenuq6bBj5Q++RvKsjnUo9czGTlZzmSTwnC5eIn/zYNlR8aWj3iE4XWuvHp9KjoKh/PdVQZ9bMu7EwnZEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6HMTYQazBq4xJWmjWtyutAeS9egVgeIwxwlbMlRMEWgtc7Ma
	tvZAg/J4Cnxktf5kQwNgB4ydCXy60tiwggt1GBA3G0s+NuYKRKbdlMyaYNAMx1Q=
X-Google-Smtp-Source: AGHT+IGTh9Dwb7pkkxXKkDP242kXyVpn9BHR6Ast3Q1izqpsDPXTt0iIBv644h0se6VkdS6Eg+y/bA==
X-Received: by 2002:a2e:1312:0:b0:2f3:d82b:1959 with SMTP id 38308e7fff4ca-2f64441ec9fmr11810191fa.23.1725333774462;
        Mon, 02 Sep 2024 20:22:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:44 +0300
Subject: [PATCH v6 01/15] drm/msm/dpu: make sure phys resources are
 properly initialized
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-1-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9hiBNik93uZFwi3I0kzx7lGjwl8YmM6Oy86cQrRvVmE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEKxWGO3YydUMBY3XruJjJyYMN06dPEnug/J
 vWyj4bB7YOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCgAKCRCLPIo+Aiko
 1TBRB/9JjK9bNDkipN2L++V/P9kllEmOlC5pKEHKSTthCTD86R3p1mBRjVDpnr2naySQVy7Ft+V
 /khY5l/aDueIB9Sr6YGQbaB4rf3ZsrG9mL8c3V2xgw+60qtcLncikmD32e86nqR2lVmvpnAU4Wf
 NAXXf4UoR5Jec0mb45LmD5bOdIuCI45MiK1joxXb+eHACJrbYFEWvfmq18kuSY1gzeMoSYCXhXw
 3I/TFEGVvjaThzJAtBWuchqyBSTw9otRq/njo7lx06SsnVbXoJNo//O6eDgAggWfSFdlmB/RILj
 plc9tN5Zcu/2nwXJvGDcu6SY9QVu4nWmcVTEEhPuhfY+p6zH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
zero-init of the hw_ctl array, but didn't change the error condition,
that checked for hw_ctl[i] being NULL. At the same time because of the
early returns in case of an error dpu_encoder_phys might be left with
the resources assigned in the previous state. Rework assigning of hw_pp
/ hw_ctl to the dpu_encoder_phys in order to make sure they are always
set correctly.

Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3b171bf227d1..949ebda2fa82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1174,21 +1174,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (!dpu_enc->hw_pp[i]) {
+		phys->hw_pp = dpu_enc->hw_pp[i];
+		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);
 			return;
 		}
 
-		if (!hw_ctl[i]) {
+		phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
+		if (!phys->hw_ctl) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
 			return;
 		}
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
-		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
-
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);

-- 
2.39.2


