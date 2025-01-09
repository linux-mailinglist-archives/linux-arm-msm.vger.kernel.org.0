Return-Path: <linux-arm-msm+bounces-44563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E82A0768A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 311C5168536
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E22216E14;
	Thu,  9 Jan 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L41Yqr3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354A21859F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428128; cv=none; b=G5MMyo9TryalmPtSD5n8JUlA/LvL7m7q2/o6IAW5JgwvPFp3QxaOyG40o0KMfeFH+83gOPjSmpnUpHmJiaU78XZKywFNutrQsUGMMEbrSZw3QwqIdiwwrvSCTj9mZsnaZaLPvqmLAY5qzOlhx2e1cegAQ/C5LAuYQtKYP9RySbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428128; c=relaxed/simple;
	bh=V/rvpjKAc8KwegpBEpR0XfRNaqLlpjQvs3AFkc0+3mc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iW7O0rH63ybfZEZ+Qj3LLcd3NB/H9l6FdBjFSgDwEUpRfAe2bZhxDHuz1uJoAEQZQ4U5TKFNjsWXC8N4U+QFcFlzp7R7CneEIGEyVEl/JVtSeqSlT1XiT+yEEmSTs/GeFjC7rlkjgoywzTLzOYPNjz8hWOup8BT6EJGMSeRQPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L41Yqr3f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso954425e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736428124; x=1737032924; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fuLlOiXUXKnRhH1On0PX1rvgW+QHGgHGX18PUfH8Sfk=;
        b=L41Yqr3fGLivj014Nz0PZscTVYJ6ptwNPM5Z6JzWKN1lXseC/cH9h3qkvUkom40+6O
         hw+SvyVJCWSiIuj6WfWUe3nfkxwInwBrAHEEBEftEKbDtsIMMlz5Xe1ABVwl/PT2KnTZ
         /aM4IQpMS8zlvhB5/ISL1hHWv5JqSasZJXkwm2g3P+Z/dxdUlgMFTBW6r6SyNsptAu4k
         MCVZ9HARgDMwd/4LF6yzUDOaPqju6FonRFQElxjj7wyGkRpjq8CficY2WvKpgTxQENQu
         Qx3C7LfSWQjDd3m4/1eC1RWOZ1EbwZn2Bj+ppFXPEDLGokguXdLOhayvB1dI2ZVnfGNW
         UINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428124; x=1737032924;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuLlOiXUXKnRhH1On0PX1rvgW+QHGgHGX18PUfH8Sfk=;
        b=V4+LFJw3RFjLi+mB5VT+cjJJo3FZaKmP7LnHnFz9sR2XWapPljs/mGf87wIuhBHs8Z
         gWZ/YidnvJKsYjTf+NfW34fV5akCtsTRB7z1N3/bBgAwC0Lm8jVmCFjqVEGnN0gGCTWe
         of1FVmS/yVARbIQunXycui8ER2BOLQ9nC/yPYM3q7LtEBBCu8jiZyrpRiCxl++fJSwzB
         CGrj2ot1qzt3ftnsgFnuWggCoK2da2VFTEdWOtWRD9n1a72Yj72lqdATz751++FphcCI
         FYsf/QjQEs7CjAvwucYmYB/th3sdFecJc2+mnpoUwhXac4I7pqz8aJpfnSYA1BdONEeE
         oTuw==
X-Gm-Message-State: AOJu0Yw4b0tIhuo6xWg8ntVnAr0ONyLksudtpbi4VPoWndmz6m3sXLfl
	rC71H1NOqe0q+6bybCGp4V6ABpdcW3KmgSP/J7V1sRLq6+PlaJ8A3nC0v0b4FXQ=
X-Gm-Gg: ASbGnctYeNMulQH63xctd97/m7R1McBDyfxSmeEN2bzl7o+0TM204MVPltxahVwu/0f
	I+9w8P3g6CoQSXmZhbI7rVC4tP8qpeWGmYp5+mhffeKXXnUX0Kd29t11osZfrw2WLwl1c3J6DSX
	3piKYKoA/jqOymU2fhLptd3Jo00vbtrwBXG+OJSIxMr4VxtSO0Ty5R+SOJcqqQUqkM/9AismoMA
	okyvdNzW9DG8JkXjpLjxiEs0rzccOvOZkfHRhXbuZMNUNvvYiJ7M37lZBgF2n6iPxT8BYX0
X-Google-Smtp-Source: AGHT+IFHSrO/z2IrsdPv1zlsY4eaxotZ8IucbvWgCMwW9PfHOa6zyCWKyMdvewg6jasNjfGQd9IjHQ==
X-Received: by 2002:a05:600c:4e52:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-436eba35780mr7441695e9.3.1736428124428;
        Thu, 09 Jan 2025 05:08:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:08:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 00/11] drm/msm: Add support for SM8750
Date: Thu, 09 Jan 2025 14:08:27 +0100
Message-Id: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEvKf2cC/x3MTQ5AMBBA4avIrE3S0iquIhbFYBJ/6SRCxN01l
 t/ivQeEApNAnTwQ6GThfYvQaQL97LeJkIdoyFRmlVYVdgZlLZ1VOLAci7+xIG9z56zxo4bYHYF
 Gvv5n077vB5Y+EIJjAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2797;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V/rvpjKAc8KwegpBEpR0XfRNaqLlpjQvs3AFkc0+3mc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pNMxOxDm6xY/QOvdYu5+akyHTu8VgNfBwAe
 6VwNxI77hiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KTQAKCRDBN2bmhouD
 17uHEACGj8f29cWYZih4RbFvhERvA/L+duReJZfq9d9CgKJ7xas6I5SlG3ngq/xKmzoZaWRG/Oh
 ZW9Ao9yofp80d3R25rnB0Jz4XwNRnHklzWylNjvODP7eQ5MRLpAt6BS8S31ePLTYle+NmBwtGXR
 ycK8CgHKhWqz8WXSE303J+8L8LVbzha8kIAi3sj4zC6PiPK1kY5wdaFqWpRveLvujsmL8MWXSUu
 CiqohhGM1lmH+YbAiYh18t5bWc9bhRaUp0xzFueO48cJ1RjEJV9vd3tUVkVyG62LQIVsgF6lUAI
 ft0HqSi76fSvEusD8WciL8L7sijeBOn7xYndPVXNXrVVSk5k9Ng6V191HCGGrm6YplGd/v8Di1E
 rDY0bkVSvvaCR2bt+P8gXXkvCZtbXGV68dt2J3XHDzUNsnQVrXYlMYpf3WUZwRcXgjIGn5oNaNj
 q8WdA3+BMXEYel7b27RvkafsQ0DOB8jOgKy2PZkZWfqgb6+oe6l4+Sr38iAxn5KbFgXomNmwinS
 Jy5g3bE5XhA4b9b808dzhzXQ2WRHuC9SvBuNwjd8o1M4w+Y2QhNNAVRuEHGCty5fBIGVyBtnWot
 v1go/IG7wfraVukYcisvNcE0EIhsuVkz9vNJPh560JzAppkbdcYSlgkiwlfb8+RisYzDjP2tAMI
 wFeIluQPFV4IrLA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

RFC or WIP: support is not yet finished because of two important
differences not yet implemented.
1. DPU_CTL_NO_LAYER_EXT: see last commit
2. SDE_MIXER_X_SRC_SEL: LM crossbar: also hardware changes requiring
   each pipe rectangle to be programmed separately in X_SRC_SEL blend
   stage. Downstream patch is bigger than above (1).

Sending this early, to gather comments or maybe find volunteers for
implementing above missing pieces. :)

The hardware catalog and DSI parts should be finished.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      dt-bindings: display/msm: dsi-controller-main: Combine if:then: entries
      dt-bindings: display/msm: dsi-controller-main: Add missing minItems
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/mdss: Add support for SM8750
      [RFC / WIP] drm/msm/dpu: WIP: CTL_LAYER_EXT is gone

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  | 124 +++--
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 460 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 522 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  38 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  25 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  80 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  78 ++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  14 +
 21 files changed, 1335 insertions(+), 79 deletions(-)
---
base-commit: c38a35d266317199e72729fbbca5b2337c20a6d9
change-id: 20250109-b4-sm8750-display-6ea537754af1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


