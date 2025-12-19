Return-Path: <linux-arm-msm+bounces-85771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4487CCE747
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 360193068D74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85B6288C3F;
	Fri, 19 Dec 2025 04:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YNfkxYik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A7288C22
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118878; cv=none; b=MpgCb/uUd1e6u8riI+PYyt9dTOBxMgjSyTS9W+9bMoy2jmRuyaPn4sB1YdWy2gp209mUd7Jc+9DBzILXoqo1LsBSeULFXAWV+OPok39s4fJ10/nsfbp74DYWnVYZ6Q+xUmZc6smzxZt+WwabLeruXr8C0toeNA1MDVg8sQdq1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118878; c=relaxed/simple;
	bh=Up2Z79kEtmtDGOhpPkDygBJipNEFvl3e0SnwWNs4gXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SnMm/pc0edeEjVMTqAGjPiV/AQI0DAYbiVNICI4AjFw1bZijosUdm0/8p1Tix6x7RergqusVFuAsq7zR10HUfs+fcyffuQqAvM94zi3JA272vj4/uGoHeLJb1SW/h6Ca9095Iz2VmSxIzwZYXSjIrfR6rdo2TdMxn4IoeO9bwfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YNfkxYik; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64455a2a096so1019736d50.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118876; x=1766723676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzmKwrslM1ZrqgvgQZdaYLdNHq7Buu+2pybODQLZPLA=;
        b=YNfkxYiky1Wp28TCoJzBVvtzUZ0qyZMBMQeMmaO4Yx/Pa0M8/o2t+lyqaPP29hdp9D
         PYEqq/S9OZOZWSU7wCZo4BrBPOmV52fp4eJMl2WpgC7e3ZENCLIwvcYmZOPul5nnwT3u
         /r+l64hBO2gy93Thk5Yqga2S+1lPg+2OOmfoMYdDkzdtgqikupenZUD3r6dFpcCM5k0x
         b2zoNzQJlxajR+i/RTcq0TA+nxlC6nW5F+oPjXw4oQ+/MEQIOk+0dd31gWqNZodR3J1t
         jzcasXodxUd1HHsBE9MEu3RabIZeX4IVo3oBuErD9t9KtWrKt7H+ascwL8Jeine7NcEV
         ccJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118876; x=1766723676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PzmKwrslM1ZrqgvgQZdaYLdNHq7Buu+2pybODQLZPLA=;
        b=KZl7TJwjr1uhPsUrq0yh4PO+ii1VuzZ8O+oXdkqKqkrozZQgXY3dlIeIC5hbIc7yA8
         MJALv3zXj0H2bcXbuyKf8Q2pBq6AY70IxZVoCAVxgYJcTIEqtB08cEmxd7sDyM6FlMq6
         VJZmJ6/GAIkfTZnIDGyp1JoDif2Q2Mzh7K3Cvx4/rbIRf4cMK6DjNgV7dyYMMWmJ2CLB
         yWEF16Q0l687RAhIhbBkbqFPmB7h4MAwugC7hJyhbZEoKUBAsmFDePBq2H6Ab3OuaQKu
         1ddGQhuZgwI34lXLddv/UEn81vRbQUyE7Lbllgw9E+NVfp2KkgNgeSBX75jRl/Xv0hhh
         Sppw==
X-Forwarded-Encrypted: i=1; AJvYcCUU4WSaOqXDfSG92gBjaAaS17u5yrJUNTw8ge1+QwyobSMIXaT25mI/Q+LTpYl+hbgs74vyLglHO/v4lDyG@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqrRUxXgfluk20F6exbNnRaSeFC6rJiV0JCU6hGWMI/c0A/Qf
	9HzaBs8srnhp2/PAdOd7L+t7MTH1Q+qBBw09EBqL5QS3GwI0SL9Uy9SL
X-Gm-Gg: AY/fxX4uNeVTwwDgvA2tSg8yYZfyJv4KhFRl+A0QM/MtN8zD00C2I9Gnf1bEhqf5urd
	d64d2E0U2XgRjEpbNzNVcoSU+1Udr9b+7Uo7K8c6uy6y5ggKVbh2mwRLGJVBcoCLidXxdusEpV9
	TAtQ34Y54MA1oY7DQpe+imcSO0o+IZbmmQpLvNsF+yXUA3eW+I2lziZUyPEyJrtpIQi4RiLQFCO
	iOZKFIChfAfldWfcOKxCt6XNcf+POg0mL1WmezAewmb872RSTXKohApprF+IsK5sQU17SUtczko
	jG5i6VYXsrR9C65cKCaDDuSAT+z9BwKBjto2NKSCMOlC/5KkxRAGyh0BVf4GEUW1KThEiX9tE7D
	Rhkk3ammsnWCzVBvrMUbXN2zgEB+lr7gPLTkrGo9/lcBsBrOeRxA2VipxWnhJMqtIGcR+h70+sY
	P/4sSnrLWvSSRFtmNVdm6H9NX1DlBBycag/NhnJ54XScpW4m/kfAET7QuEE9J7cVjwg/SPEGyuj
	MxopR/udoT1FTi+zWp43vEUDREy
X-Google-Smtp-Source: AGHT+IHV4EY7sTS07g1E7oibzLMjyhOoccEfgDEPV1sDgvAPwIVloTk4IXSQns8jlwlJaTFu3t/bqg==
X-Received: by 2002:a05:690c:6d12:b0:78d:6c06:4a04 with SMTP id 00721157ae682-78fb3f04375mr29478967b3.1.1766118875853;
        Thu, 18 Dec 2025 20:34:35 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:35 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
Date: Thu, 18 Dec 2025 22:34:12 -0600
Message-ID: <20251219043425.888585-4-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCSS remoteproc is typically used by ath11k to load wifi firmware
to the Hexagon q6 procesor. Add the nodes required to bring up this
processor.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 101 ++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc98..56e6f1370d6c3 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -226,6 +226,37 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+
+		q6_region: wcnss@4ab00000 {
+			no-map;
+			reg = <0x0 0x4ab00000 0x0 0x02b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			qcom,smp2p-feature-ssr-ack;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -903,6 +934,76 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+			      <0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc GCC_WCSSAON_RESET>,
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			clocks = <&gcc GCC_ANOC_WCSS_AXI_M_CLK>,
+				 <&gcc GCC_Q6_AHB_CLK>,
+				 <&gcc GCC_Q6_AHB_S_CLK>,
+				 <&gcc GCC_Q6_AXIM_CLK>,
+				 <&gcc GCC_Q6SS_BOOT_CLK>,
+				 <&gcc GCC_MEM_NOC_Q6_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>,
+				 <&gcc GCC_WCSS_ACMT_CLK>,
+				 <&gcc GCC_WCSS_ECAHB_CLK>,
+				 <&gcc GCC_WCSS_Q6_TBU_CLK>,
+				 <&gcc GCC_WCSS_AHB_S_CLK>,
+				 <&gcc GCC_Q6_AXIM2_CLK>,
+				 <&gcc GCC_WCSS_AXI_M_CLK>;
+
+			clock-names = "anoc_wcss_axi_m",
+				      "q6_ahb",
+				      "q6_ahb_s",
+				      "q6_axim",
+				      "q6ss_boot",
+				      "mem_noc_q6_axi",
+				      "sys_noc_wcss_ahb",
+				      "wcss_acmt",
+				      "wcss_ecahb",
+				      "wcss_q6_tbu",
+				      "q6_axim2",
+				      "wcss_ahb_s",
+				      "wcss_axi_m";
+
+			qcom,halt-regs = <&tcsr 0x18000 0x1b000 0xe000>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.45.1


