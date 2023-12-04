Return-Path: <linux-arm-msm+bounces-3321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B056980394F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 16:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E244F1C20ABD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09CB2D058;
	Mon,  4 Dec 2023 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X22j2NGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864D3CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 07:57:53 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bee606265so2004945e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 07:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701705472; x=1702310272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQOtEmHXb0hG9Hj++5MR1VfQrm4gcBlK+VGaFI1BUhk=;
        b=X22j2NGbBi742hi7tOQYqnMAlAQO4D9dt2jStfN4Ej3TuVd5caf5pT3O4BFGT3oLpM
         8lXnFqZapC254mPiUXe90/ilAjMTV4oWR565Oiuhsv5VRKtVsLEk4ObArIPt4jERyUAn
         eHo3kMtT5qo69WXw7j5qyjRKnUbkZkJbTAvYmwer6lZUCy0+AbWbxiNr1Da53wOPFTAf
         Zk+EVsNXxGqa7YZBO6lpzUJI+0i+JdipLNgFyfumE606U8gtrquN4uxulxBIwXyXVu9Z
         SC/DV2vayDERRefAnj/Ys8TNSMkq1JqjK18UFxzG8nSNKtyagEVXyg/vXA3W9Oy0y3XX
         L5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701705472; x=1702310272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQOtEmHXb0hG9Hj++5MR1VfQrm4gcBlK+VGaFI1BUhk=;
        b=B63Kvh8t7xeIdjn4MLrUXBrNX3WU1AmyDjBswhS1ThzXHi192RyXJD5tdqBZVW1LM+
         9T1WHytllcBCIKsKOji1YgRgqEkMvKF0EffvD5YizsX/1wKAYxQMT/A9u+84QKWUBczn
         N2WrvA8WCOC57NlrTuZ3k8+gh7klh45jLVD1xGU0pW4zkxO7s3/JtzXDWfT8BnhXp83d
         YGr72uvrDMt/uIGS2l3N8SbcOCT8wItV6rhy+icQ7ClTa9FeMEZvuaS+EPZ8b853YS8p
         ocYW66gYkO1rGuAnNiRyPCOvlzH3k92ADcG2RRf1XSEPwTuoSBfk8Awdkw1JO8SHhxfO
         QN0g==
X-Gm-Message-State: AOJu0YyvFHmZvuRsr4xBBHs8FhScUFG15Hsg+IN0p/HpU4FcCr2TBeuD
	4hqXH/6MWWA0FyNTYXL8FGcDqw==
X-Google-Smtp-Source: AGHT+IEx8U2H9+BCLXOYX4SoZsOC5OCmB9AgD7KUq+ArgqA7l+8D+5dasOTJ+EagrW1svXn+te9TxA==
X-Received: by 2002:ac2:455c:0:b0:50b:fdfe:11d with SMTP id j28-20020ac2455c000000b0050bfdfe011dmr420453lfm.1.1701705470830;
        Mon, 04 Dec 2023 07:57:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id q19-20020a1709060e5300b009a19701e7b5sm5429304eji.96.2023.12.04.07.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:57:50 -0800 (PST)
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
Subject: [PATCH v2 2/5] arm64: dts: qcom: sm8650: add LPASS LPI pin controller
Date: Mon,  4 Dec 2023 16:57:43 +0100
Message-Id: <20231204155746.302323-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
References: <20231204155746.302323-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node as part of audio subsystem in Qualcomm SM8650
SoC.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 8d327f83edc8..bef4582f2a26 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/reset/qcom,sm8650-gpucc.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2610,6 +2611,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		lpass_tlmm: pinctrl@6e80000 {
+			compatible = "qcom,sm8650-lpass-lpi-pinctrl";
+			reg = <0 0x06e80000 0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,sm8650-lpass-lpiaon-noc";
 			reg = <0 0x07400000 0 0x19080>;
-- 
2.34.1


