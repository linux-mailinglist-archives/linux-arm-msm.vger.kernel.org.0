Return-Path: <linux-arm-msm+bounces-40522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4EF9E5934
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62FD028587D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF82622257A;
	Thu,  5 Dec 2024 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkhiXAK1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E4B21638F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410890; cv=none; b=ZTXN1ichDlS0V279M6JfepHZBHv8JIfRMPcngvZWwUU8jHyrOeImoUHvC54ZpHKn0uATyc0zBrX/b5ydW9R/hkRY/EWNYzoRktwt8tbE2r6hpkzBtXfTA205zL2hLLtPi25rBzjQQsplquPUttFBC2MiM1lVbCkHxOUAkjkNqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410890; c=relaxed/simple;
	bh=RYPtTEAzI0OGTqfRzA/UycF6LcmmOXWAmTfNgMLYnHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5Axf/QRQyHs74c06RQiU6ArxQeE9wcbBP8u8RIqXGyu/8qYfSTaocwhdppMOwZjwfvkcEbGC/77D+Tuamkopgh/MxIq4DgZ1ZyjXPVZq0tRDVsf3UNqTVdrhug0elWAHfGjPtbQ6gTUGEUNWS2QjFLuPIRhvYiS3nkQypH2IHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkhiXAK1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385dbf79881so1374442f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733410887; x=1734015687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PE4EC9PLskFvJMahyM4wT4IIkBhlmTglPbxea814APc=;
        b=xkhiXAK1WvzQH3u9JwAH/DVlUkeYpok5VBjiqWQoJ4CcePIxwRMsDQjeVKhZpDZ2Bu
         nCSNv+J6XWxmhWHhQ52Lw3AifJu03Wjv1eGYB1AOqhCTvFuqIWzPlb/rqFD6v4D0FnED
         ly+BnPjXPKKcsxf++pk4Gm2zz5v7Q4CrjYot6XuZpa6tGjcQ/XBc/2teUHYI1Lu8regZ
         pu8LpBBpZICC8FVcT7boO8xUuW844kMjB6s7+wpgBJSCjqRybR+UljAfMQDgJzITq/9u
         eCajE2zqO1zydK8ynY25hsrzwuFsNAGcKVCTinE9Dv7fa8ClmgLC8yZF02RLFgL40O5Q
         Ekag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410887; x=1734015687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE4EC9PLskFvJMahyM4wT4IIkBhlmTglPbxea814APc=;
        b=oHnzBWoD5KpuYtyWrHdRxWPF8yRaxL19DgG4rSSXQMTLzMH1ARpldxcA5XwUEyuZqd
         XL/zRzFQTtFD7/ywFybhSipw1vqkPqQJarXRavNvK4iL6Jd3Fi7hxVrf7EVLLxep05Jg
         OAVx9goeMV9sGgSX9jEwiZbucA0wn15UguQEWCB8fMk3Ddaj8YcBDPlosJ3OpxNIaQgA
         a7Eq59oHUOm+oBXmVHJoz9KmptWSHgBJgcMoPo+zDqbCJGbbPkO1RA4neS0Kjn2jBDjT
         dmeqh8t+pG76Hpu368Ui0GkRPrE3VmbgtYrkqjER1LtbJUPfOY7hCGSYy05lb75voIVQ
         cy3A==
X-Gm-Message-State: AOJu0Yx+IdIi1KAYs6OSiDIvYtdyEdE1B6T7VouvVNZws/IWe4XEYPzF
	oWv1z7Vf4HoxcidIjNbMoWZZGv5GRl6F2bG0DArX0F4QePrS0mSKuoAAo8v+IAA=
X-Gm-Gg: ASbGncuBtHqm5zahMIRRIwnl0dTqKIJ9T3CgjQvMwci16r8sJGMm3YLPc7W4257POd3
	jC/baev6KQlOpKmxE3Xp07JhQ3K++lyOGowcmG0IdLAGcCnax3MS8yillzfuOzHEiYu9L8aQ+KC
	WY8gqax4cfhv+NdSEJcGKFYtnemb7BUlt1h6DKQsCAaT4eN8E/H75qiWtiFemitye63wP9hLZZ+
	fO80+zuwb106ME/i3hWp7DfQWIWCIyaFFNZCuZwrnGy1plhDFFflOGMLSvm/4H4ePJ/Zjk=
X-Google-Smtp-Source: AGHT+IG1XEFDu3IE/3HqjxQTBBrt8eu9bg3PesPAyjLcHPehuhNcC0WrhOXXAhfrJuVWwx7+BGIjaQ==
X-Received: by 2002:a05:6000:188f:b0:385:e986:416f with SMTP id ffacd0b85a97d-3861bb5c367mr2698569f8f.10.1733410883551;
        Thu, 05 Dec 2024 07:01:23 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:01:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:10 +0100
Subject: [PATCH v4 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-6-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RYPtTEAzI0OGTqfRzA/UycF6LcmmOXWAmTfNgMLYnHE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA5HvZp2PHgJlyryi+bTlFLh+XAS6Z7umgDCPSr
 Bhe+qHaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOQAKCRB33NvayMhJ0cEQD/
 wODdnXV1Ywe5zB0yYtWBWkIJkMscv50bJFauXBQDQKrsMlnPjejHnvtOexsT3FTdUsR5N8k71mCRN9
 9pvwbmwekcJEjoL0ovrpHX3rehOU6jX2g7ZhnrCD6GdBG0FwIwOclO0aqKC4d3tmYX57jjNiUsKW8T
 D4MWl64KScJDqO06jfZnRQpX0EVPONidZlTW7rHieBzdy9hmVLZ2VluH+FZ8u2kzzP7jeccdTKNjFc
 q6x7uLkv238qH4vSW5Ro4n/TJYVl4K0UOVK7TdhZhJ4HV88DKaAVpi7TSMmDjctxho03QbMFdHssnU
 6ucz3F1UBqMhBPfTTvzJli0Gbwp+RkU7pN4RBlKYDVCZs0BgBK1+ikourUJ5u4SiWxkgBYZ9VOBaqY
 d7+fRs07Zqi/EyRgDj4wIFj3h2UuUAWULqBqo1N0W5W8KO12D5tpD5Jgmi0/QevxVXxmm+5dlSu89A
 nx+o/PAXzLZb9jxI5aRMntBpSsJ17umoBlY8dtst9Z5YK+MLCL6qRRgBCfGyfHLyjt9YrrYR7JujMk
 n753RCyZ/lYtv+ubjyo0cqP84rNhuIQtOyyvIwixKTKuQuuOsKcb6BfG/8gUyS4AWaryiQzh0JSsWJ
 F/mMj5GEreNQ4LWT0+gF/xPUyuXMM7MwyP74tm07Jn9XZBDXc9QNmGWet+6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..955f58b2cb4e4ca3fd33f1555e36a15cfc82d642 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -2114,6 +2115,10 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2127,41 +2132,49 @@ gpu_opp_table: opp-table {
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


