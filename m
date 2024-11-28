Return-Path: <linux-arm-msm+bounces-39414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98919DB5AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 465891669F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65828199FDE;
	Thu, 28 Nov 2024 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asRlwMNe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFC1990CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789558; cv=none; b=on8/33DUEBo7oOLgHeffJY/fLCRxfMkK5mTgjF80DNCrCJplVGolc/VFcBke4qukw6FVDw7lFxNsn1rCtjix27l2oRXvCUVrAZ0P5LaZhgxeavkjR8QL7N1jErIIrhdPk8i27U+jSuZhuCVWCHNfsHS13HHWK2s43lh4PWfk4Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789558; c=relaxed/simple;
	bh=SPiS1PE0VaU+lZQZUAnT3yVj+1EZ8DKyTqWi4EEzxic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDVSwV8CjDdKPFScwgOLKsga3V3MQydQvCw7+Gaetj3AUMWEodkdIB1hvj7ZooznHS7b2ozlkBxAaA6kNLTqxYk+obdjEGK6yT46g88VIrqJujaOgCWQYW4F1DkaFlSFKkky7cv17Om5CV8cW4XyT5gNGL6yzd3jhmkQMSgu0sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asRlwMNe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so4063405e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 02:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789554; x=1733394354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxD1mwK+mwBfZm5ePvwF7qngRKOmVEln2kQY0A2fNXU=;
        b=asRlwMNecHx1zRExDAWjvIhr1X12OtzSrFf2++t9M/uQlBxU8MVVnixv0gRhwOMUxw
         FmfuRlnb37z5SXkLboGVEdztALmLE4KIb94pX+SgmMVyZWDT0ntoCgoaDi70uH8Ei6nb
         MF+WyM4DyS23PPP7WNWjracti+I3EfgB0Vd1Zl8kCPYXerHHy38Q8h/HHHHxRwTrAIcB
         Aa8bW2zHJhlwgZB9t/kL8KweKLsW0N9G111PfB8KOweB1QiKVrs9bI79ucLbkkhvbdLl
         NN+bFe7/xPBCyKQSItkJL/d8EngnPJAmGLv3UxsyU3bBCy7nnvEwTVU3FtGTh+FHattG
         Smrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789554; x=1733394354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxD1mwK+mwBfZm5ePvwF7qngRKOmVEln2kQY0A2fNXU=;
        b=EoDrA+Ht0WnEJgeqwmPvH4BmRqi+pcjwRKvMSG7qu6tHfEiQrQZCEHWqZnlA7/bB/e
         1lT5GyaNymXxk7pSh7+EcLKgYSNjk14vTAs//k1qoBew4IQiwXgn3YLXpaN2JAdyJuFm
         bRhjkGTjyr8OAqnRCdIhNoaasON54H4LcP/w83hP4U8Gt2NSUXUJ/QIW3nUo+3vItejR
         AahklFscz11AzsZI4bqCfBTUa5TassPSCCfUgrCuLsAhbQa0lnEHqHpAeFK/m4z2pHkf
         Kcdfkq0YNP5zwhpFuoG2FMUe6xKv6fA7368PvDzQZXBW0DmIuuMiDfNo9nS6jMVnNMU7
         y5iw==
X-Gm-Message-State: AOJu0YzaN5yBP4JKUZMUSEQ7OZ7VzyVFCgiLKvCm91gr/UA/booR/rDg
	9SNdCTWGxJmQApwSfdji/gyme78aXJrLF8sbZ6DLQU+lOKJkoLO75MRgPPAYooE=
X-Gm-Gg: ASbGncuAyGqpmBCWBiO5eAwVfh6cmBSroSrddzNQYxQI2znm/D0vxPCdrBWJzW+U8Tk
	vuXrd5J5lUybq8hUBOUWthPb+kUX+Eq6hF2+owcqRtHScQf3HSqGJMC99dVpaNExXzo/r0GuoPk
	5PfaXNsQhmNftdlsfb0sJibWRKQEUdBRxo97RwAMgoFtqLGHUAIEJtdRg5Sc4nYwnq41i6cpTOc
	KWWlBQjbYEwdKcD31IgctaxCuY007/4fE1icJSVVnkM7JK6zE1+3OisgAhQvipDjD5zeS8=
X-Google-Smtp-Source: AGHT+IH9zTsMi4bXrztoim9bnTLqQthtJbqFnNXarWSa44HOSdk7AqCzL4tsxwQbZNvxNUCZd2R14A==
X-Received: by 2002:a05:600c:5123:b0:434:9ff4:24a1 with SMTP id 5b1f17b1804b1-434afc3e694mr22424005e9.13.1732789554035;
        Thu, 28 Nov 2024 02:25:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:25:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:46 +0100
Subject: [PATCH v3 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SPiS1PE0VaU+lZQZUAnT3yVj+1EZ8DKyTqWi4EEzxic=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUp3GWqkaAyvNyjK+Commp2P2mBY+OCujX5NST8
 VlBWoKyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKQAKCRB33NvayMhJ0bUTEA
 C0HDx8xWxvW60Vq1Fn6+4ZVKKnqrCLe/5/utX2NRP7PNDJFGb96Do4ba6K6JuHAwoqirVKXdhPBLDp
 OQ1/jqoPoI+P0MZ/9DDvkZihtkzl31zXJY5RS+BpsGIOudVRLY8Fcj7CnSR9C9xrqNm3KXQ6cCjCI2
 wQD47Ee6FNL/t/XurPl0ZsZTEY5S2Lytdyo7FxK0KIOjw0prOTC4YO0D7lybb+q++WKCPBpZ3goopg
 IOYWckLX+xmmrQSP50gRZ3L3cSdhV8LDfpXEg6iD+ppH2Bbs1f94q602RTLVOzsdYpghreebEi8xkx
 t6tsRvaXQewCqfvs4KukxEJfEIq6AgyUsahoEcuHOphsgowe3qvT3C70WWuJu3hCpsHr01FBf31opN
 mz0BOSmsZFaDbl/VHnzV0QVppZJ+YukA4m49gR2/VQNtwLK1cklCqCwI88gK2iwAs4RDdnnT4GYkWB
 p3VE3RWOJFQVi72pPAqxLtJEmvE+xbAsC4DHcFye1AY5rxHbQL0OW2n3sGZ02Z4EeL08P4reyFFvTB
 aniTH+u4fB+cck65b/JewYNnWWWCG9+5K70XnkbBlwsYo1ygPp07ThCDL1Ie1hee8HC/CeBaXBFqDG
 e//LsTfex1Iy1ZFFNXBucoeLHxh7/o+bMo1NWjYWXSezVEoZ39mkDLDNCETg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..545eb52174c704bbefa69189fad9fbff053d8569 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2114,6 +2114,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2127,41 +2130,49 @@ gpu_opp_table: opp-table {
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6671875>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <6074218>;
 				};
 			};
 		};

-- 
2.34.1


