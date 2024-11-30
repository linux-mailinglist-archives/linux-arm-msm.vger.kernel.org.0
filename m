Return-Path: <linux-arm-msm+bounces-39664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871EE9DEE3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1B74B236F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D777E1A706F;
	Sat, 30 Nov 2024 01:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NvxzQT8h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509E1A4F12
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931118; cv=none; b=ujzxxWGYBkpVRseWarj+Ampwi89JA+ule/jmRFqYRayld1e3E3wBzs2VV/yYR8SKHbaCgu1NgqftEXMStaxeCFRUNxGAOwZvRaXopeeVsUp7BKd7UnSmnZ1828Gfd4p8lUiPGwYZOaYXarIC6kPs8b4zo3/ZJ/WuNvPetxmhY+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931118; c=relaxed/simple;
	bh=7OHCCY/C9Gi+J8yjNBu9jXr2t5pH4lXuG676E3PqyrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEHb9pYTQCNzoRYIi+Zh97xxOVCQRHmz2luKlU642LYlCmqVY7BFVdzQ+1vc6tF8n+9J52WkcaHtXBtSh3masKOmIpnIjPx8APWeb3f6X+ZnmYNjAKbxC0fvwbuMyFID42Ssmj+Mv6axzkJoMHcVK4yEkIIYnt6z2tajkvXLTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NvxzQT8h; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc1009a06so39398701fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931115; x=1733535915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4z856H9JHoTkiVMW2wllXOsniUtBFQ269F+uLj3QMj8=;
        b=NvxzQT8hEYTXcbyOc5fkC+C0BQ7peJBwB00nAlhFcEY4NknetGm86CBsYPspH9jONW
         JmGDB2H2hWE8xAeXZX3C4zzos0KWQ+baG42j4rp+Rs90eUkxswTUKJsW+9j/BGO46J4+
         7JdImHjtLLxaiOT3LQ/CF0B43cHE+WkDbj8SoM7Bn2JzdEgkOv+/SdcSZY7wI8GFrIuh
         UADq6yFyLzhjoW3sv5JzdT3sezg31LhBZP9+QDuonyTzKYty0cWjXX11Fpvp7TRYTW2h
         idJCVbV+/W6y/BW/rkf4ylWlD18szdL8Kf0XHQJza3w6vpGcsB24NFDVTU2zVg/XJrz6
         DHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931115; x=1733535915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z856H9JHoTkiVMW2wllXOsniUtBFQ269F+uLj3QMj8=;
        b=qpjBiJGbP7KiRXvjoV4BKVJelP5D8uu+jOFYDl6IJtE3Uq+lwucNz0sjXl966uoxVa
         K3t7T1FwSWWzMZYZZSB+TYIUutlmlC8v5bsFLPP2nXKFW7rAl9qRbtHSlMGoXoPpuvUL
         FIpFEl77b2J3TF4VhA1QxW8dgZoGnueHfspf2b1a83+zJxDIaGL0x7m2lxaxpkEZ8Ib8
         l38ED5YshXSehQ8GVM2tP6CT0ZAk54pw97itr7xwrGo++iHkJYK9/cw1xisGXvFgaQgV
         md/7NIMCEBXODkCWbaSL15kD+556EoVxJmo292Ocj0dEnub28OooUC7G7OvG5zbvDej/
         NTCA==
X-Forwarded-Encrypted: i=1; AJvYcCVmk0A0thxiQF5FF5IZKd23sfc76fTuCgONvn49uimWvGx3WvuzCBGlA5qEH2ruC0ig7etMH29o1RzmRRCh@vger.kernel.org
X-Gm-Message-State: AOJu0YzGJiD6603sbLCDmqg3yEYvjyiJN3+FOWZsET4+Ra/K2V87mRO5
	dmK6BlVK3yeDOzgUv2z9//QdmA36hQvXSeCZNGZVBGK4q7FBeNil7MH01BuYtBA=
X-Gm-Gg: ASbGnctIfS+AjWhvmx/yx1s7+ieWC8los66hJZzBkk1Hn25gNBmOTBzG0XtYy5M+7fg
	qNO7r0l28CjxUPs7vQwpEOsuekiUwS+55a/SIaIpRKWlFYjc3KvbVQqiD12ToLZm7T7ezFH3tp0
	I+pSBbYllrxIbOW4K16uvJvFIn86M1XLgOTT5XL73qPr/WCsQBN2kLU8Cwp+ZiLqmgyO/n2w0nt
	mfyJtzBoAQH/YCTTuo9tnl+ju3dyNpAVyiUORHFSRraxJFBQuGP/kst/Q==
X-Google-Smtp-Source: AGHT+IF0zW4Tb9smsX05u/8ucSJALcaHFjYyfqVbtDlbID1tAo7/zHKSvldSi48FISJZUqMPBLI+sQ==
X-Received: by 2002:a05:6512:3a8d:b0:53d:e83e:a23d with SMTP id 2adb3069b0e04-53df00d952dmr12619712e87.27.1732931114874;
        Fri, 29 Nov 2024 17:45:14 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:32 +0200
Subject: [PATCH v2 20/31] arm64: dts: qcom: ipq5018: move board clocks to
 ipq5018.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-20-b9a35858657e@linaro.org>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
In-Reply-To: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Joseph Gates <jgates@squareup.com>, 
 Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2648;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7OHCCY/C9Gi+J8yjNBu9jXr2t5pH4lXuG676E3PqyrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm32u9te1Qpn5Qa9ML35WLzEI1r0Xn/Ay2PZV
 nezXo95cqeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9gAKCRCLPIo+Aiko
 1c41B/0TGGROPMQI5cFxBBrL+cOETVbJVXbve1qsZlcI88uOjKk4+WJJ40C4Is1ozIi9LEdtUWb
 UdvQ13lTw/wNECHJ+i3Dsy/HL8+GwfTvemGlrb9ZbTP4bBswkuxygCIj526qWpTl1yycXLty+Og
 wVh/aus15bo/QYD2K81AztGzmRhYPsoQcfbzSYiFf4IdurIxUELGW6QwkxzApLXqHV0KQt+YDw5
 yrUO/ZjEM1tTJGNahFwdp7udfKnVn+Ggc3CJ4FqNpjgM7XLBam9mHBx5mXcWaRY+ya5/pcxWheU
 UA3D2RXp5P5Nh6XbXScyKlF9okMbuQ7bjWRziSvjVuU1YcfH
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

IPQ5018 is one of the platforms where board-level clocks (XO, sleep)
definitions are split between the SoC dtsi file and the board file.
This is not optimal, as the clocks are a part of the SoC + PMICs design.
Frequencies are common for the whole set of devices using the same SoC.
Remove the split and move frequencies to the SoC DTSI file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             | 8 --------
 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 8 --------
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                      | 2 ++
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 8460b538eb6a3e2d6b971bd9637309809e0c0f0c..9bb87b7fd25777d4ba13bd2bb36024b8035d8afd 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -38,10 +38,6 @@ &sdhc_1 {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
 &tlmm {
 	sdc_default_state: sdc-default-state {
 		clk-pins {
@@ -78,7 +74,3 @@ &usb_dwc {
 &usbphy0 {
 	status = "okay";
 };
-
-&xo_board_clk {
-	clock-frequency = <24000000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
index 5bb021cb29cd39cb95035bfac1bdbc976439838b..af281c285447f9845f542cc9d976fcdc7f1cf766 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
@@ -95,10 +95,6 @@ &blsp1_uart1 {
 	status = "okay";
 };
 
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
 &tlmm {
 	button_pins: button-pins-state {
 		pins = "gpio25", "gpio31";
@@ -122,7 +118,3 @@ uart_pins: uart-pins-state {
 		bias-disable;
 	};
 };
-
-&xo_board_clk {
-	clock-frequency = <24000000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 8914f2ef0bc47fda243b19174f77ce73fc10757d..fe617e9a086e6541854e03bd1f0a6519079befed 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -19,11 +19,13 @@ clocks {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <32000>;
 		};
 
 		xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <24000000>;
 		};
 	};
 

-- 
2.39.5


