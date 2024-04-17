Return-Path: <linux-arm-msm+bounces-17760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D88A8CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF4D1F21A93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3942176FB3;
	Wed, 17 Apr 2024 20:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="se6gY84D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7C175561
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384200; cv=none; b=Lj29uHix9GgRQIxWNDk42a5IRaf0d8Z++ksSlXhuZ6T7Fole89iZ4gsZtuhF4e15TXOjoiiEughxunJNOC/mnR2HfcWprc+RPyqsRZx0xAlVdZONRZ+CBr3rd5TRQwFtSitdZ6wcmnYZmTeMWhgIKgbcOdUVOO8uVy3koHzA8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384200; c=relaxed/simple;
	bh=N9C7J/UXFBbxcLZJ0Wle4it14ExoZJn/aRTDf20iB8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=feEt9OICM4h6qZRZvQUcBYj3z7boZB3uG2yH2dfHGBNe3w20CvNH9wD2r7BkekDjCIFjwXbMRHauE51z67ltCdl0kVEcH5a9ZDF1kyUorMUflfBnTz7L5RP1U5L5G4J0RDe6C5TjmDCWWzjkZZTn/QOPHY4nAlU1ImlG6yVDeXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=se6gY84D; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso53085e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384197; x=1713988997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYI4k5JR+67InOGrmasq4k+IdEUXSCsAg3S/O+/c6wo=;
        b=se6gY84DzsqhxWokngzsn+5aByus98CTgUqJWAYkNYBeVtD0pUmD1ZZ5N7/x2m7lW5
         L19uaKAS7RaCOhx70wdQrWrwWjNhModtzr2bNkpWUKk5eojrNA6QzOpXPs7heuSKe6Es
         hNe+mN9eJfjYpdXDIO1iiu46sKi5pIXlRg4d54kX4OF8u4YpeQXodatokztwzP1sWoew
         UOWnPUmUYSkPUbEhsvOhrDf+it4lpH59Fbt3RXJ63dZwwROsn9HUlgUmxJxMXci5jGGQ
         DiSD2gXHtPhcp8N26lVFBDPhMSmzJKAK0GrLwdrGqd7POaEYZev6GA7/pKU4oXR5PsH6
         v/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384197; x=1713988997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYI4k5JR+67InOGrmasq4k+IdEUXSCsAg3S/O+/c6wo=;
        b=sKq63wHH8MxnOMSUX4WzcNgb/mRb5I8AX67S5eDa7LLWw3QnxjK9TK71k+MUyB3r4s
         i5znCYGbxC3wg3alDeDndVSmeuDaiiPuv75JWq3v084KQbEgowAqnj7awM0GUe9zVhk1
         Ee4nro7NR6sE7iTRR5CCXZGgaDQtwpKf8lygUSPBtliWSwIxyxYb/l1Q+Q0A0LsJ/o3M
         1bTNbimLM2LNi/vZB6oSyb4W74MRnwWtdVP3H08ZZg2qbXjiVKypPgHljxFmlLhC2M4k
         jV2KfEMb76GCOw7BujtaW4Xx5HNxPzc4kDBRhDwJRo00c9qmWgGLtregd1QI2tL8uDZ3
         nMow==
X-Gm-Message-State: AOJu0Yy8VbAYqU1USRLua4uVbSz7rhgfd5acjOsFUOVkY8/mXZfPRVXV
	T+oKWKeFv0rfY5iTqJNwmk8P0ID0u2+BSbzqpNj/6uatjDg+T8GWl04JpnDTTfzLLvRCWDoK84i
	h
X-Google-Smtp-Source: AGHT+IEveCP0Ef7EGrGrqGh7PzeSM8OltYJtYtq+rF4s+Usgg81dUYwCdW8Fjgw8tn+MFYo18gTAKg==
X-Received: by 2002:ac2:4852:0:b0:518:bd37:606e with SMTP id 18-20020ac24852000000b00518bd37606emr206953lfy.13.1713384197719;
        Wed, 17 Apr 2024 13:03:17 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:03:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:59 +0200
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8550: Wire up GPU speed bin &
 more OPPs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-7-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=2413;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N9C7J/UXFBbxcLZJ0Wle4it14ExoZJn/aRTDf20iB8I=;
 b=MHA+uQvVZajZO7HB9yQ9w98lwwxIsrifK11MFrFba+JTdm7p6ywc7iaAOHKu6/NKHBghvMv0k
 DShJ2TmzIFCDxFEiwF2L/6pAbYWdc5a/F5PivT/SpWn3M5H58jc7ga8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 5cae8d773cec..2f6842f6a5b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2087,48 +2087,67 @@ zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
-			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-719000000 {
+					opp-hz = /bits/ 64 <719000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x1>;
+				};
+
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-124800000 {
+					opp-hz = /bits/ 64 <124800000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};

-- 
2.44.0


