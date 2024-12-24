Return-Path: <linux-arm-msm+bounces-43230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 632209FBC2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39FFE1885809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEE41D7E21;
	Tue, 24 Dec 2024 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pURh8fM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89941D7989
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035450; cv=none; b=VNsfxqopY4zK1bZNHgsZmdfQE/JgvUa6iqBJyyJczeXgppbS8g9AhDH8Ka/zplSoMJZf7GkCPqYbX8R8d1GPK8msKSesvY2rWb8PtPa/U925mjMOAaBaK8dVFG/I/CySc/+USXwVT0ntyHwfHu9wD5Fp1FbGWRViQh6Dk68Jsn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035450; c=relaxed/simple;
	bh=YYLN/oY9BZAxpdyRliEHDR3RyIM74cdws5RTMVCcPsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Md+tVdg1QZKug1UYcTFeXoXTM95xo7uh87yKznp5bqCI2Xrza+5Jfxhb8V/xGQiF/TH76+/nbCdBX1tlbTwj3pPN8G8b5qEH9zxd1cE8EoWVern7Vd4MC3zHnDz3MjxqiHQnVQIR03xmwayy3c3b3mSF025U+oFX4/1FPRJo0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pURh8fM5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so5244385e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035447; x=1735640247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTWn/nT9EEx5ji/oK3o3CEmYZEGrJrLG4ik4y/ciX9k=;
        b=pURh8fM5ZTfpxYbN8RaF6qtXWDmSMxPlIWsfifFuMX4Q8E4ACILSPjBlvEGnr3CAIe
         C0VlfzxvGgZFjziteXjF8Y6SZwW0w7G7g7Im5rF4OriftULjgKMKs956QdTZUO4VVtsN
         gWFmy/M2anBIctjT+D9t5OObSvW7fV2Dg+Pc0t9baRH5TW4U4sviq5BJ8g5HePFgcoh8
         QZcA/BJqCmC2Uuzt2d2XhYSxXNIpc4skewFrZAeasvXN9hY0iIMwEY/8KUfIIhXlDzU+
         PUawKBJzKf8ac0IEYzys0qow+8NrT9yKojgSPvDERxS1OhnSXFL2D4a7GPX6scUomfOu
         muIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035447; x=1735640247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTWn/nT9EEx5ji/oK3o3CEmYZEGrJrLG4ik4y/ciX9k=;
        b=nUIfD29Iv/6zOuenWuwwzwrnUwIXXs0CFneTZTx1FNdsH1fZk1pCYss5UHc/RjjWxQ
         utKuYBj8iYYn2JBLhuogcf5vw8GOp2xw0cjQWwGxCtcu77WuM1dOFnngXTBA4h36hOtN
         2kdIYst120IPwz8Kjqk/i66dqa3v9PtaDYSLtHts14tJDLtVu+RxMzEfulz5RNIJSBRY
         exB7RkaplS0DeDMUWqR22taB7Inr6ByzqwzVmuYRF/DYxPOcRiNDd87vA7K4+oJYXDU+
         Qztr76s1RAT2b39YHRirvr8cuq57d/Ap98iI4+r8NE4QLRRPHc7Q8BcGJeha66qczOWL
         dsng==
X-Forwarded-Encrypted: i=1; AJvYcCXtRxyqhv/jujaZgE7/lJ6PdBCVI8ZX6fEMc5VKsePN1K+fZGWrkokSqQ8PoDnx8rAvv8Zs4YnF8vcLN3Hp@vger.kernel.org
X-Gm-Message-State: AOJu0YzRj6yLIM6LA7OO8g7uWxZBX4bazZMZ8Jusvd2Lc9ExeIX94j8p
	XtPjOrxABlNzWLdWxVnMhOf3K6U9PcVcHktgG6UQkcpgm32qgWH8s9YSvgV0xxw=
X-Gm-Gg: ASbGncudxri7lk40cE9Czf9fPiM3WBMtwPgZI4ArouOkLCuCoSKeoGFngLevguqb4kn
	pz15K3/H/T8LYqoXWak/qZ4BJE3TkBCOHOV3OE8BL0Uy5Hi85BzszpnkQ45yroemPyn5tzYdrc8
	iUQ2F8PSjzTusppDdTRKxK96yvzIlW01V6H4wkSlxowAznIq61mdAtPYtMo2JQUcLaQnfY2X4z3
	0Px9waEiqqw6Ihqo2TM7INq6pJ7zCaPGOUiCo/uPlJwMGtcp7EHtoqUqqie/0tJ
X-Google-Smtp-Source: AGHT+IENpxaMu1LteO1S7WRTKy/B9eB/Ql+n7t/JIN0I58tBM0RGoZsU5vVyTHEKfFXpjjbjI1x6xA==
X-Received: by 2002:a05:6512:3352:b0:542:2972:4e1d with SMTP id 2adb3069b0e04-54229724e7fmr4263483e87.37.1735035446728;
        Tue, 24 Dec 2024 02:17:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:06 +0200
Subject: [PATCH v3 07/21] arm64: dts: qcom: sar2130p: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-7-e9b08fbeadd3@linaro.org>
References: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
In-Reply-To: <20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
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
 Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YYLN/oY9BZAxpdyRliEHDR3RyIM74cdws5RTMVCcPsE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoohcsqRBxIiSMe0tXJAOEA5JoOuex+QjvcVR
 8imu34jSl+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIQAKCRCLPIo+Aiko
 1SazB/4yKbXQEhC8CGTyOkeGZW7xU+iAW9vvGrQmYDkmLcLyLLEWT4+Mrf9uR5HXvasVNN4BMv8
 2zIGplebR0U4PX7DhTfpzObIOpmV9ijaExzMiy6NfPT5F22twcHJWXp/yBp5XrWwKqeXiFhu3f8
 dc34dd4lKojUx+0WlBtpCWb7+1REEDxZlyfgStTb5kc1Zux7k83EBwyzWrNEQxojWrlDq7Ftl7e
 hY+XVi2H5GrPay+czIJHCquc8v/JSLjp3yjj7gv7pV2J4/+02TD4kTY49nmt0Qv1gVA5rNiCqZO
 lFKq7i/SoQ7ZjRxVQs/RGtWKEr1WafulYWUlVvgyIDwXs4xh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SAR2130P platform uses PM8150 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: be9115bfe5bf ("arm64: dts: qcom: sar2130p: add support for SAR2130P")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 56f40e8ecae561d49331e51c57581d517dbc9b51..dd832e6816be85817fd1ecc853f8d4c800826bc4 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -37,7 +37,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 		};
 	};
 

-- 
2.39.5


