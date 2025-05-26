Return-Path: <linux-arm-msm+bounces-59428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7211DAC3ECC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 13:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DDB917769D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192371FDE1E;
	Mon, 26 May 2025 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aySdbvSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE91DEFE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 11:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260005; cv=none; b=XPPGGZoCjVrrJQPvafovNFf3spnrZgLvjrh87/Pk36bV0Dtw6vIcUwq/fPIKjOafRN7L3PHiHu1KXdGgg6gaO6RyvlZJePsXYNKOLbap5pddzTfpDI4h3JQKomozl6OsX/dAFoo/4XXgYu0GmtBT+pZY85gFLE/YvPbhtJBmPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260005; c=relaxed/simple;
	bh=jjd4GeBbAtuwlRPuLLleMWt4peQC4Vu7ly9/mKRLATo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0L4i8VgJt7DtPYpQoiC9ouhhmeTP2ALNpbelKI6YvQ3hkZaAOqiC1KEoxappJcP94EwMgS5LT8bwxxyF6x3XQC9bGy0j6IlbqyAaxal3BzRsFjhUa/P4QL3jxECQjzyAOk8IrbzfKziNhxY1vwbUX7j87dlrK4Z1M/md8Ii8Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aySdbvSw; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4cbc36ce3so52406f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 04:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748260000; x=1748864800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1OmNo2Qm8ZDm0Bz1e9gms44TxcRGKOxtlMto4OxWLw=;
        b=aySdbvSwSywhsP24JK0MpeKbHAfQNa6imkZLeUVlNGX3Mj6/z41LHRFbDyqXPwNOdE
         JDzEgLfFXjzUK0+aPjvrSsY9oMLw3gQ1LcaTWp7lVV3Oh1IkQKatO38nTvXfbrY6Tzmd
         geqg4p2fGBG3PBfAmPV04UBJgv4C943Ekcuaki47b/q+DHCcWCj7/WkKQrSMcJVRpu8R
         yvOss+NCOA7WuXPIiyqeJDUkXUFEUw4S2ocS66rd/n3LSlURym3GP3IeC1k9a32TUOhx
         NfwqeX0qF3BZtP4ycecdbBIWUDSTEB9l2UBrfKl2LEc7qByTbrro0b7B8MtJur9nJlVE
         1lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748260000; x=1748864800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1OmNo2Qm8ZDm0Bz1e9gms44TxcRGKOxtlMto4OxWLw=;
        b=qByjPuzBwMDolEp+LOajWzaGxfIqqxyDAlqKdQlYRW0Uq4+rGlQoGgNsAzQzGtinaS
         zF+YgZLF7aFVS4v236uvnrf9r0S/loWO1/e3+AphKFdwfXWpOAshmWU3jqqkpKop7Q6Q
         i2NDjzMK+y8BvsTA7laLcwu2fVK+ZQ7AbeTau41rPsWqz64WdSsbJ2rzV6fmz/MWcdKp
         brLqOoG1SwNoI6Yl7iWMswJuLMngY0Zyn4yG57Ag36ZEZ3zAPRoUdcgnrXK/cSxecexE
         YS93EL94ybsbJrFJXg0B4Gc+b18lsOHGBS0qQ2tOUc40VER9p8SwhanIjkNz4+feDuKq
         Bsbg==
X-Gm-Message-State: AOJu0Yw4gyxJAn0yGboYwmmdOU2ejOZZtvSn/nyDEqeQycYEr7mdsJW1
	WfG3JNZdaQiAhPlWcRfke+P5FXhh82ij3AacP7DAcf0UHF/wx90XN4lY1nac8RQsKxvOXChWKsU
	T2XT9
X-Gm-Gg: ASbGncu6JMMCwgF5hH87E42ZSByBuoh02s9IuMZfiEM9sSg7GDbWTGAeufRo0EnNckE
	XL6AZffcb2rZK5rOdlIL+2qT7E0AezQJvzarawWvjZR5RrP3OZ8qJIlJZdMcQrWfiz2IfcMIerg
	RD1xzTqWatWpHO8Dia13ZxnTd2DHjKmjCFasyW+9cFOnf714hP218Y5FrM7qcOLuYEY2e53RuwO
	I4b+FaBdzaPiHdcDska0VmQVWQPytXPpGtFzQBO0WeFYfyzVqzPT6lld/dSZL33txOw9t45/tOc
	0oJScW+Ce+cC3K2kUNdLCRjsGAmQEGThzxJZ31Ro3sKGuT9BxCS7p2MjK9MBGXkD4DdSEB4=
X-Google-Smtp-Source: AGHT+IH0HEEI5Y3c9wERynZXMmGvEnsD4iAVhZwQNb4LD/V/a6G6+ztZI5SPNKq1HgnPFLDXB5nrPg==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8e28 with SMTP id ffacd0b85a97d-3a4d6eda6b3mr1253598f8f.8.1748259999906;
        Mon, 26 May 2025 04:46:39 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm7592310f8f.11.2025.05.26.04.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:46:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 13:46:32 +0200
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8750: Add Soundwire nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-sm8750-audio-part-2-v3-1-74429c686bb1@linaro.org>
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
In-Reply-To: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7310;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jjd4GeBbAtuwlRPuLLleMWt4peQC4Vu7ly9/mKRLATo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNFSawL3MsJn5R4OszQcefmLWhjODYNPKTRj3f
 QjiTsd2uJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRUmgAKCRDBN2bmhouD
 1+rgEACac7dFXAfLbbCo3fGIcNoE3TiKSJl6ozgEUbLTnQu0VtLboNPa6NklpHay0T2MpfDKppw
 36q3q0VCHGJQlh//Vw/+cLfEWylrO7C2S+lFThTccQmPDm7TZSCE2RN275Y3QTb87HLZMBQ+pPn
 N2wi8Y5DP0I4onMI2DypQukfz2JqKMEga1+YSPW+WukPTrbZSNheeSYJIMWj9t9C/fzTeubp/h5
 M7NIOpmGB2BJ1nmpaHccVpB0YjxXcY2DnbpQ7wotDKTBKTQ7KdaWHYsi/kI0jvtgB/bLw1tQ1Ax
 xCu+dQTpL2cN/tm0WvplC6Ulgoi1A8vaPSuqCFXjRM6SNf5WKX5TPUZfpa+w5vpviB4NBSb40Xm
 BN+y2peTrxMzhKfGrsACtyPvIaNJ9moR6hHM5OU5Y6Xo1CsVRu9raoooFT04+j/P+0pH11PN4nJ
 vrym8gZ3nc+calCSqJX6RvaXCYdJNXqjss6/ptzBZhwXIltKHaxG5kHV8U0jdden9tSjQbJaoPE
 V/wlmELVqV+KeVRGuyz3mMjIRM2ucR4vpFiT9Z++bRAp166SuLNig+Dk+zJgHVoZ0CD5PdgMgnS
 4cnUuxCNCQTohtlakfeK3INSwRzeZJ/hgcvJaPBzh5s+TF33i9W3M5GhNB/wQkWLr5X32A/q3aU
 4PFeoPe9Ui/yFdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add Soundwire controllers on SM8750, fully compatible with earlier
SM8650 generation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Bindings / new compatible:
https://lore.kernel.org/r/20250519080453.29858-2-krzysztof.kozlowski@linaro.org/T/#u
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..68ea48854c61b3aed6e089afaebe9edba7a1475f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr3: soundwire@6ab0000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06ab0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_rxmacro: codec@6ac0000 {
 			compatible = "qcom,sm8750-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
 			reg = <0x0 0x06ac0000 0x0 0x1000>;
@@ -2274,6 +2304,36 @@ lpass_rxmacro: codec@6ac0000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr1: soundwire@6ad0000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06ad0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0x0f 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0x18 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0x01 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_txmacro: codec@6ae0000 {
 			compatible = "qcom,sm8750-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
 			reg = <0x0 0x06ae0000 0x0 0x1000>;
@@ -2308,6 +2368,36 @@ lpass_wsamacro: codec@6b00000 {
 			#sound-dai-cells = <1>;
 		};
 
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06b10000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,sm8750-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -2329,6 +2419,38 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v2.1.0", "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x07630000 0x0 0x10000>;
+			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		lpass_vamacro: codec@7660000 {
 			compatible = "qcom,sm8750-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
 			reg = <0x0 0x07660000 0x0 0x2000>;

-- 
2.45.2


