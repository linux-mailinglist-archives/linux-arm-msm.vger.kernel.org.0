Return-Path: <linux-arm-msm+bounces-14555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E878801CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FC62285BC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6398562E;
	Tue, 19 Mar 2024 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYpJxIHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F5F84FD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710864838; cv=none; b=sgs8HKv2Y8nwZHzPjFUdY2YLwirdDufIl37ut+yqj13aJ3mnf7mWsK/ccCkLyjCVjwfeIX0wLkJ56ommK3i/tbXh05QngBQw/iyPreaCQGio4Fs2BhNy3iV56LgdC8gcu1Uti7iyc7Hbxl26u6/mZyOVyq8RVYfb818Hms41LhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710864838; c=relaxed/simple;
	bh=UPpmjMlmBKk2/udod9kMX5V3IsyI/+xirDIA9F4xpAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uk5BiqLkH0JqykiiHKVevdNRDPcp/xIOf2as0H+BvPkQTj3E6X0jVhhfVcc2XGX8DfOmjEBRifhLTs9LcC3XwYWkbkiI8EdwP58w0JACMkQFNFiWsUp+0jxawpmeH+DTZXSBEo3KaN3QpEKfGxufMUrRc0+moUSS8XWVIwfmBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYpJxIHR; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-513d4559fb4so6996332e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710864834; x=1711469634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8vHp34wYH0eBavZgf2d5N2sDGNWZk3dOCjl6ar2I9w=;
        b=lYpJxIHRA8SH5PcyQPF5DuRZ/Mlz7ZiRWiXG2gqvPlbDyTPICukppdPesWinFZWB9U
         pYXydBTd2+8CKg97BgPJjHdpX/80vsCTtsif5QffCRk8N5qJKV0q+1Q7EzcDJaM1u1jf
         ukbbodHEWKtdtPs6Fz8fU6PdcbCWy/csKPCz/n4c3N0PDsHhsHftMcwUNGkpOW9jnExX
         ooOA1fyO2qy8c26gWy/MqrnJwhA5GBCa3zvwKaveWT6LWCRF7dLPbHQrMWpHwBGLvDEh
         KQtdW07ltytixBAlDN0eaD/gF2BnKJnMex8FyUsz6Bd58LC4KMkp7oYZoSvO9vtxYWoQ
         ZPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710864834; x=1711469634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8vHp34wYH0eBavZgf2d5N2sDGNWZk3dOCjl6ar2I9w=;
        b=m8O6VWvQjAoP+bbvFgaWQqcgnwdIkNfZHiRkoiqWZcEr0+/iqhEvWNsK5U0SO4yKbT
         4BHlXvImOGTPgQDPK+1eXkNTn5MB1dZAGFrp14y8dkV7OVy8wcWoZ5uPX3VTcpfu6lmk
         IoWyqicMXXvKWKoeCYpAWoviERBUTc+XgU3HS21JaskkYyTIGoKvvnUhoeZ2JG329cI3
         gzhvU+CKxDK6Fl0JMPybxMoaVIhMNiFRV1yykZiEdVoV+AmPF7OgWShGXshUZn9mzSvP
         oF7uCz4gQwKY+cPULFsM8cpAGa8oTOmy0qiRFBR63dVmmzrbDjcIW26VNLJ2EEKQ8/K0
         XV/w==
X-Gm-Message-State: AOJu0YynNtu/aLn8r9M9LuKnmVIsg5JNLumuBQNoVRf1LTXK09Ty75CN
	tTLzItFFNFrdryHScOie3GzYvChjG2UjNfOywzZyxYjofmQLBpQAtwEYFaoDoYA=
X-Google-Smtp-Source: AGHT+IHf19K1aDBaNbed6jLjYNWWlcBcPonDZ+aWjWxbYBFSfheHBGtR67+lTUxtGCrZLUboZzpezg==
X-Received: by 2002:ac2:5f89:0:b0:513:c9a6:46ce with SMTP id r9-20020ac25f89000000b00513c9a646cemr2227507lfe.9.1710864833949;
        Tue, 19 Mar 2024 09:13:53 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-29.pol.akademiki.lublin.pl. [87.246.222.29])
        by smtp.gmail.com with ESMTPSA id dx9-20020a0565122c0900b00513ee207982sm607686lfb.198.2024.03.19.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:13:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 19 Mar 2024 17:13:45 +0100
Subject: [PATCH 15/31] arm64: dts: qcom: sa8775p-*: Remove thermal zone
 polling delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-topic-msm-polling-cleanup-v1-15-e0aee1dbcd78@linaro.org>
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
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi |   8 --
 arch/arm64/boot/dts/qcom/sa8775p.dtsi       | 150 ----------------------------
 2 files changed, 158 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index eaa43f022a65..f23a99729d9b 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -9,8 +9,6 @@
 / {
 	thermal-zones {
 		pmm8654au_0_thermal: pm8775-0-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmm8654au_0_temp_alarm>;
 
 			trips {
@@ -29,8 +27,6 @@ trip1 {
 		};
 
 		pmm8654au_1_thermal: pm8775-1-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmm8654au_1_temp_alarm>;
 
 			trips {
@@ -49,8 +45,6 @@ trip1 {
 		};
 
 		pmm8654au_2_thermal: pm8775-2-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmm8654au_2_temp_alarm>;
 
 			trips {
@@ -69,8 +63,6 @@ trip1 {
 		};
 
 		pmm8654au_3_thermal: pm8775-3-thermal {
-			polling-delay-passive = <100>;
-			polling-delay = <0>;
 			thermal-sensors = <&pmm8654au_3_temp_alarm>;
 
 			trips {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 231cea1f0fa8..45e6443c9dc9 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2550,9 +2550,6 @@ ethernet0: ethernet@23040000 {
 
 	thermal-zones {
 		aoss-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 0>;
 
 			trips {
@@ -2571,9 +2568,6 @@ trip-point1 {
 		};
 
 		cpu-0-0-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 1>;
 
 			trips {
@@ -2592,9 +2586,6 @@ trip-point1 {
 		};
 
 		cpu-0-1-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 2>;
 
 			trips {
@@ -2613,9 +2604,6 @@ trip-point1 {
 		};
 
 		cpu-0-2-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 3>;
 
 			trips {
@@ -2634,9 +2622,6 @@ trip-point1 {
 		};
 
 		cpu-0-3-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 4>;
 
 			trips {
@@ -2655,9 +2640,6 @@ trip-point1 {
 		};
 
 		gpuss-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
@@ -2676,9 +2658,6 @@ trip-point1 {
 		};
 
 		gpuss-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
@@ -2697,9 +2676,6 @@ trip-point1 {
 		};
 
 		gpuss-2-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -2718,9 +2694,6 @@ trip-point1 {
 		};
 
 		audio-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -2739,9 +2712,6 @@ trip-point1 {
 		};
 
 		camss-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -2760,9 +2730,6 @@ trip-point1 {
 		};
 
 		pcie-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
@@ -2781,9 +2748,6 @@ trip-point1 {
 		};
 
 		cpuss-0-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
@@ -2802,9 +2766,6 @@ trip-point1 {
 		};
 
 		aoss-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 0>;
 
 			trips {
@@ -2823,9 +2784,6 @@ trip-point1 {
 		};
 
 		cpu-0-0-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
@@ -2844,9 +2802,6 @@ trip-point1 {
 		};
 
 		cpu-0-1-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
@@ -2865,9 +2820,6 @@ trip-point1 {
 		};
 
 		cpu-0-2-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -2886,9 +2838,6 @@ trip-point1 {
 		};
 
 		cpu-0-3-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -2907,9 +2856,6 @@ trip-point1 {
 		};
 
 		gpuss-3-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
@@ -2928,9 +2874,6 @@ trip-point1 {
 		};
 
 		gpuss-4-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 6>;
 
 			trips {
@@ -2949,9 +2892,6 @@ trip-point1 {
 		};
 
 		gpuss-5-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -2970,9 +2910,6 @@ trip-point1 {
 		};
 
 		video-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -2991,9 +2928,6 @@ trip-point1 {
 		};
 
 		camss-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -3012,9 +2946,6 @@ trip-point1 {
 		};
 
 		pcie-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -3033,9 +2964,6 @@ trip-point1 {
 		};
 
 		cpuss-0-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens1 11>;
 
 			trips {
@@ -3054,9 +2982,6 @@ trip-point1 {
 		};
 
 		aoss-2-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 0>;
 
 			trips {
@@ -3075,9 +3000,6 @@ trip-point1 {
 		};
 
 		cpu-1-0-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 1>;
 
 			trips {
@@ -3096,9 +3018,6 @@ trip-point1 {
 		};
 
 		cpu-1-1-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 2>;
 
 			trips {
@@ -3117,9 +3036,6 @@ trip-point1 {
 		};
 
 		cpu-1-2-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 3>;
 
 			trips {
@@ -3138,9 +3054,6 @@ trip-point1 {
 		};
 
 		cpu-1-3-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 4>;
 
 			trips {
@@ -3159,9 +3072,6 @@ trip-point1 {
 		};
 
 		nsp-0-0-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 5>;
 
 			trips {
@@ -3180,9 +3090,6 @@ trip-point1 {
 		};
 
 		nsp-0-1-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 6>;
 
 			trips {
@@ -3201,9 +3108,6 @@ trip-point1 {
 		};
 
 		nsp-0-2-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 7>;
 
 			trips {
@@ -3222,9 +3126,6 @@ trip-point1 {
 		};
 
 		nsp-1-0-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 8>;
 
 			trips {
@@ -3243,9 +3144,6 @@ trip-point1 {
 		};
 
 		nsp-1-1-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 9>;
 
 			trips {
@@ -3264,9 +3162,6 @@ trip-point1 {
 		};
 
 		nsp-1-2-0-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 10>;
 
 			trips {
@@ -3285,9 +3180,6 @@ trip-point1 {
 		};
 
 		ddrss-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 11>;
 
 			trips {
@@ -3306,9 +3198,6 @@ trip-point1 {
 		};
 
 		cpuss-1-0-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens2 12>;
 
 			trips {
@@ -3327,9 +3216,6 @@ trip-point1 {
 		};
 
 		aoss-3-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 0>;
 
 			trips {
@@ -3348,9 +3234,6 @@ trip-point1 {
 		};
 
 		cpu-1-0-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -3369,9 +3252,6 @@ trip-point1 {
 		};
 
 		cpu-1-1-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -3390,9 +3270,6 @@ trip-point1 {
 		};
 
 		cpu-1-2-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -3411,9 +3288,6 @@ trip-point1 {
 		};
 
 		cpu-1-3-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -3432,9 +3306,6 @@ trip-point1 {
 		};
 
 		nsp-0-0-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 5>;
 
 			trips {
@@ -3453,9 +3324,6 @@ trip-point1 {
 		};
 
 		nsp-0-1-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 6>;
 
 			trips {
@@ -3474,9 +3342,6 @@ trip-point1 {
 		};
 
 		nsp-0-2-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 7>;
 
 			trips {
@@ -3495,9 +3360,6 @@ trip-point1 {
 		};
 
 		nsp-1-0-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 8>;
 
 			trips {
@@ -3516,9 +3378,6 @@ trip-point1 {
 		};
 
 		nsp-1-1-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 9>;
 
 			trips {
@@ -3537,9 +3396,6 @@ trip-point1 {
 		};
 
 		nsp-1-2-1-thermal {
-			polling-delay-passive = <10>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 10>;
 
 			trips {
@@ -3558,9 +3414,6 @@ trip-point1 {
 		};
 
 		ddrss-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 11>;
 
 			trips {
@@ -3579,9 +3432,6 @@ trip-point1 {
 		};
 
 		cpuss-1-1-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-
 			thermal-sensors = <&tsens3 12>;
 
 			trips {

-- 
2.40.1


