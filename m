Return-Path: <linux-arm-msm+bounces-3395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E4804641
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF84281067
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078B5CA48;
	Tue,  5 Dec 2023 03:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdwtEIoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB084FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:26:00 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c9f559b82cso27315301fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746759; x=1702351559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kw40SSJrLOs+27A1LUQ8LrdqmsN65YwysfY7UPfS+5Y=;
        b=mdwtEIoKaG42QsDYNqQY/NAYhHRMSdYYlFnTgcbKeMqvWQV74NVlO67rabNgZTIkXE
         f+/B/nER6J52yJDNOwWaHEUVVd6kr6mHxOZRZzRDh869RuGx2J5RDNWc/6Mz3h1lGY4n
         eKwjDwRFKVrOZ8mmbixon/bdiEdEBui2P/vkqY+3P3aSS3chq9ypes38B+Ft1+nxoyFd
         gq2OlZa3vmch1VuiRSY4XrhUUqUI7xee+MxgAzBQmUtULQIS9GjgTl4jqbgoFpheNmAK
         MC8Ub+1PLej3+EX5eoXGfDALCTOtciNTGrIizJF/6BlWbhAlGmM2jeBuVCFTZQJoRwJD
         ieug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746759; x=1702351559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kw40SSJrLOs+27A1LUQ8LrdqmsN65YwysfY7UPfS+5Y=;
        b=IkrIXRZpcdNNy5VLELma6tlrKMCBufr8jLTNn57AuxwKL+KekPL6EO3Kczowkx4vsF
         Ra5oH2PQVzXudClcnrR3H3SgI4aDFlh02m/Nkl0Uow2oVin9hOJM4v8LBqlVsHiJy9+V
         78wpoZL5Bkn/qniY1kxYzXqyAkzyeQx2wxvuZZdosbuXrHeP//Mg/EaLRlnSsB6ergJ3
         NQG1a7vnt2+Q3c1ZUiqTdanZiRnCpnYmJP7+a5wg2UDkBB0BGhvEVEcKZbkDS6jFOqVr
         SNqr8vz4UkNTkQSyHRCWUJOAS/Bupm9ddyvS4X8VNylEU2bskc4jNzPOJEyQxDPuoPFz
         +K4A==
X-Gm-Message-State: AOJu0YwGBEpeS7QDdaCayuizGpQIGhOjCygfjRSEmvxB5ZYjYa7DcJxy
	pjqGE/MNaUmxs4QKOTCWoQv7nw==
X-Google-Smtp-Source: AGHT+IF/MgABsctR1/0cFcYinmRmOYwqMAm4fSFopzlPf09F5uHRUM72mP+uQhX4mJ7zODnT6J8avw==
X-Received: by 2002:a2e:8747:0:b0:2c9:f706:334 with SMTP id q7-20020a2e8747000000b002c9f7060334mr1831325ljj.71.1701746759058;
        Mon, 04 Dec 2023 19:25:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:25:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 5/9] arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:48 +0300
Message-Id: <20231205032552.1583336-6-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 6464e144c228..43cffe8e1247 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1142,7 +1142,7 @@ ufs_mem_hc: ufs@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -1187,10 +1187,7 @@ ufs_mem_hc: ufs@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm6350-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
 
 			clock-names = "ref",
 				      "ref_aux";
@@ -1200,16 +1197,9 @@ ufs_mem_phy: phy@1d87000 {
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
 
-			status = "disabled";
+			#phy-cells = <0>;
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x128>,
-				      <0 0x01d87600 0 0x1fc>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x128>,
-				      <0 0x01d87a00 0 0x1fc>;
-				#phy-cells = <0>;
-			};
+			status = "disabled";
 		};
 
 		ipa: ipa@1e40000 {
-- 
2.39.2


