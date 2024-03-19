Return-Path: <linux-arm-msm+bounces-14560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4DF8801DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21BD1C22B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDBA986241;
	Tue, 19 Mar 2024 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OspmlzIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5C85936
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864844; cv=none; b=bGmHRrAyey0aJo1p/48+7siS5fIKFQKSIktGAPBGtHcUYUvK92D8Ms5pWlkh94f3qK2aqrlL/fx2gKg2e5y4JX5vL6H3meqZfs0T+qBfhYF6IwLXAc2yiH2ZVwXMNxw9i4MYTWPClrE30CE3rJC1vKo48PXyklUpzgdH9QKrT00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864844; c=relaxed/simple;
	bh=+cYea2v2/BKOer4KwV/CVWAJy8hOJfQVFafipAC2J+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cMAhLhgIyAeJhwxsWjZxizcsM5yu9HzRTYBXWgyf7KEzMUmPcNLvlNQ01S2iSv8VPokYjmMk2a2sw7ySDc8co8FvEdmGu0bTDngj8HFii79/S39XkZ9h5sO2sFllN0PsccSW8wHyVkiEiqoaj7npMOZqROXvlOrkXx56pe6EirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OspmlzIS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512f892500cso6434262e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864840; x=1711469640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUJrKx7MvU52NeuXQ9HrJ3rBR5Q/85XuQI/RS6YMzDI=;
        b=OspmlzISMuWHs4p42TRJ3E/HM6ee+aHOLsfCTHcrsmFoIZ9z1NDRZfhiQHZvONh96g
         nqXcujlfTzZZGyThqak4MJH6Ht4DBVE1Y6A1PVpICPdGyEYqXqy1MD1ZQXUhLW9OIPL0
         Pwp9nSb46AS3s8ka0upRjTAvGe66TZygC+tHXCo6ymZ5o9/ZJdamQvDArxdriFkRVil8
         HJh9c0yUuEIxtJoZYOFWpnvltj+vJmaqgia03G9St4c8IlPI66ToCPfyZDTM2XbwrpkZ
         0bWg9YY3d3fTzHFRZda90m8j+MkRK4Nj9tA5/NncEmdoywJz4LMAsfCsn1/naT5dLwx4
         LAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864840; x=1711469640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUJrKx7MvU52NeuXQ9HrJ3rBR5Q/85XuQI/RS6YMzDI=;
        b=Q1w+A0L7YAVYs0ZH/5flkCdXQY1ClLTeun1xBjJ8Bf+arb9vQf4V4OfjLYXK5RoDiV
         NCpObrVlkOZ4lSsLnSIJ/U3ojrYgSvZ9ENghZK+n66j7O1kyJmMRwkIbjeyr9rh1Jh80
         E8qqa6DP2w3/2FK3rr/nwIWc8u3ZJE5NbcQ+H8b0tLgZe+LnnDS0WQs6Qr/deDNozGlD
         rJSVhesYPcSmpM5G2tirfuDNfU2Ivl6xl+bbVmigrhmuqGFOLH9meE4qSl3k3Oxokyev
         jzCtjYB97kTQHyZb8A2qLGOrUACCXTcA9M5rr3GYEG6iP9C6tbdTUGTb96GbPM54UYGB
         ojUg==
X-Gm-Message-State: AOJu0YwMjHBrZu8R+IcUBqpPm5lbTrf55YW4662dFw2vVkVAK23uFl8h
	Jq/o+Nomu4Wjiqf4dwxqNn9Q4mbDd7xOr9dqUc3vSJL9iVzzcsTxn0/V819RFc8=
X-Google-Smtp-Source: AGHT+IFGB1DWsnd12ElEbbIWQkgaeOW+F0Ihm5OZyQWwWoNxHzRzknGdE4iOkTj+o5szx6CpaZJqIA==
X-Received: by 2002:a19:e004:0:b0:513:ca40:fafc with SMTP id x4-20020a19e004000000b00513ca40fafcmr8242229lfg.11.1710864839740;
        Tue, 19 Mar 2024 09:13:59 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:50 +0100
Subject: [PATCH 20/31] arm64: dts: qcom: sdm660-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-20-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/pm660.dtsi  |  3 ---
 arch/arm64/boot/dts/qcom/pm660l.dtsi |  3 ---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 27 ---------------------------
 3 files changed, 33 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
index 98dc04962fe3..24efd1bf271c 100644
--- a/arch/arm64/boot/dts/qcom/pm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
@@ -12,9 +12,6 @@
 / {
 	thermal-zones {
 		pm660-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&pm660_temp>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 6fdbf507c262..46165a2a3694 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -12,9 +12,6 @@
 / {
 	thermal-zones {
 		pm660l-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&pm660l_temp>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index f5921b80ef94..9851bc73222b 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2421,9 +2421,6 @@ sound: sound {
 
 	thermal-zones {
 		aoss-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 0>;
 
 			trips {
@@ -2436,9 +2433,6 @@ aoss_alert0: trip-point0 {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 1>;
 
 			trips {
@@ -2451,9 +2445,6 @@ cpuss0_alert0: trip-point0 {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 2>;
 
 			trips {
@@ -2466,9 +2457,6 @@ cpuss1_alert0: trip-point0 {
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 3>;
 
 			trips {
@@ -2487,9 +2475,6 @@ cpu0_crit: cpu-crit {
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 4>;
 
 			trips {
@@ -2508,9 +2493,6 @@ cpu1_crit: cpu-crit {
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 5>;
 
 			trips {
@@ -2529,9 +2511,6 @@ cpu2_crit: cpu-crit {
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 6>;
 
 			trips {
@@ -2556,9 +2535,6 @@ cpu3_crit: cpu-crit {
 		 */
 
 		pwr-cluster-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 7>;
 
 			trips {
@@ -2577,9 +2553,6 @@ pwr_cluster_crit: cpu-crit {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-
 			thermal-sensors = <&tsens 8>;
 
 			cooling-maps {

-- 
2.40.1


