Return-Path: <linux-arm-msm+bounces-19670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C18C2452
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 14:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B761228D71E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484BE17B4E8;
	Fri, 10 May 2024 12:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uHgRcLCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660B179950
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715342402; cv=none; b=c8c0CUaZlcDwD605H4KFHWMtPQFKG5NOi+TAx6HQvSqtAdPdNX0jTg3HHJiRcnjIA0nyHiuWuZ8Rz+DwGM6c5zb8DJ1Uhr2/MwKb1tBLilApwY7Q0C83Nr5+AOQXo++ffAmlm9kXFH+pws7zZUzko92/Ej7enITxRkUfj8pnAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715342402; c=relaxed/simple;
	bh=LbkcqFLxyCx0rD4FKgnNllYg8feOnnpLUrEoZBHO/00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0nYKagqgQWLfbzIZqoUuVNU+tia1m6ib8jMB1P4Uw0rbnYEBplHNFhuY4bIYFLTPVlLCYKp9Q8Ad0Qh3F/M8eCqq63/4LNyyQKlqBuCN9lumIdjUF0RD6U+ev6xaJ8eYQbOlSxlqzNGx/7hQsKPVB97TjbiFiym51pBcdOWz6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uHgRcLCd; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59a0168c75so506582366b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715342399; x=1715947199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga0DcjRqkd5lWMS6Y4aaN9jfdq6ougYfGRhj8z88OdY=;
        b=uHgRcLCd7greQ4jS1lm04NkTZ06rnPhdhuXKpJEuy0Cw+hnG4dnfDA7POMBd/x8sG6
         qcnQp7y8lHcL3Vo+COMmpJzmhsd2AeWLSmBQf1GINqA8hMP8EAEQfQT2xPlP6J8deMtt
         mOP+LmS3d/pRtHyXkGB8spPH1c7ySZFsjHBO7PsaOj9iC7jLVZUU4vUiRyMJQaCwGCi0
         NaHi140I3yXa+nVfrkJaPTsasSU9SriRRb8EEnkV1gjGcR/NY/ES+P7uEtdWuxur4/+7
         YfvJL/nVy8CaV0dqIke1rVZEdKRyzoUfQ5xczT4Mofx0yb691pVFRiyaDPP6hgrlPagr
         ZJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342399; x=1715947199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ga0DcjRqkd5lWMS6Y4aaN9jfdq6ougYfGRhj8z88OdY=;
        b=k2//whviHyGCoyWchNVmjpYakuDgtTsKdlbikDvfkP0cGlVkwGtPQ6c+yPix8rHyD8
         D/psj6aqp+Sfjd0hco4Tz7JK7nelEUJaAVsBeyUwXMAYYYvXHn5PUcnnlgRy/ky9c9mr
         xvVioEWxUnYUg5V2PL2B/N85sebVxe2YUrflXFLYFW0trMnTBYCEUjum0TcnqXqME112
         t/z+vi0D/9ktwD8q8C7l7ie650yC1KQQ/aIMW3quItW4uG6D1LIM8wPsqndvsK4eMjpq
         qgE+597JpAP/HlM5Pi3NCV1FtMKfIALalgB/C7bRfwPuxUAQVGnSCYSBPx2ESnBEW/5L
         bUNQ==
X-Gm-Message-State: AOJu0YwIeleVpwyeZpLC9df9Atvs9sDVjCGYNQlvgOEbY13RrluNF0wb
	2xvvOWBCs084dKskLfDjZARYNAcox1mcmWwws4Wyj1jCiCJuPAkXjUTIJ4UFHHM=
X-Google-Smtp-Source: AGHT+IEQnNBfsozlbshlb9P42pEUe4bZxBKfID6D8ByV05PLQtqc3vvhFVRorAIiNy/JZWi4E3ceuw==
X-Received: by 2002:a17:906:3155:b0:a59:9e01:e784 with SMTP id a640c23a62f3a-a5a2d53ad83mr159250766b.5.1715342398879;
        Fri, 10 May 2024 04:59:58 -0700 (PDT)
Received: from [127.0.1.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7df7sm176795666b.111.2024.05.10.04.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:59:58 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 10 May 2024 13:59:41 +0200
Subject: [PATCH v2 18/31] arm64: dts: qcom: sc8180x-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-topic-msm-polling-cleanup-v2-18-436ca4218da2@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi |  2 --
 arch/arm64/boot/dts/qcom/sc8180x.dtsi       | 26 --------------------------
 2 files changed, 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index ddc84282f142..1c6f12fafe1d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -13,7 +13,6 @@ / {
 	thermal-zones {
 		pmc8180-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pmc8180_temp>;
 
@@ -40,7 +39,6 @@ trip2 {
 
 		pmc8180c-thermal {
 			polling-delay-passive = <100>;
-			polling-delay = <0>;
 
 			thermal-sensors = <&pmc8180c_temp>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 067712310560..aedf2e7db038 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3771,7 +3771,6 @@ wifi: wifi@18800000 {
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 1>;
 
@@ -3786,7 +3785,6 @@ cpu-crit {
 
 		cpu1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 2>;
 
@@ -3801,7 +3799,6 @@ cpu-crit {
 
 		cpu2-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 3>;
 
@@ -3816,7 +3813,6 @@ cpu-crit {
 
 		cpu3-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 4>;
 
@@ -3831,7 +3827,6 @@ cpu-crit {
 
 		cpu4-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 7>;
 
@@ -3846,7 +3841,6 @@ cpu-crit {
 
 		cpu5-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 8>;
 
@@ -3861,7 +3855,6 @@ cpu-crit {
 
 		cpu6-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 9>;
 
@@ -3876,7 +3869,6 @@ cpu-crit {
 
 		cpu7-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 10>;
 
@@ -3891,7 +3883,6 @@ cpu-crit {
 
 		cpu4-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 11>;
 
@@ -3906,7 +3897,6 @@ cpu-crit {
 
 		cpu5-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 12>;
 
@@ -3921,7 +3911,6 @@ cpu-crit {
 
 		cpu6-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 13>;
 
@@ -3936,7 +3925,6 @@ cpu-crit {
 
 		cpu7-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 14>;
 
@@ -3951,7 +3939,6 @@ cpu-crit {
 
 		aoss0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 0>;
 
@@ -3966,7 +3953,6 @@ trip-point0 {
 
 		cluster0-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 5>;
 
@@ -3981,7 +3967,6 @@ cluster-crit {
 
 		cluster1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 6>;
 
@@ -3996,7 +3981,6 @@ cluster-crit {
 
 		gpu-top-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens0 15>;
 
@@ -4018,7 +4002,6 @@ gpu_top_alert0: trip-point0 {
 
 		aoss1-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 0>;
 
@@ -4033,7 +4016,6 @@ trip-point0 {
 
 		wlan-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 1>;
 
@@ -4048,7 +4030,6 @@ trip-point0 {
 
 		video-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 2>;
 
@@ -4063,7 +4044,6 @@ trip-point0 {
 
 		mem-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 3>;
 
@@ -4078,7 +4058,6 @@ trip-point0 {
 
 		q6-hvx-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 4>;
 
@@ -4093,7 +4072,6 @@ trip-point0 {
 
 		camera-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 5>;
 
@@ -4108,7 +4086,6 @@ trip-point0 {
 
 		compute-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 6>;
 
@@ -4123,7 +4100,6 @@ trip-point0 {
 
 		mdm-dsp-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 7>;
 
@@ -4138,7 +4114,6 @@ trip-point0 {
 
 		npu-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 8>;
 
@@ -4153,7 +4128,6 @@ trip-point0 {
 
 		gpu-bottom-thermal {
 			polling-delay-passive = <250>;
-			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens1 11>;
 

-- 
2.40.1


