Return-Path: <linux-arm-msm+bounces-3396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E0804642
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E971F21338
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6072CA56;
	Tue,  5 Dec 2023 03:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpf5POMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8798FD7
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:26:01 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9fe0b5b28so25122971fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746760; x=1702351560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gLNbVUHB7cPdqtxMfhbnY3JXxQQRp3sAXhZ64PXK5M=;
        b=lpf5POMRhRaqCb2IWpxho0BIZ+Y+B0Im0JNCImqQzmW59JrbXAeK2m0cvAFga+2rRx
         0vUAGfbDZW26eySRN0TP6IksLhkT6wwc2QQNFbysaVr6nkCXh4abqq1xFsPz/9cCZwhj
         QncSVD2kjvgFBftStoZnmoGDUbw6ddJH3BRVxYbjJd9TI+hup15WwNr2JCqL+GA1M5hF
         zZCoC/UnOvtw6Q3LXhRq78CX9qHmX6FUVo7pbE7dyYLv2gCRUcxMj21rjQALasifJard
         Ph7uZSgLIr3XIT8l8v7zBKoZwMnZpAy3khoE7UMqokbXE5WPtcsmvTxLc9ZaYujH96lA
         3PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746760; x=1702351560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gLNbVUHB7cPdqtxMfhbnY3JXxQQRp3sAXhZ64PXK5M=;
        b=HfeFEhCY2e3u1FrWehyBqGm5aPLs9SM3kACGSCI9rH4WlqfmnpNhBaCov5UtKlyPo5
         bLvp5AfXQEWCb3Hg5ThWfAivaH4BqstgQCr+2wNRRE16nNB8AiAKmy2T1UbIePCiO5uK
         jznMfUzTdf9QCjSCfkJC0aVLsmEVB/lM5KUWbx289wguD/pUi8avgrCvh2Vg/2YrXSFY
         9hpq65eVwDxS4olgJ6ZyAp0XQVsAYkKxf0+yt+VxM3yLSqbwjpIT64XA/ZcRjLa19344
         CoZ5wHRLYfee2a/ygonCLzfZ6HqDNnCqHCmO+gSrupzn9h8b2JmUWr8bd4U9qNksW+eP
         2KyA==
X-Gm-Message-State: AOJu0YxaIpGZcPImrIeNgP8S2Tm/tqO803I9KI9QjfmMXrbb6ALbf0Gd
	02+Pc/VHgezxWoxUbF3q3TomdA==
X-Google-Smtp-Source: AGHT+IE/5jwYqAq61RbgNxG5fIePBNQCv2qOYfv+8reInrH+ynt2dg1wY4EOD/GgylTwoF6DbxXo4w==
X-Received: by 2002:a2e:9d03:0:b0:2c9:f5b9:69ba with SMTP id t3-20020a2e9d03000000b002c9f5b969bamr1985524lji.51.1701746759940;
        Mon, 04 Dec 2023 19:25:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:25:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/9] arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:49 +0300
Message-Id: <20231205032552.1583336-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
References: <20231205032552.1583336-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 3cba87e00123..85d494cc78ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2016,7 +2016,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2061,10 +2061,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2074,16 +2072,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-- 
2.39.2


