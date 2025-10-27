Return-Path: <linux-arm-msm+bounces-78962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8687C0ECCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F8894267DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4D22F692C;
	Mon, 27 Oct 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rIPGffuA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ADF2C236D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577178; cv=none; b=Pq4x7X9jdjoKaxSD011C//xYTfweUntcwgbcpCwA7lEnd7QfafsuqHItuBSF0aYJQRvB9YnbulPq+7JX/E45ZwckN2ofJqfMaGZ4yQLZW7Ss4spB6tqAge2efFbFj1MmiXdL0ke/CvdX3Q5YZH8BFfWZ0fM0RJqcrX2/eLK+SbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577178; c=relaxed/simple;
	bh=eDQhQASOEmRkcfF1cnh05g0ZSLG33Cazfq+HFLkLeDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rIbS12JtSV0cRulwHcAntAYePq2mhNYd2UntkARimiBEL+/CERFFhAXNE4Mxec90XlmI7uldT2qvTxIodF0Fr80r60JjuaOJWj3dZ7ckx2L35ilBC4c7jRSY/cRVlZEco/51oWXSbMeGVpyjSS4FrNjtoit4rteVMxAPxfYhg98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rIPGffuA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-471b80b994bso67380915e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761577175; x=1762181975; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW0g4MULUKaMYiJnLBpd0Ri5YM5rWj5Eltx5XndG2Gs=;
        b=rIPGffuAY6AQHZZNFiCD1Y8w0uiUMlIPpcjrxDSVqcX9UeJxz8yELoAeKtlJcju5uO
         IMP4QXOEeFDiXopA2pec0PcVpgj9Am12WQnaLNPBtaUMdfZx7L/c1O0xFElT+Rb/4Pdu
         IPLRojf4gJqiKvBpuGNrK+cxx5i/c6q4nsbxr6nbZsDcj6EZFwT2ut2jT5lVtcrqqlmR
         r2jNRAihzBTad1LXEIOU7WgedAeFebdDXcbzpa3s33vFIPPf3p3eH4MxnT9fbKnA5/Fk
         HeqDVcDVWeyk9KS2Vvx+0nqpqNaf1qYFexpwlvQyA6vKhbWOx5SSV5EPihu+tC4R/pk1
         mneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761577175; x=1762181975;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW0g4MULUKaMYiJnLBpd0Ri5YM5rWj5Eltx5XndG2Gs=;
        b=d6m+mPesMdG5fzOhfn6khIrBbmupHy9ekJ5nf6z6EYGeE93R8Eo6IqRP0LOUoxwmF9
         8jwb1d9MyZ6hKKPeDCKTnXfA0UuoFNx2MFtmgKx2sJ8IQPrZTcQJqCKEVlVD7YTcJ+5i
         LexhLyDWHchPHbWqbY35WsydPYOFmbnIwtc7PHnHQat74/34yMLQacgKbl1gHDuVxLhG
         VAAzvzKwO7xlFYBOpQmjfOIszSqlGuW3o+IunPMr3/cU8Ykb9hRQp8dFzLj3oN8dyAE9
         ucVAWuzLqyHjxhmdFKN9afIuCcCCW1a+IcTeN/yKesLOyVyVRbNddATyByAheyhgsdVH
         /4IA==
X-Gm-Message-State: AOJu0YxRKhzYqb3SS+7B0x/teQoZ5ljFk7XXhlJfuCvLZ5wSr1QwTqcE
	yLB+VSOFqHrp3tt4sTPCxWm/QXLiFm/KgAJv6RGf6mD1QI956C107G5iFPD+qLfuPOE=
X-Gm-Gg: ASbGncuhrj+QgIfvbiplOJ8khBlkhy5SPkvd8GJpcFosldyyARLBkTA9MXclxFlJ90l
	9upfs/v6fI1nCEXOlkXWLdDGMFtJnozXSvbzgNOW3KpNe4kwVotZ2mOEMSZfpMW8jcZeYFVQxuG
	TBwlc5K3FnnSOotrizjcobJMceHL9nRyEynCFfl6uhgdK9eX6+PgMSbYxOa0OH6D9iPihnNafZx
	6tv2YXABbJReonZ0Z+0n7pAPkOGQM3qjyaTvsakAL4nBtX9y47ECy59nn3qDdb082fquuvwB8tC
	+3p33Pp1fvctm7UJg1ciF8zfzr8iKjNIA8t3Ooy1DZBIasmHHAHoUkyTMsbk516pPYQVEWiwsvv
	RYH3GuDGikMEi2KpZR+X+CEAGs8/KUOnUzxmrzQfduSRGItsbTQdzRsAcUbVv0HmvUjmSRXUOIr
	lXDtegxJPu
X-Google-Smtp-Source: AGHT+IEaQneBk0C8dLzRUnxt31IA4a5BDhI6aZOrP71p5Fx9l+6YUOmnTLZBOBxL2PTxl1832j9iLQ==
X-Received: by 2002:a05:600c:34c4:b0:477:171f:65f with SMTP id 5b1f17b1804b1-477171f0938mr4731325e9.38.1761577175395;
        Mon, 27 Oct 2025 07:59:35 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:59:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 0/7] drm/msm: Add display support for Glymur platform
Date: Mon, 27 Oct 2025 16:59:17 +0200
Message-Id: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWI/2gC/2XM0QqCMBTG8VeRXbfYOVNyXfUe0cVymx4wJ1uNR
 Hz3plBQXX4f/H8zizaQjexYzCzYRJH8kIfcFazp9NBaTiZvhgIroUDwtp9uj8ANxbHXEwc0UGu
 8mkMJLEdjsI6eG3i+5N1RvPswbX6C9X1T8Esl4IIbqUDLUqJCe+pp0MHvfWjZaiX89CCg/Osx9
 84pWVl0dd1UX/2yLC+vRk6p7QAAAA==
X-Change-ID: 20250910-glymur-display-12d18a2bd741
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=eDQhQASOEmRkcfF1cnh05g0ZSLG33Cazfq+HFLkLeDs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jL4e2P0M+fEJRpcgfUYt16mHELFJZJztSOL
 H5lBOKx5SOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+IywAKCRAbX0TJAJUV
 VsFfEAC7FmOy5w629PPMnlYGOFdHi2vJe6IBqwe/XMzgVyHN6nqMBH4VKVuJWuqEIlCZXYin6i1
 qFByl4U3Bu3WpLYhlyWU2Oyb1Q0kIhVPpnYiSfjUtVPKKKrGrPxcLQXaj54P6ulqwh4dE6FQL4j
 FPmwZw1xotu9jIYmdKEgQpzDkZBgPu/hfMptiKHN7s8nTF5BxTvdqvkcMKjLJTMPqqjqLNWOfTx
 MzwCTH8bohm+AjllsfN0rtejPO3I0/I5vXQ0UxgnYm1RhWsji4FpZA+gNS4EimDdotp2ds3Pmu9
 2sIuL/QG2kO7x+tsj9GugfUbUaeynxaVLm+MR9j0F1GVT9tdvlVR5a5o1KCviKcuZ519grI3iTJ
 T9ZmDXNt+MSv3blgzpkP7mgQFZ/rWqwJvwsNjzdvKLARgWuCpUmOWVV/zJzK2KCQOCK6LW3XPjo
 kECMxjfouAxQAIzc5TJ0waCWuPnLK+LUVOnFW0eS6vEDXuhCPuXdKhI/c18+pVNN9IVnM4g8592
 7CNNu1KDOxu3ILGiUPOek81NTRII9//VhsqTt8jHhR27Z/D5ysUPVMmnlQgpabVtd6EJC7+wYZK
 57U4rCzSbhvKZHBkzIUNkfWaP5asFUIz2+Gq4cIHWLr0m2wndOk6KoUBZzHUZQW/UvVa6xAcl+U
 LLklForAsQbzbTA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur MDSS is based on the one found in SM8750, with 2 minor number
version bump.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v3:
 - Re-worded first commit in order to better suggest the incompatiblity
   with previous platforms.
 - Picked up Krzysztof R-b tag for 1st patch.
 - Picked up Dmitry's R-b tag for 7th patch.
 - Link to v2: https://lore.kernel.org/r/20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org

Changes in v2:
 - Picked-up Krzysztof's and Dmitry's R-b tags.
 - Fixed the bindings check reported by Rob.
 - Fixed indentation reported by Krzysztof.
 - Re-worded the commits to better explain the incompatibility
   with previous platforms.
 - Add the UBWC config patch, as suggested by Dmitry.
 - Link to v1: https://lore.kernel.org/r/20250911-glymur-display-v1-0-d391a343292e@linaro.org

---
Abel Vesa (7):
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      dt-bindings: display: msm: Document the Glymur Display Processing Unit
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur
      soc: qcom: ubwc: Add configuration Glymur platform

 .../bindings/display/msm/dp-controller.yaml        |   3 +
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 264 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 840 insertions(+)
---
base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
change-id: 20250910-glymur-display-12d18a2bd741

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


