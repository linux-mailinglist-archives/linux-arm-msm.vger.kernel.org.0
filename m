Return-Path: <linux-arm-msm+bounces-2464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC07FD7E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 14:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C64151C20BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A177200C7;
	Wed, 29 Nov 2023 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CinnIAUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3DC194
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 05:22:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a0064353af8so175864166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Nov 2023 05:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701264175; x=1701868975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlzLVTMs92fwwEwaB8T7DJx+dwVSGFo+h22EKZkAkLQ=;
        b=CinnIAUVBQ+UDUoGmPVrk7UjsVmNH4gNa5Y+8nq5WB/74dqqDeDfAy1mfYTdtuLHW0
         u4bZotmLlknbf+PyDrkRus4rpaB5OiNGuXxoWy5qE9vy0a2Nj0D60tErPgGdGIuxhY3A
         Yr/TRuHAGId/SHkI/KRWV3dtYXWU7usOnwgPoQFPWpgjOIcXGDY/9jykTBs+MLS/YYzY
         JfUata8pAgnJ9/mxmGnJ5flSPQD/dK2dv7+PuIJIOTb95rdBc/SJV06cRxx0VckzT0du
         nfxZuUysEacNAJ9op1nIMt9FPlpGNlBEtrGc+z4ZEwIyK8sCqvpdYkUdEeevSnIBMv0x
         vivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701264175; x=1701868975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlzLVTMs92fwwEwaB8T7DJx+dwVSGFo+h22EKZkAkLQ=;
        b=q3Zzk0ftVPMxBXIervej/6UqeqKhshxXE3QyA3rJ+BgmEFL4KHdyQ3Y01STUNZ5Bhz
         uid+Jzy+Ij0i+6Q5kNflKUy+Cx0+UDneax8LSslb2TT+4u2GWr2QlTxU045q6nCN2WZG
         s99lbZy0SINaxqJs9PkkEotCNyqW7cY95JXpalQCY+ewcwnacdmVuQqb4xdXpkEGMnHU
         sXkSeNCk3ArilY2JohWp9LqRVKePbysF7mkECDy43ZyZiv6NnIvcT+JVXcupmcwlaJkl
         ZgNTBdJFHeNLHo9kS67jBIUz/SzuJmukG9M20KLHLyxvMRnx3w0zvhd4IKvKTH5v+oco
         6mPA==
X-Gm-Message-State: AOJu0YyB0N6WIHSoynz6+fo9vvRH+QZwd9nYg2JbO+R5ZpjDaKIRm4jE
	bFWs7+4Vmi1i++wF/2qbG+d9nQ==
X-Google-Smtp-Source: AGHT+IGRHjDlG833IMCkZNY8/R8yds6YdmKWjfneh699twb912CYx4++MyR+8Sy4h2rKSfvTh8Z5tQ==
X-Received: by 2002:a17:906:2212:b0:9fd:fdae:a9d0 with SMTP id s18-20020a170906221200b009fdfdaea9d0mr20603479ejs.5.1701264174985;
        Wed, 29 Nov 2023 05:22:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id lb16-20020a170907785000b009fda665860csm7844842ejc.22.2023.11.29.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 05:22:54 -0800 (PST)
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
Subject: [PATCH 2/5] arm64: dts: qcom: sm8650: add LPASS LPI pin controller
Date: Wed, 29 Nov 2023 14:22:44 +0100
Message-Id: <20231129132247.63721-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129132247.63721-1-krzysztof.kozlowski@linaro.org>
References: <20231129132247.63721-1-krzysztof.kozlowski@linaro.org>
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 9df79297dad7..e926329cf3f9 100644
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


