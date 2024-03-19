Return-Path: <linux-arm-msm+bounces-14565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EABAC8801EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A651F21D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97756126F08;
	Tue, 19 Mar 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y84bVfN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC878627C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864849; cv=none; b=W+T/0UniWw7+rcZ0INRxVz7DLfqfwxp+H77FCn3cLRFtbqzDgt4C+4snwS7VHX8lw6vr3PylDTDpzIfq7MIsZ6Tqo6lIzvdL2bh+j6GN6I7M7C2xJN0i4Sg48aJSRtiH+nyIuL8GbDCs3/P/Sv5E/VoURw8DKOnvGQeN/zIRl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864849; c=relaxed/simple;
	bh=+x3S1GOyxWB2Z2s6XmbdEQtu2mW213BCuZcfP0oLFQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGEanq6fwEorXew3gRqzr2jrTqQDHrq0AA89iUNpFtZOVtZlfsOCSaWgPYqFI5xTl9DTSIDIpAlJC5c2SCsd0Jd7f78Kl0YI2cGmZTs1YJPHIZFXwtpfCWgqbsUqvdZdcP1aztR+lzyE5ywBegOgFdUArhWHgk/G32hlRdLK3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y84bVfN1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513e6777af4so4510400e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864844; x=1711469644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW+eeLA6maKWkhRGMwKQSoYuxmPlvkorttyO5LKS3ac=;
        b=y84bVfN1WAih+eD5CRB8thGR/2uKVtbGtpo1HzEWMnjB/X6kNngzY6JGOQlriJXDqL
         f/IrT+5dS8A0Yv5EtOpxD7mBMS7N3WHpO3Zmzkpk/06Y0WxsVWqIeujSC4QVa6u6f8Dq
         X2pOtdXMHAhuFZOCJ3WSkw6zgxTBuXw8YwBwr/EM4YADKaxEokfM8rvrzRuzsKTuii01
         ajAtUFLSMastHLbrwNkKpf7OIsa/GA8Mk6KZ1x++uQMoMYP97Ke1ZLgzwMNW7CSnwlhV
         VULFaOTjcmXt0qQk8khHYhYWTO5UMb5iOcNF5/aXDD7OMUas26kFYfqorVwRABChlwUK
         KH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864844; x=1711469644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW+eeLA6maKWkhRGMwKQSoYuxmPlvkorttyO5LKS3ac=;
        b=EIujR/ZC5cATy3y42iP6Sn7T72fwVd/k2RKWUJ/Tmwza5nzdViSibm+YZvut3H1zVc
         Egox/RURLGb/5MTWj0k0+PL0s0S9vEi8apzDt1g2jz3M2apQw0B9pcgBj3ihafHIqqJI
         9t6xNRQZmXE3SKuSOVFBFv3WeA4UNaNz3uDNhLUJG/tOgBHGbn5PMo90OpAao17gi26O
         RwJByBQcoUNCtovpdsYfq2YPdrjYIPu14L83nT0EmOhFerbvIEjyQU3YNfzr6rlaFdeW
         3HSJPigFSJJrVHNAT9FS751TVTl+cC1MMfaxXDoizkpD/NbAT26/ET0zEIf94kQY/YnF
         Uj5w==
X-Gm-Message-State: AOJu0YyDg1w9IimvczClqQgYa8LvI2W4cZWIvP2k5FP3ULfKWpy0E2fP
	eQ+hL1R/VMMQPmwN69tLf7AHpzRpFiR82PceW3q0rronZJq1lmHvzzRC2F6q0vY=
X-Google-Smtp-Source: AGHT+IGNJp5+cs35sQnDjBJluajP3H20zhUEfI4pfVkeHkaX8IUlnm7VzXT9bg1O1prVdJBPhrEr2w==
X-Received: by 2002:ac2:4d9a:0:b0:513:d82a:8d3a with SMTP id g26-20020ac24d9a000000b00513d82a8d3amr8250521lfe.35.1710864844739;
        Tue, 19 Mar 2024 09:14:04 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:14:04 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:55 +0100
Subject: [PATCH 25/31] arm64: dts: qcom: sm6375-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-25-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 78 ------------------------------------
 1 file changed, 78 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 4386f8a9c636..16880789f071 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1837,9 +1837,6 @@ cpufreq_hw: cpufreq@fd91000 {
 
 	thermal-zones {
 		mapss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -1864,9 +1861,6 @@ mapss0_crit: mapss-crit {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -1891,9 +1885,6 @@ cpu0_crit: cpu-crit {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -1918,9 +1909,6 @@ cpu1_crit: cpu-crit {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -1945,9 +1933,6 @@ cpu2_crit: cpu-crit {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -1972,9 +1957,6 @@ cpu3_crit: cpu-crit {
 		};
 
 		cpu4-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -1999,9 +1981,6 @@ cpu4_crit: cpu-crit {
 		};
 
 		cpu5-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2026,9 +2005,6 @@ cpu5_crit: cpu-crit {
 		};
 
 		cluster0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -2053,9 +2029,6 @@ cluster0_crit: cpu-crit {
 		};
 
 		cluster1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -2080,9 +2053,6 @@ cluster1_crit: cpu-crit {
 		};
 
 		cpu6-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -2107,9 +2077,6 @@ cpu6_crit: cpu-crit {
 		};
 
 		cpu7-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -2134,9 +2101,6 @@ cpu7_crit: cpu-crit {
 		};
 
 		cpu-unk0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -2161,9 +2125,6 @@ cpu_unk0_crit: cpu-crit {
 		};
 
 		cpu-unk1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
@@ -2188,9 +2149,6 @@ cpu_unk1_crit: cpu-crit {
 		};
 
 		gpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
@@ -2215,9 +2173,6 @@ gpuss0_crit: gpu-crit {
 		};
 
 		gpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
@@ -2242,9 +2197,6 @@ gpuss1_crit: gpu-crit {
 		};
 
 		mapss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -2269,9 +2221,6 @@ mapss1_crit: mapss-crit {
 		};
 
 		cwlan-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -2296,9 +2245,6 @@ cwlan_crit: cwlan-crit {
 		};
 
 		audio-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -2323,9 +2269,6 @@ audio_crit: audio-crit {
 		};
 
 		ddr-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -2350,9 +2293,6 @@ ddr_crit: ddr-crit {
 		};
 
 		q6hvx-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -2377,9 +2317,6 @@ q6hvx_crit: q6hvx-crit {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -2404,9 +2341,6 @@ camera_crit: camera-crit {
 		};
 
 		mdm-core0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -2431,9 +2365,6 @@ mdm_core0_crit: mdm-core0-crit {
 		};
 
 		mdm-core1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -2458,9 +2389,6 @@ mdm_core1_crit: mdm-core1-crit {
 		};
 
 		mdm-vec-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -2485,9 +2413,6 @@ mdm_vec_crit: mdm-vec-crit {
 		};
 
 		msm-scl-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -2512,9 +2437,6 @@ msm_scl_crit: msm-scl-crit {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 10>;
 
 			trips {

-- 
2.40.1


