Return-Path: <linux-arm-msm+bounces-39667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA969DEE46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3B1281CDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D6A1AA1D9;
	Sat, 30 Nov 2024 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="seDDVTFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477A51A9B59
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931126; cv=none; b=hvLHripZISE3w9ChysxHYzvixiSGn8eypIMMXIqTIH5R+BiWa8aniTTg4xhVYA2tx3m9vI6+enVzkO83sxmlJRn8ctPe6jzX1LnHqay6qiBrlMrq80Hx83/I10VVx9NmfcMcuB2jiSZmMisrtSfhEp/KQcgMKC8vCpqdM7Hw/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931126; c=relaxed/simple;
	bh=TFWNpIU22nTtjPrBPXwtPtG3hCCyX6t5KRLVmL2rE50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNwkbIIFD+/FvvcuqSWpDkj7v6sUEVRmd/tRp1QSEwgg+tO9wYJryrc9uGxeDKQgu4vhdn0+2yQZtD9tRfa6jlac4YyHTlO45E7nbuqmvGNgrlHOcXvGbAUOyeSrE2ET/6qBhOx/uwzOXkoDc5MFxckTKQvOft0hm57BeexccN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=seDDVTFY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de579f775so3647760e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931122; x=1733535922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVRzZVbEjcLc5x/T5mJ8GK+5vcUaeSu6vvQKHcUyzAE=;
        b=seDDVTFYhgl1dWm6TTJLLTabCj+sW3x9T/hWN2+UVVMlVTlKoU2YkRVToGRzHBITl7
         8I7zHgBz8nVvjKtoSrAZeV0d6yXZe0z/CjFlwplo7aUq/soT9Mf/tQMEMm7DPoY+/lPz
         n4Qw52e5JrunnN7I4b+kVAIg0gVURjRp3SiCC+KbRrrsj6ZGj3s3G01T04E4kw5rKaGZ
         OCENnVd+uSUE0Qn+Eq1B9uJ6NMQx87BAMPT7S/8rhLo9M+oSKexntjGqsenTnUIRRA09
         sy5Y1svB7IxqBVaibA+55QMFcUqNW/4KEwfN/lqvY0EtJK4v82TM1O/ge0NLOwlDWMQH
         4smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931122; x=1733535922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVRzZVbEjcLc5x/T5mJ8GK+5vcUaeSu6vvQKHcUyzAE=;
        b=jHusKyL+tymtmSljIY018i7Cr71OmCubY4/xoPrXhpyJ7H7tH823FYe7lOCWRChORw
         N4DNYj/Ygell1w8f+aKaVYb9kS+TUnoXedo2AbqiotFwQLzPp8g8EM2Bf4lYMX5pn/U3
         a1vG1+zEPeu/nQ5FRMUhJYVcHvPe7oya40lgfG6ljnPEi3sCNXZmJk3EGUKESUBxoS38
         FzNbSrIECo6BiWQisHric7hN0SgcM3xO6YMTrrrKLN5GGcYoTEy05YOtSW9Tn5+OPY/o
         186h2fUskDUpo19O/VYXD1j/IAzuVcTuBqJM2E8YCHrHB+b3ufeqELtykiuuVqobqqWE
         QoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMNWQFXxeZKFw8WziajNYvOOy0c1o9Mms5h5ROmyvWIQtHuZX8nZcGs8vsstJAV5nR3NaNE40cFZPAXQWK@vger.kernel.org
X-Gm-Message-State: AOJu0YzwdvDE6ZdX32f/XCMcIuGqlpXRSoKf3v+3P63GpRMm8wMeTvfe
	huJ0ZcSxHNz5K1ltVdDSn8YOac25H8ml/m+/sDHjjKm9Y4xtw62zC1U4Nqc/oa0=
X-Gm-Gg: ASbGncse0IQIPq8MNoI+ve+CQUB/D+QYnK/BwrRn/wKcw0rWvQYwi1xiWhVQToMp6+1
	SUqXpBRjjPy83U8S0iYVaUFSUb70uJqfTnTgNep4pm90MugIXtzCAjXMvRdGoT7NVCS88V/CTz2
	PuNIsdWZTbhZb+d4+qeynLG0rRO4Hi41kxaODICJGewRdKzuVNl/9MeMV6BX3XAngc7cnjVE7lr
	WPZ9YGJhkFh3UpAlh4Yiq5cmDomTKV2SHeTRtuEp4Np8z05U0HDtZMGgA==
X-Google-Smtp-Source: AGHT+IG/ps0oJXRR9N0frW3v6EiHeEjyhKkP0yenaBkRRJrMeulLaKWjHCYIp1Iv0Z+tSKdh/amW+w==
X-Received: by 2002:a05:6512:1249:b0:53d:ed47:3017 with SMTP id 2adb3069b0e04-53df00a9743mr13667267e87.12.1732931122484;
        Fri, 29 Nov 2024 17:45:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:35 +0200
Subject: [PATCH v2 23/31] arm64: dts: qcom: ipq9574: move board clocks to
 ipq9574.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-23-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TFWNpIU22nTtjPrBPXwtPtG3hCCyX6t5KRLVmL2rE50=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm32BPMAQzJKXT1aKXkF5qYTSpCJQIfHXE2my
 6SNtnGP5byJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9gAKCRCLPIo+Aiko
 1VftB/4tg537UIMUbY1WMczWqB7pmkYZ2dep2XLl49J6S7jzVpYMtJQ0gBHxn0XKdqr3xmVpHMb
 ax6cNI82ZVKw+SWOTSWx+XDnuc0K447lUePZsUR7nZHlRL2SKInS70FO+iaLtcyIRw6oMBV+Gwv
 lW3qMTYxCpgDyYylXm2anXXk1nLLSy5bqClG4rf5IH0L00v4jvhtp+9FopVoElgbei3jn229L1A
 cN9tcW1NVynok0I14k25KpNevwEiJVAPIkjDmKHI1iJlAEvTdkXHEp0njKj0JJg5eLwkV6nzF/+
 +V7U6G9LJThc4ns/dzJuBR5SeysoVd2hKLcXeNXLhzABCl7m
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

IPQ9574 is one of the platforms where board-level clocks (XO, sleep)
definitions are split between the SoC dtsi file and the board file.
This is not optimal, as the clocks are a part of the SoC + PMICs design.
Frequencies are common for the whole set of devices using the same SoC.
Remove the split and move frequencies to the SoC DTSI file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 8 --------
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 2 ++
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 91e104b0f86534ce02349c7b69b36f4c5e602c6d..d1af7c55f6256e9297c86df2b3a1ab68fc636862 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -114,10 +114,6 @@ mp5496_l2: l2 {
 	};
 };
 
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
 &tlmm {
 	spi_0_pins: spi-0-state {
 		pins = "gpio11", "gpio12", "gpio13", "gpio14";
@@ -163,7 +159,3 @@ &usb_0_qusbphy {
 &usb3 {
 	status = "okay";
 };
-
-&xo_board_clk {
-	clock-frequency = <24000000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index d1fd35ebc4a28bafee77e7be441709f99f482558..7e519db962d140989887f6ca9cc270a6666dfb58 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -22,11 +22,13 @@ clocks {
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


