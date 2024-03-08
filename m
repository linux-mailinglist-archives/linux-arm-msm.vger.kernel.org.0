Return-Path: <linux-arm-msm+bounces-13733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A092876CB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 23:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34F68B21B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 22:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818E160864;
	Fri,  8 Mar 2024 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZYiFUk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B511C605A1
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709935719; cv=none; b=KP0U+MZsjy9tixT9OhsXbHDuvjH/xOHB/tAqD0/kx3dXW5BMTTx+ox5gCWmwmVY4ZCtdx/4aAkH7m4mXHb7BLc9HbpbuAV4Vuyq2stvZvGoOUUy5RKIzMXkN4Xqp4q30Pv7SOKtPRjMa1xrn+YXxj7C23rAqSKBVW/NR4zu+ogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709935719; c=relaxed/simple;
	bh=5u9DxCgppmXza0/wpVNVHXJbUVr3KnjNCvIqClA8mBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMX/IJmNGSgL++1uE8UqSGVy8Z3sJrMy0rY6wvrQtCyZ3aOWQkN87B0nLtnriyTrX94AEtYdEL9TLio32K9ncTh95V3qn20iQygi54FSovmGy20rrCNnqgVNz+9dXj75d4Ji7NyT8OFVzUbjI+U1Ga91j2UtAS6Up/3TP/oHZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZYiFUk7; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5101cd91017so4164221e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 14:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709935716; x=1710540516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiv70EIyoAolaEKbYPrfg91si2P2mKJ8bXqLlaDWuLk=;
        b=xZYiFUk7ESggSMK9Sx+A51BmjSYJAgC+SsP8P5G9WkoXKuCNwtKOOWh5r6u13+M70C
         jy2oGtMU1FxXVeYs5E4iKxdg28s7qtJleSvxgKpsfJoio3XIKnCIs0Pdz9f/IxZdyGm1
         YS2h1dDlvatZR7wxeTLltlMqtBs6yiuhkbPcPVfLPq2xGVrF+aGh1imnLPMtu0saOlUT
         9GJ+nzqrkRR8QeVTKdIJbkjTYe4H1GadJ0iTAronPVZ/yW5/WEB7TlY3RnE2vF1XnO7L
         u5Z/1SNhKtREVZEV/70NTTbpV9zlCd7lTSlOXgpQnauiEKSaZhIAh1LGuKjllvLwSUqa
         lRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709935716; x=1710540516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiv70EIyoAolaEKbYPrfg91si2P2mKJ8bXqLlaDWuLk=;
        b=F9ciculw/YcWaErDBb1qk14IQWt3VzPO+J9YUfHoBnLl/up+AQn7brCfieQxHLgLv5
         iEL/DBw8Fr4D+Em2so5dKUuUoUwHsVHV3C98LzAC44o24orYHgYmPqZtpKYidynMDYc/
         B6d2ojz+FWCR73EIzzQxFz00+tmQnFv4I4U5ox8XFHDMtagR4qiB0rZa9tZscQcyzcug
         7O5h0/+noVraRescpv3fQMIZn6Zeuf0ovW1hPSFepGeRoOcMfBRixnfJ7RXXHAOaC+m4
         4Ez47cMIQAtlxapvykqkM328SjBTNz9qCUI5gDgI9SGiQuSiCMG3l7J8vFR+Dshp5CSS
         +u9g==
X-Forwarded-Encrypted: i=1; AJvYcCXvpzPAIlwWlYJUH0E1jcADlSz6sD+GBjEnMJIUkQ5UmFm6tQhbbINtF4YfEJcaR8IRpduK68wlgi0typo57IlA/4cK4aEAOtUcCZwHVg==
X-Gm-Message-State: AOJu0Yz+P2XJW8IDN+uk9mNGk9ccTZZRZfH1k3lU+3dO3XVqQBG2yewr
	rgr43zhv9JvrC6jj6umYI8x4HPuIo7EuU7ekqwA0ixN/NhXmkVbMbRY8+95eIO0=
X-Google-Smtp-Source: AGHT+IFQ+WmVI2GU3PDAyIWW/rk8kRwoJTIYLIYiPVn8TW0QHNcwRGtUVzrQ9MZ2VZqtjgmsCbLLOQ==
X-Received: by 2002:ac2:54ad:0:b0:513:5eea:2942 with SMTP id w13-20020ac254ad000000b005135eea2942mr199912lfk.37.1709935716060;
        Fri, 08 Mar 2024 14:08:36 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512020e00b005130ff68b87sm78241lfo.109.2024.03.08.14.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 14:08:35 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 08 Mar 2024 23:08:22 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: qcm2290: Add LMH node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-topic-rb1_lmh-v1-3-50c60ffe1130@linaro.org>
References: <20240308-topic-rb1_lmh-v1-0-50c60ffe1130@linaro.org>
In-Reply-To: <20240308-topic-rb1_lmh-v1-0-50c60ffe1130@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, Amit Kucheria <amitk@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Loic Poulain <loic.poulain@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709935708; l=1579;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ghHIdqDBrllaHBUjq5ng+yJ/UVI9wsqAfkk77psz8Gs=;
 b=LUOzr91VCQTW00KvaZATYi/GF/2cy2hmUe9Cq/VCc+E+esGo0fpeEQPT2TldvkzYt3iZYpTp5
 bUqbWUfhqfMBZYK87/ENNWjJ1sk62z2PrRj0ky3lPq9v8f7zY31FG9L
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Loic Poulain <loic.poulain@linaro.org>

Add a node for the Limits Mangement Hardware to ensure it can be
configured by the operating system.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[Konrad: add commit msg, rebase]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 89beac833d43..1aacad50e7fc 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1858,7 +1858,7 @@ cpufreq_hw: cpufreq@f521000 {
 			compatible = "qcom,qcm2290-cpufreq-hw", "qcom,cpufreq-hw";
 			reg = <0x0 0x0f521000 0x0 0x1000>;
 			reg-names = "freq-domain0";
-			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&lmh_cluster 0>;
 			interrupt-names = "dcvsh-irq-0";
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
 			clock-names = "xo", "alternate";
@@ -1866,6 +1866,18 @@ cpufreq_hw: cpufreq@f521000 {
 			#freq-domain-cells = <1>;
 			#clock-cells = <1>;
 		};
+
+		lmh_cluster: lmh@f550800 {
+			compatible = "qcom,qcm2290-lmh", "qcom,sm8150-lmh";
+			reg = <0x0 0x0f550800 0x0 0x400>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			cpus = <&CPU0>;
+			qcom,lmh-temp-arm-millicelsius = <65000>;
+			qcom,lmh-temp-low-millicelsius = <94500>;
+			qcom,lmh-temp-high-millicelsius = <95000>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+		};
 	};
 
 	thermal-zones {

-- 
2.44.0


