Return-Path: <linux-arm-msm+bounces-14553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A759A8801C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2941F21C0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6653B84FC1;
	Tue, 19 Mar 2024 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6L734cM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BD383A01
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864835; cv=none; b=qHd2CQVHwNgMsskUc3LVQFSEBUetjPqQZ1csUF861oJvjULFjzWohF55EWkMdLdkAUFsLscfFEGha6TKKV+AM6DOC6hGofsGPSlyXdka5NZbE7H5FpW47BNwylnklicds0Rf7mcw2J5IvPMV6J9MBRiN7YPxLDgZfblCyAEJM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864835; c=relaxed/simple;
	bh=0/k1OG8zIp9FMg8VdY+lmNOtRCz0TLzyGKYijhkIjTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b47dqpT0QVvxH/ZfNk7JNnOY+VAzpWcIAmfAahdrMERdp3E7IFpiDpvwv1iX+QCPCebLmrUHmR6kOmLQeK3s/EKAoBoREJ4bb6QgHcB5iD/riwG9qCpDGvOgkEHUEiUjMVo9qH7uHHg1vvWRcGJgUFBrdRw1unu3mZ5mdJHksaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6L734cM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513dc99b709so5118551e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864832; x=1711469632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnnzTjYGMYdvVMtijUR117h7wwCsVG1+77vBOY60uzM=;
        b=v6L734cMTxW2Eejvl/1EpxONpDbGWqm/fOnLabUIDQOaOX4pWvEEyczEvw76GHts+y
         42yb171d7qsqkNAOUajT0NSiXkBjQLcPwci8wJGHeBMc0SImWrQgqVaeDXrFcgHrx93t
         pZdfdNGBiDXyG63DuCHjoNfvteA8YGIofj5gMHugu7XD+Rb72XflWfccj27g+h5Ep6wK
         bFPe7u1fy3hcSUBPOCnAuGJkmdynSG5i2gPOxEFYP08lE8yZ8NHR9Q4MrvWcAbFMqPaU
         ZwdAaT8C68llOMacq9hJ0mAL9gBLrqyf37YpS4lmbxGtCA9X7YmauDNQSD5tOdQTLx3r
         yAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864832; x=1711469632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnnzTjYGMYdvVMtijUR117h7wwCsVG1+77vBOY60uzM=;
        b=OeeJjWi3f1rHtyhPvm/iT8OC4DQfZDTPBn7GXjeaiVBBBeRZlqFYrgpGtqAFHrGOZx
         JeS9DT31WAHFGl+RongpiEIx21VdVXPJ0CGezf5MYYphs/BWFXcaPH50nrK486DxBgLz
         Jezh4QekMEIZDYEvfXtGSL1WAM1u1l1FLsz3k0sA57f3+XCEhJ50jTi0p5Pi4fpGRex/
         wzHphdOkpec8DbrtzW4oDg4ymW2LPYnT6Q0dugEYhRYdaZGnJBmq8jQvbyGyYc4o76BI
         Q3uul1GvFo+oKc3XkgW9J4ER30FQVpd9QQOnmktyuqZkIQy5I2Ll6i9ZiKYu2UqSld6L
         g1uw==
X-Gm-Message-State: AOJu0Yy52ZV7IffVWIhz+h8g4jKJYjuBnqfsMAnUMD4aVwUc0SLsBoKN
	QWRnsDJK2ogAZMDmeK8VF8wm1qmIYMLwNztuwPGPVmb3LChKwwrEZw3B/ek0t6k=
X-Google-Smtp-Source: AGHT+IH9sfgGnrDzwU543lAC82msqrPzdaGnPwcC2+ew+N4WAUzGLZoh1nEIF2YHhSYiwBYkdFUK7g==
X-Received: by 2002:a19:9103:0:b0:513:2b35:2520 with SMTP id t3-20020a199103000000b005132b352520mr2283451lfd.58.1710864831891;
        Tue, 19 Mar 2024 09:13:51 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:43 +0100
Subject: [PATCH 13/31] arm64: dts: qcom: qcm2290-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-13-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 89beac833d43..c439ad5a16ae 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1870,9 +1870,6 @@ cpufreq_hw: cpufreq@f521000 {
 
 	thermal-zones {
 		mapss-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -1897,9 +1894,6 @@ mapss_crit: mapss-crit {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -1924,9 +1918,6 @@ video_crit: video-crit {
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -1951,9 +1942,6 @@ wlan_crit: wlan-crit {
 		};
 
 		cpuss0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -1978,9 +1966,6 @@ cpuss0_crit: cpuss0-crit {
 		};
 
 		cpuss1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -2005,9 +1990,6 @@ cpuss1_crit: cpuss1-crit {
 		};
 
 		mdm0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -2032,9 +2014,6 @@ mdm0_crit: mdm0-crit {
 		};
 
 		mdm1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2059,9 +2038,6 @@ mdm1_crit: mdm1-crit {
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -2086,9 +2062,6 @@ gpu_crit: gpu-crit {
 		};
 
 		hm-center-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -2113,9 +2086,6 @@ hm_center_crit: hm-center-crit {
 		};
 
 		camera-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {

-- 
2.40.1


