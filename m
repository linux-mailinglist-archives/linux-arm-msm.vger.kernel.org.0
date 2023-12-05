Return-Path: <linux-arm-msm+bounces-3397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E305804645
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEB321F21168
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD47CA57;
	Tue,  5 Dec 2023 03:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iqkGday9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5BCFF
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:26:02 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9fbb846b7so22555481fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746760; x=1702351560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6Nh6NsGzXsV0gzfOWL67HYiaQ10ilNSeS1asrlRt3Y=;
        b=iqkGday9JkpZbhejvSYDieebF/GFkgcyvArc+lSv+qKbdwKz+av8yNxijasirY3PEn
         uL5rdcdjXIsOUCidIQy6A2UyxnoCGg8ycfYOsNrxR1y3F/yZBpwdd4dRsTYFVWRACYWf
         J/pR1u9xXZ7D+mVkKvs7byzlkoA6IF3CNQJXEe41NsiXPwL4jka0A3nSUFodLDk+7kA5
         DJaHAtyVCowcnAPIIMkUz6F/Zp7qEcGR327WljncycOHIEgysbgSFZVqGMNvxMFk1RkV
         KQOBetfeqKdOdm9xuhUhn5IGVIJg31Bat9B6GrEiI7etAg5IMZIh0gVAkEMjqsgk6W5q
         dLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746760; x=1702351560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6Nh6NsGzXsV0gzfOWL67HYiaQ10ilNSeS1asrlRt3Y=;
        b=cJno7+k4DRhpqhn8LkGQg/Mp8MpnVPtdCmdrLpKjOQeOc2Gk/vfP9weOUyJPpF+60b
         Jvc5lCamfEQ9zrurpVG4zYLt6ZIvTLG6zjKcM12zzYjt5uqamRToh7mDJKGqYzbt4EOU
         R9zQjdS9k/l51p9XoXt/FL0vPCPmBsqwnByb/kYNmfCJOWuXhvyOjKY3H6t7EFoJd8vP
         1DSn09dVpSnbdEOGk6XI/PROW8x+x0P0Xt6ee825JmNuuRQTQigJKzzeX/5Y5mvQjjw8
         IsAAWKQaYJbs7+ptBEYrBbP5nHZqbU7sKzFJJcYQ8mYQ/mR8MrHapnwA3f47vthx9NbE
         Ebvw==
X-Gm-Message-State: AOJu0Yw0xF+mAjGYb2+PfTOwgUvlp+oekFD0ZrOnVN8OQLg8FUJzdzh6
	g5cPGG1xb2l6JqlBLiWXQurZog==
X-Google-Smtp-Source: AGHT+IFJOxG97G3my5Nrd+Hbg8D2R0GPOcOMTjB1/2G7qoKYD/WA8tBL5r7xELtKVTUzgMFSX53Zww==
X-Received: by 2002:a2e:994c:0:b0:2c9:f3d0:57b3 with SMTP id r12-20020a2e994c000000b002c9f3d057b3mr1632964ljj.0.1701746760759;
        Mon, 04 Dec 2023 19:26:00 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:26:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/9] arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:50 +0300
Message-Id: <20231205032552.1583336-8-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 9a64e8ab2046..faac66b0a981 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2434,7 +2434,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2503,10 +2503,8 @@ opp-300000000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8250-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
@@ -2514,16 +2512,10 @@ ufs_mem_phy: phy@1d87000 {
 
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


