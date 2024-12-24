Return-Path: <linux-arm-msm+bounces-43241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2529FBC59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7B8188C131
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1551DE4D3;
	Tue, 24 Dec 2024 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaYKf+oI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A261DE3D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035479; cv=none; b=sj6tfvOcM3tmmgRArj3l+SehTqkXuU9Arx7vYQVvjXKt41+P+9SihByBclZ/m2KYx7G/YzkqDy7Fcbke16CLHOA97maOyYTjz4Z6F5TYsTvBwiEsDcDv7X5T8Fb/ywz5QHPav/uWbsmBccASxLaN9wkEMuIeWPrjl55BNN5Uerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035479; c=relaxed/simple;
	bh=kWQwXDlbilsYXfDRPCbFZMxqzihzbNYaTbZjWDNNvZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPYPfqDXhQMPJR1bdwg5GoMgNAj6GpzhIp+QDuL9e7W9np33nSsrqe5WnBvwLLtbnjuvu6jMYdUfOrhZQ87sRRH9mTfMwEjzaX9S6p9RLW5fGGhNNZqOS07ZXFTFWrVVSLAxCrbdsZFas6Ee+FLAtTw7YyQEMo3qvw6h8/iXcz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaYKf+oI; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3c47434eso5449584e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035475; x=1735640275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9aOYi846ctHk/n1KmFCWB3HQZO0oFlbEq3DCWf7dCw=;
        b=CaYKf+oIVLid4fV3gy7LcpyCBA/9npn/xi1/+Xc0vaQ1xRoLMQ8mXQAQ6ggkqWkVYy
         DIYw5Mu86ko3DsIklI6yycjTzBIBCkb0uAIY5b0AbQcfXM1mZ+wq4tSYQBVy68jVa49P
         jDma2Alra+PGrrTc12bgsRMzQFUugA05/zJUKVCQNNIO0mZqum8KiUaOdAPDO2CNiJ1c
         q0oVHws1Vugcq8nIibOMB3nmrYW/eURSg8EllYEvX4fKsJUxWRCKo9H+7i3BUjUTvNvw
         X/ybKZ9jzc+eOeemtkZ0AIPR+nOJxqg53ymmrbUcAhKwfu5UjvUGORupmBmOGpTuK3R9
         jUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035475; x=1735640275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9aOYi846ctHk/n1KmFCWB3HQZO0oFlbEq3DCWf7dCw=;
        b=MwVKFM3y+fvvSvEEEpWGwUz36uw02Xq8p+diQ93PPweKrROS8ad+OWj8NVvN01Ojs0
         GtQNT7YYEVNUUhuYLN+nmg38mmf5qfoQX8cKw2yDx/CJXREjjOZHQEy4D3KX7lB5KdgU
         Nu7zx+T0g1Hi4bbWPEzhoQPqgGDYKGY5Qf1YHsPV/kNoFMkVWn/eNU6pN0WBKost3WKi
         5qmm08mt72SNpiz6lQhtJcGvbesrirlnDVYsI53zcqyqd7wEIWy2gabcsMYNCNqY8XPl
         SEPjIOnunO/zcAGu8zqComJwUGzjozOXyY2KsVgcb2Da9v0RdLcmPmZzaxuSzP/pQc1x
         6yBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/DyQx24RZx8ACMrsct+mqxvOWpNIreFBoI0/YwK1aXnt2Ssl1xyugmnY3num79B5NpaqYfjPh1B/nttmU@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1RPlXpJcuf9csR3dlOydSRYOAL4haY4YGEwcPBYZi0iQzQWv
	nRuGj90tXeY3Ck3grrb0829lpYZcfQZ648MOiU7D7Wyvoau/b5hc0nBaeqd+FaM=
X-Gm-Gg: ASbGncsXOX9mdcUSgLPVy75hh9alNqyTQCKlMIcqCi461T+N5SrD74BGvLpa5s4cr6J
	235FIHSm6wNl7fELor0EAeqva0n0AOvQ4x0nSNgkk2Oa63dTVXg/LccmnxWdI+z6T74l/KdaOYd
	aMPKSE5oWF5zw7UyoOUfOz4qcd/oCMchcbK6eh64b4NU1wGcZ7QuyqCPyD3ASOTjsb1w4+/NaIs
	iY9PRT92UkVyYNZSmuvrE+mSsKlUQf7/zlDags+8dfYcFoZKsQXG+WJ7mPSejY5
X-Google-Smtp-Source: AGHT+IENulqom78bKGL1j59J71t4OHm8EkLO5hzYAgNmYJC0Qf2w0OFdb+O5XnT65a3TQ0/jXedh+A==
X-Received: by 2002:a05:6512:1149:b0:542:1b6b:1e89 with SMTP id 2adb3069b0e04-54229525408mr4584789e87.7.1735035474843;
        Tue, 24 Dec 2024 02:17:54 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:17 +0200
Subject: [PATCH v3 18/21] arm64: dts: qcom: x1e80100: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-18-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kWQwXDlbilsYXfDRPCbFZMxqzihzbNYaTbZjWDNNvZM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoojuGj4t4y9jz9TfDC1k/UctVHH2b1IkH6tp
 BapJmLDrvWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIwAKCRCLPIo+Aiko
 1SKaB/0RrC19Nze0nL1jW+BMlXZ0c/AFqzNPuvga5fKWCPm9xIP+yhPL5doAPawCS621faj6q1z
 E4/UTs1rFnh7kU/TesQupFSZU3FD/VLjbXUU4Q0AUm1o8ZgQX39pSCkTGoByPWM6bfwb7ns26kt
 9+PgHQ9bEB/HG4HxGbu/H88E+yWj6GDd0ixoCbdyEjaWVVapwcDzYfF5+vwLGIKzlDmtGX47wP/
 FZ587VYL3rXrPzMf162S4YSTFiCFcdskFOJIt8HPCHypsKyfRxY7VkhpZ+ZCEoVL91/hS6RMfaS
 f4iLi+pxD+tl4mRVsyo0Sqb6fD+qqqdj9bIjYo03/gQ/klY8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The X1E80100 platform uses PMK8550 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f25e2d3af4a40125360831367830cb3d217883cf..bbc2bb2e9b9b3b5bd22b35a4fca085bfe2965d4a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -38,7 +38,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 

-- 
2.39.5


