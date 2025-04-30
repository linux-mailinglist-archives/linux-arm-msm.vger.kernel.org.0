Return-Path: <linux-arm-msm+bounces-56268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F9AA4C93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182F71BA1C6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4242343CF;
	Wed, 30 Apr 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfhbL9dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAEB25A2B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018072; cv=none; b=LhhIJN0MGTMNzwL40qdsRT1gw7I0I9YP/g8/W2doXP0n15FlX+kVm/jnbgLSZA+EN0n75HbY1w8J5zgB7ANGd8MNmxD0RSCHzA1kI6qU8q8GFtxeCj8oKrSBrNF8DOCR5WcQ4YoidomYaTnirypOzk7Olebdfp4JNRfQzrLQncU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018072; c=relaxed/simple;
	bh=6UGiGoFvF2aKJYkukKaOiAHHAs4rLWuriEaXmp3EsCA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XoUSdlOCG/JfdePOtNsKzSQfx5wJPxD9EDyUXCixFgY3wZwz/iQWOEftTtz+Eh7cJULdL8TLpis2MhXGsL3O8r2E1u+ad5MlmHcE1zwnQoQCGRJX34YZ6PScWmcfBo10JwHWhktgP+pg+W+zoCDkIC5mFIrS0ua2W6wfXYi3vEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfhbL9dz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ab85402c9so244367f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018069; x=1746622869; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gbEAkZNMTXlcsAP74FaPsyQlrV/eFxqWvfSJV+6E6A=;
        b=cfhbL9dz/x9IXZs0Cc5fmeVS39DfvVNRkLJChgF621IdfTtoq0mZw5a+u5AS8J1KmZ
         Dyx2Yq8bZH7/VaHbIQnT3GT7ktprdsNyTDYxc3uPFWNsmH7LLUTI8zFz+DW8xsHyRgmv
         zDIjsVLp0s96cfQmzICSEIoUTR9x2OtwDzpMTGMn7hQwegBwHpViABnRfYn9wQgw+Yk/
         hyX6Uto8166wHt7l4cW0l6l5pVySPmDrC9WT1npHDBPrOAlTkSz0Ns0phAPEW2rnXvh9
         AC8BrajMDkxrtoFOCOEOzJ/P9+pVGqoTUPIIPm6NVuCc7rcbqyOLRnxGhZfmO2Nm4mRi
         h5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018069; x=1746622869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gbEAkZNMTXlcsAP74FaPsyQlrV/eFxqWvfSJV+6E6A=;
        b=Lq5Q7/pvlfDfq64wiVyP9btm3z8IdDIwY8Y/lFjtgUrVxGQc9gMvHOgehqap6nv2wd
         EIzqSpjFMoe5QXIrOdhIHiqu2OmUHVSV8n/4+Cc64dcubmq+pi1JOD93w5nlAG8WksfN
         jMgI4mTGBJqOTI5qj2oIkpWTxL5nTJ9i92vr9SLzt8XBr3czQu+hkHYFGSrGL5iuHroM
         9+D9S26N9hNwTR+DWfdrNiCNEObwfDQzj0lBNwxFPQk6w+ovlT+v4JMeDY06SIVv24OQ
         DV67wVgA57O/SZDzpjCcLyZHPH+Gr0UEYgCYqBZ0q7I0Y4x88Gm4YKYl2S4gkpVfkyIi
         pq2w==
X-Gm-Message-State: AOJu0YwOTdH8YUj4j0DOQNJ3jdY0Kgxh1cotVy79/qu2r8693th0B/6S
	E/cOqw++8JD8R6O1rsPGrEOLBNp1DrMSrdfAKCPEhYqCVMGuSGmmReo2HeCh/GQ=
X-Gm-Gg: ASbGnctYQ78jNBTh93+8S/gbV1t89tUBEnjjNA9HXWn6M5ejaEjE9AKrCoCXDsLdtbt
	WyCgZRatMKNz4VOvJfxTlH3SEnNmipQWb9taurCo5amCwTBA8+u9HtGevts0xC7P8kp2vcS9wVe
	IGyZzsU1VYjHRUPTcOSOfM2Uti7nlcpwWgIkQ5hGxlBNDCc++s8EK9CcNXDn0uEzUlXJ+Fz6y3j
	aKywA9O8zYEJHeGgu6L4lNJ2X/aJpY8oNV1KEfQ8yoN0csubY+mICwi61mGGskn6HPCnAwWslFO
	R3gjdiu6WW7E4OPIPr80FlW7Z5liANCWen+s1tug4doZ1ZJhY4S86hNPihw=
X-Google-Smtp-Source: AGHT+IG2VTFNWUrEEXBGyq9UKQdZJTmvSHvUA0Jr6vxl/QuIFwOD6OSw3MFYg94J9D0YPZj1GRv5Ng==
X-Received: by 2002:a5d:64a6:0:b0:3a0:7a0d:bab1 with SMTP id ffacd0b85a97d-3a0900a1719mr732293f8f.16.1746018067135;
        Wed, 30 Apr 2025 06:01:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 00/24] drm/msm: Add support for SM8750
Date: Wed, 30 Apr 2025 15:00:30 +0200
Message-Id: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4eEmgC/33OzQrCMAzA8VeRnq00/bSefA/xkK2pFnSTVoYie
 3c7LyoOj/9AfsmDFcqJCtssHizTkErquxpmuWDtEbsD8RRqMymkESA8bzQv57UzgodULie8c0t
 olHNGYwRW9y6ZYrq9zN2+9jGVa5/vrxMDTNN/2gBc8EZFMBGjbr3bnlKHuV/1+cAmbpBvQoKbI
 2QlghQQ2hDQov4h1AchYY5QlVCE3jRglSD8IfSbUDBL6OkLtI0ib3zr7BcxjuMTameQpnwBAAA
 =
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6319;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6UGiGoFvF2aKJYkukKaOiAHHAs4rLWuriEaXmp3EsCA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7yFUeWWAHdoSLpFqk1YqlBuLC8G8D2EspQP
 Qekz41s5HyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe8gAKCRDBN2bmhouD
 12CCD/42Cq/qpyv78r3bYG7TRQSjR8W8dyfhsDw3xahe/6kwJE/8tsdJsyU4V5Czi4WSJ0EGiyx
 soRoYgjSB+NythlqFWG0bhEZQOOaDaC7GlBWt8bn1sbZ7Lhj7D01PIDT9C0ppHxU1Jkg5d5FaBy
 AZbFxck67k55KcrhXL29H/OMafzCARj53SSBhbuO2NAOY3ILMUe4e+2YyyKs14jx/aoKoLq9Ocl
 VXx0EEW8uVz+sX7P/JQDSqUSwR36y7/WioWqz4epvqkAjVnudlafckdSSsuHpi5mOXRETqctIvz
 xiK0q/xoOT2dT2Ivj7fDsQA3qucXsFbR3lMIIbeKuQ0vd+8Ty3a+boi1MhtDXcqQ+kHxDhg/tow
 lB7Ud4HQxqEkiGlFVDmOWFNyL9C+Tvr8NYu4iEjS6h0ccLF35wa2eR9jonSwgFLbzMpskvCxMzm
 bgz15GZX/vkIR/V4Uba8TVS6XJllMFdQxVfzqpyoEokxNqiIuIPJWv/bBffB2o6wUbaCo9zfNzH
 4q/483L74Yx6SSczfMW9liPaEocmF7+R3yR350WnX6SlNApemvkf8wMUJkOgPT+lse58EVZRfbT
 pME8C8sAfDFTNz2eQIGrxSYVF+/V4c4M0yP19aKakQL0biZAaLZh/hIGpRZxwSPIjvBc5JG002+
 EGnF1YMAh7F4mYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Dependency / Rabased on top of
==============================
https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/

Merging
=======
DSI works! With the fixes here and debugging help from Jessica and
Abhinav, the DSI panel works properly.

The display clock controller patch can go separately.

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
Krzysztof Kozlowski (24):
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
      drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on ctl_path reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before blend setup
      drm/msm/dpu: Drop useless comments
      drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
      drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
      drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
      drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
      drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
      drm/msm/dsi/phy: Fix missing initial VCO rate
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
      drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
      drm/msm/dpu: Implement LM crossbar for v12.0 DPU
      drm/msm/mdss: Add support for SM8750

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  |  54 ++-
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++
 drivers/clk/qcom/dispcc-sm8750.c                   |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  58 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  71 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          | 210 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  14 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  81 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 157 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  25 +-
 27 files changed, 1730 insertions(+), 49 deletions(-)
---
base-commit: 4ec6605d1f7e5df173ffa871cce72567f820a9c2
change-id: 20250109-b4-sm8750-display-6ea537754af1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


