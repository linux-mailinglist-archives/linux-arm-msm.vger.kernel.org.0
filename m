Return-Path: <linux-arm-msm+bounces-77001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3DBD2DB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 13:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 706394E071B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3711A9B46;
	Mon, 13 Oct 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkMh9uGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB718E20
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760356612; cv=none; b=TnJIM9qq9SEuJZiHmoftBcrUOTYFxKh2uypqg1H61EXlDaI2jEQ6TJcvOUQtf5qPTGuEdjn96PIFPe4Dc7fC+ETDS5tSdKEGaOVh6xELUxiE/i1c+gSC0bddLkND8HQhcj1VoFa3xRWrCAFxzEOwYrcl+QmV4c0R1uyudzXiyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760356612; c=relaxed/simple;
	bh=G+zOmCjf/wkA9YLjNjI/rOfASSYyTYR1c53J5rPRF4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjhCGW5x5H2ocOOcJMvjAJnk08p2FBEwqgIEPwZ9eJcSksJlLpGqt/pzi6X27+zOu4364Q10bUaEP4n0wuilsWjaPRw14N2sVvtYMF0MBX9znLk96fsAm6TpXnpjIZ2nkeDqkxiuipS1NllJUbWjrNhcfpWYpI0Lu8ZAUiP9FcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkMh9uGi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27eceb38eb1so44832625ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 04:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760356610; x=1760961410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMNbKAS1DmQTpbaCTmkQ1x83qqUuVua6ykRBIIUP2ws=;
        b=RkMh9uGij4nTiaCqPDfWFDH4dviaI8sa8L1NyPXWI0gX+XqqjZ/FLEUxslNNkb8wav
         MjlHcsonJ0vcjJ++9uDKm3DyhAZkUvS8f5WVHiPJftdqGyZVj3cDrQOF7eurkiIjMrlE
         ASTD2SyLDXQflhkuN8XAKi5GQaOFWx0f3Eh1JZ4odbrquKO+JwjII8bn3tXsgEkeLwO7
         Top91kOJwMXWA+ch/dXHbzt+XMSUfKHJhCqqFGKnJ9Lb0rY/4PRiMQpQRa9fZFo3LvQN
         o46r17gFMW29Mjv7/MAE1t43xACMpFyz+Uw9K0escIZ81spHP4yELQuSgc/m0+XdYtf3
         bCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760356610; x=1760961410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMNbKAS1DmQTpbaCTmkQ1x83qqUuVua6ykRBIIUP2ws=;
        b=F1kUUWXZEewWTNUKlo7qgRUcgrC4DzV1uaLth/+aHumIQDnNJJCgj5HnxmS9Edyxo2
         Ra0bYJ4p3gWgFEz+fiT09yQcqS7ladQ7ZT61QtKjBBGVvi8FufHHo1ILhSvlvo3LHTAh
         Pg6vW9ZDNEOP4bT5SOKHGQhL5rGmISFfOtXaJCaaTG2l6W6/lTVux5z+MhqmNn/FMH/3
         uD71K9VcA508nI+EXUNUeEPbptRLiWQYcYMWyCQRQAd33O6pna2DwP8M7b6RpiaxlD0B
         0T0lhpostNvOaoWDKuRPaHlBr2QmnmgqjyoVCPlRaT7sn1h/d9P8bdVN1cp1s3g/3bbi
         c85Q==
X-Gm-Message-State: AOJu0YylUvochmBSxsuHFWXd8k50GhWun/4ISWzZXSdc4tPfMhRFOeEo
	zqPiw1RRBnq7r1DzJulUfrgzSBGUmCq2x52dkYfN1mlLDNs4rgdesej0
X-Gm-Gg: ASbGncuRmPeNf0XNyTvbUmUPmEO29a5pn9SIxtKgeSJXe/tr+ZKEeHuiP9jh4Mw3Iw4
	App07f7Q2R51SuD3LjgNJuhJssttn1gEIRlWati8NDayh8vIKqb/jl6edd+Gj3p+TLS7IxLVjEC
	j3ia7R3Iqww6qNUmh32q4eGp0LuiM/YSh/8r4NNQW9pf5AM+oTH3unYjueGhLCzEb8vSybw+AGS
	PQFJvDh4OIgOOHiFIg1eStGkzrjja0sLo+4fXBKldJ/rmep4vWA+AdushrM5JYURtXAGu4viEdm
	WleQxExCRVAwqf/DRj3F9BAcEYU3hB62+MG2oVJ0HedRMFBywjX4B3Nf+yAa9G2/tq6awbNxQ8x
	5I8YPwL2OlPrwGUbShItYR7aMY8VcgJa9kdJJTxdrRSIF74k=
X-Google-Smtp-Source: AGHT+IELhKQzMw16baA4ZvWPObux6nLSOAeGkOJBa2KquK8bQ5F09VvJpgl7OeB+XuP/7knoRksyJA==
X-Received: by 2002:a17:902:f64a:b0:277:9193:f2da with SMTP id d9443c01a7336-29027356c8emr277255775ad.5.1760356609447;
        Mon, 13 Oct 2025 04:56:49 -0700 (PDT)
Received: from nuvole ([154.83.87.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29040e02648sm98182075ad.116.2025.10.13.04.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:56:48 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels
Date: Mon, 13 Oct 2025 19:55:05 +0800
Message-ID: <20251013115506.103649-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPI DMA channels in sc8280xp.dtsi are wrong. Let's fix it.

Origianl patch was rebased to the linux-next and formated to a new
patch again later, then it got the GPI DMA channels in the new patch
shifted.

Fixes: 71b12166a2be ("arm64: dts: qcom: sc8280xp: Describe GPI DMA controller nodes")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 170 ++++++++++++-------------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 279e5e6be..963ce2362 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -967,8 +967,8 @@ i2c16: i2c@880000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -989,8 +989,8 @@ spi16: spi@880000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1011,8 +1011,8 @@ i2c17: i2c@884000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1033,8 +1033,8 @@ spi17: spi@884000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1069,8 +1069,8 @@ i2c18: i2c@888000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1091,8 +1091,8 @@ spi18: spi@888000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1131,8 +1131,8 @@ i2c19: i2c@88c000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1153,8 +1153,8 @@ spi19: spi@88c000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1175,8 +1175,8 @@ i2c20: i2c@890000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1197,8 +1197,8 @@ spi20: spi@890000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1241,8 +1241,8 @@ spi21: spi@894000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1285,8 +1285,8 @@ spi22: spi@898000 {
 				                <&aggre1_noc MASTER_QUP_2 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1338,7 +1338,7 @@ spi23: spi@89c000 {
 			};
 		};
 
-		gpi_dma0: dma-controller@900000  {
+		gpi_dma0: dma-controller@900000 {
 			compatible = "qcom,sc8280xp-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0 0x00900000 0 0x60000>;
 
@@ -1393,8 +1393,8 @@ i2c0: i2c@980000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1415,8 +1415,8 @@ spi0: spi@980000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1437,8 +1437,8 @@ i2c1: i2c@984000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1459,8 +1459,8 @@ spi1: spi@984000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1481,8 +1481,8 @@ i2c2: i2c@988000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1503,8 +1503,8 @@ spi2: spi@988000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1539,8 +1539,8 @@ i2c3: i2c@98c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1561,8 +1561,8 @@ spi3: spi@98c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1583,8 +1583,8 @@ i2c4: i2c@990000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1605,8 +1605,8 @@ spi4: spi@990000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1627,8 +1627,8 @@ i2c5: i2c@994000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1649,8 +1649,8 @@ spi5: spi@994000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1671,8 +1671,8 @@ i2c6: i2c@998000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1693,8 +1693,8 @@ spi6: spi@998000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1715,8 +1715,8 @@ i2c7: i2c@99c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1800,8 +1800,8 @@ i2c8: i2c@a80000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1822,8 +1822,8 @@ spi8: spi@a80000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1844,8 +1844,8 @@ i2c9: i2c@a84000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1866,8 +1866,8 @@ spi9: spi@a84000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1888,8 +1888,8 @@ i2c10: i2c@a88000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1910,8 +1910,8 @@ spi10: spi@a88000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1932,8 +1932,8 @@ i2c11: i2c@a8c000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1954,8 +1954,8 @@ spi11: spi@a8c000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1976,8 +1976,8 @@ i2c12: i2c@a90000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -1998,8 +1998,8 @@ spi12: spi@a90000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2020,8 +2020,8 @@ i2c13: i2c@a94000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2042,8 +2042,8 @@ spi13: spi@a94000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2064,8 +2064,8 @@ i2c14: i2c@a98000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2086,8 +2086,8 @@ spi14: spi@a98000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
-				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
 				dma-names = "tx",
 					    "rx";
 
@@ -2108,8 +2108,8 @@ i2c15: i2c@a9c000 {
 				                <&aggre1_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
 
-				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
-				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx",
 					    "rx";
 
-- 
2.51.0


