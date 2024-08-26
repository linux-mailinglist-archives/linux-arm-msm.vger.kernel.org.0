Return-Path: <linux-arm-msm+bounces-29496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4B95F3FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A67371F22529
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F9018BC01;
	Mon, 26 Aug 2024 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2MDYqw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A016143C70;
	Mon, 26 Aug 2024 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683085; cv=none; b=iz/zz1LrShPBnmDWIoWZoGXRh8m/XYyzI0O94DvrcZaiTcKD7+ts3ox/fZk6zV4LnOgx/VCm6qO9Xc+xXj4acDlayNmeWrjhQlReUanMhlJ05Y+oNUyoLbhQQ7Hc4CtnLfw9DxRyNpXeMK9EmAQM+mO9/7/21+th6QT/7S43Ozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683085; c=relaxed/simple;
	bh=2F3ChVpAapohZrK4s3eXXnWeAXbnRLAmsVoMUX+5w0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dkP6Mto/uy7d/g/DX7GiVtnCwVOM0oxtnIF4puk6JPZMIkxSGiNI9W6jPtOXsbf66a76hNZcJJGeJovyT/vLczyIrl/D1YN6axXms0kW1KYtOGdt8nr4m3P3SMA4GJkp8XTT+gS6m1eCBv7ni2z+/pXr3QP82hV+vMatKJMDMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2MDYqw2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32481C4FEAC;
	Mon, 26 Aug 2024 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683084;
	bh=2F3ChVpAapohZrK4s3eXXnWeAXbnRLAmsVoMUX+5w0M=;
	h=From:Subject:Date:To:Cc:From;
	b=Z2MDYqw2RSEChrNEjQPTm+m1gWRre/spe7mkQR64Qj0ROHDFFykED7Nn5ZCBd30Tq
	 HFG0tUP+/2bB6Micc+s6CUDf0+rfiIEX1vcuy7eki01jcm1z6yR5pqKM1rQUmr7KjT
	 l4ZLMYPJ+Fant6YQOV8CatK6V52nRP1dNyuHIqFqF5RaiM/mZyGCV0Btl5ztg4SK2R
	 kCKxE1x3xtH57hdDGvqamUohz35UB7bilvgBj4tW8Vd5jA0cqstyC1hpAWqPptP0qn
	 0y07AsndHc0uBjP3ovGWkrZFTHrZ7fX+UbYENrUxCF7QMFvO0fhmKAOgRFYSfyKN/E
	 2H5Ovrf0zDYeA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/5] X1E Surface Laptop 7 support
Date: Mon, 26 Aug 2024 16:37:49 +0200
Message-Id: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2TzGYC/23MQQ7CIBCF4as0sxYzhUZbV97DdIEw2EkUKlSia
 bi72LXL/+XlWyFRZEpwalaIlDlx8DXkrgEzaX8jwbY2SJQd9jiIJcxsRLofhb0qIofa6oOF+p8
 jOX5v1mWsPXFaQvxsdG5/6z8ltwKFxAE7pWxvnTk/X2zYm70JDxhLKV/3it3JpAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724683080; l=1440;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=2F3ChVpAapohZrK4s3eXXnWeAXbnRLAmsVoMUX+5w0M=;
 b=BhVGrCYaAqnM6E7bm//Ol6PqDp2zaoQP9lbgUFN5k1b6WIPELIjvm+VgspyJOjIcAY90T9Gk1
 NNYeVyZa+YvDgD3lP887N40CyjQ0QVxy2S7iGNLRZ6XU6Nz0GGSOz19
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series brings support for X Elite-based Surface Laptop 7 devices.

See patch 4 for a more detailed status explanation

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
Changes in v2:
- Style fixes
- incorporate SAM support
- separate out adding PMC8380C PWM
- Link to v1: https://lore.kernel.org/r/20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com

---
Konrad Dybcio (5):
      dt-bindings: arm: qcom: Add Surface Laptop 7 devices
      firmware: qcom: scm: Allow QSEECOM on Surface Laptop 7 models
      arm64: dts: qcom: x1e80100-pmics: Add PMC8380C PWM
      arm64: dts: qcom: x1e80100: Add UART2
      arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 835 +++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus13.dts |  13 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus15.dts |  13 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |   8 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  70 +-
 drivers/firmware/qcom/qcom_scm.c                   |   2 +
 8 files changed, 940 insertions(+), 5 deletions(-)
---
base-commit: 1ca4237ad9ce29b0c66fe87862f1da54ac56a1e8
change-id: 20240809-topic-sl7-db3eef0ada6d

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


