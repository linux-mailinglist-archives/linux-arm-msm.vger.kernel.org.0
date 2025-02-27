Return-Path: <linux-arm-msm+bounces-49651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B75A47879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105F73AD5EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA99227B87;
	Thu, 27 Feb 2025 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvGh4gH4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD278225A29
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740646841; cv=none; b=Zg2Tt1TeKVeHeK4axAhAK1fYhqaNXJ0xvPsqfQBMAdw7RKPizCBkW4IQR0JcNNZFGXgLMYwyIgQ5+XbUq2G9CUxzRwUym0BA4mFTpdte+N3biGq/T2ZfIeP8Qu5Z1U8Q/481QrQPDJBN+WG5f9ZjgtFwPIBiX1vLAceJq3cGDLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740646841; c=relaxed/simple;
	bh=cGYHXokxVyCZVHTLRKLJGEGhLm1BHzPUmbHg+wxc3W8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZBm3jx/VE+PPP5NQGN3iN4cAIVMmdMOhroF9H/JKDNUdsGWzwObJeIRoTCChc5zN+02lrSAifafskYNOGJo6Qe5m+D966O4PutmleY14a5tWIn2o2rmEBL0BQNHjAS3HJiUSqkKK/KVI6lo5GrizkX22bNRcmzbNqy/4MJ2sog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvGh4gH4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4397dff185fso6078275e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 01:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740646838; x=1741251638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUMcWsjzRSuUJt/eRA3M0Z08Ceit+E/KlQusAzGZ3Qc=;
        b=QvGh4gH4mdOHfjNkZ19W6fJyDEu5CyQEqhZJRKdFub2JYV3KFD4uUJS+u2XGo1Gghz
         n/OOcXVl31dd6b5YfkU2UW3nUWPIztZNbyQ4UsUa15VqUCMkHODoTV9KTYOQfwMvYvbs
         HpNFQJmCuFkvebvaHsc0HOoPp4amyEBGNrMHE/NHQ/wTS6q4igTmhp+GULtbPgvEbf4K
         QFmHymyJc2gSOJWSMlYeyhqFtV7LRrw/aArsmbsa/pKiVr/XT8LIxvGyIkgEy+Uhmr0I
         WMJuSvXpaHXCPHey7BQdZb9ilh8xZoj12JDFmSCoerQpnK9kOa1Y93nE1q9SHFCxIxy7
         v/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740646838; x=1741251638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUMcWsjzRSuUJt/eRA3M0Z08Ceit+E/KlQusAzGZ3Qc=;
        b=Y+78YOK2P1npVKoYV0OitL4gkbsnyRIJXQBDo1hEpalR9f387Bo79YLa8zb8SQsUr/
         j40JKr6MnN41jORJ+nlttJEx25R9TWi8eidW59L4lmZBAVRsSQ85vobj59nNdRkblVKl
         uLLFVMswO4PYCIGf3wFF9cc3pcJAxR4qjc8ehQMd5IpQ/hHbcA1J++8l4GTO47dwQcZS
         wOCLM0eqxHcthd3SaIZCzl/bOAzuUiCu1eefQdiFUy2l/NarDLk/zPPCwEBLoXglkRio
         P4VEedrRN33j9NlvPZNqqBtM7llP3ngnPfMDwUy2d3dCzBNEZATlkPLshV8S/FfbptDl
         qaHA==
X-Forwarded-Encrypted: i=1; AJvYcCXylR4S84+yc6CpXm+Uu9HGk0LKIlZG/1LB9f8FKt9dhpuW8qRJZK2dW6j8hanGSavSKzazJw+E6iyu4u4C@vger.kernel.org
X-Gm-Message-State: AOJu0YwFniJN9hE0EIHAmKk1agymo0Ws4IKVzIdHui3OC+BwblVotrda
	k1q69YCwSs9uWfMJGPhUCRm8CWb5SS891ND/qgdXxFFo1FM9r3VmXfurHSTGX08Ds5KngSYZ27Z
	h
X-Gm-Gg: ASbGnctvLFXv0eimj+rb0613ul97vZAXCV0Y3ToEVRJeGi45FMKBh7j/nVMTHGbBzIk
	LHYcrVgpWtHzZxkKriFZQkGkQpZSvgD9xYcvv24oZVAbj5peqF413s8y49YrBOsLdSV5/2JfdYE
	l8aIOWBhFYHyOtL759MSXulLYc6f85SzqAoqd81a2rJPFVes1gPQ7J1BWY9mafQDiTxRqaQISDn
	ZDuBhsakxqHFAPCEOPPlcBfgdmqFJkYjF5KgcPCvYcrlFMh3QwbUahh6rivRMwO8Yifm5qlb5OO
	8DuruDX9rUCVQKTgwlGnYuq7SN3k7gtcfcNuMWh5r6i29Io=
X-Google-Smtp-Source: AGHT+IFAR/zqNw50nHwDi76ySdj7Hl1VbATouAR8F3pbM/yDUa3A8kzUc2bpZle6+uIQsvhVUiMyVQ==
X-Received: by 2002:a05:600c:4fc8:b0:439:9496:17df with SMTP id 5b1f17b1804b1-43ab8fe76d2mr54409195e9.13.1740646837915;
        Thu, 27 Feb 2025 01:00:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba57145esm47170715e9.30.2025.02.27.01.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:00:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 10:00:32 +0100
Subject: [PATCH v5 1/2] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-1-bf6233c6ebe5@linaro.org>
References: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-0-bf6233c6ebe5@linaro.org>
In-Reply-To: <20250227-topic-sm8x50-mdss-interconnect-bindings-fix-v5-0-bf6233c6ebe5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cGYHXokxVyCZVHTLRKLJGEGhLm1BHzPUmbHg+wxc3W8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwCmzyG921aczf4S+Wf/fUUMYMyLKKPpZOnTHRwHd
 jtJu9COJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8ApswAKCRB33NvayMhJ0V5FD/
 4qJGfeqekL+VtYWZLzxQJOqkkjLmoS3De6ahtaP5vgOuhg3Q2tof8+1vftHTJxUxK6ZOX4G1sqzsdP
 Afh5mo/dGHFC4biu/LqwJ+j7WJrOo6li2dY/nwl0HwetI/6fdXTwOnGnCtTBJ64exXpPV4bIsT5iMU
 jfopw2wcATQLIXkEpKlaZVPyUyyaqNLdJumssY3bFV23RuMpfL7od5FEE3JCRxOpNKCl3HlBYJF+Vt
 d3QraFgjVuiBz4x86tl9SjICN0twKkpqk18D16ks/PfvtkA81cXr4RELRHIohz5k7zwaZoVRFXhUiA
 EfCZ/zKCLYYH/Cz7hz4hcGfaxbv+eEz146MW59Kn6EcDD2Fnq0/kxOfV3YLpHQ9J4JjyOB5OTKml2T
 PtFkgomFBZO2FW2qSS5JDyDfc0ZplwElrRZFd60RYx6tFUFhO4z+w4Op2713eBDCIPzQACFHcT2Cl4
 ntM7uwfluN7Vr4rOdz30Z9eXzoNjCjMQ+g34+5E5tExqAhtG20qRWsDHIC8Tkfw5bldIduBkF+lMCC
 E+EGMDUgjoa0Q9hbSvpg6GsHGAcesaLRQAqPDsXzaMR+lBmr3diYu/5wa6qbyFxSnG0fGA59f7Vrfh
 LceUU7l6WDfQ820wcjYBbJmL0dnfSbmLIKw4AbBRd5bZV9WsTvRxvkjXhqng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error and also to ensure
that MDSS has enough bandwidth to let HLOS write config registers.

Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d02d80d731b9a8746655af6da236307760a8f662..18bcb4ac6bd8433a0f10f4826f4c6958444c080f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3355,8 +3355,10 @@ mdss: display-subsystem@ae00000 {
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem", "cpu-cfg";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.34.1


