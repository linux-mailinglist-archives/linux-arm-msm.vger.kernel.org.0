Return-Path: <linux-arm-msm+bounces-26301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F01932342
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7660D2825F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 09:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAE51991A3;
	Tue, 16 Jul 2024 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dcnioQCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81894198E9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123122; cv=none; b=kgOevI+1adMfuUU23aRf05l3eUYlO8i7fUaSEXYt2Aa+rsQzDDcAXYwbV+61RAML/UzZqKU4sKdnZbpdYG7bjuq6A0neqCAhn1FLSpoIluNaghfqhRE7a7JDdk0AbzUcvoMCvXPs0Df+YH8AljbnpuWCTkz3lr4qJdU8NeyWcP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123122; c=relaxed/simple;
	bh=vq9kQDucZZaaXMppqui404uEJ0q8knUSeXPUQx+QAE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qT5lpfKcdQ01Zlh0LKz/4B85SGP0NRIQfgrN9uYrbZWTlF4HhmN3IhLWVof7cStu/fLpkpxuNGYhhn/S/2B3Ev3sTQ0CzMFihPQk2/nb0astFQRIV0g5eFVFrRs08DfiyCF4DIkoC5gCGJ/V/sSL4mBdCuw9Mqehik74xsnmzlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dcnioQCF; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so70306751fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721123118; x=1721727918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NuFIyWh2EPTvca8mT4rSO45uIeLlFHL1Wx11wqOMQc=;
        b=dcnioQCF6R/tAAF/Ar8+n4h5AoesVMfEXnKRrtDnD3QKSulHbHVjTHm6yPFYU2YyvO
         n18nNz1kqGc63qW/+IUASpA4ZzFroLFZKLNQdHShgMbJh+bSfeICRa13NkR2vD11Imqb
         Wd/5IP+tckBbLOm5NSUtUzR5muaHXGIadnlplFyqgjDO5Ua56J3dqDl+89uKxah5tXk7
         E9gfRQHfJxRlB4PETbgLXnogtQraqLEdCA309k7gkppuasBvUmmaNKpNz9s85MR93Hfh
         Ef0HPH1N/w9HAzF2qY7w1lZ02yk9I/LmWu33IawCvVIzzuBRLqk2jlM+lu3yjoSInBPz
         kNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721123118; x=1721727918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NuFIyWh2EPTvca8mT4rSO45uIeLlFHL1Wx11wqOMQc=;
        b=huwP/2UKqfCfahlm+UwqS15j1RHiHrPv2LjIZNJZ7/DzruZhHLAfeBmnATdHp/AKix
         HKoIj5oXJTN/y6G5qRBbbVvH6ikWHtunBLMw6LKg9mndoZXBuIBkFZ3GFPqShFxTqJn3
         /72Ma+95FGLPFkek1igBdpExuO4QJHgGRxBUAORp8xWnY37OyVtXBUo4j4fba0yX82T5
         lStM5ER71Zy3Fv4LMG6DKHILpUgL0EvI3RwKZMvr7Rq+qs1pqo8tVOxmafA9vUNKTRbo
         nA+mEkX+e+hYUml2AaspFLOY7iEoDMuyASUqWy/Vb0B3UNcEjVnzW9/8VdVMflwZMR9o
         yseQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5U3cMnPiDl+vygqct5/PHipl9O30p57FEk9XIp883mwZWBz72Tix/rtK7kVSRnbWjPc93Nxv4AR1fJ5B0j4OvHHo4wW886yoysuoPDw==
X-Gm-Message-State: AOJu0YwTjQwxq89V6w3kTo60wLhkdkzxJXdY8OBurCRcDEqA3X68CZhi
	rAIDlq2D7DvTd7kUWPUEYP3EZ81xbRIfzYe3i2aiAfCe0opgYz/Gw9ssEgfDFYo=
X-Google-Smtp-Source: AGHT+IG7g7z6HLYJ14CcKV617EB+IkO1Ar44iuZCqLPAlbLMxByW1bM90ZwiiGB8c5P7bBsY3CJHfQ==
X-Received: by 2002:a2e:b04a:0:b0:2ee:4f22:33f9 with SMTP id 38308e7fff4ca-2eef41b0e5bmr10639741fa.24.1721123118097;
        Tue, 16 Jul 2024 02:45:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc2efsm154408185e9.36.2024.07.16.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:45:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 16 Jul 2024 11:45:11 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm8550-qrd: use the PMU to power up
 bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-2-67b3755edf6a@linaro.org>
References: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-0-67b3755edf6a@linaro.org>
In-Reply-To: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-0-67b3755edf6a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vq9kQDucZZaaXMppqui404uEJ0q8knUSeXPUQx+QAE4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmlkEqeiPZqFxcVJf435dyTwarvH40M/d2lT188A6R
 ERVSAGCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZpZBKgAKCRB33NvayMhJ0aQ8EA
 Cae9yseauSuv+Sc2sElmVdyGcH5OZLch0jEx6ZE5vTH7ub8TTUJ1YKK8N+WT0xacYyx/4oDp0REcBc
 o86Vn+LUidpvhFNw7XGPex+l711WD/xbSnwMg48TotUz04iuqqb5m/kb9YpjRLGXiQwg9AzcJI9pZO
 H8Rslfbni+wE3cg2f77JjzvGIzJLu4P64+GlG3TdVenFPq90g04tXP0fCp9EQ1y0fIZA/j7oBvkZJr
 Lx7aFY0bFkscjvA8eem/ahlJJhfFX76Qns5I8jZN1dZAhrPidPAbh6VQr8dWtfplfpQoFjcfU20zHp
 teMSNFP7Xa4T0JnDdWj3Yhvh1niidm9o8wX56Yjpi/fb3Cv/cS1+3p70NF5P1W5HfPW7ScwrpXMMCB
 vlMlQHH7jjZHOv/cGG2EFXWQRjwt/w7ODcEXn1XNUX+Rjv8RPvLkXi+VQ94tPe/oXf5Kgxk2/ZUG/p
 mEwNrl7j3g3F6lGzQIxof1QVrV+E/S9CyrWDR0niMCZuoeA6N6xsP69AYy0VRfgTqXpw/W4o43MvAL
 ekr1R24J5NLQ6pKRjZ3Ikmlxrf3Lda+BY9OSnx5QSyWsiu6Mj+HPKH+V7U26+haVxOKZ19X5wTsuSO
 ATfCKtj7vUVg8DdSvzjTKVdIUSqpTM4kYC8OSbgVByz6jhgKtyRY68VWv8Dg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Change the HW model in sm8550-qrd.dts to a one closer to reality - where
the WLAN and Bluetooth modules of the WCN7850 are powered by the PMU
inside the package.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 774bdfcffec3..6052dd922ec5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -219,13 +219,10 @@ wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&wlan_en>, <&pmk8550_sleep_clk>;
+		pinctrl-0 = <&wlan_en>, <&bt_default>, <&pmk8550_sleep_clk>;
 
 		wlan-enable-gpios = <&tlmm 80 GPIO_ACTIVE_HIGH>;
-		/*
-		 * TODO Add bt-enable-gpios once the Bluetooth driver is
-		 * converted to using the power sequencer.
-		 */
+		bt-enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
 
 		vdd-supply = <&vreg_s5g_0p85>;
 		vddio-supply = <&vreg_l15b_1p8>;
@@ -1175,20 +1172,15 @@ &uart14 {
 	bluetooth {
 		compatible = "qcom,wcn7850-bt";
 
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_s4e_0p95>;
-		vdddig-supply = <&vreg_s4e_0p95>;
-		vddrfa0p8-supply = <&vreg_s4e_0p95>;
-		vddrfa1p2-supply = <&vreg_s4g_1p25>;
-		vddrfa1p9-supply = <&vreg_s6g_1p86>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 
 		max-speed = <3200000>;
-
-		enable-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
-		swctrl-gpios = <&tlmm 82 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&bt_default>;
-		pinctrl-names = "default";
 	};
 };
 

-- 
2.34.1


