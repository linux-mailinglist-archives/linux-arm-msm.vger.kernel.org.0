Return-Path: <linux-arm-msm+bounces-3705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6C8088CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D7BC1C20B11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696513EA72;
	Thu,  7 Dec 2023 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uAefRhTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEEA10CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:06 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bf82f4409so668506e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954424; x=1702559224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8FyGaF/MVFOoimFLz57PM56EaJq8RVHxAi2RyNyMhw=;
        b=uAefRhTjG3dCmwKCJQ+WT1gE8h9qcVtwY+Oum+qcwcT8mCxYGTvfBcxSAeL0Mch20X
         pf+otKXn5Mn96ommri2sEcx2xl9q7eKvz0NySF1SvCvuXEePcQz84WSpDwuo9KWo+yrx
         026P7JpEWyghbEo5WFMEAwxX2YML58bInLu6DdtcBQbPIa0+0bhaq50Uzeev5gGlS0/j
         IH5iK1PC1SbkrZ9itcisH7wZd6Tea4Lp1+Nif7UFXku94Zk7q/WmD0pvjaGtMXihCrGQ
         NtSN0Mp0ho8sMFs+2uUL6pwcf2+21k71fZrcB6nhYgclRm+JUTDH+TE0enMcjCiCuObG
         snzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954424; x=1702559224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8FyGaF/MVFOoimFLz57PM56EaJq8RVHxAi2RyNyMhw=;
        b=Td+6/xgP4lstpj79/B/Wr9/FS0vPZ+l9YjXlhAZvVkYC06YEdP2/a9CSj1Qy3u6IPC
         S6+oGBgicOZehcuT1syTg5JhfPEwy04s7SSv+HYWarlnYIKO0Oh+A16soW1pAXLJtZKy
         RMJ9E7QDnxyi97iV6WhovcrSXdakX/7X5UaTRXwPOjRAI+d4H9UdICbKhy/+USK1tfFu
         uN6CPFbaE1E1/DmBM2YRFjV+BNmLQMNL1imAgtAe6I/38YnDVk7dARej9LPtlKkCiWsx
         57KHdxZiC85FsrXcWbTOAPpkCXPv+A2e65flBoogXTvv+90sQAjtJDYQp+w6X7mCGJ7R
         1SVg==
X-Gm-Message-State: AOJu0YwqKOGK4Kf0FzwsZu8DYyequHl7fAS7tzAB+o7O981K5eeTmnZ9
	HwR1GKo2VbJEmQ4mN04T+vl+3pEy62+qx9/QRlE=
X-Google-Smtp-Source: AGHT+IFrWKiFgTXwq+GAfitjQ1rw6mach5zlmsBqgy5QDtjyppvc1rwALwNiC0IlriWvIjAXgJ2A2Q==
X-Received: by 2002:a05:6512:3986:b0:50b:ff9d:55c with SMTP id j6-20020a056512398600b0050bff9d055cmr2031059lfu.33.1701954424389;
        Thu, 07 Dec 2023 05:07:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 00/10] soc: qcom: spm: add support for SPM regulator
Date: Thu,  7 Dec 2023 16:06:53 +0300
Message-Id: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The apq8064 rework to use cacheinfo takes more than expected, so I've
spanwed this series. It is an excerpt of the APQ8064 cpufreq series
[1], so it it continues the version numbering for those patches.

The Subsystem Power Manager (SPM) / SPM AutoVoltageScaling Wrapper2
(SAW2) are hardware blocks used on some of Qualcomm platforms to handle
the voltage rails. It does this by bypassing RPM and directly
interfacing the PMIC. Extend current SPM driver to export this
regulator.

[1] https://lore.kernel.org/linux-arm-msm/20230827115033.935089-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (10):
  dt-bindings: soc: qcom: merge qcom,saw2.txt into qcom,spm.yaml
  dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
  soc: qcom: spm: add support for voltage regulator
  ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
  ARM: dts: qcom: apq8064: declare SAW2 regulators
  ARM: dts: qcom: msm8960: declare SAW2 regulators
  ARM: dts: qcom: apq8084: drop 'regulator' property from SAW2 device
  ARM: dts: qcom: msm8974: drop 'regulator' property from SAW2 device
  ARM: dts: qcom: ipq4019: drop 'regulator' property from SAW2 devices
  ARM: dts: qcom: ipq8064: drop 'regulator' property from SAW2 devices

 .../devicetree/bindings/arm/msm/qcom,saw2.txt |  58 -----
 .../qcom/{qcom,spm.yaml => qcom,saw2.yaml}    |  39 +++-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      |  32 ++-
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi      |   1 -
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi      |   5 -
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi      |   2 -
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      |  12 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      |   1 -
 drivers/soc/qcom/spm.c                        | 221 +++++++++++++++++-
 include/soc/qcom/spm.h                        |   9 +
 10 files changed, 292 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
 rename Documentation/devicetree/bindings/soc/qcom/{qcom,spm.yaml => qcom,saw2.yaml} (57%)

-- 
2.39.2


