Return-Path: <linux-arm-msm+bounces-6211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EEB821742
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882FDB20A3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694431078D;
	Tue,  2 Jan 2024 05:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLj0mb4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B44EAE5
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50e67e37661so9625348e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172656; x=1704777456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OI/LBegZ33VsvlUL61Dgr0BqjEAvcQtAsCeimXpMCIk=;
        b=HLj0mb4KX6csmIybbduzz6poqZ+ziXK9u3M5PvQYTLPaYwBOFXEiAaQe6GDCprPXIN
         +oF8vkI0RdXgT0ngy7IJrG9XdhwiAOuYWgMu7qZ2PBFteT1Y2plIQP4uMlNyGJFqERR6
         PoiOkTbigbDH79M3GxjR1txdFTVl+PAeDwZCQAUg2uXWVg9bCrpjUo6wan73Qv121Zln
         x+dg+4A4GchISfaz7kIwY+Bjd916+ujliIaZE0YADdlKY8r7mvrP8GZJvhrFql/Vyim1
         94lcNBMdEvtreOk0Pp2FCSmK3tIgaXH03gbWa26FQYLhCl3Vv2mfxw4ygLiMriAoveC5
         VZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172656; x=1704777456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OI/LBegZ33VsvlUL61Dgr0BqjEAvcQtAsCeimXpMCIk=;
        b=Stu4ivfOQ2S5bx95rxAEGnl4gC3/4BwcYZOogyVm7pdUrMdI3YBXoOj5ksDUECfg/u
         Ir5P4aMasxXewPbJuiLgfNsZamf9BkF0zgeiJrBCqrPYURpySc13LN3aIkse9OTdoBZx
         o13QAetHTciLuVYRnhMtZ+kpB/iKCg5E+o17FW8jzNJLdGUYW8PvTFBnlwu2NZypb/kN
         ooePU/g8vzeZ0iZqr5xmLb7ms+bOJVCJmrdcihwr9bomZHIFR3I2yCIyC9Uiyua0zCyg
         ch+mI1xEri9Shf30Ojbqrg1NLEwH4LHYp6dxFBQXbo46RgvA5DoGaRTf/utTuSWC8BNR
         skog==
X-Gm-Message-State: AOJu0YxFkfcQjffRyGS02rbFLrxv6oZLS3m8E8aE9YJR6cq3SNK2sOot
	BcF6egiBMfP6A1cMziFcgLZPxBooNrETf+HWAO6A9q45OOr1og==
X-Google-Smtp-Source: AGHT+IEr6xI65rBC1xglbrnyfMM3fb2FOx9CfPkiwhBvgd+ufJGX9iLfi+Rh/G35BhQnUliLN0Khfw==
X-Received: by 2002:ac2:47e6:0:b0:50e:7702:a189 with SMTP id b6-20020ac247e6000000b0050e7702a189mr5817814lfp.22.1704172656223;
        Mon, 01 Jan 2024 21:17:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:33 +0200
Subject: [PATCH v7 13/22] ARM: dts: qcom: msm8960: rename SAW nodes to
 power-manager
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-13-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZrJulsqUXOM07uJN9CBFq3F4bZViSrScM3/fZ3K6RFQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlk5xl1qhaSVFkPemyNXciQqfqnv5wQiMjHINtL
 ixMbndfFQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZOcZQAKCRCLPIo+Aiko
 1RhSCACRGn7IY0ALZTteCxXCN1z14qVfEaOo5EaASS14U6XgcqeyGsUiHLU0hdeTRoy2+O85Ieq
 5b5hIPkVnj48LhTQNlRGtCARd3CfVBmHkGLy+w14ajHUYzweiduaGZU3KDdW+j0hSsG6BT2t8aH
 idlpIXFvd1lAHjGg/qriP0G7+fBTn/FZ13EtTPceX9yBCwIcVpRu8Eeu2B6gWS0gBA8PWGjmEqK
 IDQ585V3K1ETQUFB0HxZGO1oHPZzqlwtnrKfA3a3ho8+jF/ri2GduARsRjjptiUEWCcq21o0EZ+
 rh/GS3EnBQHjz75y8N1LmQ618dT+avSaW7Q3c/ws29+xB6bg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SAW2 device is not a regulator. It is a frontend to the PMIC, which
handles voltage control, automatic voltage scaling and low-power states,
Rename SAW2 nodes to 'power-manager', the name which is suggested by
qcom,saw2.yaml

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 5099a161f7f9..84c3d3ac63b9 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -220,13 +220,13 @@ acc1: clock-controller@2098000 {
 			#clock-cells = <0>;
 		};
 
-		saw0: regulator@2089000 {
+		saw0: power-manager@2089000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw1: regulator@2099000 {
+		saw1: power-manager@2099000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;

-- 
2.39.2


