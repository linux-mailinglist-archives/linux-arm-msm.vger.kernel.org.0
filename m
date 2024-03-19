Return-Path: <linux-arm-msm+bounces-14542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F68801A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31171F21739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AF4823CA;
	Tue, 19 Mar 2024 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brvYlci3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740A081AA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864824; cv=none; b=E/R1LSBK/pqetq/dPqMFZ7DKl/M2+TGAJjAGnlkXojLrO4SHn03+XAKfKharcjpQNraegV4RGL7+EL6pIdpv610iIqAJzg7krOE45tpFVF9aJ4Qa3pxM4gYNIelzhfDSNsL2bNiUgDckcObWQFtrs5XsROChFTsTuV2aRGKOkZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864824; c=relaxed/simple;
	bh=k8lnyjg65wL5etJQYY5aU0Vd22mGTE1lhYSWDl+Scgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNI0Qgf/QgKLIbFEOs3a4Qrzr5nR8dSx6aHYSOUA3qRXKbuWz6Ouq6ttUEXo6VWlnG1/T5K5vFULUfj/YaZxecDWaNe8aMLJbtt80VsANnvsd4jIi/YTyk0AILv6qaat736xP0GaG8943w62NwvUk3v69P8yi6fcP+BhNMvf1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=brvYlci3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5148ea935b8so2193210e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864820; x=1711469620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OicwjZjP5RidZKnqT+PRFlgcMM+RvFHnxHBQjXeoNE=;
        b=brvYlci3zCiHWMpu6XhPUSTyRLJ59r8BqwJK3r0Gn/QHd97MeHN/hBIk4pE4heAgRi
         zYSq/d6mc3YwVvzkOVkjLIUnU8GKxpuVLcj4MBYvqazazuwj+vWUkkpXr/h90uRhRqYa
         iJ3bLNy8EQf1pFsqju1ugwfQzP1aEUamFkdpyEgAGiSmnOJgq7BczFLJIdLXlpL/Y9lP
         qDPhT6tfmmf32SKgnfSqdoXAZkr8+LMW07iJ3Y0IXsRAM8vT6zzCFmbQIrbRSFMYH7jr
         E/8O+rl2Zdp5TyrquUKrYzZdI6zHrew7UeY54/Sv33Bb1L5CbtppFqNdukMoFK0aXxbO
         RpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864820; x=1711469620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OicwjZjP5RidZKnqT+PRFlgcMM+RvFHnxHBQjXeoNE=;
        b=k2ab/p48T39cFIsdKCFvC76RUJ+BzanOnhYlEdbL8HufNLU86ayRaiWeJ5xsbcQtU4
         CsThTMqeKJYSa3bk94BmTHVrAEjJyUPxiI0GImHzpglfQCQa9WizVTh1evv4d1wV+VFt
         yWHz96sVXqKaxnOH9wGBDmQDdqTyHY21g1Z+Xjh09MqArw5iMq6jQGqqrre0b4Aso2M1
         8yaeLGeeg3VFCNJpHBGtsQSb/JivNjh1k8RKAWAPlGtDwcmqxCdogQ/hTBz1SF/9vssU
         Kv6wd00ivp/aOmjkMtaon8BmWiUyPRuym0kSHAsIhoW1A4weDHDreq5ZDcAqsF/T3J1P
         ewwA==
X-Gm-Message-State: AOJu0YyziYGMcMqL3C+14fTIom4nsATwU083LOqsXfHdDZj5/OGK1R6l
	aSP4fHYJWiF2VBKFHGXiYxSmTUEzJHzX44AwisMPV2Ff64GPPu5Wz36KekvP3M0=
X-Google-Smtp-Source: AGHT+IGV+ykXLPbUP4WJZLNYwONutSZZLeV4SkkuFmnHc91t7astVEHOtCiyymAmSNisXXVQDSxKmQ==
X-Received: by 2002:a05:6512:360d:b0:513:8a39:e0d9 with SMTP id f13-20020a056512360d00b005138a39e0d9mr2067139lfs.64.1710864819662;
        Tue, 19 Mar 2024 09:13:39 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:39 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:31 +0100
Subject: [PATCH 01/31] arm64: dts: qcom: ipq6018-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-1-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 4e29adea570a..cd0ee133964d 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -912,8 +912,6 @@ pcie0: pcie@20000000 {
 
 	thermal-zones {
 		nss-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -926,8 +924,6 @@ nss-top-critical {
 		};
 
 		nss-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -940,8 +936,6 @@ nss-critical {
 		};
 
 		wcss-phya0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -954,8 +948,6 @@ wcss-phya0-critical {
 		};
 
 		wcss-phya1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 8>;
 
 			trips {
@@ -968,8 +960,6 @@ wcss-phya1-critical {
 		};
 
 		cpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 13>;
 
 			trips {
@@ -998,8 +988,6 @@ map0 {
 		};
 
 		lpass-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 14>;
 
 			trips {
@@ -1012,8 +1000,6 @@ lpass-critical {
 		};
 
 		ddrss-top-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 15>;
 
 			trips {

-- 
2.40.1


