Return-Path: <linux-arm-msm+bounces-1962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C07F8B06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 14:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EB361C20CC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 13:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2205A10A08;
	Sat, 25 Nov 2023 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZJHHidH1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A005B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 05:04:49 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5441ba3e53cso3703131a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 05:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700917487; x=1701522287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG/eml13csvxIp1oMDXpaSHee6jGTwYfsVkZCG1NSN8=;
        b=ZJHHidH1Yy2ivuHaeobn7Ya6+3bpYvRz+2lusm/N9325VBQT5IoIuEfs3HbXO8SedU
         yAUsEQm+s9XatiUP2B3gBhGDWqS3rzozq7CmL78un284P0MCjoQBlfYzoZbF3rL8oVJs
         vJ84R8OEbLGS+qcCeJHpemce37ZEFbQ91dZmdbU7YLtdSPzQcXPjh0Zbw8OB4USTK6ls
         R5O6JrK8UUk10gF2bmoNd/Wp4gl3wvsjPNgtv5gYATkPSMJZCp5SX/O1tsiwDG2oCs6N
         LjLUMsPZksmsiQEPkZdpyJYGqca805zr0FRs/SzzN6NJM2pffiv+JPrc798o/ojFqpoV
         ybaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700917487; x=1701522287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tG/eml13csvxIp1oMDXpaSHee6jGTwYfsVkZCG1NSN8=;
        b=XErzArofFD2daM4GmeQ3H/iY/Ov03cZw8e5l3TeMFDVDOSijMVcWVn4T94BMyls0Je
         aFlD370xcogXRByIHa1zr/dNiTA+DxzDfA5YpUI7wU4/sBKSjdOulVanDFrFwqLup2M3
         IuX6j4OKbeKa0ZM02cnUgqPWZSr3I0B5RSfpjdv5YTp9wN06kFsvN6Qz+O+u5UMJuc01
         LrULpvjhnoMFzOJl5npTcp46l3yYyX8Udi0LAm0ZXqbPBdsM17+1BUcCGQN43VFj9nnh
         Xpysh3c7ACf6F24Z0he6CbBxzqeDGL1Wel+bozMIJu6N7KhKAEwteGvs1C4mvIsKLjeR
         3M6A==
X-Gm-Message-State: AOJu0Yxy7wpWBJnjTQlBgYxfXDvNSQ99OJzMEU28vozQWH24SMoczOna
	JjOtwp/nZF/TDLu0ixV2jCCZpw==
X-Google-Smtp-Source: AGHT+IFZ8BJ+hFI4/8Hk9cOsZZnX+jYj9lDMvy3fZah/QP9aqB8PdmR2cvxzNhg+etXXKRfWitpc0Q==
X-Received: by 2002:a17:906:b20a:b0:9e6:4410:2993 with SMTP id p10-20020a170906b20a00b009e644102993mr976066ejz.18.1700917486865;
        Sat, 25 Nov 2023 05:04:46 -0800 (PST)
Received: from [10.167.154.1] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b00a0290da4a50sm3433750ejb.186.2023.11.25.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 05:04:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 25 Nov 2023 14:04:41 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sm6115: Add UART3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231120-topic-rb2_bt-v1-1-509db2e28e70@linaro.org>
References: <20231120-topic-rb2_bt-v1-0-509db2e28e70@linaro.org>
In-Reply-To: <20231120-topic-rb2_bt-v1-0-509db2e28e70@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700917484; l=1620;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=kYyiyFCu+n/yVlnn1CSwFTlalzCOHYGEMtzMtZRhGhI=;
 b=G5ebID7d1aULu/2B8nMXlCvmpQ9JAsfd1g4jYrXsg872o8+HCNHRlvntlEVOWAespFq8teleu
 0hr1msx4m1PBQoDJGHIkxtcp1/b85oaYbPPAgOyt5sHDJjKxY0wT37H
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Hook up UART3, usually used for communicating with a Bluetooth module.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..0d13d7bf6bd1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -273,6 +273,25 @@ memory@80000000 {
 		reg = <0 0x80000000 0 0>;
 	};
 
+	qup_opp_table: opp-table-qup {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmpd_opp_svs>;
+		};
+
+		opp-128000000 {
+			opp-hz = /bits/ 64 <128000000>;
+			required-opps = <&rpmpd_opp_nom>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -1208,6 +1227,17 @@ spi3: spi@4a8c000 {
 				status = "disabled";
 			};
 
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+				interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				power-domains = <&rpmpd SM6115_VDDCX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a90000 0x0 0x4000>;

-- 
2.43.0


