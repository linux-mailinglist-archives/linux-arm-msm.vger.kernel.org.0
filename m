Return-Path: <linux-arm-msm+bounces-4699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8892812B27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 131C9B21270
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 09:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551E028688;
	Thu, 14 Dec 2023 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bGCvINlD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C95118
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 01:11:18 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-77f3b4394fdso429049285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 01:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545078; x=1703149878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAhAJU5yP9YNumHSLe8ZpA4RAtCq2Rb2d15S/ucYWeo=;
        b=bGCvINlDRccgTjBeFtLbI1oG/SrWWvDZpJ1mxXgCNBoXMItDgZb6FPXU07Jx/evJhV
         7wfr3c7aYaccoynVOs7uMvVCeOyMovsDqPAGcSUbDWm8B/0nf76HkjwMTlCGDlJ/dNSy
         E0T0XkgjmbVYL+24RuQ6DQQIZ5lYuOhoax43U6PR7taHJEKmesHzhaw6VxMWqoeDKFRv
         yfXyYLv4e0VZl2wKLmLveEHtdZlonrGSbupgwZPzn1Jwd3zgDZcv+lzw0fLPIXyMIAxx
         pqcXW40YOgxk1IyA8fOBHbsUbAExzT+6MSG/sXK2pUi8AUxgBTgJ+kLUGXgfXXujEvwm
         XF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545078; x=1703149878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAhAJU5yP9YNumHSLe8ZpA4RAtCq2Rb2d15S/ucYWeo=;
        b=nhxKxSg7qLh+GQSNmUOnIOK+eMR+iJ0WXSKtZprbsMQJDmdUuN7Vyjp0ZtfpAqtxKN
         VOE6EcqGnfLKEDerQpXjXU9u6cWn0NBsnx5NHZNZbqd+4qZqIzEI0WO5v0q8jeQa8A80
         xQ1FcVIfokfeVUkt8jk7STBgD74JMcrQ9DeYrzCriq7yvlU+0C7ft5lDwXYGLPUt9Zqb
         LfGm0u5RvXJblo8ONDAZucFhfwQwi7DZnPVUXDHHMErtUhy3CjMXroEdDVEu+/MYGBK3
         YMdIUyqqCWseI72Sx1GU7QAX+W7hy0HzmWon+4Bby4RKFjtpOTeMk52U7Dwb0k1GfZ0k
         LHGg==
X-Gm-Message-State: AOJu0YzobWsBKSaU1Y3CbsQCoXKWQRyIKCnsWMR2DMK4DR3ydmnBOVet
	7EVqEiZdfHTVAzn4YAmcU+7d
X-Google-Smtp-Source: AGHT+IG/Re2qE2ey+m/qkbqpMLsYm5+OUKhCYWWHNlVIfYfzMWRf+NwwVM2BQnGRuNjT6j5kJqDtSQ==
X-Received: by 2002:ae9:f810:0:b0:77f:55b6:7d00 with SMTP id x16-20020ae9f810000000b0077f55b67d00mr10371015qkh.46.1702545077885;
        Thu, 14 Dec 2023 01:11:17 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:11:17 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/16] Fix Qcom UFS PHY clocks
Date: Thu, 14 Dec 2023 14:40:45 +0530
Message-Id: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes the clocks supplied to QMP PHY IPs in the Qcom SoCs. All
of the Qcom SoCs except MSM8996 require 3 clocks for QMP UFS:

* ref - 19.2MHz reference clock from RPM/RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC or TCSR (TCSR since SM8550)

MSM8996 only requires 'ref' and 'qref' clocks.

Hence, this series fixes the binding, DT and GCC driver to reflect the
actual clock topology.

Testing
=======

Tested on Qualcomm RB5 development board based on SM8250 SoC. I don't
expect this series to break other SoCs too.

- Mani

Manivannan Sadhasivam (16):
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

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 47 +++++++-------
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         | 12 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         |  6 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 18 ++++--
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm6125.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  8 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  9 ++-
 drivers/clk/qcom/gcc-sc8180x.c                | 28 +++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 61 +++----------------
 include/dt-bindings/clock/qcom,gcc-sc8180x.h  |  2 +
 16 files changed, 124 insertions(+), 119 deletions(-)

-- 
2.25.1


