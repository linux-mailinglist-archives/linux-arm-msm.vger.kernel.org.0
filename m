Return-Path: <linux-arm-msm+bounces-23290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 190F290F818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B99B41F21FFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1459D15ADB0;
	Wed, 19 Jun 2024 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="VO0W1bOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891115A845;
	Wed, 19 Jun 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830989; cv=none; b=FINZdNVJI4Hr++x7BaiO0wshThBpJv7GK51g+TJkTTklnC7L+YnP9F69pIUYKtKTB+fGgjrkLKKFlhmCuJFUOl9gX1j8LYs0ADIBnjQLetR/RHemsc13UCq62YBPOvXWF+frdUcSt0HigHWIQ6xTTjSqVIouFHs+bcbkAoQW3fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830989; c=relaxed/simple;
	bh=yQBW8z4axysHiGN+e7i8nXPi1UBkcEmQK0mdRQbQ40Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIPDSelBvVKF+zozRu60vA7zd0JTCuK4/mq2SH+s7ua+oNs3/1ZYw82k7q8I2VofYKtP/ZUZrihaIXnh4RiGTDu+tPTvFxQuY/AXVoyTX4KX2QvqOqWhSXbNerI//QPmzdxMeB1b37HPzO8ayMXxPlQdvYSamkftz5xauRCk2os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=VO0W1bOY; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830985; bh=yQBW8z4axysHiGN+e7i8nXPi1UBkcEmQK0mdRQbQ40Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VO0W1bOYD4LKSXAnWaxjnNtauATSOP6y4Nhuk45OsHAXKWxoTWGIGsh4iM7ri4x6A
	 Z8K46knseGue4T498sGUiRW2jdt13F+IGi/7tRTAa3W6gNsKl4oZsuSvbE33cX5rRN
	 aRO6IkhXunAHob6gTm8iblN9DWzkICM/MHQHDVcU=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:45 +0200
Subject: [PATCH 1/7] dt-bindings: mailbox: qcom: add compatible for MSM8226
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-1-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=yQBW8z4axysHiGN+e7i8nXPi1UBkcEmQK0mdRQbQ40Q=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eCyg0B9hONg1K6PiEtWtpKJoZsDpD7XEbtb
 d1l08wZ8K+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHggAKCRBy2EO4nU3X
 Vq40D/9fnWO1r3tYievE0u6euDNtlgexLtRgFSxWJ2hDxy/uurgYUjeQaXml5MvTuulLBhGh4vN
 Jt+wh4Py3cexJO5YZbBeVLiGU341CR8Nb8Ik2Gn8VONx9mfX1sRLFR5PKw+e0eIqQsRsrkB0REm
 YuesaHcN4CDXgdkK1tCMyiHfG58tsWTxJDatJ2tRCtlxy78oLD/WwOtmkGkHYztJ3YVU/Hly8C9
 6vqQpyqlXq/Kjs0zCdHw87ohx/Q0IANDgNLFSU4ZgdMqC5GMNQa9oajM1WZR9SzGSP+4OxPpPAq
 Wa49RVYaM0PTC1ZfFM5PIYx9q0m/6DdAkW/OB7xcHONqrpBMxIwFpNksICslafDCkWf1vO4pIbv
 MqiiJrUMs9+8xRnuiLvAif2E6xzlu5jtlFRuhXhA8sLOxhaPr21a/EcDvCTOtXunnzrY/Z8ygLR
 8BwpCUNzkh/yhMcpm3ks0bTtIrOYJGdNtv6NtP7dB7PjPc/K4M56kGELQTu7dSZ2vS8++AVxtYC
 2CD9pC3RVpm/KOmxkR1f4LefltepFPY6klgo4G6+9dvk0aWy5NJH9u3B3Fu3JRUACcdbI57YM9W
 GbJ94bE2RDu8M4xgvub5eCYb+bdTCcm5f+bUAM1jdXb06tXJMa4vu721eRCSSYsoeJB5kzjEr4u
 sVYHxCDw12nGNFQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add the mailbox compatible for MSM8226 SoC.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 982c741e6225..dc75ea2383f1 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -25,6 +25,7 @@ properties:
           - const: qcom,ipq6018-apcs-apps-global
       - items:
           - enum:
+              - qcom,msm8226-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
           - const: qcom,msm8916-apcs-kpss-global
           - const: syscon

-- 
2.45.2


