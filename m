Return-Path: <linux-arm-msm+bounces-20944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 106798D39AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 915C0B24B67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C0516D325;
	Wed, 29 May 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oo/A+dzx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CCE15AAC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994027; cv=none; b=BVdr1u/+yZcvEYMpGvvfDiX/L8f9oRezu0jkaHcqdvXziNLkLvPfjV2AUUbUC78NidBvpZ9w/HFEK/WpwX/nbVpyWO8lzCrJF7rzIIqHUTXGr6nJ1hBXG6O+0ia5kMPTpDoZ0VmjuqDy1VBW/yeGWeumTj2bXlkPHxc/JMO7LEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994027; c=relaxed/simple;
	bh=NhsA12mNc2gFhhoKWAPojouXLLZWTiByUv2dC3557Ew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NYC8kvFM+OZNpgkQ2SB61DpWwYb+yBx0ilK9BWBiOeMViKDv7x39gGS2YBnNRKnjJ3f3lLE5LNA07RUUjIK1tCrQU9Km8fLon00/AA3CrBJNNgu0prcPA5FWT/KSMZK5R3+l8VdcCDRq+4/XZsSGXuyluJEQKZcOEbhOZhhA+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oo/A+dzx; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e95a1f9c53so26365851fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994023; x=1717598823; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqG8Y1q7bjBKJ+/8NRu/7TrrwGlZoB2oPzQw2nY5nfM=;
        b=Oo/A+dzxSrrvgCA66h8r1aSAyOIXbfg1+Uw1LQ62yYOfNOy2e6xdg7MLb0bpQ9+QOz
         o+nA//3ITXdlOyCbwQF0K8yGtgphxXs9LOJ5HzqSPxC1dDhAs7oSGRaJw6xM5diZOzLM
         NPkPlbqlG9E2QXii79yakaBTn0gI4Oeq4G+QshLXF0GVcICFWWCUmpecuht2yGWqnaWc
         G+vdNafxiXJyybUuvKB8A/7wk3z148LkQuyXiQvD6rZY49SBxskm6Sy2ecEn7avDaDHR
         6KipFwu0HJaFVYjrWl2Q4iTymdyag6wTV/xFoK4Pebj8VZUlCh0JyIDtia1cghISVJzM
         oQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994023; x=1717598823;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqG8Y1q7bjBKJ+/8NRu/7TrrwGlZoB2oPzQw2nY5nfM=;
        b=HRjlrQDfBcRgGF/j2ePsg4dZGBEgN576byIEm0GOnUmCDTf4sZxTkk6ebH+AsaeOUy
         BUQPe1OFVPTuNxfvin6a0rqkC+dzC1SJhQQGphtrkysoygC3RfLYV84ulHxJMNEWBvEo
         8j+sbpQ2LiHDRT9pp5OslQI+ZwHjfJkDwhoN6DVedZ+p/4Tl6/+8oVvNzxIB4MwOq7N/
         pcVS2GNQytRUBG5uNAsrF51RONTzQ14+puo/9zQPc14JxIwONQC6dDT6qoOsF9rkktJO
         vZMeYXN7xwO7vcIVvFOPPoMSTMtZ/zhbkXso7+PkLoP+KVPLwZ3RG06RYfcEdf2Hhvj0
         ir+Q==
X-Gm-Message-State: AOJu0YxFVq7c54GbRyIz453TU5bA/9f3Yn3t0g5Osyty1TxpXKJmU4t3
	6PpshMds7n257FxebffhyNds3eJ2MoXPDBgR2hO763uzeq+a5yQFoZhWdwwfKcQ=
X-Google-Smtp-Source: AGHT+IHclhS3LUw7IkUqpHSstY4ZACPOcpTxuufOPR4UW3CJ8otFC7p/n1zDFwNPfaZiA7JHvCQkjg==
X-Received: by 2002:a2e:9c86:0:b0:2e6:ccfd:fae5 with SMTP id 38308e7fff4ca-2e95b094550mr92920121fa.4.1716994023309;
        Wed, 29 May 2024 07:47:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/14] dt-bindings: clock: qcom,gcc: handle the
 controllers without power domains
Date: Wed, 29 May 2024 17:46:58 +0300
Message-Id: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOI/V2YC/23MywrCMBCF4Vcps3Ykia2oK99Dushlkg5oUxMJS
 sm7G7t2+R843wqZElOGS7dCosKZ49xC7Tqwk54DIbvWoITqxaBO+LTxgcFlm9EMdLTaO23ODtp
 hSeT5vWG3sfXE+RXTZ7OL/K1/mSJRoDhYL40USvf+eudZp7iPKcBYa/0C0+ZswqUAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5649;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NhsA12mNc2gFhhoKWAPojouXLLZWTiByUv2dC3557Ew=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/kgfr508qHanfxEaMuLTnrePyImmxwJf49H
 1M7Poy8SISJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5AAKCRCLPIo+Aiko
 1d7pB/9kNqbfqeceiwOn3z4zcNDkKRYmqZOaHHIcv+wc6r0OVdHAsIsHHB4Me6ji2Qy8cPtg8Tp
 trDtzOvvdWytOA+fIzwxSmGIMNRdUTCnXWZZXDhYatDtCKR02N2lDMTokUZ9/joZimn/fhfe5LO
 5WR0geE7lnSSMrcy/RGL660hlK3TW2wwWSIMxUrcKo9xVlLc+kMEFE8adlfTRz8ESGKkuGfCj8q
 0uPT8XbFhZUV/4aC1BQ4ZdOvZBr2tWB6VvUEtTrl+eVxrqzEZrfNE5jdkfM3mqA1spckDLfYBNm
 YTLefLrvEBJRuTbOL4ZNk9jM6bMrNA8jBaXWeiN5OufHZMsC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On some of the Qualcomm platforms the Global Clock Controller doesn't
provide power domains to the platform. However the existing
qcom,gcc.yaml common schema requires the '#power-domain-cells' property.
This results either in a platforms having incorrect property or in DT
validation errors. Fix this by splitting the qcom,gcc-nopd.yaml schema,
which doesn't define the offensive property and use it for such
platforms.

Also, while we are at it, fix GCC node name for two platforms and
enforce node name in the DT schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Rework schema solution, by moving required / false to individual
  schema files (Krzysztof),
- Add even more platforms, which don't have power domains,
- Sort out MDM9607 and MDM9615 GCC schema.
- Link to v1: https://lore.kernel.org/r/20240528-qcom-gdscs-v1-0-03cf1b102a4f@linaro.org

---
Dmitry Baryshkov (14):
      dt-bindings: clock: qcom,gcc-other: rename to qcom,mdm-mdm9607
      dt-bindings: clock: qcom,gcc: sort out power-domains support
      dt-bindings: clock: add schema for qcom,gcc-mdm9615
      ARM: dts: qcom: apq8064: drop #power-domain-cells property of GCC
      ARM: dts: qcom: msm8660: drop #power-domain-cells property of GCC
      ARM: dts: qcom: msm8960: drop #power-domain-cells property of GCC
      ARM: dts: qcom: ipq4019: drop #power-domain-cells property of GCC
      ARM: dts: qcom: ipq8064: drop #power-domain-cells property of GCC
      ARM: dts: qcom: mdm9615: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq5018: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq5332: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq9574: drop #power-domain-cells property of GCC
      arm64: dts: qcom: ipq6018: fix GCC node name
      arm64: dts: qcom: ipq8074: fix GCC node name

 .../bindings/clock/qcom,gcc-apq8064.yaml           |  3 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml           |  1 +
 .../bindings/clock/qcom,gcc-ipq4019.yaml           |  3 +-
 .../bindings/clock/qcom,gcc-ipq6018.yaml           |  3 +-
 .../bindings/clock/qcom,gcc-ipq8064.yaml           |  3 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |  1 +
 .../{qcom,gcc-other.yaml => qcom,gcc-mdm9607.yaml} |  4 +-
 .../bindings/clock/qcom,gcc-mdm9615.yaml           | 50 ++++++++++++++++++++++
 .../bindings/clock/qcom,gcc-msm8660.yaml           |  3 +-
 .../bindings/clock/qcom,gcc-msm8909.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8916.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8953.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8974.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8976.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8994.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8996.yaml           |  1 +
 .../bindings/clock/qcom,gcc-msm8998.yaml           |  1 +
 .../bindings/clock/qcom,gcc-qcm2290.yaml           |  1 +
 .../devicetree/bindings/clock/qcom,gcc-qcs404.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml |  1 +
 .../bindings/clock/qcom,gcc-sc8180x.yaml           |  1 +
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sdm660.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sdm845.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sdx55.yaml  |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sdx65.yaml  |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm6115.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm6125.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm6350.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8150.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8350.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml |  1 +
 .../devicetree/bindings/clock/qcom,gcc.yaml        |  1 -
 .../bindings/clock/qcom,ipq5018-gcc.yaml           |  3 +-
 .../bindings/clock/qcom,ipq5332-gcc.yaml           |  3 +-
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |  3 +-
 .../bindings/clock/qcom,qdu1000-gcc.yaml           |  1 +
 .../bindings/clock/qcom,sa8775p-gcc.yaml           |  1 +
 .../devicetree/bindings/clock/qcom,sdx75-gcc.yaml  |  1 +
 .../devicetree/bindings/clock/qcom,sm4450-gcc.yaml |  1 +
 .../devicetree/bindings/clock/qcom,sm6375-gcc.yaml |  1 +
 .../devicetree/bindings/clock/qcom,sm7150-gcc.yaml |  1 +
 .../devicetree/bindings/clock/qcom,sm8550-gcc.yaml |  1 +
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |  1 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |  1 +
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |  1 -
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  1 -
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  1 -
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  1 -
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  1 -
 58 files changed, 106 insertions(+), 22 deletions(-)
---
base-commit: 5274c645b48141dd4e6f60ec7ff24ef143ec9952
change-id: 20240528-qcom-gdscs-b5e6cafdab9d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


