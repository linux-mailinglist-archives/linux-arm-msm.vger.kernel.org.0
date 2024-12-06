Return-Path: <linux-arm-msm+bounces-40764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5049E6B70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B77028160A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D751FC0F5;
	Fri,  6 Dec 2024 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URgUEn3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AA21F943B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479985; cv=none; b=Ac20O75tzsLsM6iNZlo9nV1XmLwKUwsNBdKS8THteAvrbTAZhjnk/oiaS3tmSXAZhD+y7nGpGeT+Bf8l+JArY7twi13JDQXpuZS1XjmDDy0ngfrhKtVrcYgNrO7gkX1mdan7pojK2prDvIztrNT0km9rcb/szuLOXAdE1m8Qibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479985; c=relaxed/simple;
	bh=iFi/F/6SDkMbs3FLKC847CfXuURF9MluQ2AJKvuBTQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCEvbW7dWU7+Bbarz3ntmzWsjLlpwZXfSN/g8WS3V3RdQHVCW94pmXsUHDruX8K5uHdYtFHIktgxJF+ty5+BDkC4rN5nmc7MhOQw8cPvJJeWuy/IgWT2VNBPXnLwKHxDxmreUsTqTvoMkGkJWe1ld5+dyXqBm3dXIY2xO9HJ5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URgUEn3b; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso18511605e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 02:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733479981; x=1734084781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PiNaI+58XsVknLA1Lj1zNnrtDeSnTdMypwBV7C0twA=;
        b=URgUEn3bh1GdZv20g75NnuvnCpCyP/4Kmf5YaRVtKQFR4IWgg1GkJKxN9kUnY/9LMf
         /5B247lcIX9an3qEPHBM//mOr4tCwl5+kzhr2Wuf7jRT+Ka3oxlFwFEomh37EFsTyYHo
         eAywxRl8YLpkJZVSh00aymXMKFP1zKl09mhcW48a+18lunJjAmuMIJjWCZraGVNUWBL3
         6Jc5U9Rnf5rk+mMWdVbkKuWnSv2YV+IliA1xUlLDvWpln6KIB8HMby5VM6kTdrhq46lx
         iq5OYc9X5jYk91HzotcLl0EyxRPtl1bt+PY4iHZxff21n2QlOD0nJ83slw0mcB/8xQ8S
         Bxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479981; x=1734084781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PiNaI+58XsVknLA1Lj1zNnrtDeSnTdMypwBV7C0twA=;
        b=n5MGHkq6tUFRgwecW2T1Qdzc/5JPz4t/S6EurOajc6BfrdqK2Jam+klTbFsKBthotg
         hT8mcGM3ahTw9HTZhOfEyGCY14UwkBKvrPwvTATF60KsMOA+PLGJ48UL5dqTtbERWhC8
         1qTlwy2kgmQOowqE4gNlD0LqVZXSF4tIrS5KoMeqzCsoYvPqahLcsq7HnPVVkZKXbgcf
         aqYHCkVg5Da9fK6xY7J9Zm2/8QQ+2SDmGeOT/xeT+PqAVQP/1ulA7qk4khMms4tPrOAC
         Yn5eDICql02FKBOl2UmjkJ2foNK8v0RnbliByWG8HF3KoeZoQjLZXE3nVxeeHEhk8EwB
         BKvg==
X-Gm-Message-State: AOJu0Yyr0S5mtmLchPjKKdRoRZI1T+IfobL0qDxoScOhiD0jdorZHDcW
	iCT7OMskI5cn0BLQOAm+Gj0xYgCdsve/h9C/l81w4RqXGK0/EcK77pj8wsOYCto=
X-Gm-Gg: ASbGncsPDVPyKRNcbW82P9OF5Rgzt/PSZ9NtRdGsl59qQ4r5SitSlPFGJc1CwlLUPCb
	iClBT/d8dsaqL2zBFafjfeVLOKZxa/jNIZmG0mq69uw4hIAMnZ4wMLCkpq+sVxTLY7t6j/0owbx
	1j8MKa91dC6PRb8YocZGEzJzPMsAD2K/WZZxZovzM0ZHrcMvS1w44uwVtBYETwDNOwy5yphpRXn
	2O77y7lh9F3X0ulmcpRAMl97DN7do1N3Fr3PHqFW+Ju8ubs62S5Jo+Pz6tZe4eJ/M5f1m4=
X-Google-Smtp-Source: AGHT+IF8mGdVRFEzsyhKWsVjHHeYJhetdP7wKYZ028fcd0HA554evJK67OG21svJjUakrajgt1UO/A==
X-Received: by 2002:a05:600c:4f87:b0:434:a7e3:db50 with SMTP id 5b1f17b1804b1-434dded6701mr18057635e9.21.1733479981310;
        Fri, 06 Dec 2024 02:13:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm91092035e9.32.2024.12.06.02.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:13:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Dec 2024 11:12:54 +0100
Subject: [PATCH v2 2/6] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-topic-misc-dt-fixes-v2-2-fb6b9cadc47f@linaro.org>
References: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
In-Reply-To: <20241206-topic-misc-dt-fixes-v2-0-fb6b9cadc47f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iFi/F/6SDkMbs3FLKC847CfXuURF9MluQ2AJKvuBTQs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUs4o2mNSJr0wfdtRl1enbEggIxnsm1NH4Ai0mYW7
 m6RHYziJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1LOKAAKCRB33NvayMhJ0SWeD/
 4vGcuv6rOxLOGC7g3VkmfDUKMVU/M5eD2QEcU3JggqNQmWx4ExEecOgv47nhuB7ERmTYZ2euQj5Pa5
 EI+V0lKc0wBiEIjJWq3zyImsA93XfBLJxSSVX7cpR0LqwjkZPFVdps53pPWDWxQHCY1zswqARD3Vg2
 JkT7iwk1AzIALZg58mSAKYyi/yuJw7MLrksWzRIM832QNj+8Mg3yybaKSfQ1Pywz2jSZTgI06r7qV3
 UEJQeSrFJy35tNpVkkDEqOwk6EMU+44EXDSX23GOt4wEidC1NeZa/QGUpc1T9kgdaGFkOFV/hCdDEf
 Z38/eNcil2n93rw2JJiJY8HrxdNEQa21N9cBO09koXmZwFyVEYFQHlNAPPidYuFtwIG98Jm6e/pRNf
 rPR8QWs4wlmWBCgR0ZL4G5Ssq8C2lc4yPfC36AD/V+vKdSyrPY10yLn8iRrg+FYkC0aXYUsyiLWqYH
 /jaatflqAteQxxkBiEKyEasDZ8n4n/58qbBU1+ULOCpbD9JISPpFaYLIf7rzMLa4ajkAHNNvOBeIw4
 HV6rNiYBNC9QidOYtf5C+8H2xxTZR5VTa8rjz2DtSM+/+BrJGjd8Bm4sheikegEU+S1BgBInTkTJsK
 5dcZPrCrdWMsH5tg4eHib7Z4nQQWiydRDmlPNvjlWryzzCMBiXil8G6I+yzA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The ov7251node has bindings check errors in the endpoint, and the
camera node was disabled since the beginning. Even when switching the
node to okay, the endpoint description to the csiphy is missing along
with the csiphy parameters.

Drop the ov7251 camera entirely until it's properly described.

This obviously fixes:
sdm845-db845c-navigation-mezzanine.dtso: camera@60: port:endpoint:data-lanes: [0, 1] is too long
	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   | 42 ----------------------
 1 file changed, 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index 0a87df806cafc8e726aacc07a772ca478d0ee3df..59970082da45203311146cc5249298f6188bf67a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -79,45 +79,3 @@ ov8856_ep: endpoint {
 		};
 	};
 };
-
-&cci_i2c1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	camera@60 {
-		compatible = "ovti,ov7251";
-
-		/* I2C address as per ov7251.txt linux documentation */
-		reg = <0x60>;
-
-		/* CAM3_RST_N */
-		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam3_default>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
-		clock-names = "xclk";
-		clock-frequency = <24000000>;
-
-		/*
-		 * The &vreg_s4a_1p8 trace always powered on.
-		 *
-		 * The 2.8V vdda-supply regulator is enabled when the
-		 * vreg_s4a_1p8 trace is pulled high.
-		 * It too is represented by a fixed regulator.
-		 *
-		 * No 1.2V vddd-supply regulator is used.
-		 */
-		vdddo-supply = <&vreg_lvs1a_1p8>;
-		vdda-supply = <&cam3_avdd_2v8>;
-
-		status = "disabled";
-
-		port {
-			ov7251_ep: endpoint {
-				data-lanes = <0 1>;
-/*				remote-endpoint = <&csiphy3_ep>; */
-			};
-		};
-	};
-};

-- 
2.34.1


