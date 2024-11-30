Return-Path: <linux-arm-msm+bounces-39645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B069DEE03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84531281C90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4824D70817;
	Sat, 30 Nov 2024 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQgIGX7J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF15588B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931073; cv=none; b=urvJFjxnFofHbuh/1NYCOnET06C8FUoAQpc8kl1YlAkWtbysOP5W8XwwknRTKC399m7XndU+EwL7h4dwKa/sJMiq1D9uypjaWEA5BdwjebZw4OkgkSlrTEqx5rxUab4xFQdX2X2uMlGrxlFTqpoUNgu7snyBXyPYzW9j1KS1/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931073; c=relaxed/simple;
	bh=RRNUGJhydbP97WLehq1T9w+y0AXTLiZzoSCdrYYWsLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWbx2Di2gZczdBXU5nNx2n8B53qWKyR8wAI8ovDxosKmtBEmRvz3PSAfaR+TiKIilWg2bTcua7oGHLGdw8Y2reJ6sYlzScPwfqIyNbIuXG+6WX1aKAiUBRGj6A5YL/ukqP5JtKuoM9l9FnEz9XxvSEry+LD0AjVadh4tZIOabII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQgIGX7J; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd668c5easo2530084e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931069; x=1733535869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epR874hobbwB7Q3STH+BJThMFI2d8KsVV/Va6kd5V5w=;
        b=dQgIGX7Ja5ZCMmQYn/UKYN/L+XWNja2BLWpp8OOkr93FgpX61/APj9bXtYe/1u3Uf8
         cr5XA7EZ4o/EnYoVGtRx2/JZ4+UhpxnKzinpliu5uPb2NvYmVPctyCaj6QW5Uskj8vAL
         6QT+E8lJo4v6vfgs0BPm/U04BltHrhTW7zGyfZZ66xZ22vZuBz5pBvicH2kz1BYZqZ6I
         nBJ3HHL0wj/gBsmumdYbZmUI/PN7OP5ceqLQpEKrbUxPUA7DtRo20L8hlHMu8lEwTxWn
         EvM+TIpryd87nRVyiph4mlOzEua8uTWxVanc4wfQ3rKM+IVTgz4zVg7tpwIz1ZFpL7pQ
         gy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931069; x=1733535869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epR874hobbwB7Q3STH+BJThMFI2d8KsVV/Va6kd5V5w=;
        b=SK6P+70EX6S+3cIzBfbUMWk/QY1AiIrDhAQF0WL5o/QTuKTMvFgBJal1s0CrpNcgmX
         vtf1EZMAptuI7wFrCzjyb5I66cEEwJtPyJRI12qDa1QoBgUsUFOVFqIvolfJKJ+nJd/P
         RCUXAg54/ZMlby6LEwHha0EaVdu2kS06MjtEK8jQ6w8A+j1jX2K9xSq8bOxbyPb40D0P
         bEUkC/WL8O37kNVzbckGm7jm9uedpPqJ/LHmIQE8mXGdla6mmDSrh0dfvEV0iadIvOFe
         D511PY5ngtEmzrIOTBzAOPbpa0QweqCX2WMJVDehQzfJnLEKjCqBOE/SsO/BvRsMTtAr
         LLaA==
X-Forwarded-Encrypted: i=1; AJvYcCW66AxV4sJFJWuxPECilrXMBeTFaFh1ohxYKfZrVLXyjB+bLTeVii01PwJnp1RHEpFycIzcbKkRWA6QLOm1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4c19RNksBJ38EsdjJkhEISLEK8PjoimwcmmMdDIKsdRtVFVVP
	iij2VLUHx9h57nAeyXiNpHpnRG3wUxonROAX4VL2Z8vhFIc7IMGXRssRNr/72l4=
X-Gm-Gg: ASbGncuJ9/OoQhH8c8Vrn1OSGHrHwXWqB6lPdq5FKGIctp0kzhJgYIdZYFc/5Wjw/8F
	P1dn63l0JQFbWR2/SJnKo6tvsG6KKFKh5rbIOgM4TjFvdPJT7pbqg9+JmjuZP2bJzcKQluXXbv9
	oO3uXc7bIVW+MIeeYfCa/AS02mnzK0mEmJOpiUClEByXUkFsybLQbvDvnFJIxAWfPA/yt1BMTlk
	4O9O067ZWhLgAr/Qkk15auHCJeJovbTM7ggAas1wSQrXk/luasP1LzeDw==
X-Google-Smtp-Source: AGHT+IEWpKMUmLK++Wh7HnEPgRrHYZ5S9gc+8yhi4nMvcHtj0hHeJIA006FZxSetGhGCfh+UN9H0jg==
X-Received: by 2002:a05:6512:108e:b0:53d:f84e:ca1f with SMTP id 2adb3069b0e04-53df84ecae5mr2675045e87.15.1732931069294;
        Fri, 29 Nov 2024 17:44:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:44:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:13 +0200
Subject: [PATCH v2 01/31] arm64: dts: qcom: msm8916: correct sleep clock
 frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-1-b9a35858657e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RRNUGJhydbP97WLehq1T9w+y0AXTLiZzoSCdrYYWsLQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm3y8sGkg4cbFhbievKqVk4IBQYf7oTigPWWd
 GC3yaD7idCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt8gAKCRCLPIo+Aiko
 1cYnB/4nCxLTczH3plii1y5u6b2Agwm/84QIJwC2w1M5TaC5NKjGEZ3MrXI1c3qTlpx751Xu5rg
 xphBhbwii3Zr/O4Isu/Qe6K3lmd9HN25m/9KmOEkdfbwx46/f5DycqoGvYBdJTjm1ODsEuPfuki
 UhU/PPkssXLvIBnCNHuYHO7delXV1Myi61/cm8SQQio8yzsE41zl6bNedQt/JhfhZiuRMZcJAfv
 cUsx69r0UmBA/7ZY+niAKenCpqoJ+KMiznDJLxMbgMt1vMbB3ccIM6REglmFTxJvcUo2KFfiZFp
 AR2eQiA7/wuoesJTfjiVo6iX3gPwzqJUUX4zjZWWSieoAcD5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8916 platform uses PM8916 to provide sleep clock. According to the
documentation, that clock has 32.7645 kHz frequency. Correct the sleep
clock definition.

Fixes: f4fb6aeafaaa ("arm64: dts: qcom: msm8916: Add fixed rate on-board oscillators")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5e558bcc9d87893486352e5e211f131d4a1f67e5..8f35c9af18782aa1da7089988692e6588c4b7c5d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -125,7 +125,7 @@ xo_board: xo-board {
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
-			clock-frequency = <32768>;
+			clock-frequency = <32764>;
 		};
 	};
 

-- 
2.39.5


