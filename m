Return-Path: <linux-arm-msm+bounces-53500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7AAA7F9FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8756A3A9B03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A1D269882;
	Tue,  8 Apr 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkvZ0zG2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1714F26980E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104788; cv=none; b=ou25BzdBZkLh/K9DAqdrGueTcR1CqyGgna4kPx0M40PGePxwadPcPVrCaIwyqlHBeg58OGagYZBebvWBJkz3Y+15ESvRygMdITLAt1yqKc3VhSBYC0pkSmRcznozryhj/vb0WgrTX7i8IUQ0ub26X/P0xR086shCnwQyUKjjGSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104788; c=relaxed/simple;
	bh=omkn3m7HWR7M8yA3Wy2SKdjKBChDLn4G9csmN/Npsmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p80UB9uVpLL1MXkvZsbLCtc5Lp48wW/3C9yXCCpHZ4P2kd9u1nv5ru0weHx+plPI6RP5ySSYeCBfryTTLrVCtnSeFruF47SQB5CAlhdqTpiwM9GUt/hw3RsXOz1nMMtaDiD8FxkvzS3bQqD2Er5/rbVxTvhlzZNHR0qzWFd+bnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkvZ0zG2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cee550af2so5216405e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104784; x=1744709584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZd9DLuj7IqA/jzUFYP9J6UdMf8SerqXtE2cDOsTPxE=;
        b=bkvZ0zG2YfTU67tqyzwiHTkgIeYhWeIXVXtEM3hTLWt9CoPNxMR+LK/rgmndQON9Sn
         I/uoaaozuc28xjgPUDutXBvg2xot+zb0yg1S9ZWy8StW+Inf0cfyg9mxhQ6laWcKrxJM
         CUM4iCozWrSk4mo7yVSmytJaRYD97K/7EhHoHUxf+FVVLWSEVRxWw/gbu9ATWZIGXY0M
         zrV5ufmQ+RbqW4ED7ct1UyBmDgXHb5dBV6FtG75SKZiLahrCTfSJIK1WVqZDcBWkCSgn
         +VGuFRYb04OYW9sV6cTYeZDjKy0BPD6Y7BU0ix+TVaeMaLCifLohSa/8W1ELavSXxdoG
         Ndaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104784; x=1744709584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZd9DLuj7IqA/jzUFYP9J6UdMf8SerqXtE2cDOsTPxE=;
        b=DNv+g3R3u/vBvHINWOFAsK7IdPZ/JZj0/+Jye1yJRLmTvxaFuxosnH5RK/dAaDWyNT
         UEvtKDYarwHvXj0unH4cOaVEftGeTbJOQau96yR8mBk6G/QTBUahmqiixWSt5ST/uPrh
         zi437oQv4ier8TTlek2mfHFByyJt1sAoA21JnExch2f+HcAMo6FHg5rr7yu4L/Nk5PT0
         QWpSJRAvUbJ3BkxDvJXACZnmaRruKSblkd46TVWRedRek7Alb1ErzMmwovuXXeyOA0Lo
         WtjncJNrdjKs8TPC1p8yw16hrT2aXOT1G7RlAbb+OgfWLIFLc/VS88fcCDg/5FPGppab
         bArg==
X-Gm-Message-State: AOJu0YyWsxrKikK5ClU9+beiCTLvN3/FZ02YVR/j0FZOfwqnGKI+YxPw
	53BhBUYacfYuktyPNZabg01Dobzu/9rdatfoPCe9lob98r9u0mXpbNUzu9uDBIw=
X-Gm-Gg: ASbGnctWGMBQzX/E1cy+wKfvbbXTW2+NFh+3LHNJOLs7WcR3VKKPBVdrdTzMbhAe2NK
	A9yHRdWeWXxyL8i55x25hqZNQuscMN8h0KBZQvZ+yc+F3g5geS1WTuX2CCTzMmtuumyY3O5gkVm
	EvUqLm+KENmaOL3cFtcUGVmzEzu8ZOl4AXjFjiF6e2lDPlR0PFMvHxIPs/DA+HO6QW3pP1MIwDV
	XmrB54BV91DrC7wFLVHAJGdcT2n3/r79tAbP/epYz7e9t4GarMhK2B0X7W4oVsWPkHmAPhnh9Yy
	0v5cWPm+iSQ6KKKoFbE14RhecRIQJQfQUzGdnSZjGlHwo/8wVNRqbC9irpN1sPQ=
X-Google-Smtp-Source: AGHT+IF/qIrOpR+RbXkw+mJBR1TH3gB6xPsy3GUgB1wSHHUldAHyfxAZI6SomCiSn2s1hM7o2Zfdjw==
X-Received: by 2002:a05:600c:91a:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-43edf680d22mr29157485e9.4.1744104784399;
        Tue, 08 Apr 2025 02:33:04 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:33:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:17 +0200
Subject: [PATCH v2 20/24] arm64: dts: qcom: sm8250: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-20-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=omkn3m7HWR7M8yA3Wy2SKdjKBChDLn4G9csmN/Npsmg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0nKsnrVWZzBEisFbEkzVk7Dwfx+5aBJmVyA
 cICw/KgXpWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtJwAKCRDBN2bmhouD
 125sD/9W9jxNwTVpd7nBVeoMBxDwN/ldcSOJA7n7Y9hThPwHeCqPAn6tnQUVjfa5PwXWukWypTG
 V8dH6e//1ZQFU3gCDUftAvschpaZzqFdRKQZycHCnC+bp2Oyyd8otMZsbbp16sAloW65B/+6V42
 j40lPic2ZqYsizWSNfycfKbnZbohk55PcU7QHHauQDqR4QOjP32ajER/vOMaG+F6Tu6kHBt8kRF
 VRr4mNqQ+BBBDqwG398G3RIwsL4huBp1UjGZ5/GAjuMsWY37WUTkPvm3Ol9jQ+Fe2zmLp/vfcY0
 LUVJLWuvSS2O9xn8bIlEzNQpZQQC5P4aLtT8JZCc3JxVWe8pvKTQQyPGqIlvoyXfjWeOhb8xfOg
 4XH6ahUFQd8bfogSzy/A5s66sw4ioMOzrgA2tzHVrs+kch3ULwmkgbRxJUQqFOxVY7IAehuYBFm
 izPBR0suv+2CIZPhyd79Kwg9LIkszZTeSq8okAyCjkkEr9LbUH0pVZ1tB/A406HtbBF9aSGRRlT
 CuJAlIOXz+ZtZM2jfu5f3XEl0JfBhY3Eo52kNN0IhS6rLB58ZfN0pyt+/RjerHhUjrBkNu1mU0f
 /yt8182YvTtPfYsurc94jKS+GDSCdCKt2LUq8Ag1JtI1iFuz0hRI42UwZFRwVhARoXFUEQ/gZkl
 o/kWOf94uddXWwA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  3 ++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi                | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 01a321d801af3389258abd54e60c39272c59fb7e..465fd6e954a347acf15ef3199afd8d1a198f95e8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -659,7 +659,8 @@ &mdss_dsi1 {
 	qcom,dual-dsi-mode;
 	qcom,sync-dual-dsi;
 	/* DSI1 is slave, so use DSI0 clocks */
-	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 68613ea7146c8882150f1b81dbc0f3384d3380ba..0425e14840c6a299aa49e82ef5010fc9ac090296 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -4861,8 +4862,10 @@ mdss_dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
@@ -4953,8 +4956,10 @@ mdss_dsi1: dsi@ae96000 {
 					      "iface",
 					      "bus";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
@@ -5011,10 +5016,10 @@ dispcc: clock-controller@af00000 {
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",

-- 
2.45.2


