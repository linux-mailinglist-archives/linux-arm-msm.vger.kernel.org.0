Return-Path: <linux-arm-msm+bounces-5226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D7816D92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 13:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 144B91C23994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 12:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9EF5025B;
	Mon, 18 Dec 2023 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHwZmpec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1324F8BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3b4b803f4so3135945ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901311; x=1703506111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NpBpw87ancReoayxiYNLEpdh+qbLyvkQJUBfcAOaoQ=;
        b=sHwZmpeco/gTdT87jm1yr3TGjh2hS48sfxvc++zpJ7ghQlVNZIGELUijwlisT42vCd
         zLmeUQWbzVWiy92b9XS7CAGG7tyNceeWGEO0C6LYA6GjPKCsZik4nTzEVCZaPOtB1XjN
         Dgh2Ngxzhl7A/Yc+w9qegYozV7nuSSzULKaSTDS3x8aRxhnOyK2ZMbhA/k1zvDUS18vh
         98Kza6Gr0mrn7gkESuRaV0Xbvm/EN7kxr6aYB+xoSk9UpCI55Nw9LeSoAWOzJNGQm29F
         ZFQNyOnOZLUwFBmAZ7w+BzbSAPmHpEkgMxagJsduwC+k57f33jRCOpMnfXbalYEgqj5W
         5svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901311; x=1703506111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NpBpw87ancReoayxiYNLEpdh+qbLyvkQJUBfcAOaoQ=;
        b=pdB/QkM8ZOxn7F1iVfUp2i0DQoGZTrzAwq2ZrYfhnlQBz83Qt5v31P8GvnRnucEHD1
         1uSBPJwmrmVLTpHrdQ8x6bPcVfkpM1iiOxO4JVTcHSCMWxWTDA38h60G47Cor2RA4J5Z
         78ax/WHkRl6EQogZQVZaFB6LJG++99thfXcvXh+PFjdUcgWIA98fY/AznXkMG6oWG62j
         p11RrNbbOSg2s8gHn1vz/wQzGFw8Ic4JDnVwGNKRgudV9bCpcaPBs0ErExPuPklCRscv
         3rh2uaoKF49NyjdsH2gccX/AhM8BW39p1JpCiFfzNS4na015EfDu7rIXXXRR2451wxJc
         jajw==
X-Gm-Message-State: AOJu0YwKePAaYHd648cwvGNLf/YTnSMhCqPub4/X8TbDGPJMCoEoZBpQ
	++JbIpkFm6n22LcsKN4irwEIOihPCoBUTofnSg==
X-Google-Smtp-Source: AGHT+IHWUgQYCUGlqwV406h6zHwdKzU4NG59nQYN4sJQ2Em0W4gzvKZvabKGPJlQn2udUzFH5dAm9g==
X-Received: by 2002:a17:903:1106:b0:1d3:aab1:6273 with SMTP id n6-20020a170903110600b001d3aab16273mr870341plh.118.1702901310948;
        Mon, 18 Dec 2023 04:08:30 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:30 -0800 (PST)
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
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 11/16] arm64: dts: qcom: sm8150: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:07 +0530
Message-Id: <20231218120712.16438-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SM8150 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 3834a2e92229 ("arm64: dts: qcom: sm8150: Add ufs nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 43d56968a382..18af94852974 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2065,10 +2065,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
-- 
2.25.1


