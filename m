Return-Path: <linux-arm-msm+bounces-21815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0CC8FD746
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B9C02813C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919C715ECF1;
	Wed,  5 Jun 2024 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJzKGhlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F615E5DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 20:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618237; cv=none; b=C9xG2RzFnHsvBiFQrV3zS7jbIrE6gBaCstGTzj6+ji5q64QG6mBliTIwMJiY2vsbZaCbUmGvMlj6JFkhjRk0AVzQoAyhzcPJIVuoAwNkGbsGjyd9f0IhzztKaoe24oqhbq0TNZv8yMc+vh8ea8kVkuVii2Hfv538i66Yc1vPZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618237; c=relaxed/simple;
	bh=0JBK/nMl5cHZdGnJCndW0tz6llOA7aiaSZQ/G+fHoQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5MIU4DewPlqE8ZZZjghElGfJA2CbBCzFjL5q5Q3B+u33UMANl0zIqbw1q9peH1myNMuyy4S1CL6XZ0g5WzhlPve1R0PL7AgBnWLWKrErRiZYBa2isl29jFnbzOuPOC26City95RFG5biqk7HtLLSJncohYM/m8NO5bzjY85HmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJzKGhlu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a6985ab58so113077a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 13:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717618234; x=1718223034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zhSqnuAi2a4A8OlqdMxl1Xx25B3ZvBd8bPE6idYqUw=;
        b=dJzKGhluCCCr4ysVAwh5sufGIvlXoyGVdkE6aRZfBu6NIEk/hrcdXB4P00ShQpVKRN
         +egmqWd+GVCoSxXX0Lxw8T9RZQNGQPJlgwEDLb/QqhQUBgG9j4ApcIGpfsvbc2uf2Qnw
         ov0ujBbJODWjC16dZKGHyNA8xwjvf1D/h9dYkw+xnvZPVpDdSAQrVHtXIxe+xMdktid6
         kKTxfrkTzaU36kNF7WXVeJvXM+70nzDCT/P6ZYZStSheO+JW82IjSSHwJo/9s+Re4TV0
         EbfCcdLkWWRE9zWxVHWpfkJwIQ06JxSbCRtfv4SY1Om+srKp992k6L2mXWMR1FR2n6ta
         fO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717618234; x=1718223034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zhSqnuAi2a4A8OlqdMxl1Xx25B3ZvBd8bPE6idYqUw=;
        b=HlBig9iEuay+fUTr1l9Zdrb5DPKWppLgBIlAZ8NcLFX4kNkOqYPDb1ej9XroapGft8
         kW8ksFj3GyOfEud7UKBSxioIJeiK6/iyFLX7WP2/XJPfHMATVkte6sUfE8Mst9HwAiJf
         2akaKSCzgXlLSe92IItvr6wQewWDqsD1g34/wIMOmVPBIUiY1hx0AHoQ+dwrjzisY/D+
         7f+6mDVZyGp0ndCXeSK9Lcf881mTPBJiRC8XnP9OSrQRC45ssQmRx8s6nD3yP+2hhFpc
         5MWkv4S1+vyIDd9Ms/LAPh8NBw2POkZaBu3YsH8VajxNGIpNt4fzkf0cUtGMZx330BVv
         JyOg==
X-Gm-Message-State: AOJu0YzxVqr0X1xrwtMLrUpzz1sx81WkB7macRLnVup9SmxhrY/THHad
	VbakAim4EmLbakPTfALbhifJfPiIGyYDJa9rNXlLDtSicTsfN4KpUi8WZTMK3EUtcZpS1G5KHtW
	7yNk=
X-Google-Smtp-Source: AGHT+IFDsc8B06V+5iEYvzet3jVlB0i+L5L9Nrt/H40mqNDBPty8TYTHLtrCt5rS5peLfSWm/ftVxA==
X-Received: by 2002:a50:9f2b:0:b0:578:881e:7b77 with SMTP id 4fb4d7f45d1cf-57a8bc9c0aamr3181953a12.34.1717618233978;
        Wed, 05 Jun 2024 13:10:33 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:10:33 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:20 +0200
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
Message-Id: <20240605-topic-smem_speedbin-v2-7-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
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
X-Mailer: b4 0.14-dev

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index c55a818af935..5f5ddfe205b0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2119,48 +2119,67 @@ zap-shader {
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
2.43.0


