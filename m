Return-Path: <linux-arm-msm+bounces-48245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43471A389D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 17:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A5243A781A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 16:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EDEA225771;
	Mon, 17 Feb 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvTZhrf9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547C225391
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810508; cv=none; b=aa0ASvDJR4zmGNcMbvjBpZwO/zD4PmfCVwzYZgCTQh8ff9J6cqfWdZN+QzWAZy+xVwPnukey86mmWda+6bJcvw8sqR52Yu70BVCBK5cmkQn4GKaBA2dxnqRjWjUtp75iJQA9MqWtT+v03CUbn5YL3FZVk5oje7dM9BKaXFnToos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810508; c=relaxed/simple;
	bh=4GpjtyPhX2tIp7jKFxe8+OhXpy9WD8kHJbcuRQ6OQrE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FdfowEd+4gYE7m9rt7x75dMJzKHybr6/JzUjLDL4+MPnP1k9nKcnMLwuUohs2jbZJual1fcSiT+NTlDyBinsWS7/QAMCg90b1QKPC8Impa8hsr0rtH6eD3M8H06qavy0Oy9ji1aG8jTDRAMnFgT64rn5l0d7nuJkTrNfWE9yCG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvTZhrf9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb9e81c408so26027366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 08:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739810504; x=1740415304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tl1qk986xZ9hRS1Mx9gWyhQ2tNCZt95h0ZGTwuGdgzE=;
        b=UvTZhrf9VfYKLukqhkHdj6jGZ73OtoZLG/DyJHH3J8qP7dksB7w5TjVcH/DkS+XBm9
         HcwZST8jKWPuQwdk6715mZzbV7YNQ9b8Gyuv2iXb6/E7Vd9Y00R7BtEdm/U4/yBechPH
         0BeU6ISnMumsnaTiPqbMjheyLZfLcRXvlYP9a8f+S59LWVL2ulHqwC1MlpL75E7DKeMw
         rs28EOB1Cz7xexwe6z/FDe1dsDbz2IH6ygQqwfLCayAOyIpvVM8MUYS0g2fnKLMN2WO4
         2rS3FCkNZCtWPmzjFIiLw7W4dBtYvleqNVmP4pY7hMFcA+HgELv9NJN+4eRjs+UkGv+r
         gLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810504; x=1740415304;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl1qk986xZ9hRS1Mx9gWyhQ2tNCZt95h0ZGTwuGdgzE=;
        b=JBGTEBLytrEAy2ufRX4CWeydHWpxKboq0JUlHxD7zXqNXnGEQ3bOIWhZOuc1upSeGr
         /6XL6BJnNrFuZPFFRFWq235TBP81BmZaJNi6a/zxklcPP6tOWKdVZJhRdiYa0E82RwV6
         3bHut+7J4pUchNFqWCZVQ4kpvzkT6H2kRBkyhakIAaUFNGowOPAdTaMFyFkveIMzSEA/
         0jtCdn7Zh2SS3AXCiCfMT0TiNaaB26lOM7BszqmtaVY2i7bswPNQ1+PwFG5a3k7C5ebl
         c2NIoSBFpRH0AcSLQxn25sHrgoGFRhG88ZH4VeXrKe80RD05H3SV3oXIgoBvTZ2DPr+s
         9C9g==
X-Gm-Message-State: AOJu0YxQ9XS8qqMAoI80Nc/Pv7ZJ29SiDFVPkJIYZCZ/RQWz+x6KROor
	X2hBOGsmKahnBvOIgukZL+9PYXEmKLKxOV0CsXxf7hTE1Q0Ksvo3zJ2D+9s72qo=
X-Gm-Gg: ASbGncv5kZGrDyzhSz6mzpFrps6ezQQsAOwjqr7TX3mjxZmr/rnVBdowdx7HYN6S+MX
	8juOSZPHzaV0ii8IRGWGzk4Gb0kftrTjXnK8w+YGCQ4LHBf/iJ3hegXdlBAze81TcGQ6P1G7Piq
	H+2As0mKWUQE+RdRmAQIZkTTVznb7BQhMirT1T+cd2HleJFxGKwtId4RivNxrGXHaUH/FvwIvJd
	FTG3kbXmznUDTn6Qlc416vJJGlOVZB8uzlVKdfpIVqJf2I2ivqC6H3WlNmQW/JHISuvkPHO2kNA
	l3YwatKyWVghRSSQbE9+R8Jc/YtRDFc=
X-Google-Smtp-Source: AGHT+IFcQeNVHnsKf9IkLIKYVAi4SxUUfp260hQPfDzut6VqqPWdr13KL6UsKqTMH8NkbWY8oez30A==
X-Received: by 2002:a17:906:6a03:b0:ab7:425d:1fa2 with SMTP id a640c23a62f3a-abb70d95991mr424723366b.10.1739810503738;
        Mon, 17 Feb 2025 08:41:43 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbac781b78sm82647966b.60.2025.02.17.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:41:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/16] drm/msm: Add support for SM8750
Date: Mon, 17 Feb 2025 17:41:21 +0100
Message-Id: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFms2cC/32NQQ6DIBBFr2Jm3WkAoVRXvUfjAhV0EisGGlJju
 HupB+jyveS/f0C0gWyEtjog2ESR/FpAXCoYZrNOFmksDIIJxThrsJcYX3etGI4Ut8XseLNG1Vo
 raRyHstuCdfQ5m8+u8Ezx7cN+XiT+s/9qiSPDvnZcOePk0OjHQqsJ/urDBF3O+QvwbVf7swAAA
 A==
X-Change-ID: 20250109-b4-sm8750-display-6ea537754af1
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4GpjtyPhX2tIp7jKFxe8+OhXpy9WD8kHJbcuRQ6OQrE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBns2a03lqV9dIyHRAwlUHltfCOEPr1IiF36ellm
 Mlcs/X8ZX2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7NmtAAKCRDBN2bmhouD
 14NnD/9a4pjkt2J6S54Y+zsdMes7Q8++B4dMo0E+BAcDVAIW+FD7aMnvRQY+gsH8ZrDSV8wrXWa
 Zt+3ARMZ+s6bjYynoZ3saHvO8tYiCPojMUn6UPnpBQ/jAJZ7KGvukfWJ6IKN2geKNqyy4FZPaH6
 U7ARb55Vt/7KAbdceUn1TaNEMFlzZeFWPu5jM1o1Hc+4XjrdsCfQ7lfDIFqCPJIMp7q1di1RH3n
 sWxrXBfcEv93aAQJUj24Vf+oaq61tMLVRp+N1EN6k/n7WYcP7RCpQaEIaN6f9XKJfBeg1UIGhWY
 slvUnjub3z53iIgvdtLYuz5/EGqm+ChSCL9fQ3o08gh62U3DgpRTJ3kddlqR8QmxJPK9Q2qMCAp
 xvSz8WYJnLAA128U4V78rc3RVgN14inNw5LJOfa15BNYLdfRDdznWN+ol5A5EWgMlCm80EU/vUI
 2V+NH+57BieX1jEWvb7jE8dYiwOZuDNAJ0pBsApZaCX1J80jV5IG6gndFpyKisLY3HnH9xfy0Ci
 AWMdNov83jiCl6ZI42MYxqPzvyO8j6gGtVTb30BoDJRz+PuWlcuR69etka/UnwBk0Pdil0fX8bK
 JBwFHSG/eu3ORZDfeFyROJrnpQZaxdQvfIOt2uPHx+BsMpOsTlIPRvHhkBB5IX4GXt6u4nb7p2W
 rQQJXEiVe/CnP8Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Dependency / Rabased on top of:
https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/

Changes in v2:
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

Description:
=============
I got modetest writeback working, but DSI panel on MTP8750 still shows
darkness.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (16):
      dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
      dt-bindings: display/msm: dsi-controller-main: Add missing minItems
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dpu: Drop useless comments
      drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
      drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
      drm/msm/dpu: Implement new v12.0 DPU differences
      drm/msm/mdss: Add support for SM8750

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  | 124 +++---
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 +++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  59 ++-
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
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  25 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  80 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  79 +++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  14 +
 26 files changed, 1655 insertions(+), 101 deletions(-)
---
base-commit: 44ddcc7604ae61eadc748ccc6156bf4b98697978
change-id: 20250109-b4-sm8750-display-6ea537754af1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


