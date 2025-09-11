Return-Path: <linux-arm-msm+bounces-73119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BA5B5321B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04F275A1289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 12:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED22B3218A8;
	Thu, 11 Sep 2025 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9C0vXjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26C32142B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593758; cv=none; b=XQLrYdPBAMueIUn/yVeZdhdxLHwGek0lMUwbBjslulRfXHiUHkirpuDg9r/zfACxNpOy0m0p53MdAGB3WuW6LzrM6lwdBq9niYK3TbszeLrPymco9ZZuN1/pG6x0IUrqP72ojaVbpGtwAG1FV5O3IYjGAs6o/PU4MXDKNWgDYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593758; c=relaxed/simple;
	bh=UQ5TvznCATcmW7TKNpwWYXlNr4pPB+TVdlMyODvkOAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tQw0/WTDQbC82kDcudiotujlBrm2TkOMuzMqcGAv3VsP6pg3ypVP1YwE7vlZ78BbQkUPWWxjBGwsQ+UaCoa21QV4iMoEhYWOYH5//azOZaceHNG6sYfKnZOedNwh7l5a4NC1WOiuqqx8TxGe+8S4c0Que+laKH35MqjGnVC3H8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9C0vXjP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3dea538b826so642559f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757593754; x=1758198554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7jUWByvFECPwazBbFEH1CWu4/FyyuDx2jex9LWCqcg=;
        b=Z9C0vXjPsI/XNh2g0OSS/Jh+HRKlXw2rNt5MwUVtxZ2tKS9Jd96ocO6uit6TD4Tse1
         mKb+4SDEyl07977AI+ScoD7guX5ZpUfw80UI5OyJIeKi3n3zQqDtZyfJLmLfwlzs4r8B
         cc6bxblvimENE67zEcBQnLnfFM8pu3D/KTX7stoLylbKS6Y+3Udyy0cApTTavAJYkX2V
         L2QA/g7DrUN/zAJ2iA/BYL4wxlm6Esrux7BvKu6RB18Fw01vCiEPMSVkkiMVLNDUsahC
         6sjdhQlSIf9v8EP2k94fdPx6vHhaYzubbjByU0n0WMpzJ0Epqmg1cYPTlEODbWxKxLbS
         UFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593754; x=1758198554;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7jUWByvFECPwazBbFEH1CWu4/FyyuDx2jex9LWCqcg=;
        b=gCu2QseVGJBm586aZnf2bJzZV1aZ67v3I5qziLVdlZiBefMvJEUCkoaDOAwglpUB+Z
         /1m5HESCMkxe+Fl1sOJ6zJApei4TnwHgQYJxME24t1BJ/Rn7OJdsEqQpWDFbxiC5rNB3
         TiINA58446UTDGKItZWA3GHndsOPbRobWJx4Pv8qU+kuZ+AWqJgRBZyLMIe+zOg6zxev
         4TDaQx0Jsm4obtpms95PbFVAl6kHUnyxGWeYwPsQEjWTENw6f9JNiskdPH5VcrAO7laY
         ex2iAcS1UBCNcJW354o33XnA/IqChK59McDRT10KnzcLlFBW9K2fW8zO/xcxaekdAQ6z
         0OiA==
X-Gm-Message-State: AOJu0YwUgBxfJajNWEdyWNyJc42o/Qpdu/pE5Ytky7eclXLNxuyr356h
	dUbmgJGT0DhvwOeiP2eK9Zz0uA8NxM6eKae0jw8ITg1ObFG6Gqngt0gcg6+2VHv+NAk=
X-Gm-Gg: ASbGncudqQImN6/N0yKOtQMuLBpQZCBoUZVlbbdyR6NjbhVE4zBlqKHZ43JYTsetF72
	YbSsXUuA5o0GxrwvwZF+tpNwrrJdDo4itEfjJ4SKpBAwABzbZmoyExdQLN1O3Zee1hB9MLNcKwX
	BPyq5e2ufEZQIQU91mvdddrdKv4/6Fqgobtjw1miBB6aJcFOAypvadVhoruWspsb5JH7t4yCYOF
	1He8RPfkz+z4HKCzbbPHjT78uy+WaOAqQfsW6cx3i7GlCrpo1SXEQp/QCe3CBXMkwMXAgY3d7B2
	EW+ANpH01itXw7NlMwTWEtNjbk3C+CMK/wU/82H9CmGdj54Q75Hrqqy8NhR1ry/c1ftmCyPVDzY
	hTdooSAEx4yod1t6b8Pdmrd6oM3F0jR7FUQ==
X-Google-Smtp-Source: AGHT+IFivbwBDhax9/vD1/Z2k59af0UA+udS9AYGBjFC3i8fowSQAZAx/4n6gr0/W/KZf7ttitcR8A==
X-Received: by 2002:a05:6000:25c5:b0:3e7:5edd:ce07 with SMTP id ffacd0b85a97d-3e75eddd171mr2860539f8f.40.1757593754308;
        Thu, 11 Sep 2025 05:29:14 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd424sm2230444f8f.36.2025.09.11.05.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:29:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Date: Thu, 11 Sep 2025 15:28:47 +0300
Message-Id: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/AwmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MD3fScytzSIt2UzOKCnMRKXUOjFEOLRKOkFHMTQyWgpoKi1LTMCrC
 B0bG1tQBqC2ypYAAAAA==
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=UQ5TvznCATcmW7TKNpwWYXlNr4pPB+TVdlMyODvkOAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBowsCHPeqOhMBzz4He/Z4IkOQmFd0kfNeUmdPAN
 g5tuRd0NFKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaMLAhwAKCRAbX0TJAJUV
 Vgd4EACf0BbVhV+xN5B/TsmSSgYOg73ZeFP+I+GoXeHKWl32iz7eGNPrvOTY1m10FUSnDMVZ/Dg
 WFyvv9ffTz9Gu1AkOLjT+Hgx1sIgVv0AYil1bwHNNaUbNqEUJOk4vwNUXZAe6g7XCsGLjDlMJ/l
 derLO34kRwFpSNoucU+yJuQJ32zt5knYJWwQ0Pz+2w6o2odUrf5Fpy80XtjV4YaCOGwhm0Npu/P
 AaqZluigHo5oCRZitxRBlmtPj/wU9c8i3i89RnCqelO9ir00YEsfItkshbNVMP+7OLlrHSsViwE
 KmK5mvW1Jxa1hhAifrha7x1oLxHUqlLGE4sA0ONLBvikYvgvQkFVErT/ZotpcpNzmdVo9UwN1CC
 1AMMokEvHrzqSbgsg7vhdbgwE2fFil3U9/Y4jtlq+QEkizyvZiI6hpg8gLGwM2Tqm10mtWu4xG6
 L3++ryTG9eWYrmb9yzgHT9UQnPYazDBH0VDtLXLkuKac2js3Q8Bk/2RFhLyhyuOney8Poqp0Tdp
 Ea8tCYp6zfKavtlqHnMiBy5RX9zdr0V7dOV8WfyQLfAWRN8hSZd7BHO2fdTQWp7t3BwQEVIuflg
 RoMBpbfFp6ujyS/Bas5yfEUt1ku6Q71YqR2SejHpCEXqKFIUMyfA1KAf+q1ZzEBOCD4rdAZabd7
 wZh2R2gzu7SdHOA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Glymur MDSS is based on the one found in SM8750, with 2 minor number
version bump. Differences are mostly in the DPU IP blocks numbers and
their base offsets.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (6):
      dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
      dt-bindings: display: msm: Document the Glymur Display Processing Unit
      dt-bindings: display: msm: Document the Glymur DiplayPort controller
      drm/msm/mdss: Add Glymur device configuration
      drm/msm/dpu: Add support for Glymur
      drm/msm/dp: Add support for Glymur

 .../bindings/display/msm/dp-controller.yaml        |   3 +
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 260 ++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c                |   9 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 10 files changed, 824 insertions(+)
---
base-commit: 65dd046ef55861190ecde44c6d9fcde54b9fb77d
change-id: 20250910-glymur-display-12d18a2bd741

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


