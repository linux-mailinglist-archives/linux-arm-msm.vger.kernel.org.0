Return-Path: <linux-arm-msm+bounces-77066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2890BD6CC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2403AD46B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4928243374;
	Mon, 13 Oct 2025 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaL2RZzx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF7F2D780A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760399719; cv=none; b=ngsAqqzkTOHhq/e9EyhFYk4mwf7k0799ESx0NAZbYUG9u6C0wICLynqIbij540/JCGubUhWItF0EelSfaRv+EyGwGKaJupjWgTUivdYC19k26a9rvMwteSofixd1yhd0R3QZiSw2idgcawsZTKoJXCfWafYYgrJAUYkRsx3oNgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760399719; c=relaxed/simple;
	bh=Df980L54ms5GjOVdXcHa9S2VzaB9Zl+UozeGBw/fseQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9GdTRD2BSkjBds074PBobScJG5YAF4o4UrKGfMCudQ8lpptvtRS0Ug9nbJTcLGzTD5Ht8cfX74EJc5r1btw5YQnOHR1NHSMfEG6/jNCTNFXe4vgsW/LJnfNr1nM5GBLo/FpG30XnaPJjLv2M4XsK2NdBjz+U4sjc05uJITjhBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LaL2RZzx; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57e7aae5af9so803991e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760399716; x=1761004516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gKOrm+tCImTyJaklLPlljFMcPfGdKRp64lsD1BIpYU=;
        b=LaL2RZzxvAzuqsBN9Rfnwf1HWMRUSnW8Wv/4YvNjsE4wb0hWbl61yUmFDw3LSiTrY3
         r9WDQZUtjYOpfIMiXkC+hD7yTsF4VzpjkL4RkgK8uCZy5Ero6TtywqdnFocqE1MOydxp
         1XELE8+1amVfDNOHvze1/pGlxHDJcZXqTQJz+ShQqkPIJV41MxmJms0FggnebEiV4EhP
         ad0r3db6QcmrJFqkpO4j9X9ekwaKoViiqrcgwAhEQh/EOkC9oacFDtqSSuYOJGFVaVmC
         xLkI25uxZVwZlPw0AZMgNK/FSrbFu/rvgM5olPrB23cDQ99OQdClbAqHwhnhk+8KU5oh
         DqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760399716; x=1761004516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gKOrm+tCImTyJaklLPlljFMcPfGdKRp64lsD1BIpYU=;
        b=UmkPb9UE75qAE+c3aRXJ/OSGXoLs7NhkC1FNQ5oLzSYL7+KpEnmhclvVc8XRS3/wrP
         DRZ0iKPuD9ZXfrMZh1Z/g8zl59c2RhSH7MrrfWME0kn1CXiaCYIcFusm6tjjrns9VQwL
         DiWSWDR0N2Q/9j3UxX3zZU4En6KSoy4izcHiGOl7v7TxucH7+MJ+zKtDu33WTl/V1sS/
         krIOFtCsQfT+Cer3M31upo1yGL6nNFaxFMNDzZhwXlT3pqma5fkXijjsJdbdEoUzXJKv
         r/bHOoAnaeaUlrCsUcuvMgdcY7C7EBC3kYPyR5Yd+rXZbLpR+8AUk/XJfL0gnv6BmImZ
         Dwrw==
X-Forwarded-Encrypted: i=1; AJvYcCXARNft0htO35cTuuWE5NtcprE1G62q0K+bUFkef8Zz3B9yKHucN82hc6B1PoQ73MhdUMo4HGClKN8qyzN+@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHjjCezp0Ia6L8dvpxKn4OtsDRxO1ZogzMkd4fFmCrIOwmsJZ
	OxHKObN4pM6hyas9ZRE/s+h2+1I4yD0w3YKNQlt75pWcqZ9PWKdrjI+4MDVwj/dRq8FRZzBbbi9
	172Xh
X-Gm-Gg: ASbGncufaez1m4zw1Og+Xq8A4enmkj3KakLdVn7HeLy5I5Y0eYofW850wtk+VDRxleQ
	ICAS2ui5WwA1uUsTLp5QX4ZA82ooRrl7og+Xy5dHZ9MXweuSC6jeq8Z9BZ8rzPadVLMEHDasJV4
	Ndygr2vXlwyD3rV6I3kv2VecMHIKq1zIKSYIVCq5vrc2z2RHCY5wuuIbMZ6nyoeZjJckeDndNkX
	9DCiOPERH/eOJ+pmZyano7dENieCu5ewWfEHlgwioWurQjmRQhV473GWuvsF+kJbZ4weSbRK9m8
	sUluK/O5Da5Ke6sVAj8n0oBHmLnL6coZ2X5wACmVpMBojv2m2M3k8rsZNjos83wpZHsypg229Ll
	M/fA0INY8LwZOUKerPxTFQCaImyj9n01NSizoDxe27SAaq0Jn7DsR/t/H2x73Ys1VuTD5aVrxVN
	oUF8mt7B26pyZdo8Mhpy6ibsk=
X-Google-Smtp-Source: AGHT+IG/iQgh6tA8Db1h3Pgh7fOMKR/cnwkef9NgnTwIUXo4O2+jmz1y7xVsiJ7GbEYwbzi+FdD+lg==
X-Received: by 2002:a2e:a99d:0:b0:372:88a9:2d83 with SMTP id 38308e7fff4ca-37609f7e907mr34153031fa.8.1760399715681;
        Mon, 13 Oct 2025 16:55:15 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3ee2asm34880741fa.50.2025.10.13.16.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 16:55:15 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm8550: Add description of MCLK pins
Date: Tue, 14 Oct 2025 02:54:58 +0300
Message-ID: <20251013235500.1883847-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MCLK pin descriptions for all pins with such supported function
on SM8550 SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 144 +++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7724dba75db7..52deabc0bf12 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4277,6 +4277,150 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 211>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam0_sleep: cam0-sleep-state {
+				mclk-pins {
+					pins = "gpio100";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam1_default: cam1-default-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam1_sleep: cam1-sleep-state {
+				mclk-pins {
+					pins = "gpio101";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam2_default: cam2-default-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam2_sleep: cam2-sleep-state {
+				mclk-pins {
+					pins = "gpio102";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam3_default: cam3-default-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam3_sleep: cam3-sleep-state {
+				mclk-pins {
+					pins = "gpio103";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam4_default: cam4-default-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam4_sleep: cam4-sleep-state {
+				mclk-pins {
+					pins = "gpio104";
+					function = "cam_aon_mclk4";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam5_default: cam5-default-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam5_sleep: cam5-sleep-state {
+				mclk-pins {
+					pins = "gpio105";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam6_default: cam6-default-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam6_sleep: cam6-sleep-state {
+				mclk-pins {
+					pins = "gpio106";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cam7_default: cam7-default-state {
+				mclk-pins {
+					pins = "gpio107";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cam7_sleep: cam7-sleep-state {
+				mclk-pins {
+					pins = "gpio107";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio110";
-- 
2.49.0


