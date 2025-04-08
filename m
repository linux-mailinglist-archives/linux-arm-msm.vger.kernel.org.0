Return-Path: <linux-arm-msm+bounces-53488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BCA7F9B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37DAA7AA02F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5E2267AF1;
	Tue,  8 Apr 2025 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UF0kdsn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140EC267721
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104766; cv=none; b=i/ywxpXsykjGbWlX1i7SVnosueDLmxlVZlFAx9fock6yuGe6aHyKkv2QC4g++6zLLL6Til5EeAGVKoQPJnNVubjI0nwdh2dVhoS+fvMd/fDMyCcahzXGqSJWUAyKM6vb9tAwWNPQCiGxDYBMpr/LgPWPDF/BXBWm3NdcDAMexa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104766; c=relaxed/simple;
	bh=M4fS18wV/N/X4pK9zNCKm4Msj6IewLiSiVDe3r0i05M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqJhtWvIidD3Z05WfYq5KRjNVcF1vl95XqU+kRK5lfIDTdbLz4n8Lckqo5GqR4NEtB703LGQsNGeHn6t9jqh5/ws6dJ2xxubg9Yt8mAkJCEfh/ijxLId8cu2p+rtq09Y8YRd8fdOCtthFyGABaSRnzGakj0xFUiyns5tdfUI55Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UF0kdsn9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so5582095e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104762; x=1744709562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VBkJO02dyoagNQ6pDN8dhyYpKnyWMklQVY5SKdGbWU=;
        b=UF0kdsn9qb22OiEhW+gTDGyTcxUjXJbPmcsjcnkd2t+C+7D4cHdV9J2C6RkelhcpzQ
         abTM1vSrkowElrRDb1BoR9axwhyVq4nm6J2OBd09HKl5Pp9mKFHqnYzODG4uebkmztB9
         HO4hHazO+IQSNIo/ceobPRHgBLKk/kM7B9UrmV2fFkFKvXb0wKcP+wnxEBSfjm/OKf9V
         B0oBnODdftEgdCITLbHrh6zS+RO52l1TkG/paTTCMbm86GN5LayFceiZJlzqTA8p/sDU
         MFymxTMCkT2fMbEfUujkc3PE+W7Wf5Iq4wbQCBhSZORaSegubXxmfiixZHCe9iPP0RwE
         yGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104762; x=1744709562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VBkJO02dyoagNQ6pDN8dhyYpKnyWMklQVY5SKdGbWU=;
        b=fNzGWqBVVJokFJDw81TPSRNkRSFQTAFKeFJmsFxHJBfSokHF0dk5Gfrs6ux5Q3jxZL
         o7HS/9RQzkl3mncH7UwWa8Bz/7fll4FstZvq0DZej8S4Ir0q7/iGY4ucZunU5JuUqt1v
         Op44c8H3dZxyF/dw6DUGV1qPivs83h+hBwN3GH6//K4y0tysjOt3/bX0Uib9TzgYvrGH
         S+MEly5a/w7vmjat5FGm1gDUGYuAhUuHzx5Q5iiXLSXY8CCglY/C1rFMGjKglElHhLk4
         hQ2ldx/lmJ6fqCMVrLokmkOU9IAOJsCoRj4KpEXK5ZSks12p6lQwSMUbvMpPag0U9IjG
         QwZw==
X-Gm-Message-State: AOJu0YysyDjktndEjTxbtes1euTHR3gR6st8PdwvSRhc90UokLMNtj/G
	qzNONF0Yu7lXMd+Me8lX1hphWjaosh0yFL1SX8bi6AdcPb8HWl6PWl+nDaM39Lg=
X-Gm-Gg: ASbGncs9SpkeRyUViD0+3xB/8pJjiIBEV53BwqDnb0Jy6D2BCl0G01T6VxxRru3OB3x
	dryQoSGB2PRjzrILICNeVmzKsTBY9oluwYv7jOCOkxDddY8PzIwWuz862ND878e5EMAiT65Ko2m
	FNIiebAJ0jcimVDxTG2yOVd199PxxprFBE2t3k0ABB5t1tPvBmRfB3kcqiXLTA/Xla381S/rS3t
	dzcmrJgtbjO3oE6Mxo37nLMdBB8ln8vPtMdYWNZ0blEWRMtNoy4Jr/w0hyLs3h3IPvPqCDDkyeZ
	3GUo209+Ecbk6maEPCjg4ZpCRK4hZ+d9eKVA+f6Zi+UDUqeP43Q2Ur1pV29y3wQ=
X-Google-Smtp-Source: AGHT+IEnSwkYNEUIMIA+e+PZxWoejVqQZk24l7VLml+XJY8MKjWBvHDb6mA0X4DYzMS4VtWKFu5wKw==
X-Received: by 2002:a05:600c:474a:b0:43d:301b:5508 with SMTP id 5b1f17b1804b1-43ecf81c639mr54484605e9.2.1744104762203;
        Tue, 08 Apr 2025 02:32:42 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:05 +0200
Subject: [PATCH v2 08/24] arm64: dts: qcom: msm8996: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-8-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=M4fS18wV/N/X4pK9zNCKm4Msj6IewLiSiVDe3r0i05M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0dkiAm1ThIF40nmL12uD049QNeVcK4GrwFB
 bl6KkRdd12JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtHQAKCRDBN2bmhouD
 18ThD/kB/dlwJ0Pewm6CK0MwduIA90sex0sSchHb0OB/dl3uUg8ZN8sg7P+0PFVmf6YfOUU1Baf
 cetBEeA3YMDHRxmX8Lj9Rod8prwLuRSD54Ept9XdWDeMhXJD+7eaDNk5bmVEua0nCv/PJL6JCsY
 fCXppdLf6L4Xfy5q4l+uBTGIhlhpmcD6IybsaDRLQ7N9zLcwdWIctIWDE7xrIiNOGDbD76v1gHt
 rK6CieNsRwAPPRdZfrL4gBAtAR6nJV7f07UcGWNACMYI1MkZH8HlfLVvhbL0n5dJcl360zJqKVW
 TUsIr6stPi8I40mM2N8jN/r1fS88BgqEp6DBxopU6yeP2FKEhNY0Vzwwv4U5QL0UOoH8SYNpfbL
 mzfaoeC+dx7DVQZ4chMjts5o+Vr/56Lk43qlGrrmY6GBBOl7w1l9/OoWsibNlPj6ThfSzNELflj
 Iaw5VnSUAucwABz0wiTd2KAy8rXfgL352dzIVxbTkUUcRo1Elq1fRmBid1W1bTHqKhjKshGTgQH
 hVdm9DOt3BQMImAIuhJQWB/2Ld45S9tLpdL3ZMewJ/K5MKeVHW9GmdToTteC5zAfcfq5QldmqQ0
 giYqd6sEg2tSGt7qxvf+rZLIzvdNqwBUGJKokgG355JNDpvM95O1w2QeLjG4yBx1dsvhJAccng2
 LUM62sZBctdcJmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 4719e1fc70d2cb15a6a63d3e28622ae078a367ef..ede851fbf628428f5740ca8add65ffc05360cc62 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8996.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8996.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -937,10 +938,10 @@ mmcc: clock-controller@8c0000 {
 			clocks = <&xo_board>,
 				 <&gcc GPLL0>,
 				 <&gcc GCC_MMSS_NOC_CFG_AHB_CLK>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_hdmi_phy>;
 			clock-names = "xo",
 				      "gpll0",
@@ -1071,8 +1072,10 @@ mdss_dsi0: dsi@994000 {
 					      "core_mmss",
 					      "pixel",
 					      "core";
-				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
+						  <&mmcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi0_phy>;
 				status = "disabled";
@@ -1139,8 +1142,10 @@ mdss_dsi1: dsi@996000 {
 					      "core_mmss",
 					      "pixel",
 					      "core";
-				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
+						  <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi1_phy>;
 				status = "disabled";

-- 
2.45.2


