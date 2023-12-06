Return-Path: <linux-arm-msm+bounces-3560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84101807154
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 14:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336B81F2142F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D515241F4;
	Wed,  6 Dec 2023 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGVCEW5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE45DD47
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 05:55:53 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cc02e77a9cso6582464b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 05:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701870953; x=1702475753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo4sjmVaV/TBAMJQg43OcyML+wJBUfl40Ts13Xx0yio=;
        b=VGVCEW5CyMHN8E1h+aLD/A+6crvPQMWmcbbuWt2k06l3JtSk6Wg5L64bNPXGygSB5D
         SysxNdeZIA7Rta1jwrz637PiEMinkzsfNNI9NUrS83rdED3Ad7C8y8quhRm+ib13IMBb
         gAgx0fhJj6lV7tpIeGWWVI/jUm/naom4JBKzECJTygamAvUf4zz/baATD0jj3bVsTog2
         tx8SmYWhYq8l3QNcz38WSklkzOZiJ4p568ls6Wwrzp1xpmo2G6e2PApJv7xcwR/8LLGC
         NzclMFoRoJ8j081uno4YK0Ipvex1oRpD04GKl8oQG3d0Go5StE/6emG99Nuvw608SQKN
         9PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870953; x=1702475753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jo4sjmVaV/TBAMJQg43OcyML+wJBUfl40Ts13Xx0yio=;
        b=nBCxH126JsmqTRrEYiLVTU6gYlNOVy8Gnh6ZAatilaxVTOXt+ioscBTe3ln5G6lLQO
         hLK9I3QGwdw8yBfOpJFlQoAcmewiAkQY4pVFjU9CXc6pJT0F79XQIXMtNkhOMiDMP8zc
         IcUn0VS9WrHU285lJAGwo2S+EcGedSI6tW6imU+BOVoNOTV0Ib2qVePpum7IWK7eyAb6
         hMgnrso0X8eE6YLXNs7Z5Hb9tloEM94YUvCsGujZGNoUL43BkQy0466lr9SQPJsJXZYg
         +cBA3/EGSICO1G2sBZZklQhrNqtSG05gqHjVm90pCeaXxanC/nGxf0vSFMOEH7quYmT/
         nDHw==
X-Gm-Message-State: AOJu0YxG9/GfuP04N2OcQZh2ZEUilmKEwBd84zsrn6nOxgQ6Ksg+j+DQ
	Mw9+Tzz2THrTPQu3drEa9Dx1n27DssX8ge4qqg==
X-Google-Smtp-Source: AGHT+IFtRa9+0838RSSI9ko0zFdJdodaKRgyzIqc6JbiWzTHnFiflLRfRI9fQ6/eZ/NpRcFfWuZ26w==
X-Received: by 2002:a05:6a00:3391:b0:6ce:3f6b:638a with SMTP id cm17-20020a056a00339100b006ce3f6b638amr947618pfb.48.1701870953263;
        Wed, 06 Dec 2023 05:55:53 -0800 (PST)
Received: from localhost.localdomain ([117.202.188.104])
        by smtp.gmail.com with ESMTPSA id n38-20020a056a000d6600b006ce91cdb1c4sm1366056pfv.188.2023.12.06.05.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:55:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	konrad.dybcio@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/3] Qcom PCIe DTS fixes
Date: Wed,  6 Dec 2023 19:25:37 +0530
Message-Id: <20231206135540.17068-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This small series has some fixes for the PCIe nodes in Qcom DTS.

- Mani

Manivannan Sadhasivam (3):
  ARM: dts: qcom: Use "pcie" as the node name instead of "pci"
  arm64: dts: qcom: Use "pcie" as the node name instead of "pci"
  arm64: dts: qcom: sa8775p: Add missing space between node name and
    braces

 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 6 +++---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 8 ++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 6 +++---
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 4 ++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 4 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 4 ++--
 17 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.25.1


