Return-Path: <linux-arm-msm+bounces-14541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573E88019E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DF01C22E10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF51823B4;
	Tue, 19 Mar 2024 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCNuOEFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4D81AB4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864824; cv=none; b=PRWbeBX4HGpTOOZkcPoFYJg33IJksZC8Pcsj3WO39MKfSHhxgtwSc/xJULOa3dW0xlmP5hMRu7jdOCIc9ZkrdZORFUtxhvhaEBxdtWbJMe0F9WvVpSiM9G3avfPiEgO5JmR9R9uF6Nct8NwD3KZCROTcH2SMRg7wx7+rcFfy4QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864824; c=relaxed/simple;
	bh=53rfcs6wPcUFJBxFhOnzU59sjBsZn8dZASabRE5EfFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mm+yJZcqKOmXZevsCztlCMJcCswKPnjtly9fn4+3sFD7L6HL9c199jBTs1a52Rtr8e+97FPCR8EQOQ3GSY5HuPv9EGx0NaJdw1RNDSpB7qC9Jv8lw4yIq+5mXjqT4Uwgh/4azZjP89JNmWEyIC3cGbEArPi9DkTPxYK8izYh04M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCNuOEFc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d3746950so7101909e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864820; x=1711469620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKhk60UIiAqlpRk16jVKRzKgNE6SdDJ//RGq9EU9euk=;
        b=pCNuOEFcz9UHAqLDtbSRAR0ZFgaLEWiy7bL0JOpdXb1+Bt6c82xnN7bDivw8BalMC+
         K4kbXHjloJeCJwOUhI7GrKHLND+ZtE89fhuXMmyfF04nOVqUpi+rdJ3RRVXCJm85nlgE
         LgydoQQUQOtXae3bCZIybwhYhmz4SF+gMceNOB7E9Hfo/QVdu9L6QIW4+smWGO/orJYi
         TrC4lIJW0W27KdUKwBV1NA1z6YNb2hB2LeZNLB/SzClHQTd65iyb3w96Rkpo1zw3ABHe
         DOr5uLcNFf434ooxYTnj4SzbPHO32A0Gco6WVXg9FvafhTplo+Wwwoik7BHgsxmi/51H
         qwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864820; x=1711469620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKhk60UIiAqlpRk16jVKRzKgNE6SdDJ//RGq9EU9euk=;
        b=VflLsvp7/x9L9UuigZNDVEAviCmiBzOrwyUgKw7EhlV1dbk+AfA03vVxlkhEwYI8bR
         6MnvDjmCrRTNcY52s8Dw8PENu+JCfOaWtvCGqSNuCwTh0LVqlJP6QQgDOPFn+6qeONij
         SpAxikZ3YiT+muTQVTBS8wKx8q63XB/gmUZoEjqog9zDbwXcT8kcbk8uTJPcG/aH5Rzu
         fqUpwGlJSp3IKYc7H4FtWcKFWaxbTcDKWDZCEDqgXexnBJ1pOqGW6s0IDPdSAo26LFEm
         9u559Sep4akiIqtkBZ6rVaMalRJ1n5FQt6/0LwdrJSvDbnQmpuIBcscb1yiZ/+faCj54
         CkGg==
X-Gm-Message-State: AOJu0YyF1v942dv8yFzqq4R6jkpE3auHzpXN68L8xRKlUCI59Su9Gep9
	l+dPEfx3bI8yU+0ho+VUYeVVGfNaTsqF21JvmsB6Hg8hHLfiO0K8UM7kaAyYSAs=
X-Google-Smtp-Source: AGHT+IH6aNVKYcARt+lJ+X5dNVRSQXSHI9p8pOvhyEOLbX/nKridsjACQUtxdYhIW+jNSEVbE+si7w==
X-Received: by 2002:a05:6512:473:b0:513:da61:9b46 with SMTP id x19-20020a056512047300b00513da619b46mr8573736lfd.53.1710864820716;
        Tue, 19 Mar 2024 09:13:40 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:40 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:32 +0100
Subject: [PATCH 02/31] arm64: dts: qcom: ipq8074-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-2-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 36 -----------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index e5b89753aa5c..75641175dbfb 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -942,9 +942,6 @@ timer {
 
 	thermal-zones {
 		nss-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -957,9 +954,6 @@ nss-top-crit {
 		};
 
 		nss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -972,9 +966,6 @@ nss-0-crit {
 		};
 
 		nss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 6>;
 
 			trips {
@@ -987,9 +978,6 @@ nss-1-crit {
 		};
 
 		wcss-phya0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -1002,9 +990,6 @@ wcss-phya0-crit {
 		};
 
 		wcss-phya1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 8>;
 
 			trips {
@@ -1017,9 +1002,6 @@ wcss-phya1-crit {
 		};
 
 		cpu0_thermal: cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 9>;
 
 			trips {
@@ -1032,9 +1014,6 @@ cpu0-crit {
 		};
 
 		cpu1_thermal: cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 10>;
 
 			trips {
@@ -1047,9 +1026,6 @@ cpu1-crit {
 		};
 
 		cpu2_thermal: cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 11>;
 
 			trips {
@@ -1062,9 +1038,6 @@ cpu2-crit {
 		};
 
 		cpu3_thermal: cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 12>;
 
 			trips {
@@ -1077,9 +1050,6 @@ cpu3-crit {
 		};
 
 		cluster_thermal: cluster-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 13>;
 
 			trips {
@@ -1092,9 +1062,6 @@ cluster-crit {
 		};
 
 		wcss-phyb0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 14>;
 
 			trips {
@@ -1107,9 +1074,6 @@ wcss-phyb0-crit {
 		};
 
 		wcss-phyb1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 15>;
 
 			trips {

-- 
2.40.1


