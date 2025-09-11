Return-Path: <linux-arm-msm+bounces-73170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67724B53BA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 20:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4676B7B975F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 18:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A94B2DC77B;
	Thu, 11 Sep 2025 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTvls2y3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2442DC76A
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 18:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757615928; cv=none; b=OSB8gNSFzeS4u14gqr2eoPWC68WZIkw7FyODtjpU5eJchnmOeBAEsbVn1Ce0MzXoaQ6VuspD+S/UteM5rNSS03mqx7t1EIZnErg4X8uLAWt69Aq1N1OqQ6ZPHIhcRiRsQVg/AuJ5AjBtpiPJijfRqBNXoOz8rvXNY2jJCNp0NRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757615928; c=relaxed/simple;
	bh=lhy1VcmKCOKs2kPZLsxT9iR7fBKv8yka30yVgDt2xNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpZc+f0HdcSDZpVO9g0Z7B03SaPARFPOnQ9CrNJP5X11Z2C4IEPIxcI+LQ+bceENJsPrEC8TKcV2Yo5zaI4pYfJ266xxSd4PVSO94ZBo2O/Kaj+SowObJCbyiC9CzIoPC1ajeW4SdsG7mztyB5ZR3VGIQ46YsEt9F54hh3wsp2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTvls2y3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0411b83aafso157824666b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757615925; x=1758220725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTsAmyj/JOYYUEo4xJmHVkBDh83ZUOk02bdsqrMVGp4=;
        b=RTvls2y3RC6CYbhIpKY+HlSzZ7eNYiFV5/CKVNib4bkoqbDSlJ+GRlQBmQ/sfrnwOq
         2Eezevgziwl1wci9uWAi96tJ+R5CdvZPv77o370Bb2AR1eiGIJ5ZzsxE41IaqlCHw2oN
         3w6Z6ZcNxZ3iYyp5y5f5wLmw1ppFVZyNFoAz68Gx4ZA68C/0YqHbzL93I/7ie3dBy/U7
         HU3xaGGNHEWK347947mENF+GxzKFxG2rWny+D/8zMMT/ZhUzu47zZHUsufkQpTHi+/KR
         7nVtGb+ccLMsCJKEInGMViVyK8c4ABxi1Z5YVR0JutbPZy7xjUcq/5b6txroS6hD0ko4
         cbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757615925; x=1758220725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTsAmyj/JOYYUEo4xJmHVkBDh83ZUOk02bdsqrMVGp4=;
        b=mG1AvTq4Z6PHZlY/uZ3Nwr/xXZC0Krp767WWZXaj6yUPJcO1G693UMlTS//FwaVinN
         lRp/sQyFvQU5QHKVGNy2LM+cT8aeDFjuH4QltUVASK65iHysLs2J9m6sXGijiAhzc5zR
         d6wF/sciORYt5hBqg0KBEsLAOTDcWxl5trWmHOrRSXcvC8Z+XCgbQEhNvNykGmq3UaZr
         HPG4lYSB8OgTa7MhogbDfTL+c3/8NNPXyBiLHGFGKHSqlvWM6AL9VezZmU34JW7Hn5DY
         ECDrWg0v+jT29OHqcXdCh5ZrrdGtorosSG5GCgMeVwPFuKrkfz8asoEbf+X+N08oBz40
         ByFA==
X-Forwarded-Encrypted: i=1; AJvYcCX6v/Te8+fzquygotiCt0Nb2bWnVzNTgdmyz9a6JsL9wM1DvruzQqSXsUBvTSW+J6FOxWNpwmFTF+Oguleq@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpAryAnKuJWzNM5SQTlMyDMz9nVr/7WRqYz9/FO42DY31cNGe
	TbjsXoCtGb98H6GtdT2Y8Y5yKSvrmDV5HWeIe9KMmQrBTz2En2dB7/Om/rRp4LGAI2c=
X-Gm-Gg: ASbGncvF0zSib6KX4wsgcZFWOxjeLeaBvm8CNiGtkbjyTrQQR8XGBZrS6YcYtdOXbIt
	ZrOf9PYYKyF4tKTQm5m6NQJ+YhIZioTgeSzQglEyxru1VNG/KzAReEdunV9ysDXEzi9SlEQ21fo
	Z1GCyxVuBANDiRXjJxcSHu/MNJFWKdnQmgWrJ26p2AWnWDg8aA0IcIUdj+1EjJ4ujpEGYqC4Ses
	gSXxXacuxpXR5kaIthllJnMQeMhIxrMtOOdqKFhKv1sFepWpnfzXNOOChiANFkq/zlU3Ibx3LaE
	8WG48F7s2I3rrWcmefXdqK78xRph4RE/3wassOQU0Ug3fGX3bxxMkDsDNqzGUuApclrU9P20V5o
	52cUm9gSK8e82nXh9Gly8UXq7BPwXFQ9CEgU6gB8x1bu2
X-Google-Smtp-Source: AGHT+IGnScMky1jaQN3N/9d83yEP3nqexnNHEitwDorxUh2bbjPeWQGbEG2JLh4duXeqBh2zoFg6XQ==
X-Received: by 2002:a17:907:e98a:b0:b07:6454:53f7 with SMTP id a640c23a62f3a-b07c3833aebmr13158866b.52.1757615924986;
        Thu, 11 Sep 2025 11:38:44 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:725:1e09:bed1:27ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm183999166b.49.2025.09.11.11.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:38:44 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 11 Sep 2025 20:38:24 +0200
Subject: [PATCH 1/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org>
References: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
In-Reply-To: <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Add the IRIS video codec to accelerate video decoding/encoding. Copied
mostly from sm8550.dtsi, only the opp-table is slightly different for X1E.
For opp-240000000, we need to vote for a higher OPP on one of the power
domains, because the voltage requirements for the PLL and the derived
clocks differ (sm8550.dtsi has the same).

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 87 ++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index ba602eddfb54616ad38205570bc56a1f0e62c023..d6914165d055cd0c0e80541267e2671c7432799e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5234,6 +5234,93 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
+
+			reg = <0 0x0aa00000 0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+			dma-coherent;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable in boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-481000000 {
+					opp-hz = /bits/ 64 <481000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,x1e80100-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

-- 
2.50.1


