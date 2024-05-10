Return-Path: <linux-arm-msm+bounces-19653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0008C241B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8941C20E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 11:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD9816F84A;
	Fri, 10 May 2024 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tAPYWS07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B942C16E898
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342379; cv=none; b=QSeXT/eX63xYy9roBZ6xgNfa385dbSRt2/6whfo8whEwy7hFXZaERsd3tmbdNz+V9EuHp2opCZsP3B1Efb3AzkibR7wnubrlT4rFsEbc+yd5Ra+2nhxug9hajjJ2ah95+9qz6qqP8flvTTgFxmljRCw9vA4Z6FmwMbFvBpLvAks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342379; c=relaxed/simple;
	bh=xq/Hy4Zry+1j/+krCSBNdt1SdGwM41vFXUOXZ7JkdrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3h2oGqeQLf9C5F1PLeEi/vZxpYdfdq7Jf7d9qOCCY3AIix53hWSEdfPUD4GEKo1e3CQK1WM/bFSIqawfUGhANUL+JQ7e6d/GafHKbXog9Z612JkxhIe45zsdCzJ0MoAb2MYRWNvGbsGPepID6TvnrakNEvYdV2hoKckkHFterQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tAPYWS07; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5a2d0d8644so251633566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342375; x=1715947175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AF6Kt3hor5s6WwdiBm5yOEm0vELRyqrn6ISDRDFqzHg=;
        b=tAPYWS07Ndc+MTr7lmSU0wTTiFJYrCkzsva45d+bmNE45P94bERdVFh/I8KgLDk/px
         c2SmpkJ9CBj3/x9GVhlrwpN6N1Ttds++ygB5IujIpPyHsQxP1RQ8ANJTMGdeNQ+FM1SD
         XRsmh/8O8kmT5ShRq6BgBxdjbdpu2z6u1BciFweCbeRuAsk1gdjYP28flfLPscXemgd5
         bzwEuaLKXwUpsOFOxEK0VOjYJ1WETbEo8/PiztUfIipHANRivsLd/XprdgMtc0InotUX
         LgMX9z0lyoZqW9wh66B6RFG8aHnoxAKmCYr5RJB/zG8go7xiyz4nKTXpNc3xTZV/3Vnj
         dplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342375; x=1715947175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AF6Kt3hor5s6WwdiBm5yOEm0vELRyqrn6ISDRDFqzHg=;
        b=QzEWKqupr8S7o2CMJHFjSA14bNfBsxaD1+d2cCVcI9CCl3j03BmYZoJ/q29/nmM8ZP
         8dHi9BthqeccZdhkz5DKo6xXaikmeTMbH9jxYZ0lzV6mOI8WzJBT0/i6wHXrGdEfr2xu
         /vIDKLe/PK1sxCaUDfXThpGA5rrkZKMFm0l1d1lBEBboJlVhGbL2URahvWwM/YwA/sh4
         7QfluWfpfJs78RVFP3uol8OvvO5tkwSvUa7yQGm0zxU53iglFqbuYlv73CCiPfbHel2x
         B2k4+qzatNBXJpFOzbnSaRGYT/oCYFwuGOjX+iXsWPNTwp64NAaq8QHbXssabmt5Erte
         y+cw==
X-Gm-Message-State: AOJu0Yx2SxMVfg1OqDS3T2jAS5FEAn/SOlxxXxfxTWtY3qLbVCiSzjQZ
	c6Oc9+VrmmDSX1bFrZZZgDhef3+ooOfh6gT7H1eIyopNEwafY32pXozPsAV+n0Y=
X-Google-Smtp-Source: AGHT+IHYQac4qaVSSW/Vl8NTk0NuQuH/xUhn9qFwAQyzRyxRuPA7rM2PVw9dIlkgf/jroTybu9x7Mg==
X-Received: by 2002:a17:906:528b:b0:a59:cf0a:4e4d with SMTP id a640c23a62f3a-a5a2d55a730mr176691166b.12.1715342375230;
        Fri, 10 May 2024 04:59:35 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:34 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:24 +0200
Subject: [PATCH v2 01/31] arm64: dts: qcom: ipq6018-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-1-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 17ab6c475958..2d05b77201aa 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -923,7 +923,6 @@ pcie@0 {
 	thermal-zones {
 		nss-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -937,7 +936,6 @@ nss-top-critical {
 
 		nss-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -951,7 +949,6 @@ nss-critical {
 
 		wcss-phya0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -979,7 +976,6 @@ wcss-phya1-critical {
 
 		cpu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 13>;
 
 			trips {
@@ -1009,7 +1005,6 @@ map0 {
 
 		lpass-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 14>;
 
 			trips {
@@ -1023,7 +1018,6 @@ lpass-critical {
 
 		ddrss-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 			thermal-sensors = <&tsens 15>;
 
 			trips {

-- 
2.40.1


