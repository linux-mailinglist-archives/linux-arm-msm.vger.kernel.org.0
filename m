Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA9146168E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 14:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243121AbhK2NiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 08:38:11 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:24566 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhK2NgK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 08:36:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638192765;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=CyuEO/ocBtKZi6xxkM8b+/heUAK2IhFfRxXFov7K2vw=;
    b=srD5753NQRZMLK6EDeSCWM3FnZ5qk6DKVG5auHxJKh2EuvxGiAUeXEf5ve0gW57xUl
    uUnIg/b1hpW08SUw5vbwCbzRvQWiuSkRzEQItfG95Ih9wWpUlfajQDbkxUqmG3uSy0LG
    KIzTyIMgqSvhck0zgk/LHPZ32gLCPqyE4KyhkJn7/pS2VAjQRqTwLjru1zlX/JETCeEB
    ZVo7IPZ+dwdgkGkXHCuB9ggBuUbXwV/VM651bIV/YSDze6jpAS8zhHkupuhGN8R0AxTr
    njuPR/dJ5XTbI6q6H6i0JziZvNhdT0F7f8EUUeJUegI46UXgBCtyIcMNjMsFMCD/ZDC5
    XmJg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2YvqQ"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxATDWiPUv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 29 Nov 2021 14:32:44 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916: Add BAM-DMUX for WWAN network interfaces
Date:   Mon, 29 Nov 2021 14:29:30 +0100
Message-Id: <20211129132930.6901-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129132930.6901-1-stephan@gerhold.net>
References: <20211129132930.6901-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The BAM Data Multiplexer provides access to the network data channels
of modems integrated into many older Qualcomm SoCs, including MSM8916.

Add the nodes for the BAM DMA engine and BAM-DMUX to enable using WWAN
on smartphones/tablets based on MSM8916. This should work out of the box
with open-source WWAN userspace such as ModemManager.

The nodes are disabled by default to avoid loading unnecessary drivers
on devices that cannot use BAM-DMUX (e.g. DragonBoard 410c). However,
strictly speaking the nodes could be enabled by default since both the
bam_dma and bam_dmux driver will simply do nothing if the modem does
not announce any BAM-DMUX channels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c1c42f26b61e..56b6974c01fc 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1309,6 +1309,20 @@ spmi_bus: spmi@200f000 {
 			#interrupt-cells = <4>;
 		};
 
+		bam_dmux_dma: dma-controller@4044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x04044000 0x19000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+
+			status = "disabled";
+		};
+
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,msm8916-mss-pil", "qcom,q6v5-pil";
 			reg = <0x04080000 0x100>,
@@ -1352,6 +1366,22 @@ mpss {
 				memory-region = <&mpss_mem>;
 			};
 
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+
+				interrupt-parent = <&hexagon_smsm>;
+				interrupts = <1 IRQ_TYPE_EDGE_BOTH>, <11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc", "pc-ack";
+
+				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
+				qcom,smem-state-names = "pc", "pc-ack";
+
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+
+				status = "disabled";
+			};
+
 			smd-edge {
 				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
 
-- 
2.34.1

