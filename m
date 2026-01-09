Return-Path: <linux-arm-msm+bounces-88177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D8D0724C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3979305E288
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C9E1DA628;
	Fri,  9 Jan 2026 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka564WqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416E2DE701
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933257; cv=none; b=mqmsS1O+zaQW7eG6PXqFTzRhC+qxCn3IRIbyhm6L53UySoWV0f1YTIq6DLXeRHIjaxaacPj3bnerVoUOvVCpWOkmK+wtcrHpNxVLkHWMW+rpcrFWZWVBIOUz2YWFHkJodhvUQOPgaw8rX8GGhbJ+t7lqaClDURl53O/RdVKnB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933257; c=relaxed/simple;
	bh=Rj5PF4kkx8UYCh2Z9Zcdx9RhapFodlCcdhqtn13jraI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4y9lFyCgA3XVhm4JWhXvy+nJoLpi0b3UocAHq3ZSey645DeDkkn16A2TEYel0DLdITJnbRsTmGGX56ZMQqlG+u4kfm3p6sxyT1HPuT0943YfcI0gHUD+1t/YbtNCyMk1GcJoZZzay5ols6QhZgKllWspxhiz9OXzTUkqEx4IAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka564WqA; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-3eae4e590a4so2022192fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933253; x=1768538053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLAZec+69W0xvV+E29B/iSJ71Q0zPCP3JKbVoTTx9Tg=;
        b=ka564WqAwbDWkk5vubPgKmfOZC6oGceuv6syzKSg1CQff/dZICUXtFx6Qmt7FFGQ+0
         7mFRGnl6aVtdcn0H+zTTl2mZ/1SJVUY1q/fHO4C/JobRXuTIbWhoSnWvtDwy63k/wJuZ
         acf4U9rxxcNFuefU1QzYcngKE8zmNJMtSJHTd4gvKi44+9vHc+LTR1DJ+JiN9cuJQxRu
         fN/RcuO+j7ZONhuyVTDfpkEIdRwbiQjPuPz5KS6FYOH7wWdE/agSfR4JKA1TZF9VfZMv
         YYStORNmBXMduVr10QLuPLYuvaOxlP+AttG+2nvfryJ4tniocx4QK8CMjXMDM5TEJAIE
         wzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933253; x=1768538053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLAZec+69W0xvV+E29B/iSJ71Q0zPCP3JKbVoTTx9Tg=;
        b=rmbuA2Sd7Kwt8tsTqgAnoD75Amyc5mhz+v8eH1/SwQdttz6zUuxcpWdywVj8unavUt
         b4rtaXAmF3eF9DyKC6mMjKhuGmK0MI8w+JK4afTencSowNbzYlpQj+VCe8CzqUq7V0XH
         Ns5lvZYOWkGWWaAx3sAus984FzWjyk2FfAHCzV1qJuVCPbEyQSopvtFnww8QWgcP82Kv
         q4Tozl/Ha9/jI7s3AgJh7i5RqnNgzX8ZiPJa8f/mQUsviC/F0qQ4E56wyuoFVNMvNJ5n
         TgxfPsZHKupfFgR2IhtuipdlpkraiGa+1p83yThntSvjoDoF/K2IHMMo++rj35leeMjk
         5D1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHULiuDDW8sgGQSIT2smPgH/K0nUwBIK8Wq9wB6tAoUXBV2/8DDz5TKuFnlJDRkvywth8bSGyH8Smfp1pI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlq9WfTIZOdNYyT6O2aElB/+4qLk9cXOjT07JWUCFjjw0mYHNb
	iuwcyleWLbGmkeMUZcL41EtgQWvNWuEd1Q4iVWqk8SiehgzmaMsifkfS
X-Gm-Gg: AY/fxX5nsJnrhZIBMFAheyalenF1ptA3LTBIjwV9QslwzsExDZAA8JG5tGQu1hFtBZW
	W/2lTTHx8i2Tt+wriEQd7Og/vy5+yRNTJGEGuoju/WZXLqxvd65xG5Zo5fP9Pk5ni00UuVQe47B
	WORSvK6sX59OebGgr+9VLjNsu9dvXuViQSeZJLWOmWOl8C8mpe96ltlBvrX6YwNITvyXVEaAgMr
	1pK+yaO9JtWT3MsjAE5Juf2bEncw6pzkmUvyuqCJWGU5cCJIHxTGUIIXGi03jlfVM4bNuYkqS4G
	Kqj+xGV7kBb4cPXCZqu8oXOPLShPgRnNSeD5vCvpu+1RUcgqqqainFw5ZJ8N/yCHiv9nywfd95O
	M9xQiDCJE9S3jDEsieYEl++8hsJ6SDzzD0nepQhcIgo5zVKhwWYHiDz155jChn7Tpge2sZUUJ6q
	n3wqg30qjeQvMkEU6eo9cMmzfQmHXkbGlQMpF1peuKB0qj+EkObElCojYkOGGLneLKjcm5f7u2a
	PCzRV9y7SjmDov6loHSM7g9Qvuj
X-Google-Smtp-Source: AGHT+IHhmLd9QokCnmdrjmN460hm0QSVTgysKbvdgBbpEqXgCTi50/GZXdPKyd7ggwHgyojjtJjDzQ==
X-Received: by 2002:a05:6870:3353:b0:3f5:b004:314e with SMTP id 586e51a60fabf-3ffc0b5e85bmr4714763fac.46.1767933252709;
        Thu, 08 Jan 2026 20:34:12 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:11 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: mathieu.poirier@linaro.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 5/9] arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
Date: Thu,  8 Jan 2026 22:33:40 -0600
Message-ID: <20260109043352.3072933-6-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
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
index 86c9cb9fffc9..56e6f1370d6c 100644
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


