Return-Path: <linux-arm-msm+bounces-43623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CC19FE5EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA9816234C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E601A9B5A;
	Mon, 30 Dec 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFjfNf04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982E1A8411
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562696; cv=none; b=ZZAdjwaOrs4S5c0CKCBokqirCcr0+bmjqOqreG/2QzIB0dXEJDRlsxyfw3rO9Fq4nwuStectLgwjGpHfxdJ/ia0VDMDo8UNKpPLIe7r5SZrwKeFBAl9IiMZSkS6jojriprabIb5qTFPTKAC+FJc3Ie22bqqf/2ucwVWmas+4ZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562696; c=relaxed/simple;
	bh=1twL1R6+Gz6p/VKm6pQxuF5xcNrz1voVT8gEwVMUkrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A71p7U2dw3eJn4sDZ7u149S7ijZc/9w/xsfa1F4l6A7MWV8oaRGUXhVUrGTgLBS6jHobaZskpbFC6yXOyj7JFf/54ON6PDOwN6e3pmellIboTmbzjIIgXNh3YERzyTKdMKqWM2YIEPMjWsGb7DBhmJwNXNmuQw2u8nvEEojOc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFjfNf04; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43623f0c574so61594695e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 04:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562693; x=1736167493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zxzmfN+S+EqwXDEGQufwjDgqTqyEKpfp2+VozhCeAc=;
        b=uFjfNf04Ik4uoyH6prnROdFh5ggoLYOyCwq8lF2kz6Na/4dSNYmRqKRDTtgkHT4ROB
         dZJ+eiWY25DOIMr10VwTwkF6Ff2CtNzHHKRISQb/oG0P7HkRmhmNGMbVgo7LPvfWEkPx
         ifcDc+dECRdLnmId1CX5bU6Skv2mXwM11/CqEKOc9gdqB7ZzxJ9iUdHTDnWSfAIZjdXR
         SUvv1so8Sten7MroJE26VHKStmpNsWlCt4Bu6VzphO9IywIiZWEl7HgdLNOCyNU6sSmb
         gmGtcUXDZTa98m/3VRcrEUtkXyM7sSQ10UtsTskytczFL/1HG3NIq9y0LmaArTmmCqfR
         ms4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562693; x=1736167493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zxzmfN+S+EqwXDEGQufwjDgqTqyEKpfp2+VozhCeAc=;
        b=BYmVjcYMfyAAuJHPHeqHKaJ47VhRsDICtqhwvIDhrw5EvhyEXIB/IhWui374J+JskZ
         MNVjG6tTLg1rM8k2ikYID2iHARDjhztR7TEFDFeZccuHSZEw0mVTLN8/wwv2NoLpc9Yx
         pid9zFBx0qzq8FvlHxeJHKsCWx7J98qgJtRJHiOIvDY0Uq5cvN9j91AvMaVzJBEhY22m
         6Z8QuetSJDDi6csgdfXkVhJ7vBOWQzE/UkNaO6ZdTe5687nfMel1DayM8RwDtTPqt4Zt
         g3FjgyHfeQCWU8ljGEBzKmFATA3LagQNHXop1Vc7FnXF9Y/JBjywzDKsSxq2T19dgFjM
         1FDA==
X-Gm-Message-State: AOJu0YyDyhTssBxzLvlb9QM95/jzGm3uAgoscu91Bt4sR2xxdFH/IEf6
	WyRVdkXGzQMLY4PCt++6dOaLh/PhDXv4n0RKyN4M+kq9xF/XE+PG7Wu+Ejl6XZE=
X-Gm-Gg: ASbGncuMHOZ5WvxWk/9c+sMMyaa/cphsNzrbHdt0/mkBkGKodnIQHEbjh1WGRUl+3Md
	es6ZckYAMgPSM2lVlyGwbDZNDbYr0FMk72QvWyLvfjP1ctFs+q82Xg90VZgf4URndTSHWpoHVxS
	cJyeKMF01MI7SfEgTtFV2/pIqU8dvPh2vqLn1ap+90hXMuUEQ/OGnoripXI0V5ohRe6jnT1tds6
	hcwMxV16XanfIthLvks0LtMZbfj9wvZwxsaz1bEkBN/lzGc2BOv6WUQwx1DQM5//KZu48TMfzUG
	dQ==
X-Google-Smtp-Source: AGHT+IEofBUb1zs6VJBgdMv3fHfb5nIMgMaWaxPzn0kbnVaxnMjcoobq1d6KAl0JRI0/I4ZgXayOJQ==
X-Received: by 2002:a05:600c:138d:b0:434:ff08:202b with SMTP id 5b1f17b1804b1-43668643173mr316610935e9.12.1735562691184;
        Mon, 30 Dec 2024 04:44:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366121955fsm359913215e9.21.2024.12.30.04.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:44:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 30 Dec 2024 13:44:45 +0100
Subject: [PATCH v4 2/6] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-topic-misc-dt-fixes-v4-2-1e6880e9dda3@linaro.org>
References: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
In-Reply-To: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1twL1R6+Gz6p/VKm6pQxuF5xcNrz1voVT8gEwVMUkrA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBncpW9dio26gXaBHtFhv5NsMh61BNHi55g8yAYKLA6
 1rYgWJGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ3KVvQAKCRB33NvayMhJ0S+zD/
 9uH4Cor6MPmic5ikGxMQzk+NPlE0uJDsPttlhXRvqMfvFmtn4zDqnaIMPcEv2zjwYAkeAQOrd2VvFD
 yoFsNeJ81ecYh7BKb99Ju60DlB5r7iWCOEVQd2Z4gyY0nEiHL3NJAuf8M4FANqGmJWfmhjysJp1rls
 fnE9fZT/S1GCj6n8U9BDPhpE+hHa249Y/yr8tmAvPzrASVKbwLfkhF1w4dZOPKpuCEfuSIj5XFN0Gq
 JngLZ6TSGTn9f7L1wUVEWReo/sruWVCisLScRyfv4vkC6LBJfGnr4Yn04MS75FqOqeQkilW0xnuxVV
 IxSu9fwD6cFR2gY1p4w6CNEzo8p8puk2f/kSQSU2HUdiHltXOGDIZTAzIjrnBV1Br1Z9nO8Mro/SRS
 aEwzt5ttYKFlxWnUVXjhWWrHYYDQkuh4hjxCc9dgPzdgmMAOhFNwqsz0KA1MhNCx8doBnjHKMwn+II
 dFlfME4HBc+2iykSBBzQfq0xaF3kQdiev8lItIRR3NTy9iJ/2Oa0vA/+YufuaWNGBKmZ07Cn0Iy0BY
 usNPeVsK2ljzpfKw6pffiq8ZdsHI217QYp55/M+COW/PvlfKE42MPN7a9MaKR7OcTUd54wI/X1nhgW
 UB3z9OVWSSeYatoGlYunSJoxia1LCa2erxPujYaoYjZ65wFQNXoiH16tgaHA==
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


