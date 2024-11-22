Return-Path: <linux-arm-msm+bounces-38862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE69D614D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 16:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E006160475
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 15:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BF31DE89A;
	Fri, 22 Nov 2024 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cgQ+j+oK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838D2E3EE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732289224; cv=none; b=J2saHfyWEbadYmh/S3Cbl8X3ZzqXd5Ondv74yH2vBQ0B1lYqI8CJGiOyTfbBJB7ZX9SpVrYLAYVeebZSoJhPTZhjo4IAZmMyN35ngJlrLglceXwshkOndRfZiR8y5n/i0uRw8wvzEgf/c7segfbrNFL9ILAsQQt4oila46NTx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732289224; c=relaxed/simple;
	bh=OxtfIizlInMQLJOVwxv3lqR2c1aKkI/srChQv4aj16Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxCmevilEuCtPTpIbIr63aCqUMqQV4inY3QdkSIpCe6gan7C47bEi/ysyQHXjpBuiTDd41Vm0z0q4wUdxRv/B12MbbbpOQ67IKO6FPxBnE04lvR284JkGPUJUwUQPUYFOh5OZW8wInGBUz6GtCoieCEw0jTXNH6XHEdT5RygGFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cgQ+j+oK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso3348935e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 07:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732289221; x=1732894021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07DrWQLmvM/zsRSeHGvpGmL9a07pj4BFtUDD+dGDJGo=;
        b=cgQ+j+oKw4JNYOnDycRAq09l/9vxz7HJlP/04WMeWtxAz1d7IDTEOMrI7TqQ35zPLr
         oBDgN63OSWuUPCKVSj1K11LZk2/7gfBSwnHX5KgsgzYQn+kIAu3h21dYyXLNNwmXpxpu
         5dad3DWAiD7wZmCVU/gGf44YpHT55G40yOW+q8BOu0foMkmKX8z3Ibx7AruLvHHqDENk
         u/eBfJiJstzTvmlqYBJJmEywzvIiLxZ7f7plRh7j16z5tH+aO74/+m9wgwu0/zAYTVYJ
         i3CMX4Hqi9J9yjpzPjIIZfXEPFymbBo1hVihfl5mGeXbZ7nPpVVgXLnIqzrtvToN+JUl
         CrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732289221; x=1732894021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07DrWQLmvM/zsRSeHGvpGmL9a07pj4BFtUDD+dGDJGo=;
        b=HcXOcLadodpU+n6/1PlkgtU6mz1k34r3X+vap40oOugYX4p505RV6gv4+e/GHLrc+8
         S7Rlnnb70IBUzkkxf/f4FOcah9c1Ffv/AIjt/HxDDo1Id3RYJdEK3kGwJOKyzUsBLraK
         6meO7qWCmX9suFgSaxO9MZEkUzb6zd8yeKBNZaLCKQMxp0iSfop1JwSwlQFfkcMamCM/
         7zLJ6JdOGk9HvQQy5z28+eGglxQcQ02VaT1nbNhgTKwGruJvCRobXy6qvze68Rwzyxvb
         PKrM6dL+4SmVUwv1JX1w64yDuHi0gVidp2C/0g/5JgtKSsjRw/uVTi92Er9/Exvx03bN
         x5+w==
X-Gm-Message-State: AOJu0YxC9qtrXy5BOByJSllAXYcWSTx2XNA4kDit/J0r04ZJYIVWgkuL
	GTrtiNxg9mUTb270sTvsrsIVh6MmmQrAOGSX8Yo15zbaDbIy6Kz6N3x8AaKAeUVJOmHzY24wqGB
	ktPk=
X-Gm-Gg: ASbGnctNB+hNqyAxJO1DKeUe4vGe04vznige++esLu88s+GsGTRo5s0ZJ9Akzy2c7YJ
	BaiTQwbNDgJYtARjpw+KEZounMC4Mtu4SocOO6rQHeTDlzErFdRUusVq4z8rYOpn1X4nMdL0f2Q
	Lag2KEYm5utVDtq5t2VbPUeTSSRfWiZaZOdA3xOxamwV7hotWFk//AxyutCQ+ly0QlmJRD8Z37V
	IH2iGQjHxjVJ2X1jWlTXxwJAbaIi6Z/H3x5w0SH4E2l0W1QOkl8sS3iw68E9zO1zg==
X-Google-Smtp-Source: AGHT+IHwuhTEytuKqWwrA8tXoW9eLb7eZVXOuNgB4uqemnWqZKAhiSyt3b/On63YHMNj6bYJcVVOuA==
X-Received: by 2002:a05:600c:4f41:b0:42c:c59a:ac21 with SMTP id 5b1f17b1804b1-433ce41fe5amr12533155e9.2.1732289220575;
        Fri, 22 Nov 2024 07:27:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4c68sm93002935e9.22.2024.11.22.07.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:26:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Nov 2024 16:26:48 +0100
Subject: [PATCH 1/4] arm64: dts: qcom: sm8750: Add CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-sm8750-cdsp-v1-1-9a69a889d1b7@linaro.org>
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
In-Reply-To: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6221;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OxtfIizlInMQLJOVwxv3lqR2c1aKkI/srChQv4aj16Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnQKK9jKRZpomeWSvMCT8ZN3Ncr689dNDIlJl+b
 PkbqfCVRXaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ0CivQAKCRDBN2bmhouD
 10DMD/9d7+ThZMk1C4nI1Df1j2ckRtrqOF+jcI5RfPi06YKinPsTQiquvDqVOdgFNqwaJPXylDn
 tZJ052bt2zOwERJUi5MYkSjklndVql9cCvxsdb6ptoq69/nMZkTWZwgllDkvjiR4lx+Xg6HVObe
 aLTw3MNRoxh5h6CZfMfMVq0S2aexdjfdj4BXxBpkXlnK6wi8AEflBJCTsnMTZsghn9vmSN1mW1s
 K9frE4vx24k1X0ztDkKUXHryUNQF1z2fySzDU4tYeYLHr+/8hFi91YpRjZNdB0OS0IW3muUloNq
 M/I3lXfURjqFgl4osuw/B+GpU7xFWj+aE0q0IRTaDWi5y+mohNI4So3gAjZY3gZy3AXxeT6+X8P
 2vfZ0jmMT6ehtWp+plwK0Jo/YBgDJ1Bo+5SM9A61K0CBIwLTIIQosACn9+Wfk8WpscShilxSBby
 q+wsISgy8Na7v0HunNWRz65SRKK5EouvQ2ojXG3uEEitIUf8257MQT0oZ7ZrfTXc4xuJIJWfiD9
 l1zSYMlj3VfLe/S9/yymzxzeeFKe3/fXiOJx93zirMjferjyvKFrKaUdciEpSl+cIY/dPyTD3ui
 zkJlWg2tKaQIY8UaZ0pyrsYW7ZdEq14UGiMl8S5GrdltWM2Gngk+EwMTR2QCPazrVBpdQL0KGVS
 bfEBb0nIf2vdwWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add nodes for the CDSP and its SMP2P.  These are compatible with earlier
SM8650 with difference in one more interrupt.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 194 +++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 12ad35f0885282d0191e596d0962e242ff30a28a..344331cd97e292a46e3061760817acf643fbe1ff 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -551,6 +551,32 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3246,6 +3272,174 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,sm8750-cdsp-pas", "qcom,sm8650-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x1400000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mxc",
+					     "nsp";
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+			qcom,qmp = <&aoss_qmp>;
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
+				qcom,remote-pid = <5>;
+				label = "cdsp";
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
+						iommus = <&apps_smmu 0x19c1 0x0>,
+							 <&apps_smmu 0x0c21 0x0>,
+							 <&apps_smmu 0x0c01 0x40>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x1962 0x0>,
+							 <&apps_smmu 0x0c02 0x20>,
+							 <&apps_smmu 0x0c42 0x0>,
+							 <&apps_smmu 0x19c2 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1963 0x0>,
+							 <&apps_smmu 0x0c23 0x0>,
+							 <&apps_smmu 0x0c03 0x40>,
+							 <&apps_smmu 0x19c3 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1964 0x0>,
+							 <&apps_smmu 0x0c24 0x0>,
+							 <&apps_smmu 0x0c04 0x40>,
+							 <&apps_smmu 0x19c4 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1965 0x0>,
+							 <&apps_smmu 0x0c25 0x0>,
+							 <&apps_smmu 0x0c05 0x40>,
+							 <&apps_smmu 0x19c5 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1966 0x0>,
+							 <&apps_smmu 0x0c06 0x20>,
+							 <&apps_smmu 0x0c46 0x0>,
+							 <&apps_smmu 0x19c6 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1967 0x0>,
+							 <&apps_smmu 0x0c27 0x0>,
+							 <&apps_smmu 0x0c07 0x40>,
+							 <&apps_smmu 0x19c7 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x1968 0x0>,
+							 <&apps_smmu 0x0c08 0x20>,
+							 <&apps_smmu 0x0c48 0x0>,
+							 <&apps_smmu 0x19c8 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x196c 0x0>,
+							 <&apps_smmu 0x0c2c 0x20>,
+							 <&apps_smmu 0x0c0c 0x40>,
+							 <&apps_smmu 0x19cc 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x196d 0x0>,
+							 <&apps_smmu 0x0c0d 0x20>,
+							 <&apps_smmu 0x0c2e 0x0>,
+							 <&apps_smmu 0x0c4d 0x0>,
+							 <&apps_smmu 0x19cd 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x196e 0x0>,
+							 <&apps_smmu 0x0c0e 0x20>,
+							 <&apps_smmu 0x19ce 0x0>;
+						dma-coherent;
+					};
+				};
+			};
+		};
 	};
 
 	timer {

-- 
2.43.0


