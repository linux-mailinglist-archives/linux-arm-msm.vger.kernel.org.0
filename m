Return-Path: <linux-arm-msm+bounces-43226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49F9FBC23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82151188775A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3D11BEF8D;
	Tue, 24 Dec 2024 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGac0H/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B791BD014
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035440; cv=none; b=TP8KhefIl9TqS3k3sey3NIoJjS44h6pBdmYHd+WLn9rXSOXoGDR0NP0TfFSx2CQW7TIOYn+BA90H9JEM4k/e7adYWgpcdvE2oSZE40mwUEo8BvH72fFgJ0dB39WFZ6Dlxi9fRH3/F9p53/EqWnqd7eovMcGOKF9nnXQm9YRlq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035440; c=relaxed/simple;
	bh=ICsKkpn5EvTWejmupXrRW9hTH7/us+kf6N9oJ7E9bww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qconos5jkyKicbZMMlwAeolWw68UIFYvBFeQjhf2Cg3LeY7HYsyzMnePbAUXRSMWhYDzskgmq8Y19iDtNOj2LDADAf/+/hFWgC0fFPN+UpBK3PtRMeeyVkQ3mY3Zcv3xRkHZMBOsycn0mIgsOaGiipb/AdnHs/ddHjIhS12U+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGac0H/Y; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so5343808e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035437; x=1735640237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQd/2FVmAl0Cmw9f2Bljw/aTs9lMiBL9KUoFa8xK7FU=;
        b=kGac0H/YxgpCOobq3V5IBZmDtBXOvIjl65eOs1c+wC6V6GbGJC0XT/mpPtPYgJHEJS
         EctGyFU4d7NZccPiuB1VUCngmcxos103TZYt0YqZ+Y/whzFcnXjGsyp8/XnMDNbVmgPp
         qRMfzvPHjWfL65GxbQL5jZ9SEMTsZ3IlPVy7NiaAVaPMcRl9AQM+e9pHo2ZL8iU+lAJt
         /EunXagT6C6VFj5QNGsDchY/5eTdGVXo06GIaePnGCfhwzj+RoLdBegl0jslKbnB0JwG
         N6ER7Ud2fEZR3AQE+ubANqpWh/HgvegdnYcFdJHHt1vhIbMUwWN9MEmnyMfKS+O3BTwI
         rEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035437; x=1735640237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQd/2FVmAl0Cmw9f2Bljw/aTs9lMiBL9KUoFa8xK7FU=;
        b=Qt38+GpzZDE5yiygr3g6s6uhyxyMmWrhZaS2RUU/3TOT6H/YOkjfdA30z6R9aulVe/
         8aV+eViWeM7xPEBGIQGFswiMpZpYFDUpWNDh6VLbi5c4RxM95DHvheYlGxI+6wpPyJXe
         X35+xboN+yvgUPFtb7pGuD0LaxSJIhYxmCWPML/ADLp5p2heOenUsUOdt40fpHs5/FrM
         vR4TOXXoBwhVKW6iDd3ayOFYhkUPwYCU3D0PT5NRgomITccQE3RiGyOggL3gppi61q/h
         ADQNR4S6oHkH7KsKy8PAjNnPO3SQA4YA3gEC1yAfESJcU92ZcycsJ7LOixOSw/yy1Kyl
         FmNw==
X-Forwarded-Encrypted: i=1; AJvYcCVhjRQQR14Eo825IDSY5orlaw9w9HpMwUuX+ndD1sJE1wEOWonW6IuEW20sIF+9oZncxvuB07CQNLIXjkd6@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMnQUzREGnl+1aPftTcJ3i9u5KlaOzEtrTWr/fYvDf7eaPp11
	OJ9O2Hz0z1WIQ30u9/MkeAo5ScdB//lR0yXctOq3vFBauhC+z/e2lKhdinuirEI=
X-Gm-Gg: ASbGncuddeIeMG3qLKxbeQQhiXbJClONBxCzIb/v7t2EWw3iXrraGAJ43cghOTdnIk6
	tWoM0ZiYyhBtXImIVvYOmK6E5T2XeMEzFbFeuHUCiqCt2SP0AePIi30glEz/R6PeB3rbo63Zxd8
	I34PxxVDr3qXf+GAPTDWn9adxvdKbt7KWGp6MlXyCXasLMC4jsYz3OKEjCO0ztr49Tfdh2ibnvY
	Kr9BsW+IxqooyOi/xD0IOXWK0NgzYqwbmlbBZkE/NpoU2W4/11NkBCcLdWIjriA
X-Google-Smtp-Source: AGHT+IF3JElfx0Js9eyuyq/KBUyzV3PAYcl1YFx7lfm4Gxnh/ukKis1zasNKglwjkK2HZvNUo+G2Lw==
X-Received: by 2002:a05:6512:15a2:b0:540:2160:1f80 with SMTP id 2adb3069b0e04-54229562a39mr4172808e87.40.1735035436982;
        Tue, 24 Dec 2024 02:17:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:02 +0200
Subject: [PATCH v3 03/21] arm64: dts: qcom: msm8994: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-3-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=956;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ICsKkpn5EvTWejmupXrRW9hTH7/us+kf6N9oJ7E9bww=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pWl4J3nmLoJ4HnhfW2afc9PwdlpBzKO9f0SIJrAm9qw
 M2OoNudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiI4Bf2v3I738lNyGMuM67M
 cTV2na1cZLLNi2X51e7GWM+VPz/ysB3jSJbZZFpSf0BgmsLyP67yRXx+0iuT+37n87yOVvp550q
 rRqSjip8+n9OWrJVCtw3O35m8i+2ZfEqY5c7/0m7rFfU72ELvWF6yfCB2JfWZC5te3M3D3hr3Ns
 fMk3ny5fqdRKlrM9UeXi7ZOkvP9MDUoLgzpl1zbwWUpfNbsk52akr9y3JIK+/3+uvVAXv7H+Yu3
 T5LQPfD9fVv/l+8PMFzp2XB+dOvbfc4XpTiq+Tx/nwhe8n5wqLiC81/NeKeZbjkqWUt+Pb7qXVV
 aCRvpKhgzO6u8N2RRv837N57K9i5QyFd8cHEgL6tZfU3AQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8994 platform uses PM8994/6 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 1acb0f159511996db07bc7543cf4f194a4ebd0fa..e6c6582ce1eab5bb6831d3458861d0d68c056316 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -34,7 +34,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32768>;
+			clock-frequency = <32764>;
 			clock-output-names = "sleep_clk";
 		};
 	};

-- 
2.39.5


