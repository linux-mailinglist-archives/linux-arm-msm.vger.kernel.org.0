Return-Path: <linux-arm-msm+bounces-3391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C8804638
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 940C81F2141B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C208F56;
	Tue,  5 Dec 2023 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCTxYCfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9E7109
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 19:25:58 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso31398551fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 19:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701746756; x=1702351556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Doc2wSVvitZEJUDkyRSKyO41LlrtXrqRu00he98Er/A=;
        b=qCTxYCfPEhH16gsqnBSA4oqq+esAK7er3m0AT/gREdHZHBauq6+vZsQP8S3GsNPJeP
         iviMZHEb0Z1HFAf/oAxDumgGxpDwLIuhtzeIxhG8wu5x3RVzC2d4y55byrW+gjCWt7gA
         rZjRSeWvUTlmLAsQsCwRNY3Y3N6W46h3xQUFxZ6CsPs9kUKMFmWrd9eYTLigKEUCYtOh
         JAP+w5UPZZ3euu7T95gHS8FQ5kt1yz651GpD3CJrwgStByGQnndfzTqtUR8Sm1jfUaW8
         d4PmuJhuR/7xinjuoTiyBwfyGQbTI7qat3NcmX3NJLYuaDQ3PTF0MyK6jA1Hgac4qOIQ
         EofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701746756; x=1702351556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Doc2wSVvitZEJUDkyRSKyO41LlrtXrqRu00he98Er/A=;
        b=u4+GdOPfRGo9+SqV3cgVgwMstmApwVExArGhxb7+7lLyXWy1LPlO9lwXBl5Tf11eZ+
         zwML7/XutKqmNgg+C/5Xklm9KeCYQm8IOr/gzOwOMAciyacCLlsRNsmCDQKfKV4YTBXm
         P/O0Glgr3dv/A3IahwJb2Se21bhg2qGpWjbYszzehz+TegZWiNbVcFhPb+ShbBTXn/mE
         gVsZaQLJRcxiXVuEfCGlb3hORFWcSIx8IBC/WjDFOIPgse2tOhkiypJS+F8IoJY286vh
         eOMM+psOG7uV5l5qPwROwlGkLTU2NAKE2OCGgR1tn1aPgsKmi23HgIBQO+c0dUFR8fGF
         B8qg==
X-Gm-Message-State: AOJu0YwQWYbxeMOe4sPNW3TXPBWb6KSgX2oROZkASOV1ppzEkkWzr0yY
	3SEKqDZgvPjRIKC57LbTr+dDQA==
X-Google-Smtp-Source: AGHT+IEMWdTcQGtNhGUcW2RvnDjpWS2Hlyw1tasdz4pEuvWvO79oolr3EOBRq140yl4z3Dxd23AuWg==
X-Received: by 2002:a2e:9d17:0:b0:2c9:fa2d:3e10 with SMTP id t23-20020a2e9d17000000b002c9fa2d3e10mr1517430lji.68.1701746756309;
        Mon, 04 Dec 2023 19:25:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651c04d000b002ca12be2b63sm127277lji.18.2023.12.04.19.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 19:25:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/9] arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
Date: Tue,  5 Dec 2023 06:25:45 +0300
Message-Id: <20231205032552.1583336-3-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 67a5a0f612d9..5893e52037f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1004,7 +1004,7 @@ ufshc: ufshc@1da4000 {
 			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x01da4000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufsphy_lanes>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
@@ -1045,11 +1045,7 @@ ufshc: ufshc@1da4000 {
 
 		ufsphy: phy@1da7000 {
 			compatible = "qcom,msm8998-qmp-ufs-phy";
-			reg = <0x01da7000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			status = "disabled";
-			ranges;
+			reg = <0x01da7000 0x1000>;
 
 			clock-names =
 				"ref",
@@ -1061,14 +1057,8 @@ ufsphy: phy@1da7000 {
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
 
-			ufsphy_lanes: phy@1da7400 {
-				reg = <0x01da7400 0x128>,
-				      <0x01da7600 0x1fc>,
-				      <0x01da7c00 0x1dc>,
-				      <0x01da7800 0x128>,
-				      <0x01da7a00 0x1fc>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2


