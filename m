Return-Path: <linux-arm-msm+bounces-48961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F8A3FB8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC2247A2D8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C362520012C;
	Fri, 21 Feb 2025 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUiEbb6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F031F3D20
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155599; cv=none; b=KbQyU+Z5nOpbISkX8vXQuo3/cM0Lq1nvCi/zSP3YSd/NUwG7KzAOwhdXdNpq94HhTneoUra5wBFMB9wzxoSUvZjwoB5BI7dv0sxfRI8wWwTOZYoyNMH6TbgwAyZzYH/KOyx86bS/x/xAk+MGQUPBMhCoE8w3N+Ae5Wh7dwznxZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155599; c=relaxed/simple;
	bh=66DlPJwzm+YX/S5sA5DZ6Q8G2mY3WkRT+3p0txpEYGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhUvTEh95g8DD70F+Y0wz8HvKtDHofx7ooX3FsXlVUKm11SXNNj1d4kYYzY2dSoRHTUvdrPgjX9WInBGqdDxzUazKevKx9v4M8FwpnGXwFvatghHpw6938UrMkvs4scL++fjtO6jx5AbR/mKcd2uzFwOlAGSr663Zu33W43qgic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUiEbb6d; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7f9f57192so33575566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155595; x=1740760395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VhvN6jhdR2GkWmkJMAr59edVOoHNxWabkri5JyhKbk=;
        b=TUiEbb6dQ0o9eTLiik6TQa/22scsuegpAavAZZo4P3rfh0rY2xiADRUSOuN4sPsiLU
         pWcaKyhxUR0f6XgA/ntjAiizrNdqIgDR16hJxyUwcAcgutAqjXwz85wAhKFiTDew/1om
         dPqahmScJrl9wJ4zg93cnkBESrKXpO7Pll5DJrtrNFheEEXS1qeruThxEVz7QraETz8X
         ueUuDqKfmG4kpmqajngCZOmWhA2wt8tlcrtHHPtKmaDuojp9pK/lZUsMs87o4SgMuwCy
         GDwZ2unE4i+Rbcpfv5MyNvRRuGDPNu2VsE4hIeDKt2BNYLBYQPjW+Ch+/L3nf7gFFQiF
         sAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155595; x=1740760395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VhvN6jhdR2GkWmkJMAr59edVOoHNxWabkri5JyhKbk=;
        b=X+tpow3z/GSnYHYncXXkYwWcWRomdfF6x/8mA5jY1tnaO5YNgYl+xJtUuv3uKbU4Lz
         7q0N/fvLN2ZjzGCqHEc2ObGYoL9Q9u3NHQjFgXmdH7MXHwDaBtSwr+qkANQHHTUa1S8C
         bdlzj3BFCZxR4yLTgrHyfVZVE/5gySLKPrdVDPr7NGBmHet5zwezBkJzdYXPn1B9J3zB
         9Ji7ZjteVEwPWgARICEcqQD4jTWuEf6niPR0tr9vZnFEPpMgMRj2eNca69ynRfiTIG4N
         0ghKA9UmFyR7uSy32dtS3S4I0jvamVTNydFIVGFbtU1cjofDEYMQEBwjQJLdR8ubWnmd
         c6vw==
X-Gm-Message-State: AOJu0YwsjlezjY5YnhIn55MB0D+HaA03lTUK9a3F+/e5KDU4eY5TAnhD
	F9VnrLSh/JQ2iGOtdhttJmTbb3Z5CmvZOFi8ohibZQTwoZ0FsDH5/Qc6NVFgQe4L07Jm9qoRJEy
	+X2w=
X-Gm-Gg: ASbGncsEuVND0fSzK+4d29l1bOplTLzZ10jxpYbOlg6naX4LE/9VdUAfstyS9gXRQTf
	16qPGf/rpSaSh7j6zlHcZFJIjzH43pOl22ehCzO3hyPWJZqV9fmDhS+LZwZKwIFYVj/9GkwAP/+
	hez3s7wo4U1dCyYF2Mnfe25/47HWjJiRo86+R8Y9+MZpu0R3kyojuYGbvq908GklivVHUEJ6+i4
	BNIs2HqJfPcl/v8sNGDTky93O/qxgPCG9gtvHDqed9UJoPlHUSwlJGFiUZ3Jb1u0z48KF23VfTG
	h+aNfAAfMQROvdiyBYJOInzUnUBGmKk6MDB14Ck0sHAX9RpA6FUJuTmlMDhBH2qvkUPAHulRVoy
	M
X-Google-Smtp-Source: AGHT+IEcxstNBg2FzM7cXU7n9A0s9L5uGHIo0LGmFkNCEtfji4AIpDp1jp6D7Gfi/hjkL04Nb1x1Fw==
X-Received: by 2002:a17:906:6a0f:b0:aac:619:6411 with SMTP id a640c23a62f3a-abc09c24753mr163502666b.11.1740155594927;
        Fri, 21 Feb 2025 08:33:14 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba4fc0c29sm906814066b.157.2025.02.21.08.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:33:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 17:33:05 +0100
Subject: [PATCH RFC v3 1/3] arm64: dts: qcom: sm8750: Add Modem / MPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-modem-v3-1-462dae7303c7@linaro.org>
References: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
In-Reply-To: <20250221-b4-sm8750-modem-v3-0-462dae7303c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=66DlPJwzm+YX/S5sA5DZ6Q8G2mY3WkRT+3p0txpEYGE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuKrFLVieFqloDeTMUu87DvvQAwT0bIn3Z0CjD
 0kZTKMqeSyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iqxQAKCRDBN2bmhouD
 11Q1D/4x3QyqsTL98OfCQqAXGKuJQcfqfx+qle+9xvooQfZT1186DK91xXbQgfhK3DXRWImyfD6
 eQbrH46ilAcDJbDwakbpD+D4SCpwPPFq061YEPLH8KZ2gHpoYG28BsDBIiN9cdDgA58jexqbEiD
 aAPnPxkrX5gQIjHMP56Ll5dgeG6Kf/90O5bbIACyCFqtYU5cS2uu9tb+AsX5H3oC9G5hxb7t6+G
 idt+ueFkZEtWYzTnoJFh1iFrvTANFQK+L3cNkdz7oDSiMHzR5Yb8WdvWYtzN9PRqsLu8RcS9OKc
 jXY7Vo2z9gmQDR71SSvaiIDDhBmRkQ+BVcpGvxbVNip006cCuit1gEohXhRN1sffrl2rHp5ZgNj
 zZZUIY62JEEDLTCwRRZLmSYlK/lAmGM9mrOuDv5DvL2AEgP/7gMkFNAon6pQOuWd9ygk8lD3Am8
 ZQ3zVA6jbNGON8mZf7mF9y+o0p2ZMBEi3nTIMflkOje+1v4PrxiwAjmACDDkaXJ8rr1OyO2Faky
 IRgjkQSL8NJtc9TdEPxb1rGnyr8vXVFJBYiH5GVhx8WpGxZ9Bobx8ykURJtHlAm8UBXN5H0DL18
 EsXuPJzgd3jKNZ1gvnZ/6BsyF7M2tVd1cEvCWYv7l5tDvanpsNhh8qYxkw1OMy8h06ZKliAyGbx
 9wVxFnzkBuWfgzg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add nodes for the MPSS and its SMP2P.  These are compatible with earlier
SM8650 with difference in lack of fifth memory region for Qlink Logging.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 92 ++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 033e8153aa73cea00d1d4394c572bf8e19231305..a0316514d8aaa3a3ec3599c1fb2f9b2ba948145f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -571,6 +571,45 @@ smp2p_cdsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <435>, <428>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_modem_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_modem_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		/* TODO: smem mailbox in and out */
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -2011,6 +2050,59 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		remoteproc_mpss: remoteproc@4080000 {
+			compatible = "qcom,sm8750-mpss-pas";
+			reg = <0x0 0x04080000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
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
+			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MSS>;
+			power-domain-names = "cx",
+					     "mss";
+
+			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>,
+					<&dsm_partition_1_mem>,
+					<&dsm_partition_2_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_modem_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&ipcc IPCC_CLIENT_MPSS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				qcom,remote-pid = <1>;
+
+				label = "mpss";
+			};
+		};
+
 		remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,sm8750-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;

-- 
2.43.0


