Return-Path: <linux-arm-msm+bounces-41005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7E9E9154
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93614161A79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551E0219EB7;
	Mon,  9 Dec 2024 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fmdmx7d5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FADA219E80
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742156; cv=none; b=awjNG12X35CfttLs4JICKfRBX9XynuBgD6KyukFdEFyRD6kxjyDXJUiY5TmnPnPP+52BNoYJCFRJZqofUbHC+6UqERnQo2SY5aw4WrPy+Za6t70vaoB7lvcs2/MEpavOoBTP317B6e27De8IoF+UrMsTnRgCuWIoTdJxZ3vDb40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742156; c=relaxed/simple;
	bh=eZkXlPyaruX8crpL1/AvzdOvoDUQnQQd9zI2il3C2w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpXOhG64RcohgSblzATEF4tXitZK0/OE7N+Pe5RwPky4qBm35oJeX4xsddqLvPgjP/nccuax1Ju77opSHe/C9Qc7H1VK37bVDr+Y7jhzxDsX3R1Pfvn3EoL8sBaXh8qCrzceoASXlwIr/fIytu7KDqU+ZY061nWgrr7bc60azZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fmdmx7d5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3da226a2aso144443a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733742152; x=1734346952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wCQZHcMvRi9iQ8s0t6z5HpqVIJgC7kyG4M3HNIWuLDA=;
        b=Fmdmx7d5T7kbvRbYP14s3E84Ul7bIIGxwyyNkEPeZbk5CYx6hWi30s30J0JLLk3jqa
         GkHk8fh8J7m5HyvU3DmbV0y+ypdU6n6MjxiDUdFLYFBnoaF+pVCxHHcBYaXcq1zq/SNN
         5GXesve8zQdenVJjifQR/dsbBXb8V9XxKv4QwCeOU1m49Oc0zAFh3PVdvsYyJ+7c73Ki
         cuM3h6MyTL3ffoYL5zIoVrDv1PJARt8xZwkbFLK9ARkdmAKBaGmXrexju3AzmXB3dq0U
         EhwKB17biHQzDvH4aur/5WOEHNE795w3D/o5mWetH4CsUWqjhvhfgehEtJKrQv1/snQn
         amlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742152; x=1734346952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCQZHcMvRi9iQ8s0t6z5HpqVIJgC7kyG4M3HNIWuLDA=;
        b=GKWqCtbIbkOGtgOv7hNnwpdQsSa9CKy9CG7ZFdyY7ccphDGAoiiDsWgz0AdzTAz3ko
         kxuXYKzpHNLpk2lonqqlsErVjTCVkglphiwoDZ8RxLqPaln+6K/zJfbqkyzqtN7GKLLI
         v/EwAtEoYdINNYIKjY9VnrWYhsCNH4z28SK2bQfu30JOLch/GiwLnV5X9WyQvTfQ/edb
         ygNGGxLlm6uShhvghByrAhdZbMKUqwS8c7Ys6J5rNAxuE5wXQukcgRyCAJRg6iHfdbqC
         qIwuMWMslbFzxg+RgRD86jJVcHXEqzzOUjFCDR4gvU4+H28AqT8/M5+r38dTlKFQ+z77
         V3uw==
X-Gm-Message-State: AOJu0YxCtdOjJQBjQMAotzcFsgG3oj/vXHlIDXxRKG8Wgit+Ez6YfP1N
	thTslTywxUDC/ibg444Bs25PCnJkJM3He5c5/JQ8E3LrXUCWKW9nkSdoPUuva6s=
X-Gm-Gg: ASbGncvOiufaB9HHcB4kkIccgXjKgqHSPEYT5K4R0HXZzhXpRZz1Ujtg/rFFkH6TRyq
	R1GWtq+5HQzrApBds82lxty0XA7yWV7NKA7/3X9mLC0CfcS9Alci5txkffaoeRxnnGWjGBmICYS
	92FluqQ7JtHQqiG6qLtqZpM02RJIEN+VB8gwNLRYtjsL2nNhyJnDYQVNQhyRx14b+CFH/qJXEve
	bOTMcPCtWZBGOfYh67Bli4Yo7fhB2jWnKMjymKc/1b704iR6pdXkjr4EecNQgC33A==
X-Google-Smtp-Source: AGHT+IHqcqZMTgJX8G2GXQ0L4+EfdZbXGqlO1MAJqaJQBz78ApHZUkQiVKXaczDuiRl0U30+EV3iMQ==
X-Received: by 2002:a05:6402:5289:b0:5d3:e843:fcfd with SMTP id 4fb4d7f45d1cf-5d3e843ff81mr2601313a12.11.1733742151614;
        Mon, 09 Dec 2024 03:02:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3dd4f641bsm3348818a12.51.2024.12.09.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:02:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 12:02:07 +0100
Subject: [PATCH v2 02/19] arm64: dts: qcom: sm8350: Fix CDSP memory base
 and length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-dts-qcom-cdsp-mpss-base-address-v2-2-d85a3bd5cced@linaro.org>
References: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
In-Reply-To: <20241209-dts-qcom-cdsp-mpss-base-address-v2-0-d85a3bd5cced@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7882;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eZkXlPyaruX8crpL1/AvzdOvoDUQnQQd9zI2il3C2w0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVs4y5Y9190qLvbza+FBbDoKW69OSnJHvkza3/
 FKG3CMotQqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bOMgAKCRDBN2bmhouD
 1zdKD/0Zq7zahWNKijfJmvj1Sykj+OvMlMosY5vECcb5oubsACRKXndv+R4vRUW+y4QXf+HNtF8
 U6Az1Tr75/7p+OCl9PN0zzK60W9BotK4MyXNSLUB2IVteChX4dZpKVYcXgLtdQPGlPPcfQxl6Ml
 Z8jngKVuvtotaIrSEEUMuxxGoqN1lFoJ4/7mehxwXumzmcFtO8CTHuGLIO920om0QNH5rzd88ln
 PZSAWp97FM020hpCSWImB+ucI7u8gtigmM6TIAf5plnMYfHgbZtUrISjeyAvs+zVPqPquFw7xty
 s7WgzPSv/J7tXnRLCbXtdD7oE/g8uOqop6IqgCneE0bA26Uu10pjQq7Bv3rY9i+o4sBop+JuU+Q
 PR8cZG3k4Roeo/sHU70WyNxRuA+r7LvyJk/w3gSgCijASOOG4JYy9z3XcPZvFI0xAoHETUeyGKP
 RYBtBkoTZX3OCAYPM4oNN/f4nfP4tJ65VVxsXY9ly7QA3NGvrHTIUlchaDbDqFtB2jHPmsJMiiY
 EpHo0CgoF3ucsczVKQOEewpGNcvkhdq15FEysinCqhXMdV+TM12YKVoXZvVWVHj3Gk94W6oHU0m
 R6qpp2wvg2+h5F8dogADwzQ+yjkml1qshDszWbPXlilRxb1idS/+JDHRKoHVN+Ug8wOQJjYnzds
 cbKWEqbiOqq+paw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in CDSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB): 0x0a30_0000 with length of 0x10000.  0x9890_0000,
value used so far, was copied from downstream DTS, is in the middle of
RAM/DDR space and downstream DTS describes the PIL loader, which is a
bit different interface.  Datasheet says that one of the main CDSP
address spaces is 0x0980_0000, which is oddly similar to 0x9890_0000,
but quite different.

Assume existing value (thus downstream DTS) is not really describing the
intended CDSP PAS region.

Correct the base address and length, which also moves the node to
different place to keep things sorted by unit address.  The diff looks
big, but only the unit address and "reg" property were changed.  This
should have no functional impact on Linux users, because PAS loader does
not use this address space at all.

Fixes: 177fcf0aeda2 ("arm64: dts: qcom: sm8350: Add remoteprocs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 218 +++++++++++++++++------------------
 1 file changed, 109 insertions(+), 109 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5fae676af3a3da21066d01092b6b24fbc4ae4a40..2a62405c0c9eff959abc4cee57753a8b1545c9bf 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2496,6 +2496,115 @@ compute_noc: interconnect@a0c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		cdsp: remoteproc@a300000 {
+			compatible = "qcom,sm8350-cdsp-pas";
+			reg = <0x0 0x0a300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>;
+			power-domain-names = "cx", "mxc";
+
+			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
+
+			memory-region = <&pil_cdsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x2161 0x0400>,
+							 <&apps_smmu 0x1181 0x0420>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x2162 0x0400>,
+							 <&apps_smmu 0x1182 0x0420>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x2163 0x0400>,
+							 <&apps_smmu 0x1183 0x0420>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x2164 0x0400>,
+							 <&apps_smmu 0x1184 0x0420>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x2165 0x0400>,
+							 <&apps_smmu 0x1185 0x0420>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x2166 0x0400>,
+							 <&apps_smmu 0x1186 0x0420>;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x2167 0x0400>,
+							 <&apps_smmu 0x1187 0x0420>;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x2168 0x0400>,
+							 <&apps_smmu 0x1188 0x0420>;
+					};
+
+					/* note: secure cb9 in downstream */
+				};
+			};
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -3589,115 +3698,6 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 			#clock-cells = <1>;
 		};
-
-		cdsp: remoteproc@98900000 {
-			compatible = "qcom,sm8350-cdsp-pas";
-			reg = <0 0x98900000 0 0x1400000>;
-
-			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog", "fatal", "ready",
-					  "handover", "stop-ack";
-
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
-
-			power-domains = <&rpmhpd RPMHPD_CX>,
-					<&rpmhpd RPMHPD_MXC>;
-			power-domain-names = "cx", "mxc";
-
-			interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
-
-			memory-region = <&pil_cdsp_mem>;
-
-			qcom,qmp = <&aoss_qmp>;
-
-			qcom,smem-states = <&smp2p_cdsp_out 0>;
-			qcom,smem-state-names = "stop";
-
-			status = "disabled";
-
-			glink-edge {
-				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
-							     IPCC_MPROC_SIGNAL_GLINK_QMP
-							     IRQ_TYPE_EDGE_RISING>;
-				mboxes = <&ipcc IPCC_CLIENT_CDSP
-						IPCC_MPROC_SIGNAL_GLINK_QMP>;
-
-				label = "cdsp";
-				qcom,remote-pid = <5>;
-
-				fastrpc {
-					compatible = "qcom,fastrpc";
-					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "cdsp";
-					qcom,non-secure-domain;
-					#address-cells = <1>;
-					#size-cells = <0>;
-
-					compute-cb@1 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
-						iommus = <&apps_smmu 0x2161 0x0400>,
-							 <&apps_smmu 0x1181 0x0420>;
-					};
-
-					compute-cb@2 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
-						iommus = <&apps_smmu 0x2162 0x0400>,
-							 <&apps_smmu 0x1182 0x0420>;
-					};
-
-					compute-cb@3 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
-						iommus = <&apps_smmu 0x2163 0x0400>,
-							 <&apps_smmu 0x1183 0x0420>;
-					};
-
-					compute-cb@4 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
-						iommus = <&apps_smmu 0x2164 0x0400>,
-							 <&apps_smmu 0x1184 0x0420>;
-					};
-
-					compute-cb@5 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
-						iommus = <&apps_smmu 0x2165 0x0400>,
-							 <&apps_smmu 0x1185 0x0420>;
-					};
-
-					compute-cb@6 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
-						iommus = <&apps_smmu 0x2166 0x0400>,
-							 <&apps_smmu 0x1186 0x0420>;
-					};
-
-					compute-cb@7 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
-						iommus = <&apps_smmu 0x2167 0x0400>,
-							 <&apps_smmu 0x1187 0x0420>;
-					};
-
-					compute-cb@8 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
-						iommus = <&apps_smmu 0x2168 0x0400>,
-							 <&apps_smmu 0x1188 0x0420>;
-					};
-
-					/* note: secure cb9 in downstream */
-				};
-			};
-		};
 	};
 
 	thermal_zones: thermal-zones {

-- 
2.43.0


