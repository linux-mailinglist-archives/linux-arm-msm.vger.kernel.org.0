Return-Path: <linux-arm-msm+bounces-39415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FA9DB5AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 11:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9E9D281B30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26471922EE;
	Thu, 28 Nov 2024 10:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQMR3/0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D8E19924D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789558; cv=none; b=XiZfw6YV2bZDpRtavKbdA/LsudHoaYPcanHWmRq+UVgLkwE12MA1kAqG7gFKr2NWuMFo4bVA66eGxDFRQc4C+IRPWLTbkkD4WefrsWN6VESAAHpA5nH+MwXAq5wBqzb3pwq9TsAvnHnjcO4fGaV72hI4D4YoSWSBrUkkLsyRcq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789558; c=relaxed/simple;
	bh=Z/fubARSNKiSdA4saAVoRo6dxj5fjC0/InYw7gi/1hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFiVg6ing3czcfcHGzS71JpZsFJHdHCA2cmPxkOJ2rxoXQQ4qcZoJZR53BCZDJWHFgsGxNbNGq5Ngffrgrra6WWW+ckT5ATkjXZ0y3QjitBilSV1q/jii+j23KrqO7Nvb51pbdZsd0S7xB9rk+e1ZgIVHWaxxG24Qg/8n3dd/p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQMR3/0u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso6032275e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732789555; x=1733394355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV2f7FQ+IZLtcez7+tYl5S56MAb02gKSe/ez4DkB/II=;
        b=JQMR3/0uvg1cH8gUkLpe8zExGWRx20fv5pfl1NpSziEsl/lv1gew1QJma98w2CtpKv
         CfQitQIEvDQv15LCodxrjX5z3uRCNr3ZlDGTBtpX4cNdH7MWc7PzORP4E73blnqkEGCu
         Hx/qFF4gSe1alfip+iw8omf6ZZ+Bm3OWSHiBKvYUXtCF2sEkGhHHaFVNycA9FWdPaB14
         LmjUdTKiVgHFHgRjH+f8mVDRPFpoyuN0nlcR+Uy3kGnL9Jw7YkMefYUXRhtcYxJEHFFZ
         8Dw8QPYMGaXXvm7SXFf/ZyGTjH/sZ/Erw9aF6U8xw/hyqjOxQ58atye4Roefnde6XPZG
         EnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789555; x=1733394355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV2f7FQ+IZLtcez7+tYl5S56MAb02gKSe/ez4DkB/II=;
        b=sOhY1TmevNmsoYBTNNEdhG5Wd4E6ucm2hzjlI4zf0b6BpvrRYZGWvyzKGn9Zzz4xQv
         oDu0QzP9EESiIe9cbjxnKlSjFbcbC55HN+AezxzIPaAcXxRrrJBiiQAItV4iRHEkwSHn
         NB4HDfPpfBQkJFz1jhboG8xap66//Zzmgr1Tji7EmiOKQhT8uaEt9un+otqiERFojqU/
         QZTNUudeyBgj82M/dtshQx9aM65LmOTJFjnhuot1sRCy0R3Q1su9RM6c2GKmVth3WbxJ
         YinQqWHWpHuqwhubYOpyysNnu3ztZYkuurjaWMB2cgRwtKRaekFqUij/9q+oZA75NTl5
         wD6w==
X-Gm-Message-State: AOJu0Yy/cg3n9C0+ehG/ELTNJ7VntA/M8k1kgj8/EKWYk0UN/oafU77v
	8beSYlnFcxc0WwFOZVVrUqKHYjsFKBhdxhOE2KfZk4Im3/wgZ07R08Ta/wTobNM=
X-Gm-Gg: ASbGncun2IGoWeVLtep88r5qgnRzxcelH1lILcGYj/YFkgZv1SejiYj0SeCyHUeJVdE
	KkZj2cUHe6ghrW3PzOGn4x0RWIq9tqPUmJNnfFAh4W8Tm86o2s8Xshx0/BxzLiNKrDoB0HOX79e
	Jeyv9L7vHG+ANMpqGnV6apj2blHpcC6wpKxFlNI247u0uTfej1k49Iefk31trt9A3djR+gQNAu2
	vWQ+N+ObJSSBwDRaYMjsuPepXe3jDNz5uImeSQAnSi+my3tfIxEYSBOLwU5SpQs3gK14x8=
X-Google-Smtp-Source: AGHT+IFDPNwfPwU7WoDGxeoMVmod7G7Th8E2EFadkBA7uRFVnWAcSGDgmzTL1DRYsdo/WKpUznV5Jw==
X-Received: by 2002:a05:600c:3b16:b0:434:a4fe:cd6d with SMTP id 5b1f17b1804b1-434a9dc02c5mr60957305e9.12.1732789555076;
        Thu, 28 Nov 2024 02:25:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:25:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:47 +0100
Subject: [PATCH v3 7/7] arm64: qcom: dts: sm8650: add interconnect and
 opp-peak-kBps for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-7-81d60c10fb73@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2636;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z/fubARSNKiSdA4saAVoRo6dxj5fjC0/InYw7gi/1hw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUq+h8O+EIw/Wmn20ule4XeaTlABW5canDbHBVJ
 hvj0Tk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKgAKCRB33NvayMhJ0YUlD/
 9AklTjzKjHTXsDNhxoMU2vlELfn13KBdQEWIH7QLvqednKgEWEfQJF/QAYc8iiDJEHIHnmaCbXADHa
 JHCBES8HZ7L1U8mnXKneTx3HJ92mYMbWKtjcderjdusT4Lxwv3uoj9WejleepYfBS3GGTIW3SspHtK
 +69uE+EeNwMP7zLvfSDiCvEhppZ4Vjg3lmAjp5d+2C0aQFFAWBie75uXLei3mO20W1nNCmo95Vgpv6
 sxbYN9NKLGDhQv2/5i+ZwjkpPN8s7CPji3gdO4ODau44hzRvcbUetfP/ZSZVPRj3C0f78ho42pz7t3
 9U26Ay/sNCKAt/b638J6YA0jJd4StYkw7Q1A1f0hufut+1Mo208B3truFKCTiyfTGY5bg/n6p+sC5k
 qS719wFR2pr3CpuU/lC94xsSFhyK7WIhxcntyygzVphL8u4GpKx6yA//9FnIgZY6r4vJysR7qF18ZT
 G671aFiMFhH7OzHPqY+SAlEtAuFY23udPGTfeD6Mco3VXICcf3gahprPPZfg7L2nadNnqBWSD7fC4u
 EPOuQW6szIx32FHqvgumi6Ss5bXUlcfVAq2Q6idXkNDTCNY+t80e1qv/jIEoM2C/9o9P3X4BrGEU40
 pJTEJ5PKOxQpg7RVNZ/H/Jv2oWqt85dgvAgt5qnYBdU/N0xgrT6Lamw9+Uig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..dc85ba8fe1d8f20981b6d7e9672fd7137b915b98 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2636,6 +2636,9 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2649,56 +2652,67 @@ gpu_opp_table: opp-table {
 				opp-231000000 {
 					opp-hz = /bits/ 64 <231000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
 				};
 
 				opp-310000000 {
 					opp-hz = /bits/ 64 <310000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-366000000 {
 					opp-hz = /bits/ 64 <366000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-422000000 {
 					opp-hz = /bits/ 64 <422000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
 				};
 
 				opp-578000000 {
 					opp-hz = /bits/ 64 <578000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-629000000 {
 					opp-hz = /bits/ 64 <629000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-770000000 {
 					opp-hz = /bits/ 64 <770000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-834000000 {
 					opp-hz = /bits/ 64 <834000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 			};
 		};

-- 
2.34.1


