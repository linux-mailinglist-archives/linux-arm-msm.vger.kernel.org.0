Return-Path: <linux-arm-msm+bounces-77194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F34BD9635
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2BEB192668E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CADA313E04;
	Tue, 14 Oct 2025 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCE0aHzn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324B42D4B5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760445588; cv=none; b=mWxgciKXKfb5+S2dbRAvMr6eiYXvbMSASsRE9qfAYX5+biYJRyNUAj1fTvP4oUqq8DU0FlcQ6C6cFTFsLO8fSED5YoX7b2eynQ7YCS/AYvKST1sCFLGdZpnBmg6DX14ImMLTwTpo8B16/Pd2J0enDFF3ECh5cjo0co0wdFqyiKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760445588; c=relaxed/simple;
	bh=E6rbjBM66wL3IoHHlXeJRdVPT7g2CsyRrCjh7DjI1gM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WFir94BH3i231wj2XwtNPXkeBlVmWoXxBcWq5Wmp9FpPqMFQgqOPkTsyIWEp173JiQKHt5CAbV2xbOgRFd7C7ELRJcr30XA8LFQH8uF2aTTRzC2Dg5i/OlFX9NOOUsQ7ERdrwqDknSk4+iRN/ZWWA/aVtxWeQ5MFasUO1/aUcDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCE0aHzn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e48d6b95fso46471285e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760445584; x=1761050384; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WxfXNbeCWD17r/8Zg4XQzenoQeshlu+uRWMEBxO3DrU=;
        b=iCE0aHznKk8n9IgJ4hZjsbDk+hnac4obynwM5rDX6PzrnHoMZ5yuYFVxpj2yo+apGa
         uhTWl652BaXUtsk90gPqErtGWkDyKc1lNEliRrNkDH+A/FwO8bE/VBw10OysQw07G5kp
         D65lmZ85mbv6oL14eR4sxV5TUISNBsy+j4utSRBdPIcuv/2cTt3gsfqr/1s5IAl1ZSHB
         Ml0+rwc7eaW6dNbbOLJoYflIVv/Yj7fgjUFkYMFlb4UzbTbPD8958fL2Fo3LmG+KX60S
         BUpHYu9qZOVNnTvRYKC12MG3eA0h2fwBk0jj5MxmGtV8hmqZRUtCr1F7z96mAp31ayRg
         hEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445584; x=1761050384;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxfXNbeCWD17r/8Zg4XQzenoQeshlu+uRWMEBxO3DrU=;
        b=DX+MxO2rbyaT96F6puQLhuVlEefDEHmYApSgBPjhW9/Nrpyspmqhr/2nzY+hPczZwZ
         2rkFIGwqsalhRK5gKorsr3KlnWDwBB0WHTERxvxyJJqtVa9T4kyok7/GB2rl845SkFRR
         ++PIvonZi6p7kDCVpb3YqBLQ5gjLZLCBHRjwLZr8AtuhHfMx75FJQqOEBBO2fp8XR1/P
         wMkSYArVwqX1wCQZKHaSWgSec1aajk0A5T0Dz9hst4lN0DPKT8hYC8odmv0uAfI+pMsA
         XwuAoaNyXE1UICR3MMmQVBu44G4/VL1pSWULlkyHbtEKX14ovr/5YuNDCst+h/9Yqxlw
         zrjQ==
X-Gm-Message-State: AOJu0YyWh6+SlzesH94XgmjUB3RUiVg29OM/d90FOzl1kqpd7hqLy9r6
	3Vx8+Ny+0FGwOUczs09IPm1aNmFitmq9sPozWyhFrcS+w/GLcomS32mGQQ0YOOUtCZI=
X-Gm-Gg: ASbGncs5aPyE/c7GX2KEHGT4g4OgDagaaIscuV897aXXQe9eInwG2UhiA9xqEIdLeMq
	gcSEmscvx2M4y0qzuoCDoGGZAI+vVMxtY+P8ZZwteBIX/J1vhFW43bm28N9zzaJ5joD9acvOT2i
	7Sike/HiPRdxNja0JJOB3y0oXjf4n4iMESSPLbVBws8lJvjR0i7cLMNdBFcmBNksvj6863kIBIX
	+BvAzLRteTUcuVNV0Ua2Cm6+5L/K18m7nxLxVaNV//zUJtQXVx1j6NQfcIOElpTFQZirATg7VSG
	Ikq3CPYCxaiymPSxIWCYgQEh4d2aVgNh6QBRUo6+1LdwrXyCc4AhnfT+Gt1LlvclnU43KlYeyx4
	DYUNYEPexrmsx+vQ3OcdV49EWN5qjYX36iJlh0weSuVNF0hE3xrEvuw==
X-Google-Smtp-Source: AGHT+IGSDpXQTDlp1VxndrxWzCAqXHmiwD+D7q+jxH6QwOgs6VZlAYCg4fJPWrsSgEjEu6T2Fe/K/Q==
X-Received: by 2002:a05:600c:138f:b0:46e:19f8:88d8 with SMTP id 5b1f17b1804b1-46fa9b17d03mr185755555e9.34.1760445584277;
        Tue, 14 Oct 2025 05:39:44 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm245813815e9.1.2025.10.14.05.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:39:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Date: Tue, 14 Oct 2025 15:38:25 +0300
Message-Id: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEFE7mgC/13MQQrCMBCF4auUWRvJTCtaV72HdBFNTAdqUyYaL
 CV3NxbcuPwfvG+F6IRdhHO1grjEkcNUgnYV3AYzeafYlgbSdNAtauXH5fESZTnOo1kUksWToas
 9NgjlNIu783sDL33pgeMzyLL5Cb/rj8J/KqHSytYtmrqpqSXXjTwZCfsgHvqc8wdPz85qrQAAA
 A==
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=E6rbjBM66wL3IoHHlXeJRdVPT7g2CsyRrCjh7DjI1gM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo7kR1NKRRqIO4/VJxX1w0FK4IziT2Nr+YGPX+H
 01KO6LzZieJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO5EdQAKCRAbX0TJAJUV
 Vh5HD/9nE6fTwwGQFiwiPBHCieNeh9X8dzP0HxIbCfVq1Brz5IOWonJI/Ybt9tAq4ILBNf0citc
 YrhihjdzqHfyJjV6+LkgzPtmh3D3SUEWn0HGmMK9vHLw2QrA+pYLAOb4N/otKxbPwYU0Utuxb4E
 +mqd9tsr+5AvKyM5uDEw6vsOVJsg4VdzZMHSMFwQ0pEMUtljRG9ANtdUuiPGZ5tcrwgTmNRDZsz
 fzR3EHogY3BDWkjjoa2wnBiWOyQfDQYMsLPLYPfS6dPzgZTg2dXJWTOkVqDCwegp+JK4GPtqEUf
 qEGgUqxOOm1QuXh1XExBAOTk60s3920EIJ4IBjbAWHLpCIxsXazznT+Eq3ezfrG4J03b53PgHJp
 E1KWT/Obhamb2Fv/L0WAtX2yhwyLofNVpHvUTkEYP9MSjcmm/1iGLStBHB++8Fv353tgzDrzCiM
 uTYUMv+G9HAJINXgLPNvLYZ/kIJfrQbc61FFcuvO7OoKMUKUDHDSDpGJaAnfjdhk8xKw8w9hb/J
 ZJAiX/x2Ho6kJ+b8vnJM2+goK/EFkG080zjAQHSfS+9RKf1oU/kVxaDGhNMFeXBgcsX4nUQkh+N
 B9/qUdvgLyw/MlGgMOX8g0Tcwi0bRYezbmOLi4kkptyZOFt8BFuNHfvA+evmSY9C0X80bkZNe9K
 s28/pRE6moARlHA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur MDSS is based on the one found in SM8750, with 2 minor number
version bump. Differences are mostly in the DPU IP blocks numbers.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
 - Picked-up Krzysztof's and Dmitry's R-b tags.
 - Fixed the bindings check reported by Rob.
 - Fixed indentation reported by Krzysztof.
 - Re-worded the commits to better explain the incompatibility
   with previous platforms.
 - Add the UBWC config patch, as suggested by Dmitry.

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
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250910-glymur-display-12d18a2bd741

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


