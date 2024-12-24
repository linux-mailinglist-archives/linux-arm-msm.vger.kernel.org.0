Return-Path: <linux-arm-msm+bounces-43231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2F9FBC45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 169B9162530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03A81D89E5;
	Tue, 24 Dec 2024 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vutb31zj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171CC1D86DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035452; cv=none; b=NP9lhSQ1tqqLCrxD/JfaENZorzjsP1AZyIHqpCbOROsBwFBgmq9VpIU9kZIyfh4YaEAXvSFMZjhWpdIy1CNeHTJ5W0VhjpFc+Ylp2xa4Iw42CBN5c32zPPVzOFUaK8/YLjyJCg3pj/ol2Tws3/8dnK9PxZFhiX6PTmo3T//vXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035452; c=relaxed/simple;
	bh=cwHGT8dW2fufdVjeg8a7nAT+ERCmV5CuNqJS2eXbLFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1xvlFBZMDL8OUOCEf9iZch0Twd7tgwl2tHM/YiZ0EYORqDkhq8U6+g5nKiaU0+T+s4rxumrRjzQQP8s47f0qIsQBBiBhluhUCf5CmCs9NFQ0QtWD/KbqJZ99j+ymCNn2SYgZnoI9XzvVHI0t36N1mFNE97pKWaxUpCYyb2/mGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vutb31zj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e384e3481so4629819e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035449; x=1735640249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUBAhw6SG3dsXPAFEzT6mizjETu8TuHeYIqS7qX2o8o=;
        b=Vutb31zjqIIGou9JFl71PpSx+rwW2iBoNLvmSNTJS4QIdy5peZvZHAsWWqJ6mK1BIl
         +XudENElgQMkPvjLjpm1aNGnP2V8CJ0IsN9qmFO3pID/iY0mAO72pgqaiTapeFhGWw4C
         FAZu/3FLRs7IRDFbnzHOFmNSVSa8cI92rIw0iy/HE7nHTUOEX6JVfuJ9s82neZ15niYr
         BP+b4oGAK4pbf7AUBmZ8eIo17pWt4QuLvY+kkcouEpBkkXdCRKLTGjwy+/X11+mV1Ucs
         lvlTAJLXOZew8KK0eylKcxLJBrK+d1RVwQlnh7UriOD7CnwQObV2RiDk/fTvI1L3Nnvf
         j+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035449; x=1735640249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUBAhw6SG3dsXPAFEzT6mizjETu8TuHeYIqS7qX2o8o=;
        b=eNGz1x7W1i6wQPEcPWoyif2M1zv1rozZwk8M7+7Ngib8O9DuLlZc4rfMij07WG6uoT
         TUD4tmoVtro6CbGYbaztC+V7mC9GwSX194h2KXh9sw3w4Z+jP0+2Npn+GCZqBBa4A+qk
         m940m6Cw74zyovP0QvgBfAn2YcGvj7uHGD561KnxTZhAVeI7KTeKhnnWdxtbbzJcZC6u
         YcL8uFE7w5MiIknMTWq+9mDnjc98uTkofd+50va1KXpFCbDs2/RtziVsdTqsQVBhWZq/
         3kyNdSgLrBPVPPuxptkGzXWzO2VR2b/y4ZqPJ76WPdaNe45QkD6mGXAt/LCyUuRitSB5
         OdqA==
X-Forwarded-Encrypted: i=1; AJvYcCWFeyyMD9RlSTOCAR+O5FLFsIKGZmr+NfpzvzEQjDcJa2kx7Ut4eIui0QNDqZyIqiRzbeB5jo9Qs6FzZPzb@vger.kernel.org
X-Gm-Message-State: AOJu0YxutjhVnXco3u5+qGFeEEEJEJZ85fhdDcv1TnvFS3HqC0/C8EDF
	Sspi2AHYgwIzr6U1ih3g2BrB3ENCe8cLRg731v2Y10RJ3I2toLLQIXWvtWOI8dA=
X-Gm-Gg: ASbGncsMSK2Fa6zJiVOLKoXkjmleid+JUnv8sFEZSCxbYM6azMl3ffAqTICx7YsOagj
	vLCrwFYXfG5Bke2Bq0x0h4yXmXCEtpgzXGtj2625g8L9/B44ILqa52KiErmonKTndsX7ygxHKft
	icxrINiApkwTzOTzE5D0Isl3TKBA+mLhOnNRW7+iHqXgj+LvvElMZiOv4zOwtSsw07aq4O6Dsvg
	QEoak0kFPGNgaikppqpyBLltwuA6GZk8ytCoyh7QOtQFGpNLRr23zKAd4Ijmwbr
X-Google-Smtp-Source: AGHT+IG1vEFCzs2j7JdubfLwVTBndShfFsQSSbdq63reeHK1nx8ohnxn9oJCDky9+ZzTeX5yQJ3r4A==
X-Received: by 2002:a05:6512:1149:b0:542:1b6b:1e89 with SMTP id 2adb3069b0e04-54229525408mr4584494e87.7.1735035449429;
        Tue, 24 Dec 2024 02:17:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:07 +0200
Subject: [PATCH v3 08/21] arm64: dts: qcom: sc7280: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-8-e9b08fbeadd3@linaro.org>
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
 bh=cwHGT8dW2fufdVjeg8a7nAT+ERCmV5CuNqJS2eXbLFY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaoohcejC0Gu9WRhXVQyWuYKALbscr5UzIWu2u
 sC62DiLymGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2qKIQAKCRCLPIo+Aiko
 1WJ2B/97jXYhWoXtKYMLcFjuNVqxe9zbyRK9JLpmzKHwkZPUc3NF/1XtyOKP4gc+9x3zHWpA95R
 XHHw7Z6/ObFTVWErTGdDzWxmOCf3cixZv9IYfcAlgrGHAs9nEBb1l9Piq10n0qYw9On/PxB+1cj
 EdCKFabvZ9ca+poeBWzsmW1sZizK0ZqG3gXoFmybD9jBux7pTMhTrlkcrEgelrDAevJWKxyp0iF
 oZumsxkG0uerUXRpCqcFJE+NN+6qka8yHVSetFw9ymKLD4hqLexlVhuvIYmcFdpJucKgeHphW2w
 eORNYSJLh73EoSDGBlKQc5ij8LnzaFBoxad4zM8BSlmZqRph
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SC7280 platform uses PMK8350 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: 7a1f4e7f740d ("arm64: dts: qcom: sc7280: Add basic dts/dtsi files for sc7280 soc")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 55db1c83ef5517f82504816baeee583695065225..d12e0a63fd087461a33622e8771422c8acfdbc25 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -83,7 +83,7 @@ xo_board: xo-board {
 
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32764>;
 			#clock-cells = <0>;
 		};
 	};

-- 
2.39.5


