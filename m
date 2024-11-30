Return-Path: <linux-arm-msm+bounces-39666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C079DEE43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF9E4160306
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F748142E6F;
	Sat, 30 Nov 2024 01:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd1D2Hi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8E613F43B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931123; cv=none; b=J9yzOkjmPVrgOpBSsq73Iiac17Px2s7o1CJwg6O+RAa7RM9ZWzX6xysc8tnSco2eKP+cJzMljcIi9CAUFQNEed/xy5zdiMRwnWlR6cOWCXxnYvoqKmVlmAt0at0dBRCYoiRi7WQEr4V5ynZaywETsvbYRqBw6H1e/KEs8vCgYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931123; c=relaxed/simple;
	bh=tzUIrFmtHkqGaZynEqK4WS5Rn+VXfQprwMZT5pAQztw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIQLIpCXCPYsuj+in7ByndzIfxA6ecpsGIDP+kEhcQQQ8/nuXP8U2nSUm0Ykc8Jvb/bP+dunhs7FPogGB/FxwW+esyvtCxnJKVXxZ3rLgYeasGUMZaueQOWlmN0bj8183mepzGjxRRJ81nzGi3cyh17XDnHrgWImDkjD3eNHqOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd1D2Hi+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so2983598e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931120; x=1733535920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBd6kLu4CLXaYNqds7prk3Ww69RHVKvVah97AtSlJVw=;
        b=dd1D2Hi+eM4riAt1i9C7didXCBd7LfYkLhQ2qDdRA0koeEVOF3EssJKeePHaGM+zx1
         TgTnxZpA/yNcT3SLATYKWMnAQ8SFF857FhnHbXDaP9qTPHW1STjnZCb09rRxpmar0cqm
         c2nEWOvi6knMrfaFZ6rggOl2J7O5kG61JLeUmI300CGVIKcgekN7g3WBlfhZDMlsUYor
         a0bY7uw75pXmh9ZPVEJHRmP8SVVqC5rikeRm5f4WKphusFzjiRhvhQMBFEAUdCNey7J5
         K+oLZgVlsIcAkkcVZhrTOR446SrFrhp4hM16vOkqhoEcFZlqXnTOplE3sbT/668v7huv
         PGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931120; x=1733535920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBd6kLu4CLXaYNqds7prk3Ww69RHVKvVah97AtSlJVw=;
        b=ocEx5i9jrXB+Eui+dqIcvnVNHXGatz+NgoDs7+ktYryDUjTTnytC5PzDkQD9cTcVuC
         /6TQcpUtBUohBzF1UZMfDBgZ4iqVQGuRpVIuU+yYgQ5dJTXm3diHoxJPbZtqy/Un5JUR
         EMr71wNNAM97BqemvAfpQWBRNQRYvt9LmdOME45c131F5JSlG+fW9POo5F/Fx1CuWNgX
         TiDTKICxswsxW/fJiy6oCO9JQ0NdjmavFrqd/P+RFY9MOBF5k4VhN4tVPSrlPhigujyb
         BGJj0q3v7Pkq7GIAoUceqf7aTbNSCF6+hJsDFA5LOXYvRaVroUUNSyVjRgV9PbkRl5hL
         SBiw==
X-Forwarded-Encrypted: i=1; AJvYcCVC4qa3kxLCLOWV34JPZmtyi5W8+TGT25wSEtZRpAzAqqfhk74AZ7vpq9RRNG9VeFoPGs6z4gsqYmFJd/C5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyr4nq+UTT2kv56GZVDmJw6jjy8/7iRg0l+jrUYNprkH04HGEY
	h15Ky7NxLRjaBhvrfx3QG3PUKMCjlSwJefNwEKcYsBymT7rzf7HQFoj0hGsW/3E=
X-Gm-Gg: ASbGnctQFIWQ65beYCEOZnRPgbO6pDudPjJK8AKqEIT/9IU6LCaOtbpOsA3opnc4LHw
	TamJ9o+k2OQUfvSKCIBSrntVZP/e2mHuoBQQaETScOJe4IKsOGZBz2tcpFlc+2KdeLwkEBdfdIZ
	qScoU0+09VyhfIiVeAtAU+dbqjgceltuAlZspigwX7B73kaZkn5fHnVG6Gb9TVD83A5THXJHFQ5
	EXzjC07INh0BwRV/5GWj3TrdpkvpHxg5Zj7cJZcOrNws7XdZMHdXBK08Q==
X-Google-Smtp-Source: AGHT+IFHprGjr9oiufgUFNlRu7i3bV+HDX3rUbRZh/Oc0/ghSGE3IbBA3XUkoh5SjUkNsNcRSib/Uw==
X-Received: by 2002:a05:6512:4012:b0:539:f7ba:c982 with SMTP id 2adb3069b0e04-53df00de5aamr7177110e87.33.1732931119941;
        Fri, 29 Nov 2024 17:45:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:34 +0200
Subject: [PATCH v2 22/31] arm64: dts: qcom: ipq5424: move board clocks to
 ipq5424.dtsi file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-22-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tzUIrFmtHkqGaZynEqK4WS5Rn+VXfQprwMZT5pAQztw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm32hy+wo8YKljBc5YsZH/dScV7hREaRsyCPH
 Hh6M3ERgs2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9gAKCRCLPIo+Aiko
 1aVxCACnJR+glZe9ByF3Wo/0IdL3OsWS3RVqYsicEWAuWDD4P02EPXYLDPMyKJwukXTmwUH8gnl
 +gsAI55ElIZEe1TcAIqUxcq+tDDjaRcB0F8zqVlIKfUVariuX8RC6tASPzIX4CuHuYQg1xOE02L
 E1DmkbgM+BjM2tWrfPyLZH4bjh1GfI41LmEJlm/6/E0DL/gzCnGuq8yTzkJM4JM8H09XCUe0a0H
 tWCL6j7P/sMapyKyHm2/35BZWz7viFBIFLh7Gj3gC2KMkgoYTZonUgN5ePLWavgyBhWgLLyQnmV
 hv3WteOuWB4rb/67JZNsbuLZkgYPqX7ZCIMYL/dwoxCEk3I+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

IPQ5424 is one of the platforms where board-level clocks (XO, sleep)
definitions are split between the SoC dtsi file and the board file.
This is not optimal, as the clocks are a part of the SoC + PMICs design.
Frequencies are common for the whole set of devices using the same SoC.
Remove the split and move frequencies to the SoC DTSI file.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 9 ---------
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 2 ++
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index d4d31026a02624fb5ca08cd7fc6dde9d10fc9b81..e78d2dd9148d7daaffc007322493577ff2ca6c7a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -18,10 +18,6 @@ aliases {
 	};
 };
 
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
 &tlmm {
 	sdc_default_state: sdc-default-state {
 		clk-pins {
@@ -52,8 +48,3 @@ &uart1 {
 	pinctrl-names = "default";
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <24000000>;
-};
-
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f9004123caa45e5e9e303662e3e92a56c57..85bfe5edd9ddc2da0897aa5a4d43a68116007d9a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -20,11 +20,13 @@ clocks {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <32000>;
 		};
 
 		xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
+			clock-frequency = <24000000>;
 		};
 	};
 

-- 
2.39.5


