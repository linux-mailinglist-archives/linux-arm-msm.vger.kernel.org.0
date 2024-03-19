Return-Path: <linux-arm-msm+bounces-14545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1C8801AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F39E7B21A9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8490682D70;
	Tue, 19 Mar 2024 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNNT/yNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CF68286A
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864827; cv=none; b=Euye8kX9pZVRO8N1fWTn5bGZkyQmgGWLIA+KGXUtlnvtddKhcCs2p7jqVK7RZ+cP7lVO8CAax/uu3xhaWzqcJYWQs2dy6SUjvXMeEiFqwGR+WPXwfPccDrxsrsobenbAkrYfwrOBUIrJJj/6ZGD7vz51OY/W7WqmqOPvy8wKauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864827; c=relaxed/simple;
	bh=DbBjX4DIiuCNjj3JhLbWIrKqfrFfqGS03QX0BIULxbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWRFKzlUU+y0bzJbzQJWBUa+TXM5BVh8rG6bnQVQWWUyUqN7pVtOQgnUrdFxZBXFX+WKMZ56zRXEo0/BxlxxBeQ5a3Mko+NaEn2PKgbJX4/X6pFqb3MQJB5urlVTaibh2lH+avuklTvQ1Zw0YWD65Fhmu7pMDqXz3cq8XE91R00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KNNT/yNN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513a08f2263so5940782e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864824; x=1711469624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4U5+kdqeP777KP8JmcZQhYQROmx+V53PtnamLYp1ng=;
        b=KNNT/yNN2oRVvu9Tew/UrrLTeRM2Qdx3IUSRwFEkM1v+3LKt02O27cOWBsAZSFJtwF
         Rsp3BxMDixQoosiYbIB5yCbjpGQOflK2mgfh6vOlSs0wDa7Z+NuDXLMCGf02ZOOFUYyj
         hs5GKBhPLTt6RBNhGFu38CZEq/LVwtGFmyH+ZCBU9GHcS5TzKTqDuw44wHnKadEwXLYC
         QbrDM/5sKQC/BVzB1BqCzktrCg549HybTRmvtlYwFVE0NKYTBg9EgV5OCVl3WdgPjD/Q
         eCByMLO92vIeO0d6dx5NXf0Z3/zSVrrxauSkQhle+QMv1d+9ewLYcXtHjN/BQPKZ44Df
         Zf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864824; x=1711469624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4U5+kdqeP777KP8JmcZQhYQROmx+V53PtnamLYp1ng=;
        b=MHDfO2EwL2V6e4llB0kj006G3vYrCnXxFM1MTTp1hhoJwMWoBxpoSTf9rutgXKzukB
         azLWvFqbptBC++1odp2hPDQ3EgPm3adhFLydGr2PvD1bRwd2TF1QSeTRR0RlKVjdlnXt
         olOT939YvARhDgz+Ns+co3+5RQgkDlP5FRA4MmO2l0EXiyLJRkTFAfYZIphYADAz4znq
         sfc5dWr8kIVIX3GSelv68GhLNTwV7A1KXJvKt5j1tm1oWm0/J+z69+QCOE/4Hb/CzAni
         xo+CXIq4KvpXjzigHDZu4Dd/RuWrY6SkrcaFhRMSeDHZp+xIiDesNp3F0+QOFIQM069v
         lKUA==
X-Gm-Message-State: AOJu0YwAqwUVzhulQl0eaLrOh97iWGVm2aIBUgaLySaouYDWIJYe2OnK
	qqycNGElqz01OA838qFx/QEmazwjRYEjzgOzwfAAktB/F1NsdcXJIsvt1rhwPza0fpYCK4hcWyV
	c+Aw=
X-Google-Smtp-Source: AGHT+IH3IoYWQxwcFXVcO05zaViq2XKBO5jhW6naBXXxyUbEelGzFLhanXgDvzukc/mr4Qo9YZbPMg==
X-Received: by 2002:a19:e00f:0:b0:513:c54d:7bd1 with SMTP id x15-20020a19e00f000000b00513c54d7bd1mr2226551lfg.35.1710864823932;
        Tue, 19 Mar 2024 09:13:43 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:43 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:35 +0100
Subject: [PATCH 05/31] arm64: dts: qcom: msm8939-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-5-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index dd45975682b2..43c0335b2be2 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -2298,9 +2298,6 @@ apcs2: mailbox@b1d1000 {
 
 	thermal_zones: thermal-zones {
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -2329,9 +2326,6 @@ map0 {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 6>;
 
 			trips {
@@ -2360,9 +2354,6 @@ map0 {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -2391,9 +2382,6 @@ map0 {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 8>;
 
 			trips {
@@ -2422,9 +2410,6 @@ map0 {
 		};
 
 		cpu4567-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 9>;
 
 			trips {
@@ -2453,9 +2438,6 @@ map0 {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 3>;
 
 			cooling-maps {
@@ -2481,9 +2463,6 @@ gpu_crit: gpu-crit {
 		};
 
 		modem1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 0>;
 
 			trips {
@@ -2496,9 +2475,6 @@ modem1_alert0: trip-point0 {
 		};
 
 		modem2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 2>;
 
 			trips {
@@ -2511,9 +2487,6 @@ modem2_alert0: trip-point0 {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 1>;
 
 			trips {

-- 
2.40.1


