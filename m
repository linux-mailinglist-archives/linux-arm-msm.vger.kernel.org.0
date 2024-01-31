Return-Path: <linux-arm-msm+bounces-9164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26876843718
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BC51F2380F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814D03DB91;
	Wed, 31 Jan 2024 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aR8uiQIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34923E49C
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684872; cv=none; b=hDhziHnrAECl+Apuf/MXvLsjgw1xfXL6umRkgQbbXYaQSaBN473t/PZ929zjUMhg/oN+094LEgAqH5kyrb8PNBq0KNuC1LNbyH0L7IHY7/X+Q3FEfE6C2wrPkS4zd5b9i8VBIIru/GVR77n2HtDXm7YNydnHhPD/CmHK3zeRBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684872; c=relaxed/simple;
	bh=8oILixSlZ5urTs1vGCrQlsyLD+Svdi6zXRxdXJ11eVo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lpSoKGCrRoNEUWYezbRF+D01+kC/vNf3dYqgMpOrid2LlGhKHErSOwwbqQII99MBX67G+G2CdXdmH4twIGjDZWOHI+5ra/TJ60XOkf+tTQZdOlG1cj9M9CaDbXir9a7xz5O0mFEC/aJF3mZqrvA3D/8tW0Gmsye8l04Z1Qs5J5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aR8uiQIa; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso2529164a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684870; x=1707289670; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOSkO6Y4FYd8fxupP96Kte1aY7D/V2g1zrYc1jxvyPQ=;
        b=aR8uiQIanIUMGZJPN5Sv1LcknTsmogTFKFsBH0RxXhFlPMLfMEu2PTuKwuc66hAAdd
         y0WFp+kwoZkRTzZrEBN5u4tLNugTB3lxDxM93SsqGahJ/NjYJgh64z3ULGCPRbrus8LD
         zONGvlwTM4O7jcltoiZ7mg0gw9XG/7VrAk4fgShW3b2zv2tqo/qaTkrc5kNh+RjivHin
         dX2Y27qzDnOjo+GZ3jhYsaJxkV2TzIzzaQBy0LYGPmulSjrgZbwsTmFKzBCzEdlhZZrK
         frdNu/gxKS65ra3QN42XUk+b1rQaPIzdMti0QJW8GVtVxLz7vgdv1Atu1byYN7hlIYgl
         yIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684870; x=1707289670;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOSkO6Y4FYd8fxupP96Kte1aY7D/V2g1zrYc1jxvyPQ=;
        b=FChlR3HU0OXUbWinHBuh/ZhlESpoGJi1aNDIPGXyl+nG4YsawWWNcQkhlnZLbD16x5
         S2OFaSK5YXnhE+dJEB9LwyJVAM8uXyFq7qsQxG46GXZGVDnY6QlHGBmCY4x4lScWiMjQ
         sr+AreJiQPlTjjRdaKQxBBv6NI13l7a0UWdzwtvdWiuV4yrmk+0diC5j7zfsXZ75Ir5W
         s2AUfX+U6NLoKdqQ4ysFHXdn8P1DwddgJpNmgrMgmzaVbTI6Zu2glxRu7muuPI20T0yj
         KBDrIifgaPah3uZ5zEyH15IhYqqHRrNSD+KKdsHDLiRzz03xAJsGVWCTXgQ9zxJTCkiG
         +MSg==
X-Gm-Message-State: AOJu0YzGmAAXanUrCUpDw3/w40HDZ0Rs2XRV0oJXoE5sq95F69aISbJU
	yx8hFNnx27zmfRibhSBje5Sje44Z7Czgg92mPr8viegv6sUjZlhgZcrc2wYnKg==
X-Google-Smtp-Source: AGHT+IGq4Dd3fKbHGpJ491lSOAvBvsjx9O1WWxRttsPouRtdA4cN3NaV7/uiBsxKoB69XgDHDdyI+w==
X-Received: by 2002:a05:6a20:9e91:b0:19c:a7c0:acd8 with SMTP id mq17-20020a056a209e9100b0019ca7c0acd8mr719947pzb.0.1706684870039;
        Tue, 30 Jan 2024 23:07:50 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:07:49 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 00/17] Fix Qcom UFS PHY clocks
Date: Wed, 31 Jan 2024 12:37:23 +0530
Message-Id: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvxuWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQ2ND3dK0Yt2CjErd5Jz85Gxdc0tjyyRLI1OLJONkJaCegqLUtMwKsHn
 RsbW1AADUe1pfAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3384;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=8oILixSlZ5urTs1vGCrQlsyLD+Svdi6zXRxdXJ11eVo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG2op3Brs8QxQHR4Lma+anPdMoGprBMDMvoU
 04otxHtgv+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxtgAKCRBVnxHm/pHO
 9WobB/9NZYXT3tglVcat/alW1W2NsBvVeeQMIiTQSkS56WqIl4UHrc0WDixCWSWuq90DVYkkzQj
 DQR93pb3ofsHf4bPUZZv5CGNDYGZCKpMh/5OM+tGYjOElbgJKujYEIJjw50vJRw+7ZDXPKEV4be
 sFNBIU2jj44uXi7+XSbMAvTUX9Ho3lZ2OT4jV4lQMe0cHuUiZbidlw/QOQdhHrtO9tCuZtUlCov
 ZrxHspD4SpPtxp9deLDoG0fBe/cl8tIAIu2EYe0rxn6Mkg4HrbpK/dFVIHH3SB8XnuOGqrZuAyg
 MjZsL5Jw2TXxRS+wnDHx6CxtVTT7I95xGozCN6KUdmV+7jlP
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hi,

This series fixes the clocks supplied to QMP PHY IPs in the Qcom SoCs. All
of the Qcom SoCs except MSM8996 require 3 clocks for QMP UFS:

* ref - 19.2MHz reference clock from RPM/RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC or TCSR (TCSR since SM8550)

MSM8996 only requires 'ref' and 'qref' clocks.

Hence, this series fixes the binding, DT and GCC driver to reflect the
actual clock topology.

Note that the clock topology is not based on any downstream dts sources (even
they are not accurate). But rather based on information from Qcom internal
documentation and brain dump from Can Guo.

Testing
=======

Tested on Qualcomm RB5 development board based on SM8250 SoC. I don't
expect this series to break other SoCs too.

- Mani

Changes in v3:

* Added a patch for SM8650
* Collected review tags
* Rebased on top of next/20231123

Changes in v2:

* Reworded the commit message of patch 1 to justify ABI breakage
* Collected review tags

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (17):
      dt-bindings: phy: qmp-ufs: Fix PHY clocks
      phy: qcom-qmp-ufs: Switch to devm_clk_bulk_get_all() API
      dt-bindings: clock: qcom: Add missing UFS QREF clocks
      clk: qcom: gcc-sc8180x: Add missing UFS QREF clocks
      arm64: dts: qcom: msm8996: Fix UFS PHY clocks
      arm64: dts: qcom: msm8998: Fix UFS PHY clocks
      arm64: dts: qcom: sdm845: Fix UFS PHY clocks
      arm64: dts: qcom: sm6115: Fix UFS PHY clocks
      arm64: dts: qcom: sm6125: Fix UFS PHY clocks
      arm64: dts: qcom: sm6350: Fix UFS PHY clocks
      arm64: dts: qcom: sm8150: Fix UFS PHY clocks
      arm64: dts: qcom: sm8250: Fix UFS PHY clocks
      arm64: dts: qcom: sc8180x: Fix UFS PHY clocks
      arm64: dts: qcom: sc8280xp: Fix UFS PHY clocks
      arm64: dts: qcom: sm8350: Fix UFS PHY clocks
      arm64: dts: qcom: sm8550: Fix UFS PHY clocks
      arm64: dts: qcom: sm8650: Fix UFS PHY clocks

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 48 ++++++++---------
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 12 ++---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  6 ++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 18 ++++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  8 +--
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  8 ++-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |  8 +--
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  8 +--
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  8 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  8 +--
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  8 +--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  9 ++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  8 +--
 drivers/clk/qcom/gcc-sc8180x.c                     | 28 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 63 +++-------------------
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |  2 +
 17 files changed, 129 insertions(+), 125 deletions(-)
---
base-commit: 06f658aadff0e483ee4f807b0b46c9e5cba62bfa
change-id: 20240131-ufs-phy-clock-7939b9258b3c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


