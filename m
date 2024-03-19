Return-Path: <linux-arm-msm+bounces-14544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B48801A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B045C1F22B81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDD682891;
	Tue, 19 Mar 2024 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E9JtSYDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87916823C3
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864826; cv=none; b=rL5tvDZmmdx1FZ0q+3aprER2bXT/tikTf+B9tt/OuZVVetqFk3NtWVOjeLgSBHbgquzH4FIVmh+1uvDGt/fbb5Kw0B7IuQUcLuPY/q78zA1DfnTDGxahqXEamHy4YjT2S//LeFdewI1cb2zBKuakjFK3C67gK09VqUb/K91udJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864826; c=relaxed/simple;
	bh=czTRD0cUdTrGZWHnHZMrrONd+Cum7+20Z5L2jGpatJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMtv1n1imVoLxSXMP7tXYS8ue5q9vxD4qHyisyULKgjykq/vUPIkTicc2EXS9vue5Yk9dVJzjS5BdtStGaG3cKP+2GRTleCO4gAf1YcOK/R4Fq3fP+MiPhJZDnUOTLyi9KjNXlziGuoxhkIVBJms64wUCLQNADFUDwcIXglz06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E9JtSYDv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-513a08f2263so5940758e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864823; x=1711469623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZA0m8KVEeSJZj3NTvXTSBRFxE/GChVc+fNT8dQ6LCt0=;
        b=E9JtSYDvHTNxtnJHqThOEiNARbA7uLC9iJNXJKDsVEvJfpwCGWV3anU8HSQyFkiBBT
         17+P6xjyf/MzIt8UevUNY2HJeozH1S9ZQwIrE97PVBB6FZ3TIYHP0BnSK20ZZe7f2shc
         4k50dGErFz8tnN/l+Bg7YK82wceWo4704qiuVdEGr9nImZlovIibBYxlcikD3K7BlyWz
         uLkoes5pfLdffeU1OdsiyoMTYR8j4UkBToUYEoOKIfFsS2pDQj2QouzbepO0wkq/lkU5
         J3puO5zijGBKx/GbLJwl6Yp9y2TdeORF8P8pwq1FXSLjx4iCdrmxTZKy/fajVpjVv8Pl
         2W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864823; x=1711469623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZA0m8KVEeSJZj3NTvXTSBRFxE/GChVc+fNT8dQ6LCt0=;
        b=jaVUs3AC99ShL9/BPSnFdABXMuuuvu6PnEwDSLPh01bHkVhglHkwM5PVWhBOIGN2SG
         tGxY9gm/K9JifsyRlF6B0KWRZ91y2bWwRsqqT/fxiTfO+tgHy58MkxtSH3WkX/I+JNTJ
         LRRGszmM8BEq8jQ0lt3NZ8Wa5pN6YMZoOzMu/PFX+7RLWEdvCGLw8HoD1aachaFvGydL
         MWxdlJSR9ZfCPAMQynRKSURmRfBrttGSOd34Jrlr3JskGPPsRwTOmZIq6Zr+Linvuez8
         ab8Ni3VlBkv0Nmm2qNutPQzPw/7GJb9zCkXxyO/PF492/q8534X+g+dG+xL+vuktcCwn
         5yHA==
X-Gm-Message-State: AOJu0YzKOW89be2Ma2BJnoGJ8BQYuZDweASMl2symrD9bfFXoiTlKCcz
	0fycjAStDm5QViw4SiS3DyQb/NI3A8oA+JkhGb6lCm1QTd03pKtegvC2tqsTGnI=
X-Google-Smtp-Source: AGHT+IEnLqsL+mnvRm5BhPySVvFgWyrF3dVRV3cHETxw8yRb1MFx+VO3GtW1/TFf5InmJGNaXfieEQ==
X-Received: by 2002:a19:5e12:0:b0:513:cd70:8d94 with SMTP id s18-20020a195e12000000b00513cd708d94mr2295022lfb.14.1710864822862;
        Tue, 19 Mar 2024 09:13:42 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:34 +0100
Subject: [PATCH 04/31] arm64: dts: qcom: msm8916-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-4-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index cedff4166bfb..e95800f8258f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -2625,9 +2625,6 @@ cpu3_saw: power-manager@b0b9000 {
 
 	thermal-zones {
 		cpu0-1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -2655,9 +2652,6 @@ map0 {
 		};
 
 		cpu2-3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -2685,9 +2679,6 @@ map0 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 2>;
 
 			cooling-maps {
@@ -2712,9 +2703,6 @@ gpu_crit: gpu-crit {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 1>;
 
 			trips {
@@ -2727,9 +2715,6 @@ cam_alert0: trip-point0 {
 		};
 
 		modem-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 0>;
 
 			trips {

-- 
2.40.1


