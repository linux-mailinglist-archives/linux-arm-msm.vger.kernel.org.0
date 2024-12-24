Return-Path: <linux-arm-msm+bounces-43179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13E9FB93B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58EA416526E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE7E13C9B8;
	Tue, 24 Dec 2024 04:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcM7hA9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA4156236
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014331; cv=none; b=FigN7ci1JU3c3gH1LxdGBoS0Cj3o5hs8MF+ycpPh9Y54fOsWEaqtAvJGXDxIhnmqHmjRxnNzZNueATi4Y70ZH3/XYAbaCGVZP28K4sbg2fx/HHD4E4XEB/8XuOM9tiik39p45UZ9550LIDmPfs0pE3ubLM1OeHghlMYRnJmrPV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014331; c=relaxed/simple;
	bh=7H7Miw4Y9xtaEfOBBtk2QI7k72SP13qbxE4Ugq17sLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtHhCUSPzqVKva8PLJ4TvqhtbjgZR+bgxsJd6JkmPZhbE+AubtYarKTH6Z3OlHRV2xQv+P1L0fjqjaBVnNGPpb0qgfU7ggC+B6DGk6eTlpOwylzKjw6DiIMBedbIXyNoJ6yP6QGu9n8DaGkjGF8tOgmAnqtA2MYnOxV9CU5Q5tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcM7hA9A; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f757134cdso5300279e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014327; x=1735619127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CSDGB69QriY94B5b6A1T9MEsmUWimXhm8siF3IuBBA=;
        b=zcM7hA9AyBWh8dsaWE0hsUf9Xo8n8BJ/R6KTfBVmiMKLORJpJNVmXkGGO7AP6/omf7
         OpKBy+I0l5eKZJeADbjX0Kfp77vMu7Xtfx+FbdfO6ygp34nVlzY6jTynGzsKtyP+iY+h
         o6V0d3GMoTvt1GJIT/wJVghlgxVnlKEt4RsLYnHma3A48pGnhxawLFYQIQSUQoto3wfh
         KthTH+U/Gstt2llPZar/SBrRv6vKTvCzUligyY8auvF5sqIZYep3qZoIWop/fuJ0w6ex
         wfUfdNlh1NT7cQgkO0HLBSGy/o/AwxYTSuUpude1fz9yREk3Hj0jQ1Xe7ERGytfTF4um
         JrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014327; x=1735619127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CSDGB69QriY94B5b6A1T9MEsmUWimXhm8siF3IuBBA=;
        b=fki/3wQ2hVUoJValRDKREp/utuG1rhad2kSxGWbqQZORedLUTQs1o3d+rRvXFOKJDw
         6LwCaMZDnTt8gnLC4jJOmDJzlR/fJnuGhifhFyFI/aj30uIAzG68nlSY0q/LR6ao2Lwr
         sREE3C9n3kE+4JGOhSOmLpW3u8s5D3i9a7HqbP+daywpu7B6jFSTcqPGYrkCcpkJi3PA
         CYCa0J/ZRG1y0E4b7f92irOMU3uFViClIlE0o5gXJjYX/s4xJrWDVWWzoMMhy/vwTDTT
         ZqXkO1SeudpPLl5I7sM2KimMG4S7dnV/tw9f6JdOqlXHuHHoiAL2hgMl3vxojgyv04+l
         5okA==
X-Gm-Message-State: AOJu0YyvwME1H9vH29J3C8x3Wqz//2P4arRHyXIdm+UmoM1yfTVQsz2J
	H9wgfBRHBTE7/Fg9SErPkPi+/OpTWkVBlyR9e+ImyrblOH4er+DrOAtcNZqFTdU=
X-Gm-Gg: ASbGncuNlYJhUAppLqR6JJtJbAMSwZWtUMTA1S6u3mKiyHiWFDrbGZUoPDtRTuAd3dT
	HDiU1SQNjr/NwVcJM+in5o0QrxslpR6qMz2YeVWX8jVW+bwbakULvkQbcUjOnw4Mx/IsbLLCPI0
	oVYCrqeLqDaJ/U8nPO0b/Jg9Lak8Ze7t3W1+1idh4r602H9pFyJVbmujla34eG+URpbktTQR1vS
	JBTps57TrK3/MHFrRHMa03zdCt2p2l0e6XB6iA2JRNAb1WLkmlRtbNPZ1mGasLu
X-Google-Smtp-Source: AGHT+IFIMXnvY310fiuVucPefEzpRGs5Kpa2L9uUWMq4mZOqFrsrgLhrdOkMgkhW4cJzykbkMvG4tw==
X-Received: by 2002:a05:6512:318e:b0:540:2ef4:9cd3 with SMTP id 2adb3069b0e04-54229533377mr4811759e87.20.1735014327301;
        Mon, 23 Dec 2024 20:25:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:25:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:19 +0200
Subject: [PATCH 3/4] drm/msm/dpu: enable CDM_0 for SC8280XP platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-3-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7H7Miw4Y9xtaEfOBBtk2QI7k72SP13qbxE4Ugq17sLU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajet5hOr2ZF19/TJ/9lFfZkAHlqBDSdoMxLSY
 6Bx11ZzMSCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rQAKCRCLPIo+Aiko
 1d8CCACrv88H28PCpd6FXnqQQwpcyYhVxMwZPrHp0Xsdy67xoQ0BoLVJtNlax8w3kbaiacfNyL0
 3WmcBpDQOW4Abt91L3TaB7SKT3ra1SDXVIqGuCpnizwSdaGRGqf3VV2F6qkExOtf6lX3RXYEZyk
 N56ZOzY0j73b526EE8+5XQnoxHgRXN6r0ZCXwGBYG9MaS44A08Lu/D2+cpxB3NQBid1upYoRwut
 NGLNtD5LarpUcf7DQ7SPron0G3TxfHCkVyx/ZDCQUzbpTxJTnIsv6ivzgiJIHdhWl+54CHVnpka
 prrTUFR+tyXQ9lUSQVhMFiVcMsq51AYx8VbhfX6n+JaEpmGi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable CDM on the SC8280XP platform, allowing RGB to YUV conversion for
the output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0d143e390eca964b1c81f835d0904a2079b0b941..e407cd8084923f5ac356130036f342c2794f3815 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -435,6 +435,7 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.mdss_ver = &sc8280xp_mdss_ver,
 	.caps = &sc8280xp_dpu_caps,
 	.mdp = &sc8280xp_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
 	.ctl = sc8280xp_ctl,
 	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),

-- 
2.39.5


