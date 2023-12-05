Return-Path: <linux-arm-msm+bounces-3394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCC80463F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F005281597
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB6A79F2;
	Tue,  5 Dec 2023 03:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4jpCQaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41D8116
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:25:59 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso28532711fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746758; x=1702351558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJaItxWd66KVB+vImAZ2Ym6WIhUCfCFsDOPpLld4kxo=;
        b=I4jpCQaqls6GYFnQZsRrVNsVWnH1ssGYndVMb+Z3K7KGpDiWN9hjRhlj+20dK4RJ94
         u7Mo6c8C6avNcL3VK+r4K2xZc3eXk+S7Lr17NbFdR46tekxWNCG9ikZFSN8tCynNY0db
         Ed4e/3lvTAG41XhWwgy3X78BcKVr7QrDfGgEKBC8QRtpUhrqerW+lFWvlOseum3eJtuD
         pfrgy4+Dt8dydKhPwpL5XlFGjOP9FfovHaedyJ7i6+0/zgEBOva4T/UENkK51Y4ANiC9
         VhYGh8GWRkoKDXnvpuKW1FJKwfwRJeEbdAxhm5q5kmKiByvrxqkz3HKUEQVJc/SCke3e
         bW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746758; x=1702351558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJaItxWd66KVB+vImAZ2Ym6WIhUCfCFsDOPpLld4kxo=;
        b=ufCIcwqP/6FcZSBqgLmCupP4ZEytmXpGWrYKB5ppjIHUDt2C0RKd4sBw8XBig8RdG3
         ify1jvuT3SuUtyY6pxpt3aadqkj0x9f+ek6jgAK+JZSEjJWED5aADoXBl70oTw4o4ryZ
         OIZQwc54BLnEMPzstUx3vVXWL62oLGqc/oDeROOHzoHD6HVxVx3aNazuUBMK5Wsl6t96
         tRhQ1DQpzroRejmzrETbo3mK8gGb9yhuSSqMUC0Sj2QKKWnvc5HNUhccwVPe4vu5qR6R
         toFNAlWhwzPkotPziRsB3iC5WOyf80mHhvA7jDJyyVY/paT2GutiI2HM2cJxP4qv5sWL
         Eo5g==
X-Gm-Message-State: AOJu0Yx1pMS1iAf0wpu2AooBipemHFno+jURBY96kl/M4RclPrz7ANwj
	vjcHukQwlg4isVAtsilA179etg==
X-Google-Smtp-Source: AGHT+IGcxvPJYhw6aXWVJAsjc3BOdfqeyIs5UojOIvoC2fFKu96nkNXe3iXI7yN55QIJwnESsWURow==
X-Received: by 2002:a2e:b0d6:0:b0:2c9:f6c5:bd9f with SMTP id g22-20020a2eb0d6000000b002c9f6c5bd9fmr723989ljl.107.1701746758121;
        Mon, 04 Dec 2023 19:25:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:25:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 4/9] arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:47 +0300
Message-Id: <20231205032552.1583336-5-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0d13d7bf6bd1..11771931ee8a 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1006,7 +1006,7 @@ ufs_mem_hc: ufs@4804000 {
 			reg = <0x0 0x04804000 0x0 0x3000>, <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <1>;
 			#reset-cells = <1>;
@@ -1047,24 +1047,17 @@ ufs_mem_hc: ufs@4804000 {
 
 		ufs_mem_phy: phy@4807000 {
 			compatible = "qcom,sm6115-qmp-ufs-phy";
-			reg = <0x0 0x04807000 0x0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0x0 0x04807000 0x0 0x1000>;
 
 			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 			clock-names = "ref", "ref_aux";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@4807400 {
-				reg = <0x0 0x04807400 0x0 0x098>,
-				      <0x0 0x04807600 0x0 0x130>,
-				      <0x0 0x04807c00 0x0 0x16c>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		gpi_dma0: dma-controller@4a00000 {
-- 
2.39.2


