Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90780319DBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhBLL6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:58:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:48064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230201AbhBLL5j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:57:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D9DE64E8C;
        Fri, 12 Feb 2021 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130950;
        bh=hbNe8n/nOJZWhdmBB+ff/tqK4Qphz4Ib3NZgc4F601A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HZne2W+jDxQvGFKa4u6ELvd9XvUkxbcg4ptThzNGIrBTTb3zagJoYu4n/y+PWQHxM
         KfZ/YDKLEXYPLxj1Wg2FmY7GM13OTtN+vCRlSYdj8Ms70cUd9PnN5vvtYxbEY1Np8W
         xiqFb61yyb28MDQ4tWt7KrLrl0V3pM/BKm4euNNbvN4nac71h5WPeXLniYqzrWDS5i
         +WjynE+O1r0oaaevQELXpkAJHftcHtoJjPTjMHMRyGHY8RIUYzIWXWS1zfm1iqCQXl
         /cdjkCGUbqOfEIaTJivdULrm8I/V76h1QwZtbZQ1wGwzbRzTxzubyPzP0q36QTQ90l
         fTrJvEoL8jEaQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: qcom: sm8350: Add SMP2P nodes
Date:   Fri, 12 Feb 2021 17:25:29 +0530
Message-Id: <20210212115532.1339942-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SMP2P is used for interrupting and being interrupted about remoteproc
state changes related to the audio, compute, modem and sensor subsystems.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 96 ++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index faa0d0a716e6..1ea72f30ea5a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -304,6 +304,102 @@ smem: qcom,smem {
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
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
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_MPSS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
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
+	};
+
+	smp2p-slpi {
+		compatible = "qcom,smp2p";
+		qcom,smem = <481>, <430>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_SLPI
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <3>;
+
+		smp2p_slpi_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_slpi_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.26.2

