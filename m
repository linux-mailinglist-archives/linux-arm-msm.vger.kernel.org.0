Return-Path: <linux-arm-msm+bounces-3320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939A80394E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C326B209D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37402D049;
	Mon,  4 Dec 2023 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sF4kk+al"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A937BB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 07:57:50 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1b03886fd7so213561266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 07:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701705469; x=1702310269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IE69eKUaclA1I+ClHsriNEM4oABBoVrGfcljQTrsZuY=;
        b=sF4kk+alDLkd/hq4ZWOvrArvd/VYEFkfWaf2yGMgy3KinMPvfHjGK0n7iU1hs5JmZr
         KVV8j1r/bjj9fbOkeKW+YeZ3J+n8NStpvo/yH7w9nyQloXR3+abOCDeGDsieaPCA28Xu
         ZOP8b+er0sHEmPIjTlN/MlUY/eoi1T/FILtiAlSB+pTNlxT6ODFkhqqXkzEs0eV/gEsc
         sHJdnBuW5hhUCAfGJllruIOQ7pd0An9b0oTvzvuKUDadZ4l1FOzT2ExDEwH6cl9zG3LK
         gxUfxj73uQK/m5hJ6jL6og6NSQ1DTGTt/bgBwcNhEcQVy8UQKEBKOqbwVfo42HxB6M4C
         2XRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705469; x=1702310269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IE69eKUaclA1I+ClHsriNEM4oABBoVrGfcljQTrsZuY=;
        b=c0/bGl7DeFqx75HJNC3sHO5FXwM07/XiclKygjCfu6AGdKz0Em3Jl9XZU7gWYGyw/R
         qkv64QmGhfr46SVqBNrWvPQRFQsJtA0X3e6Ze2kYcbpCxEHsiy5Pth7G94qAx0SHrFRz
         Wj5zPLampk+/1DX0TMmqGOppyGD03PZKGR83q20yV7WFkjskc8HEcZ9xeoaENJZOtcuB
         5N/XxgZHzlTdfMaDhwqaFuxAWxkR/h77NjYc70NYoRdJxYQE2buwFsv6EW4Mj/IuHxfm
         MljFgEuuG8kVR0cvQnUMKmTbw3I3ta/MMBMD4CJHrndXQM0CsMeV8UqvfWuoZug2s7la
         KGTg==
X-Gm-Message-State: AOJu0Yxtyn7yFuXY5gddLqokV/phZPr62oEL0FSXDYkdqVt/gLztaF0T
	v4oG1L8QvDls5pdVIf1yY/SpWQ==
X-Google-Smtp-Source: AGHT+IHOI+4vYdxqb5izumtihzMzU/uShXgmoAJB4b1wtT+GLPyhUbfA4tz0MAun8Cc6GYKblWuxng==
X-Received: by 2002:a17:906:3f88:b0:a02:a2cc:66b8 with SMTP id b8-20020a1709063f8800b00a02a2cc66b8mr2881716ejj.14.1701705469161;
        Mon, 04 Dec 2023 07:57:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id q19-20020a1709060e5300b009a19701e7b5sm5429304eji.96.2023.12.04.07.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:57:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 1/5] arm64: dts: qcom: sm8650: add ADSP GPR
Date: Mon,  4 Dec 2023 16:57:42 +0100
Message-Id: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ADSP Generic Packet Router (GPR) device node as part of audio
subsystem in Qualcomm SM8650 SoC.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. bedais/dais order (Konrad)
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 41dfa5e19a15..8d327f83edc8 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4326,6 +4326,46 @@ fastrpc {
 					#address-cells = <1>;
 					#size-cells = <0>;
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 
-- 
2.34.1


