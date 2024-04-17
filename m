Return-Path: <linux-arm-msm+bounces-17756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836C8A8C9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4ACB285569
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBB544C8B;
	Wed, 17 Apr 2024 20:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jODWByOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684725FDB2
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384195; cv=none; b=lBPU5f/aLHqHUn6+FfmrQSF9hiCLnIuDwAGr6fNh7A61uwxtpWDM0Kj9viMv8ylfWNeXkV8bKQvEly+rPh0lne28g5B0/o3vSS+BqDX4EViSb0xPM2xvQ6gpj14Y5jbdExWofP3InzGnggAOPumSs7jZfBa2JVvCVkynC9FgFIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384195; c=relaxed/simple;
	bh=npBgux6bk5AO5WT4DCEsUOpTuW4/rkHnMNv0Oi6y770=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlzjwhOcmb53KyZ32MunwfovvWkrdK3IbBYUaClg8gsLXrQ5gkpAsVLCSHkCyTjY8RFNGJiZRJ4x9ilRsbM68lrqb3WOh/owJSL/u1XjaOCmlPAjcVeHrQPTP4H4SOC8cdoY63rQCoN40kTVfy24+RrIwNgwIgf9b30w4JSdxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jODWByOx; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso77460a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384192; x=1713988992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eu1lCQsHeKnio7sOaXuXrZB9Uomc0EWGgn8cJ3gmGiI=;
        b=jODWByOxMHq+ndK+VtKvQ0rqxav1u4xqNuA3gJqUxjC5j3pO0yaYXHrqQrQGgBmLBm
         gYEe/XVoi4OuOvEaMGBy3zPLKDdkDJeSYXCZSyN10hrFClojoupmrgIRgEMrllXYvkRT
         AFEW2H85LkranW/0ggmcgTgMxShBWLg0RUBUFjVmyv+UJ0Ec0mqyCAbWMa6zmJTSf2YU
         oEmKl+qBXPhBKJyORjoCDUkmXDMn0OXBqaS9XgxZWzCLl/5cYda+3lpTpuybRQZsUsXH
         jK0oY+S0DoUoY02j4uWV8jPB2AZXo7nDRN/jfvRgwwDfTfDtgGGS1jrpOgFNWZfjDqTM
         cRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384192; x=1713988992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eu1lCQsHeKnio7sOaXuXrZB9Uomc0EWGgn8cJ3gmGiI=;
        b=fDPZ/a10ZUbcTDwBL16sWfsBqYD+hguR+Nx6Z2JrBBZW1394PyCkI8DH7OqLr5ZoiM
         qSQXRg7RZvrlFe482a9cq5yupMT+kITkfJh5mLLiF5F3SAwWA6i/ReEs2/tliMraLOv3
         3PuCWSFTWAvwLXRvmImZT28Ch3f3eEPNFi2gEKW2LqrcZ4BeT40CFi0LvyPCDau+nP5z
         ynXiK5kyehl70hSqzsKzUDbUQG5I1O6Bks4K6K+KaepWq32TkjzZojPHC1cvwikLYAve
         UzLhgMWknCJe4uW6LyxX/749n1PY3T2ZeALeGRwAmDejIQS7xR7SyE2/Ir9bl1CybPp5
         LSeQ==
X-Gm-Message-State: AOJu0YxpFc2d/IlZElz8XHjA39SPrJjhddtoalPFU6MA3Qc6A0HRyuSH
	KparSl8ru+ZoUhLULRXYP673BGS58e+3BDZHQkyemA9YAS3lTGN0i+11476VZmE=
X-Google-Smtp-Source: AGHT+IFIvDRiJ31s+hSlsYhn+Py3IPiDyVX7dHDZl0RdvShwTlsDWXxLhY8Sx9+RMVQJq2r7fm14cw==
X-Received: by 2002:a17:906:f0c8:b0:a52:617d:d77f with SMTP id dk8-20020a170906f0c800b00a52617dd77fmr367738ejb.56.1713384191895;
        Wed, 17 Apr 2024 13:03:11 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:03:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:56 +0200
Subject: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-4-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=902;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=npBgux6bk5AO5WT4DCEsUOpTuW4/rkHnMNv0Oi6y770=;
 b=ts7z6ZIKK7AXNNK+04lsJTke6GzCYGY4YjqPBzvs+E2Q9SC1gprs3T172vQ2M9MvAq5v0QKoP
 40+y85UeVa6A+N71RkbN+f5uOrO831Eks8B8s+dyoqIMjDrvAsTCffT
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add speebin data for A740, as found on SM8550 and derivative SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 901ef767e491..3b631445c541 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -570,6 +570,11 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AB), 1 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.44.0


