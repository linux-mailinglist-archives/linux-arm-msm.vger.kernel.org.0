Return-Path: <linux-arm-msm+bounces-39655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96A9DEE24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B423B16120F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B770189B81;
	Sat, 30 Nov 2024 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcUIaqcw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04C16F8E9
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931098; cv=none; b=ow5yBMQ8DlRrt6uDtj1V29K0D76E829G/uj6ob9kNVEBdPSZac+FDCI6wVXTkQ4tXYaQb3Sk2HQrd2cWYyZHB8oL40wWY4jb7d1g1uH9b+4WJwALN53hV8o6gip2E7sgajE//2kD/nhu+U74dhx/Kt4gMw9y7NQ3bAiUgF+jY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931098; c=relaxed/simple;
	bh=q3UE0E2mDZCC929aI9do16YaC9c3UMVZhi0tXk/GPcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRJMc9tcdlx9b3n4Prml0fjf/BiwCXJSZKAl0SaQXdOTWFsF2muXqkpq5W4wzu27W6YNEOmpbKRZ5C1FVZ7Mz/H73tZfI7XJPhTgaf6eA/SRelnZ9tpgLr4hs24rJexaU10va0h74pWBN19pMDTrv3k4d0vmE9TmPIfYxrZ1ry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcUIaqcw; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso2507467e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931094; x=1733535894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4ChnpSI8rQpGaKLPT4prgKqYz0wE7uQJXmY4boADvg=;
        b=hcUIaqcw/04zbRBjSZ8a1MB9sH6t02B0m5n00h19+bTHxEJ4YkUAJyQ1sVXKdikR3O
         aeLmDoztP8RiVgUI2AvPymTCdk2MdsFtf3cXrDxpPegjbJATv4TkySM4ZSK55eGTc4v9
         +2gKteIGkG7X9k391cwmv8ka/1403VKncEaIOXaI4SrKsYTVug2iGdJRU47maBh9Zsf+
         WfWa7/NQIQtODnAqxDImkYTd0b1hjLZldDo8OQ4Nwz8TMQsopRrNd8qmZGf4Bbd6M5IQ
         BmR3jP0yG1BouDiTzKBm+9dntn4yKMRdF9jntPTCidBrAvjzK3VidvatiI7D3YyOOTSs
         bXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931094; x=1733535894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4ChnpSI8rQpGaKLPT4prgKqYz0wE7uQJXmY4boADvg=;
        b=UA8CsDMpXV0in5unMwVsWWhxKR1EuLw5iQC4zLHpvZvC4f8uYvLpLUPAzmmZKIuHVK
         wCV1A9hXwIrDA6zYyJT/37h6oaft9KWR+jXcZrKOEAX44WrgL5QkvtxG8Az0stMpUU/g
         FfFC6jw6779x7sLE812ZJ2vB94W0AXm69ZNzRIBOE8o4T704Q6UiMFQF7UGSpMmfFLHH
         lqieTClcwLBbOWydlDjPJZ47tFv4oRTFAsRe9FDW5OJF32PqiayL2Tj+47DdyNDs17tZ
         B01ylfkep/e/LTHSklkBs7Mw1m36CNjYuht7RaQJipHN4jUUMvN4Ca9L6O0IXMqFtlo2
         YfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJbGGDkYRlvMiQBc6X5Dq2MvvOcTE3T216Cxlo8IeWQq7CMA6MjsSEykf7cj/JDIN8MQZgbKXgv9KzGRly@vger.kernel.org
X-Gm-Message-State: AOJu0YzIMoImA5kEdDooPyrfndBH6LV4suWe3/r6Bjp8+ouT0UHL0+aw
	+ptd2rEWaLfrHKAxtdeLLROIsr6hLqkDFmVxLRDk9D8iflOTfZZQ5jOWrKB6BKw=
X-Gm-Gg: ASbGncvBwU15oHJyNbkHMbY/OOUl1m3kvqv73Qz1ZTdiIF1XtZa6ckdjXETYOL6RYgV
	NarGMUYTg+EX+JO+n1RVyFTYGccEC5STbvsMdrltMG1CrDUT9DXOP5UQAy/DNTdtkELEl974Wzl
	FlmWVyTpaWiVD1vVDgCwGtkUCWqkyUQ7xX9x/CnDgW7ryHvzbsox1jQ/Pa0iQ8jS48oStSw2kWl
	D9CBrElvc9iKuQlxW0Tx+gcZDVoYDvIKUMqjAzNPa3Sn2+Jf+gp4GQImg==
X-Google-Smtp-Source: AGHT+IEFf1xsL12jwu28gmLmBmw8ROzxlpNzpCXVOjJeUtDWpNYIS6/wo9wBUy929SPhr5gXTTkJDQ==
X-Received: by 2002:a05:6512:ac7:b0:53d:e50a:7032 with SMTP id 2adb3069b0e04-53df00ff78amr8025047e87.44.1732931094137;
        Fri, 29 Nov 2024 17:44:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:44:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:23 +0200
Subject: [PATCH v2 11/31] arm64: dts: qcom: sm6125: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-11-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=q3UE0E2mDZCC929aI9do16YaC9c3UMVZhi0tXk/GPcs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm30wZw1UBZsPTjf9xNdqvcaOd9XA8j7YB7bR
 oxw1NHD9lKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9AAKCRCLPIo+Aiko
 1TV6B/kB8sg3FuiJJxDK8ulc0P4XwZf6YfrWFQfF2PkODvBX5FwGdrS/It0JBMHAbbbhWYSo8lS
 ya5FFkeQ2ixl/GZLih1jNIilAwUOy4HKdkAdJVyBSoa2YFzgDQ6o+ugPdf1am+IxAoya4PYAVme
 NHEQ6hSOsun3Xz6vD1tBRTUhPYT+yvgFdHxexqM/ncm2dLe66LhiePOxav49zyI7I3hgI7i8D2S
 hCqudhtGq/dr+Aco20746ZDK9zy2hshwcMFfynXf8zmjaaa/Hc8fswHtKvgZBLLQVdnsXQpJTC5
 BxWIqP9VSdcBMtAcxTPgP/q6LNFiOUluVJy/8SRlC7z6Neor
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SM6125 platform uses PM6125 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 17d528d639343b9d649167d231aad3aa63474435..f3f207dcac84fa2f72fa9222c26ab3d7fe8813b2 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -28,7 +28,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			clock-output-names = "sleep_clk";
 		};
 	};

-- 
2.39.5


