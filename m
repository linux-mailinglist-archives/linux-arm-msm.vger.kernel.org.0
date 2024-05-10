Return-Path: <linux-arm-msm+bounces-19654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973528C241C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAA2B1C20B07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EBA16F900;
	Fri, 10 May 2024 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFdMUNKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9C16F0DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342380; cv=none; b=ZgTpvSsCv6HwLVrTKmvtbUl+V3EMDC0PpYTU6zfokfhwfOYonMaQVQ4d090G0vUfeJOTiOoD7Q+98qU7eDNx7UANT94IGB6QkvP9KYuHWJr4EJ5ADZT3lV5Q8wHTRBOBeZvd5OWEdQbVxUITG1NZSQxje8Lt18FZnXSe8l3kDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342380; c=relaxed/simple;
	bh=dK9DowlvEZW+LtetMDGjnQGyXMs1w8D1AnGc1PI8Qww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojZ7phnYyM6FAJHcBQR9ksQsi6ahte/HQLyST/spjwtUnyQ/M6V5iDMFACs0vA7DROAcIrRKuRCJ0Bu7dIPi/rtrenw7SLy5FRAN537x3GocfUp+5dp2vrUgCOfjzNQYFD5oFEsFCpaAWUT3XbOb+zhyABDcS1eD3i8loTnm6bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFdMUNKI; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso34983621fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342376; x=1715947176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWIB+Z5MSUsi87orA4+fPYLJmz3fRVrSjUHIWZpplPA=;
        b=nFdMUNKIcULi8AchXs5NwTUyWs1pSqlprFkBAcI+fWND9iNBMNFt1EaWCDaiCZKlCJ
         xBXF+14my1CLp/0J12cSbXX00gMPBftEsdRhX7y+b2u9k/IYQj2N3JinLJiLqc7rilJB
         zSVW+Aoy8boReQH37bYtwhsnlC4/vGu3881JQIYVvJsA15q8ebf/G1UPsICTLZ0h3v6k
         4D+1arXMi2Aku+20v2W4E1UqURt/OAUCdg5NKp9kk3G2ekwtboI0mZVL0GYsLlb/fmA0
         EgwWqEEmiTLRRVfdOnRdBzz5/NM+4EOcE4J4jcctYxjLGYVOVsYTlat7tFDrzoQKqfQ6
         L+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342376; x=1715947176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWIB+Z5MSUsi87orA4+fPYLJmz3fRVrSjUHIWZpplPA=;
        b=WPMrWrA6lQvvfM5kZYpxIfT19J9J3Imd9cYbp+BwMqBdq3uRtZtgj9ldUUTcNxsKPt
         M8u3NB8vec1xOE2D0K+7AFfMahdCHSlvlihiqpzUBiF4yH8u9qTLpae1GTbTV43Ei0qJ
         7SgVp4dxVwJpgVZhBZrCcELDVGlN8nTk67nbCc5H6zjIKInsJpVA4pwfNVfaBi94lLlK
         GOpgT0S2PiNvJwpH5Z5xXsHyeOB7W9Xw14ZyPQNgZ7AVBinbnfmjEWdqhrGDWSAUn4Xa
         a92NwF70WitIJLXS1r/+wDj1DxI96riGprqoewZDDjxsQBB7RdquwfxEN9qhPbPb1BFY
         ZSKA==
X-Gm-Message-State: AOJu0Yw0LJs/IfGurvCTq5Dv11dV6pMU9GGEyrUswBvGaXu/V9Dgb76n
	RBz7Bd6q+jHrnZag357B2+ViD6lGB9mB+mOyokeSglei7ZOLxqkg5aopx83P1q0=
X-Google-Smtp-Source: AGHT+IEJY9NraJb2lQ3/WpsEb/xHayHJ22eEyP44jFR9Z5gbwOB0iKMCC69YiJw/azuD5pVwFugQcg==
X-Received: by 2002:ac2:5b0f:0:b0:51c:3f4c:ef6c with SMTP id 2adb3069b0e04-5220fe7aa4cmr1768860e87.40.1715342376510;
        Fri, 10 May 2024 04:59:36 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:36 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:25 +0200
Subject: [PATCH v2 02/31] arm64: dts: qcom: ipq8074-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-2-436ca4218da2@linaro.org>
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
In-Reply-To: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

All of the thermal zone suppliers are interrupt-driven, remove the
bogus and unnecessary polling that only wastes CPU time.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 5d42de829e75..aa93c426c76b 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -982,7 +982,6 @@ timer {
 	thermal-zones {
 		nss-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 4>;
 
@@ -997,7 +996,6 @@ nss-top-crit {
 
 		nss0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -1012,7 +1010,6 @@ nss-0-crit {
 
 		nss1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 6>;
 
@@ -1027,7 +1024,6 @@ nss-1-crit {
 
 		wcss-phya0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 7>;
 
@@ -1042,7 +1038,6 @@ wcss-phya0-crit {
 
 		wcss-phya1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 8>;
 
@@ -1057,7 +1052,6 @@ wcss-phya1-crit {
 
 		cpu0_thermal: cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 9>;
 
@@ -1072,7 +1066,6 @@ cpu0-crit {
 
 		cpu1_thermal: cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 10>;
 
@@ -1087,7 +1080,6 @@ cpu1-crit {
 
 		cpu2_thermal: cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 11>;
 
@@ -1102,7 +1094,6 @@ cpu2-crit {
 
 		cpu3_thermal: cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 12>;
 
@@ -1117,7 +1108,6 @@ cpu3-crit {
 
 		cluster_thermal: cluster-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 13>;
 
@@ -1132,7 +1122,6 @@ cluster-crit {
 
 		wcss-phyb0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 14>;
 
@@ -1147,7 +1136,6 @@ wcss-phyb0-crit {
 
 		wcss-phyb1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 15>;
 

-- 
2.40.1


