Return-Path: <linux-arm-msm+bounces-61735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF921ADEF97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 16:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FDD51717CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 14:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2080D2EBBA9;
	Wed, 18 Jun 2025 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPItvhtG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D1F2EBBAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257198; cv=none; b=o9DLpefvIhwxLPwuUFY7O9nweQQM58bCTtxf6z+QnjrfWcwL7HMgWva6khYC6MjPjtxwEIchDhuW7l8ogjFL/NfV75T6688nwFh3j95+Uezl3NsYuqC38pg+3JDoTuL8+gMpRlwEBp4WUcu3l+WpejyHbSufMxMBKhN+B+LmsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257198; c=relaxed/simple;
	bh=wl2W413fadjLC8Prj+CLmGouBWzphfFSKKVzE1b+lac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u62fnSeTYca7pct/+Vk8EBMDgabP7QPAk8iGn6iAl+fQx3tzlxTz5STXEVrAB/gSq0LOSs+JtBiW8Wx/Pvbt4nP9WZXb2f5qhl7Puv2sE6AzdpVYscTdEnA3ehNq8QCCMuSOkGbv2UGQWGWwzAuo1HAleSpg9Gminv4+ZJJqVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPItvhtG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-adb2bb25124so112868766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257194; x=1750861994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vF87nlgifvkUBONk2wiu0rHA35U8cIhcMf66IG9ELMk=;
        b=LPItvhtG/Ry4CRYsgZlmVNdI8Ohm7aHn90in+2IfBYGIMRGAvFeHar8ItvLG0PhB1s
         ve/3RAeClrWuCDfMVc0cWm/npa+B+dKGU5YRfnwBiGWleDEsMvpXklc2u7QgzfdyCQXh
         yGhCCUqUHUAQRQqg7Ud5QXyMovR/UmP5DMQIPHxE9migsU2MW+YovyIdqq2atnea7clK
         qZRg0KXWMoyXprDKDGBAcFnm+f0GeEt3WSaHKwkEQFCiJ4rSF7Roo2k6eX3StUuJqb5D
         4MYEGEcfNb3YziWc7INcZupJBQG9TisTFnPIoiYvpvxw85W6cZ5DI0Zj3z8aSpS5lANY
         y00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257194; x=1750861994;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF87nlgifvkUBONk2wiu0rHA35U8cIhcMf66IG9ELMk=;
        b=PgdBt+rpwD1xI8Gn4ZN2srXf9ZF4LkaVIixVxKT90g9z9ZuTi8T6OII5tWzbsJKs8E
         u5HgLH7iAEmM+H5V8lhmVLOmKS9GEkdEUFs449awEa6Hs8jrKCEACTzFA/uOQxpw9ZpK
         ni2xTUwBdaKQckdwZr+EkJizyXbYDQt0Bsy5sUvbKVcu53ZU4AKuagyYNH1DROBsikUy
         BsnoE0TaJsJfsxemw03jbzwEJnbqYXokbq/AGAUBPdtzGpRjDasWJ3+K4QmPr8jOZckb
         45iZVK7fNziOQIQQgS6j73cfo7PP4M714Xdbe4cAKf/wuI6nr2ogAOIKLGtjPYas8mzK
         j57w==
X-Gm-Message-State: AOJu0YyxSScVSEQuPjj6XdnjSC4T01WvYr/y7ezjJ6s1Q/2omzciroYi
	TrWJNcE6O/D7O4p0/Vf2YL5UDvl6bi1iRMfqyb2+L4It9JS86fwpkQeZJZr/Fsg310k=
X-Gm-Gg: ASbGncukpW4g/0jdOSA5vNwxJIF7VwSqDRrffklm6GoOe+XNkCYFPQV/lO+RZMDUR5R
	XYwd2LVp8FiwYEwU4EKF3c6YvS1xA6Chv5/poC7m9xkrnoKNtMH6KP4GLk2A86SXTsN67agB2Qr
	FaENEpz19JGrOjLceSxMHtIn0hMKSsyHaz/BodJg3xfju3mzinKKLOU7TJZrxNLrePDboLVMXLJ
	cul/2zZKUdylwOHKuTjAQSdLr0F8TUAG8MW6tV5jTJ+MEfLxu5vAtsmNvDD4l0CQV7e7z3z+lUd
	QikIS3qXZxHVbWBWcyk387DN+wNnEZxbXmnM5nvDMi5252lCmPR17NEgD8hMmzMjvIHp7fh1xPM
	CsrN0gPU=
X-Google-Smtp-Source: AGHT+IHaH7KxFD4UqLSMUiDVgpxBtPDP6dlDPbCHz9u4DEN6FHLmTRocIXZTCQHdL31T5CjRe8GP+g==
X-Received: by 2002:a17:907:97ce:b0:ad8:9207:b436 with SMTP id a640c23a62f3a-adffad16db6mr284505666b.5.1750257193778;
        Wed, 18 Jun 2025 07:33:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 00/13] drm/msm: Add support for SM8750
Date: Wed, 18 Jun 2025 16:32:29 +0200
Message-Id: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3NUmgC/33Ry2rDMBAF0F8xWldF0ugRe9X/KF3oMUoEje1Kj
 kkI+fcqCcUtNl3eAZ0Zca+kYE5YSNdcScY5lTT0NZiXhviD7fdIU6iZCCYU46ylTtJy3BnFaEh
 l/LQXqtEqMEZJGzmp78aMMZ0f5vtHzYdUpiFfHitmfp/+p82cMuogchVtlL41b5+pt3l4HfKe3
 LlZLITgZosQlQiC8eBDsNrKFQG/CMG3CKgEoG2V4xoY2hUhFwL4JiHvV1jtAFvVeqNXhFoICWy
 LUJXYeeuAeUAZ4orQC6H5JqErgagBEEJw8S9xe9aV8etUm5+enS3Fd02VJRccaBhPNORhpBHtd
 MpYqNEMQj0L+a7t6l8q5WxB6ofjMU1d0+N5oj+X1VW3b1EC6eNsAgAA
X-Change-ID: 20250109-b4-sm8750-display-6ea537754af1
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8438;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wl2W413fadjLC8Prj+CLmGouBWzphfFSKKVzE1b+lac=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4WiLcS8JsW/YzidPM6dXpf+zHU2SdX5bzPF
 3J3GIhVl3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOFgAKCRDBN2bmhouD
 1zMgD/4un3JtjNR91InGeDILKQ70J6bxLQNyUGpnu47j5hu+OyPKM9vdCqC1edMtgE61p09jGc3
 tnY1PPnxeZndp1JYixi3xg9ZEr7fZXKxu6gxfbPsU8eKGuCyRjdOOLjbpOsAHRj6jGbu3SmlgDZ
 10wbqutfNgLGVG3eY1uw74Q3rbJcehuq9Syly0q4F3CYhx7mqo/Ek0FvNaUTXhl5NaSfXFCHHA8
 t1scYI4bpuIYiSC9toygHtNF6k8aUMB8PrxEoX/GTf+D/TgRHQx0o+zZkh37sJ8TaeMfA3zYOi/
 cl3GhQFRXVfmTz6KZV745gUiaeVpch1yjwCx+PIbogapbcpsQ9ekUtQK0hpwUuKmkbjRq79DpQM
 cJSKCta73ivpUwjkuRexTqLy1aGdRwgnEyyw06y4562HbvcxgFZc2qlovOaWjTfB84BhrEaH/+D
 V6JRZbsntq6K3yUAvrAzoQ9srclHNgEExPa7iHaesvy00DApHk5fH7Xc7IO8dlpiIaQKNHtOpj+
 5UyDxfyCoduOaGqAY9m2Wuy+NL6mB/iM947TG78VxDpoarMzndztmnGfX9tJIDavinLjrDldBAh
 yH5WqzNUSahDiPY2lqzrmmmROfcp8Q6pPQ+6WP1Bt1CzOoj6JdA/VLrDrrDhkMrgs6EEXDGXWwT
 ubRUvzW931DdUHA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Dependency / Rabased on top of
==============================
https://lore.kernel.org/r/20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com/

Changes in v7:
=============
- Add ack/rb tags
- Drop unrelated DSI enablement as requested by Dmitry:
  https://lore.kernel.org/all/fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com/
  These will be sent in separate patchset.
  Such split allows to have SM8750 patchset fully reviewed, without
  continuous requests of doing some more fixes in DSI PHY drivers
  (related and unrelated like 10nm).
- Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org

Changes in v6:
=============
- Add ack/rb tags
- Dropped dispcc-sm8750 patch, because I sent it separately.
- Several changes due to rebasing on updagted Dmitry's "dpu drop
  features" rework.
- Drop applied patches.
- New patch: drm/msm/dpu: Consistently use u32 instead of uint32_t
- Fix dimmed display issue (thanks Abel Vesa) in patch "Implement 10-bit
  color alpha for v12.0 DPU".
- Implement remaining comments from Dmitry like code style (blank line),
  see also individual changelogs.
- Link to v5: https://lore.kernel.org/r/20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org

Changes in v5:
=============
- Add ack/rb tags
- New patches:
  #6: clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
  #14: drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
  #15: drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
  #16: drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
  #17: drm/msm/dsi/phy: Fix missing initial VCO rate

- Patch drm/msm/dsi: Add support for SM8750:
  - Only reparent byte and pixel clocks while PLLs is prepared. Setting
    rate works fine with earlier DISP CC patch for enabling their parents
    during rate change.

- Link to v4: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org

Changes in v4
=============
- Add ack/rb tags
- Implement Dmitry's feedback (lower-case hex, indentation, pass
  mdss_ver instead of ctl), patches:
  drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
  drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU

- Rebase on latest next
- Drop applied two first patches
- Link to v3: https://lore.kernel.org/r/20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org

Changes in v3
=============
- Add ack/rb tags
- #5: dt-bindings: display/msm: dp-controller: Add SM8750:
  Extend commit msg

- #7: dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750:
  - Properly described interconnects
  - Use only one compatible and contains for the sub-blocks (Rob)

- #12: drm/msm/dsi: Add support for SM8750:
  Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
- drm/msm/dpu: Implement new v12.0 DPU differences
  Split into several patches
- Link to v2: https://lore.kernel.org/r/20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org

Changes in v2
=============
- Implement LM crossbar, 10-bit alpha and active layer changes:
  New patch: drm/msm/dpu: Implement new v12.0 DPU differences
- New patch: drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
- Add CDM
- Split some DPU patch pieces into separate patches:
  drm/msm/dpu: Drop useless comments
  drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
  drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
- Split DSI and DSI PHY patches
- Mention CLK_OPS_PARENT_ENABLE in DSI commit
- Mention DSI PHY PLL work:
  https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
- DPU: Drop SSPP_VIG4 comments
- DPU: Add CDM
- Link to v1: https://lore.kernel.org/r/20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Consistently use u32 instead of uint32_t
      drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
      drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
      drm/msm/dpu: Implement LM crossbar for v12.0 DPU
      drm/msm/mdss: Add support for SM8750

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  |  54 ++-
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 ++++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 494 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  57 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  56 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  17 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          | 210 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  14 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  61 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  79 +++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  14 +
 25 files changed, 1600 insertions(+), 30 deletions(-)
---
base-commit: 9a3b1b1b837c4085ada0e47dc46b399ea4eb80f0
change-id: 20250109-b4-sm8750-display-6ea537754af1
prerequisite-change-id: 20241213-dpu-drop-features-7603dc3ee189:v5
prerequisite-patch-id: 09ea9d7e22f5bc9ff3a4cd7e78be26c5dd154798
prerequisite-patch-id: 42012ab2eb0a46b5d3818e1b59af93c22020138d
prerequisite-patch-id: 361f60c8b2eb46b794d64d1eee9ac21644ded7c2
prerequisite-patch-id: cb6a74cf415236caf49ac6f7fd40bbfcb0bd6778
prerequisite-patch-id: f412cbfc9f6a50738e9d13493a1b3775f9a91942
prerequisite-patch-id: ceeb81f111e4dcb4c1fed5b26a3db274272ae59d
prerequisite-patch-id: d28630601cb7fb106decaab036b6ab400d5e6b6b
prerequisite-patch-id: 9b6ef3a2d66ab25c0dc0c9e68406ea4d948d2920
prerequisite-patch-id: 346d20e7cb51fe60058414bc8227a3d49a20806e
prerequisite-patch-id: 8cfd3ed00998e7713d065b875abeaee40bb1de46
prerequisite-patch-id: 5bd409601455e655eb253c97e8a45ebdf0351871
prerequisite-patch-id: a116df9db7a38831b4d99908753f5e747aa86be5
prerequisite-patch-id: 0e74b407b739f91d338ee328a7bd406cbd1b7d86
prerequisite-patch-id: 2a4739ced79df9818b8d6fd14f7c37b63524ec00
prerequisite-patch-id: 24c19cc08357986131b70f93f597bb0406e19c3a
prerequisite-patch-id: 35143dd7831bbcb3ef78492342683800aaae3f7a
prerequisite-patch-id: 2b292dabe10b76a444e9c2588422b6b54f9f7dbb
prerequisite-patch-id: ba31ff07e7f114a5e3b40fd9ea80b1005e481529
prerequisite-patch-id: 5fa3ca0d70d1efffa702278b6880520e44afa982
prerequisite-patch-id: ca74335a125aee670fe733df32e4960c9e82a302
prerequisite-patch-id: d2f4fd210e5ef44f26939548df78017950fdbf97
prerequisite-patch-id: 47381cd6f4e2044a9a66525c46c4cdcdabcbf9a2
prerequisite-patch-id: bf483037378a25ecdc8d2d1601a61d9fa3f6903f
prerequisite-patch-id: 0d4d741ae44545698e0dbc7add62ef52820021d2
prerequisite-patch-id: 0de4d879d932dc35e5fa50439e6126e3ea560929
prerequisite-patch-id: 73201d8fe16f7c701b9fa9485e0c362ac49b4abf
prerequisite-patch-id: 429a252eeb9a0cfa1881e89bf092d32105246ce4
prerequisite-patch-id: 6e38493372299cfb94a82f060cff0fba3ec45047
prerequisite-patch-id: 7ca84aededdfd010139aca6ce4053990255a24bc
prerequisite-patch-id: 2150afe0ffe671a1c608c36c9f7a8374727167f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


