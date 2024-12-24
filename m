Return-Path: <linux-arm-msm+bounces-43242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF39FBC66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 11:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD30168420
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45C81DE892;
	Tue, 24 Dec 2024 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zB56wcTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254F1DE4F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 10:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735035480; cv=none; b=NN+SXd/tlCUXWNgbpORMHgjynQ/E6nnZBCXHNF+pMREYpNAlnVT2fjsre2jr49/VXnbAKyZzYXd0z1/tY0gogd4v1ciniyJpcupShky30OL/x+KHnTWnh/Fm1D66muAXzxDXeE8j4yPYi84Xm8JB1YWqgO08Jg0X/JMZsWn/+Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735035480; c=relaxed/simple;
	bh=LXX0tpGxrPC2kis2WoEdR7Ui3mOGhEj+zhg45SEX/Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBWHgZso2etWcmP7ameLqsGxPwrPeGi7oxuWiLi3bm1BEOyuhX5UURBR/WvQTtLqRvx/NGJQGMtGBvELyLr8XASnrEb1n80lLPn1r1t2FF1EfKFUX8ON0tWYSqN/1zcloC6fN0qzc+4zVXJWQhMZAP6A+B2oKTE57g2EVaPCfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zB56wcTe; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30229d5b22fso57135861fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 02:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735035477; x=1735640277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLx30k3oLtldvsgstuJQ+s3SGXKcYe7FaeB1beknjb8=;
        b=zB56wcTepvg4jWkRyno0KerVBxk60hit1JwgghwVhp0KKFuT4E+MTacf3VeI8suSVd
         n5eHHR8ziAKmhZ7ELlyzXXedtjlWVpdyFG5j5qQWSacz0cBR6EQfa4SKW6Dc7OvDzYiq
         lvW9CsIgXtLVX4cuTQmn3ZRu5XPpnNI7GwNesqm/GLZDofJQzfyfjChg/GNJAH0AunRZ
         LwML0GXqBI5D0ul8rFG6uPV06adQRUq5id+4GeiBr4N/JPjWOTWDjGstlFmZRiG0Ivdx
         vbHYwP3of02rLevUCT22ip0YiKQYy0oY+2zMmPvvB6ly50AYCRmfOZHZqgnTc5Jd2Uxg
         D4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735035477; x=1735640277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLx30k3oLtldvsgstuJQ+s3SGXKcYe7FaeB1beknjb8=;
        b=Cd28nfnnMoLDtXaVNRhH3NNVqWNMludAb1mNr8E3fylOmFmZkXu3YtDN/Xh0yxRXlL
         5pAbBhp8LfmbhbeHfOcWGuTr3rNkyFyVxlbtjQs+jbSjNk09Xh4NJ2bwJ1NRi9GXjkDb
         NPID79iLCecgile+/9Rp6bSFf+eZ6JovQeq5U6iqjjMNJh/GkKVbrXc2e683C21+VrAd
         mg86Vm3mpdrp/Q6qByke6LH4QITl5BeTvgPDP9lRBkjjZKgQD0NSeBAYLKiA5wP7Fraj
         0XjZZSMzqFB1ixnC63rUn4G6Y2sTvKLtczsnmEzGbTzYr4XFy7SZS0taEglyVeP9yPbX
         wjxA==
X-Forwarded-Encrypted: i=1; AJvYcCXWxv+iIQ31OYpJbazk9p2yZPN0Jzn3KgOtzlkmNQnpPCqhCtlozKmaiZjmuZ0BK3KY52WMA+d6k/DkV7Ha@vger.kernel.org
X-Gm-Message-State: AOJu0YxFwrs62nJJ7liK5yRk6iG8U/mrYqa1Y9EBFgJeI2p/heghEllP
	zJXvz2qpv4Oa4yLEa49D7dW312IdCXibhwOsz+9ucfoVnEQUAZWfxZH392Ernl8=
X-Gm-Gg: ASbGncvTwlPbNCK+YDn5cGVjiS4rdOZ7Hn+qHhVX7sTaLnZUWiPzeqCtevf+kbkD+ZO
	APpbI+fJwIRZX2WamnzCHQHZFaq0tVjlUlWLBXt8NLKWNoLm38rPLQrPRgsFF8sH0NZiASJhTFb
	cluJihsnJLjh83FeovaWrDBUu4HqOZdUcVNBnKZzKaaD2RQ+osUXgRUI4xMN8ITi1887lQbUgZO
	hu2RGoMGvMOqXyBZIx4AbZNkwZIxFGY0i2aTnOikouFpll1ba17LQxjRxziDX8F
X-Google-Smtp-Source: AGHT+IF4jMu5LK8knuM36drolUujr011KJJJGtRK1uQFBpqucDFTROh/idVDBfKRkcx9S5pe+JC1XA==
X-Received: by 2002:a05:6512:a94:b0:542:2338:793f with SMTP id 2adb3069b0e04-5422959cb2emr5861122e87.54.1735035477310;
        Tue, 24 Dec 2024 02:17:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600596sm1576865e87.92.2024.12.24.02.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:17:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 12:17:18 +0200
Subject: [PATCH v3 19/21] arm64: dts: qcom: sc8180x: drop extra XO clock
 frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-fix-board-clocks-v3-19-e9b08fbeadd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LXX0tpGxrPC2kis2WoEdR7Ui3mOGhEj+zhg45SEX/Ao=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pWl7L9pxTvZXWM/yaYFRd/vRcQufZsHJNjlGihQVWl0
 bcDBfs7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARGWn2v5Jd3nalL3iMLGfs
 r+MP7XGebfR0i6ZO0cbt52Iyd3I8bN0UKs/R+kqvWfuZ96vWE3um75batPp8xXt9+1tBN2I/bTt
 1mT/WKFjvsQzfyftvlZbEyHW8WCHbku35RPigcG/Ru3jTO3ntF1v2ZvQGOq9a9OTmB5agbd171H
 JNfgV224nOfDx/8YxJN0xTRZueFpXenOvAsaPK4+XzFRkLHqQ28Co3Np2d4OGum15s8Jq/r/l/4
 LL8Lx1Km+uzBHdFcuQwin+7eOnGTe6j71o+pjXVTOptD6n6+Hr9u8N3kiJu9IgZh6ye9ThYYn+g
 R3D16/ydvlfXx0Ud3fW3QdiO/QBT4ulzZkL+8i4rQ0WlAQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

sc8180x.dtsi already defines 38.4 MHz clock frequency for the XO clock.
Drop duplicate overrides from Primus and Lenovo Flex 5G DT files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 4 ----
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 62de4774c556d3954a797287ba2ecb36d979dc9f..21c2d25a294506de41f6e8b7197be85c02d03568 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -681,10 +681,6 @@ &wifi {
 	status = "okay";
 };
 
-&xo_board_clk {
-	clock-frequency = <38400000>;
-};
-
 /* PINCTRL */
 
 &pmc8180c_gpios {
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 79b4d293ea1e70d68346e7c5458c94f7c2b6f1eb..7a4bd6955470338dd9c7a628c9f9a01de8b480ac 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -773,10 +773,6 @@ &wifi {
 	status = "okay";
 };
 
-&xo_board_clk {
-	clock-frequency = <38400000>;
-};
-
 /* PINCTRL */
 
 &pmc8180c_gpios {

-- 
2.39.5


