Return-Path: <linux-arm-msm+bounces-53498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2D6A7F9DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D9CF7A80F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CE02690D0;
	Tue,  8 Apr 2025 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GGaqyny8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D6268FD8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104784; cv=none; b=PUMPQ//Ni5ADAv8IP3clANs5CnC2cDJUgmMhkV8e+sjOb+V3okLPeTIXZTyuzpIze08iSkkSgTirbNrLoP2iCk2REbjRQRhB2T0XX0LwwcLgQBBN++6Snu0Dkr2IFq1QsQ1ilCT1rWDHHlfIZ7fDCPBd3exKMXfjHzAd3tnhT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104784; c=relaxed/simple;
	bh=h9IbbxPf6pvBnHOvJ5sO1DWyf2vr/Z2QR+oJ30BnJ2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zxp1ZWqgBnY71u9N5sze8ebB/0uxS4YDr22/L1n8uM4NPv28Gzk0/ItA9Mu1L6TH3l+YGpmGDfJGJqitrN8aO5RQIbRqc+Wbv4POE/1p154zD9aOcB4vd3l5HtKxTrVzaN39+EYvW1WvCwxV1yBtEGdYOyFuFR+D2R8Z7Xli4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GGaqyny8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so1879835e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104781; x=1744709581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqZ01UYENiFGCMU8FPvhNtuqdF2GBrlUh+1TmmPgt1I=;
        b=GGaqyny8Qe7biwQZFjXa4a/Vu1C7liuA5yfKcREwuyBeEzg+EtNr1XnwqSbS1S9WIu
         OUx9XkOqdJ5zhDYdJh9/Aeeq7vO3zKm4/InCO99zJ/CHuMXWqlTmg+iabNjJvuq1l1EM
         UMbHAap4c2tdnNnKVV2j9+06GsamgtCzaa/5bFs2VoGFjfAyWMn2sYqFUKAZwSH5S/32
         riZ8grcW32EAa77QG8yyhvaYHvavWZxM3HPrf4jrNLJGRKn6g1fDZaMdQA+vkd9FYCCd
         gkFD3BNfxn3wMZ+xydBBlMsOIjvTn57gKSoPf5FWnFvqWzAA1b80GKdKNF7sEmH/WBGC
         QC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104781; x=1744709581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqZ01UYENiFGCMU8FPvhNtuqdF2GBrlUh+1TmmPgt1I=;
        b=JgurlovvaAfxrhqt3488YmlPw8QLAoy4MmCDCXIR+xmFNmCw2p4B7Ll2bm1CtSYdnV
         ejCa0HpCzvg7iqlNUrg0jg384ZqopHWckkH2veAhRE5WkL0+BwHHLMs9g9jLEEl5qqBn
         N1usXJjndI4x1EhlWs1FKEi8hGV/8DawZdUzEyhrc+MWIgshYB2RzhZtn/dnos/EjLtX
         bu8BtNq7dW1yz4AInqC0dp3b14CaMnFA9sDllVlrrGfAXdgwTVq5OfEJyY4J2YHCpNt6
         jV92JPQG3859nUd68X1fvJQmSyUhQU4GMypdc3KBe7HxjcTbo9Lnvm/mGlettxHb7Nyu
         kRbA==
X-Gm-Message-State: AOJu0Yz6XSBdLAvrDrqTYiWIKoMAM3gID1g9mbII6lGsrJBjM8B+4tMQ
	wfKHV902/m3E0RDG4AkZMLI5VNHQu8n9f/jVw8z/o1APrjXihPkhMAwXj8SJVJU=
X-Gm-Gg: ASbGnctp0i4amMpLf4gm7G+uI69axwRNl8TrMKAOt6kYhig0XcOnVs3k2UV+Ist5umP
	lOOZuNA8atvog4X9SLhOEt5OgSUh7+lbpBz1QAQEsJFN2EP/yU+rzxu1AkXPOxVk8ArHQri7gUp
	DWFn4w5yz0FJrSkoedLZN+OefJ7gCH4Gk93M+PXzMMROEcr3VC7hHT6XXQcsh9ReVQnianeggaX
	BXIBFEfNcDEBAu0DGxcCekmHHhadqyt+3mRP5PH7Te+kmFH22iCG82uk5JdQkJwTkkyvEfsc7rH
	iEh/cc+5Xxi1DMH6pPenutO3qiuH2Xl6Abposn9oA5mukdtgGSrUDNUfDUydgQg=
X-Google-Smtp-Source: AGHT+IG/stxRvCyHPB+wYPvOm8ldE0NKkSj8eaGEMwk6B5xZcXSPEU7bOQoHIU1MKqErQ6yLWzgHaQ==
X-Received: by 2002:a05:6000:4310:b0:38d:ba08:dd64 with SMTP id ffacd0b85a97d-39cadc73360mr4550061f8f.0.1744104780646;
        Tue, 08 Apr 2025 02:33:00 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:33:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:15 +0200
Subject: [PATCH v2 18/24] arm64: dts: qcom: sm6350: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-18-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h9IbbxPf6pvBnHOvJ5sO1DWyf2vr/Z2QR+oJ30BnJ2c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0m3A4zVgL2bVGlyz/HeyNzdKyRWEnVraiN2
 /evhNL/gWmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtJgAKCRDBN2bmhouD
 12bFEACCA5X5bb4BBNV3qFiN5gjAVQH2HCF4C/AV+7cWWbwfd0FH8eluw3e034q/uoTSh+A0Yq7
 Qr9K/AAbnjLKlpgym3WSXy5QtDV3OGozu8jC57sFHr+xwiYWrFAYniLhy42p8p/NAmXMRc5HsjT
 CCgQEI5+ishMqToFOenVuqJFWthI4IPLSUMbegYd5F6p1ZIHaaTblHMhZgkTCT7JcTTmtVtH5nU
 N+oRta8DjoKjAWVnS2Xqm/H/EVrMMiX6aWbpxrawGcI2OyQV27x6y4lZhuIB1hQRRUgECDKCB9a
 jVH54hDiDJ+zir+CwSbYRWlgEkzN6jFfmZTIlL1WorJVqXElTninpHNpVNnwCOruJoA41fRfOSo
 H9ZkcdnlPlVv5y0Td1E7whbQdGUkrPqq98EbuYjQE7WaINSJtHsdZr5/O4f7FB/vJsqjss+RtEW
 LcKlSYHOxK+/F7U6qMLCjSbYgy5f2Q47euFipZ6PSlKwE9f/854tP5iKMTqRN4/Wdo5Wh8xPEum
 3PjmQ+zE8bKb6fIW5o0wTVTy1ajBBeyMzpOkLsaiGo5q6yjFidx9cN4pjtQNK9ZLecece4ArqLc
 Bdetns7h8z901MEr8BPxtoaoec98vToAGbdGwkGk9lolg2qAF/kt16Y/DbLhucxbmwo0bJTGS75
 webfJ1jCUdIWh+A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 00ad1d09a19558d9e2bc61f1a81a36d466adc88e..1f2ac20e537eca90d96f755e9c76c6c3fc7f97b1 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sm6350.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm6350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm6350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -2269,7 +2270,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 				power-domains = <&rpmhpd SM6350_MX>;
@@ -2347,8 +2349,8 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",

-- 
2.45.2


