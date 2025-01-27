Return-Path: <linux-arm-msm+bounces-46261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7978A1D76A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79E7A3A7A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B19205AD0;
	Mon, 27 Jan 2025 13:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaqFDE+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0294A20011B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985717; cv=none; b=S2UG8Za/4kWcjeNhHjymBbIvhh9NW0KzwtDyPkWV6H5/kVvzGQAAPofcdo+FqxhEEubh0ErIp4BHReGqgTiELDUMRraTBuSUrjQEDtzINIOKycyj1E6rYsXsbUr0nzd+1nMwYV0E4XtP4JwrA6MO+IpVY1u4EigFiLkMTkA/sNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985717; c=relaxed/simple;
	bh=7RI98BXbtMqmF6/Mmo/fkSmn+6UBk1FUfXB31KjI4pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLHXioZzDLfkce8VGGjHpV3c1N8a5MaOIfeRKkqVHj2eNW0n8CiyT817kz4vlf3brTesVQJzqVNrYnCipY+fgseC1oe1FVGVNbDtUzgUyKEIjAWyLb3hgzZWDyyyp0AcmPgwfR1eNhKBNqb438pyjXNWiNBb/iC9yuzTdUEhJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaqFDE+D; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43616bf3358so7277745e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985714; x=1738590514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDNuzXFJKLOjm1m/inz0tGDVZNbMCzuLS2z3gfVVaF4=;
        b=LaqFDE+DWN0ws6FYMWA+80Cpyqq822StiNIuwI82ZVPlWwt18mfaB9/96a5GGGIqEz
         4d5dM+iRp5mmvaccwuC3K8NfTDaUVO1zeCYna8frqT4xb8jpfaLLtEWTM7Nh7M0gTaDu
         XxOD00VVCYM5/yIO0KEu7gY1VBiGS2zfWjfLducvER4tSLwy3KTuakEdl4Z4fI2LS70A
         qn7bAjCAB1D8cAK1b38o+P5Y+CEjZK0LHAYvdrHMppi/+7vOmvxblPqFIGgiTcsycsp9
         a1oUPr5n7RvCwtg5bRMK5vQeoSfVJdeS91GPjRycLu7m2+Bd0mPcfwUUqw/vYj4bwJkn
         meng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985714; x=1738590514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDNuzXFJKLOjm1m/inz0tGDVZNbMCzuLS2z3gfVVaF4=;
        b=I8q9CZQfnznktIxpn0NPh2Dvwy7VghntIEPHO5mU9myx02d8wxEcXSuiMCTE+WKr3u
         pBp2eWiVFbrBXOCBrOWFBTYNY6VYsrrG7CNa3VrS2h/E7FH80mdOEF6uCTfHsclrEv5e
         rKXOry3HoHgRnhLXqad8zuv/XTrWTy5zZD+jkxsiDoqGI9eru6gpGYiyF86AgFYuaNNv
         7FRmgk928RWfVlvt0yGrYeDR4n8C73mZH2JkSpI51E3Pq1JfWI35GAz8gQx4D06Pd6lB
         dtQlI2YCz2cJxAHFp0Of5Jp4SJaj1vxWSnFwI6sw0I6B1477HmnFIgatwXXNR1LOnNzb
         OCsg==
X-Gm-Message-State: AOJu0YwIhGCKweSsZjLakzpuihTsib6sUQR8xWU/0viVHHaW85kM3qE3
	BnMCuMAktWa4j1rnpTfUY9h8kc6sCZTpph4/EKbqPSHncVszUNZJEBoy6ciDKl0=
X-Gm-Gg: ASbGncuXB+eF5PA4Tk5g7aAcoBmKBqfAzMDz816HIymfZ5LOBxpA9lq2ZO8O43Zt0Jh
	4djNyq6kWbVDKwmJVD08JxJReD1++EBDlOdlvm0T1kuRuMoMlBEJes1WMhnipd+YTQHjM3c+uqg
	QemztoZ+hR6YmqpQjQV0/eeZWVw0PYPYwFQc+2HNI/4TONCtadHrKqu1Pihq5W2STaR3muoxtRb
	oTVTSYoqEuMRAU+z/QtoxeXl0IDhjpxBqPq4oOFVpgFHOEDyUhNa9GkmxpnkWQuDhOY7UAhnx6h
	QUlyug+tUa8MgRrclFQ=
X-Google-Smtp-Source: AGHT+IGcyPjT4uFLvFPBuRzWjALlW75oYOxp07cABtHmyZgQsmcktqkXukUbBODGIERg0dBhDdlt2A==
X-Received: by 2002:a05:600c:4f54:b0:434:f9c1:a5b1 with SMTP id 5b1f17b1804b1-4389141c9cemr144225005e9.3.1737985714312;
        Mon, 27 Jan 2025 05:48:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:54 +0100
Subject: [PATCH 21/24] arm64: dts: qcom: sm8350: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-21-9d8ddbcb1c7f@linaro.org>
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7RI98BXbtMqmF6/Mmo/fkSmn+6UBk1FUfXB31KjI4pk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46RPLCR09Vq37UqXRtiSe/H+aa2TQiaFg0v6
 pTzh51y1BuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOkQAKCRDBN2bmhouD
 16msD/wN/Y6K+NOBViqANrZ2hKRKHeK1REPbQADHtatWKNjBTw8lFBaBdPtCl0eoXppmJFnnrul
 zFruQfLV1R/ItQxOQLg6YXHF+VTMFDGvDDIv3KW0icTHNrK7ELIV7vezHRQcJQaw1MfKMPYPBFZ
 zT6CJ0WaGML3e38ctj5F95Pa5ZwKzGFgsKU0ZeT2Hl6qJrPZaQtWmkfEKSdViCpfS3FdrPKWJEX
 do5oBxnpdb7IJ1qkkncJbWXa+yOik45+ywQo+ogVv/eY4Fe34nQX2fjS8cDvQdDjp6ttzcKGyNx
 okxvMwo3MqCEPRUt2du6gwj77I36xxyshBUNevNTfpCFlzoVlbFxP0b1UYRGCZ/3pSeA4Kr0HkN
 9+LzVTaF0DEAWKgwD4w96Wid3U0chGprY8XncWXFEF89IjjAAcDo1UqYXzF4wY+X0nVXprOrqLc
 +aZnaEsc4FXopijeIjgJsh0iHONqKdK1ffi6SPMFN/KjEgUoV9UWCUuCMOLQcBQlh/P2U1nOFUF
 Rjja6Td3doZ0ImYfRpzcMxxsA/sXGJUfewcpJdXyEtIlJjRbNYMM3biloeBBIfCBuXcT6kgrtFM
 xXCGxglvEHKw0J4Up2y5nX9xy6ctHUB+tp0QD2tcHrBozxyfCk2ZlFB6s7enIznYdtMFpTuaXhR
 awpjfI4WGJfw6CQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 69da30f35baaab67e51afcbca3486fb89c14f281..ada1456791d152696aaf35f6dc115d9cef8170f3 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -2960,8 +2961,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi0_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
@@ -3059,8 +3060,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi1_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
@@ -3140,8 +3141,10 @@ dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8350-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",

-- 
2.43.0


