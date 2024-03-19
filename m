Return-Path: <linux-arm-msm+bounces-14554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824958801C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A722A1C22AC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815B785276;
	Tue, 19 Mar 2024 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lmIrkll9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BE84A54
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864836; cv=none; b=Rl3TcLysC9AlK5npQiGLueyZY4Mbds61KQ+x7zDv1UbWRAKscOPW05gjWvEU+4QoDKE7RcLPAlXM1fIPtOAe6Et2I4GPy/a+hHZLg0Lrl1H2mGINFUeX8ybrXVflyg6ALIstg2fcAdGxqsSlPMgLmqacahkysa+owtHfszPzXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864836; c=relaxed/simple;
	bh=lUckpy7ysAP8KSlLQaJ0KH/EmjxeXgdV5P+mSMqn7kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rq3RG+mNDBKEoWx7Zaj2cL8QFg52ayNGuCwc8Lp0HNp8NrRlS7421oERxRInI/4ZmFxgQilue9UcrmYR+JG3eiS5ZcDAONE3ItGm0k22aCfZ8T0wMQNSCy0mcodpp1Fpjx6GnkZYHm6k/AZpLKtvG2ZRuUPRWC0L/25Z3WR/Hms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lmIrkll9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-513dc99b709so5118577e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864833; x=1711469633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C35V0j48KRJzj+MbmIEByOb9R1hjafjYDuf4YisORVg=;
        b=lmIrkll92BA3wswdcG0/gUKpasl4bJ+ehYZjbPkMhsfTJ5ZRayh0AW6LhXkqu4Tgxs
         kBcR8JyD69GZGdQXwHAy04q3CisnhyUheesqPLtpqLVadthn5ANApKr0hIykw85NceG2
         PCJajswkGjIZ8aU5+IKNbGaHlekwOHXQ8tePClGdRgOIay74YFjpElI9hhMekPQHg2aD
         oTkhaUg0vHQwJRaZOw1JsXYYElbMrDeRXG6DIutzDRD6EVi15lL2l52g+C/+vJQDiA6s
         GG3Cw29e3C1Uy29gFoG8dkP42AnGnzXhBgZTCKeEqr+mNAmWlCdZolWaDMDTIkL+EKm9
         NBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864833; x=1711469633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C35V0j48KRJzj+MbmIEByOb9R1hjafjYDuf4YisORVg=;
        b=HrYw9+5T4OlKdSIOcu0rThFPtWYQIxULfkwjkcGA/EpOmJAn6bPUoBXSq19rBYSOgn
         UjSyDWXgqOn2Wl7u8HJlecLJ0Dd7cW5GjyiGxme/whq6cxBI77Qjf2GdB1XQTZbOAtef
         xYlFDyrOav54Zdx69n4Skj5bcaXMp4/Bvjj5vUoLkpe5rg+vMZkmbYKN2HomNPnp+evZ
         BBnD4wDnpI3Udh7LYtIo7lZOWLArP0iXTnEYaz3c7wxoZFeF9xjYJpblKur4JZgp5pq3
         DAIFtj2QGGbAWYOGqvNNoImryXu3crh9EupgkTbFEDpaUKhysvdgqABB6k0KpEXNgfUJ
         FrwQ==
X-Gm-Message-State: AOJu0Yxy166Jtv/rNQMjjUQkOmw7YI+7tJQ4RffhZwI0rfEZtAYPSH4v
	XJKVkCDuXiB+QFRciyhH/d/109VVjeN8eoCCHaQd2JouRFJpPJ8ci7XLmfd+Ofo=
X-Google-Smtp-Source: AGHT+IHzUqhQVgP9CzXIlbPiGEwMEgfHjaWnAeko5lQYNQHKMT93kosdcJ3OoRKmZUqkU4cVkSG5ew==
X-Received: by 2002:a19:914d:0:b0:515:852c:ed8d with SMTP id y13-20020a19914d000000b00515852ced8dmr989361lfj.25.1710864832848;
        Tue, 19 Mar 2024 09:13:52 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:52 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:44 +0100
Subject: [PATCH 14/31] arm64: dts: qcom: qcs404-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-14-e0aee1dbcd78@linaro.org>
References: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
In-Reply-To: <20240319-topic-msm-polling-cleanup-v1-0-e0aee1dbcd78@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a05d0234f7fc..ad109b38199e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1589,9 +1589,6 @@ wcss_smp2p_in: slave-kernel {
 
 	thermal-zones {
 		aoss-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 0>;
 
 			trips {
@@ -1604,9 +1601,6 @@ aoss_alert0: trip-point0 {
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 1>;
 
 			trips {
@@ -1619,9 +1613,6 @@ q6_hvx_alert0: trip-point0 {
 		};
 
 		lpass-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 2>;
 
 			trips {
@@ -1634,9 +1625,6 @@ lpass_alert0: trip-point0 {
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 3>;
 
 			trips {
@@ -1649,9 +1637,6 @@ wlan_alert0: trip-point0 {
 		};
 
 		cluster-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -1683,9 +1668,6 @@ map0 {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -1717,9 +1699,6 @@ map0 {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 6>;
 
 			trips {
@@ -1751,9 +1730,6 @@ map0 {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -1785,9 +1761,6 @@ map0 {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 8>;
 
 			trips {
@@ -1819,9 +1792,6 @@ map0 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 9>;
 
 			trips {

-- 
2.40.1


