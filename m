Return-Path: <linux-arm-msm+bounces-50184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D4A4DEC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A2E43A6D05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80460205ABA;
	Tue,  4 Mar 2025 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d6+NaMNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B1204F86
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093642; cv=none; b=WGhcKooPktj6KDyrNeMuqVtz7A2CZtEXy0orpal22ornQzaOrkKH3B5l0mmqCkYGpIwysu+Dld2r4TzspdAufvkTq8tZk2POtI6OsCWrrB9IYP60fLEG5NZyObe6gDj29nNPlQjVFJHycstM3qwOsAbUa+oXKJbmxC5KQlK3Cb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093642; c=relaxed/simple;
	bh=TO/kj9+lLvHOlw6v676cGN2X1xrQoQT6nqKUEG+rBfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l54M6qJbrOBuT/8PpNe9UPNE4MeiG7bmSuuCaCiWAdo97opf76XBkpbOYrLja8SDO3JdhN/qubhXXOzv9oGTC/0bkeKhk8xOAwsJuXIO7L66e6R9tUpSO00HI/GHupOvyCODIzWDEGMI3EZ3mnd06ZhLqmrsiKb6d6yrq2awXfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d6+NaMNL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390eb7c1024so3223746f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741093639; x=1741698439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nln3oiv+wCOohYzCVrwCh2whMM1hc+Xd6ZxmtYAIQvg=;
        b=d6+NaMNL5ZdSTpfsrszfNjt3oZB9Sz7TxOp9XFxjI1WxUvQKqrHWZ1fU8AFsmSJSVN
         GR34CLe2T5F/1+T3IdwRjSPcw8iq9KmWAU/Hj+XdjpcUeQxDl73PocjucWh1BLfJchsz
         ZdMhOPbwlePm/Pj7M3Co6AuTxWndKOIidu8nmB5GjuegiCqnrCqxNslUJ6APn87zSUZi
         oZKhiU3kPzuuwUMNYYnBRd61yjjYhed9WpVTXNvRZu7Dbw+nhtMDqSEiqx6CD/foTPtZ
         D1J7Y0L8wUK97lBVzbpEYEXiSZ7ikGgk6E1WeBJePUt0fn+AeXWx6FJ16tbw6RFDGAHr
         C+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093639; x=1741698439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nln3oiv+wCOohYzCVrwCh2whMM1hc+Xd6ZxmtYAIQvg=;
        b=eaQfTIP31Q6KrgusbftMWknLSOJUUobmX+GvrlFbq2BZ8v37oTpd9U7YCmN5plRYf7
         ShRGwe2pV6edSxGOWUT/OoDbnY2guJzOQd3U5VQYl5Gg/5h+E15JdL1smVZMPoKGAGBT
         aK93XwoUfHy70GbhbR1aLmWdx7IdMVOE2/N+t+qcjNQR7YfMPg+cZK/tIjfYUxkG1HSR
         d85amk96c9yAiU/PiUkXW5KNdplQqOyYt8WvocloFyDnU9Mmb1qW0Mj31pNKfiQBE9vs
         DGJd0fZW1ZDap4usRKHNBzkXyFUqf9nTcbWaakjkvWHZWJ0vX8+ByBlBetCEO0nwJzu1
         ZdHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK5wj5/AoVoWriH2suMNDCs4KiAyhjR/EpsRXF1nzFNTTjpPfz/UpaaTkEkppzsqMip/4yDerXiWtfY9wp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw737TsD/SgMA9V9gGusLeFCtrRRGQL6Pnm7jGGYNmKuwSkxMt4
	EX2EBRamUdBDEil7mcmWjLZ/tcIO09iD2j2MLxTin57GbYG4FfjrFd+vzpNBfvA=
X-Gm-Gg: ASbGncs2rjhnWCWiAI0SjJ79b2UAvyBZQ7PV0yaA3U4IK2pNbpxvYn7cWF7s9tCS0J9
	CdbkihNZeBN4GR3Zf/aGUhf8u1Ynys8+EOzPkPPaEggFg0gMa1yokG5UvzzStdrL0cb4DuBFvql
	WK0VsDijHBp3epob+Qmj+hvQcNlv0PdherkGaD8kCIPJBmtGPcSkCkAsNp/h0O8zq4oD+Qmaak4
	D+FBu/dinTlgJNNjZ6zY+f6EJMklvgwl9wukceZMW0N8wluIvkQrAiILSkNCF2V6ZRAXZ2GUqQ/
	xaLyT2JutHHycqPo4aZpoMjqomkGW6ttAZWQpltIJJdIwSR5m6LFFVv5Wu3HfV3XwPtGupuJFr7
	szUxu0w==
X-Google-Smtp-Source: AGHT+IGpTFcm31h9EpuPbAm3YUIJaoJyD95IH89so3fYUNBg2B1J+FhEDae5gGh7l1PFPh0SPC0Ycg==
X-Received: by 2002:a5d:6da3:0:b0:390:e85b:a8ee with SMTP id ffacd0b85a97d-390ec7c6a2fmr13832592f8f.1.1741093638590;
        Tue, 04 Mar 2025 05:07:18 -0800 (PST)
Received: from [127.0.1.1] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm17401715f8f.44.2025.03.04.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:07:18 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 04 Mar 2025 13:07:13 +0000
Subject: [PATCH 7/8] arm64: dts: qcom: sc8280xp: Add Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-7-279c7ea55493@linaro.org>
References: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
In-Reply-To: <20250304-b4-linux-media-comitters-sc8280xp-venus-v1-0-279c7ea55493@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-33ea6

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Venus on sc8280xp.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
[ bod: added interconnect tags ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 01501acb1790a..fe8aa24d5d51e 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,6 +10,8 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -690,6 +692,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -3699,6 +3706,81 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sm8350-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem",
+					     "video-llcc";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2e00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.2


