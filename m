Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4604C7DE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 23:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiB1W7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 17:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiB1W7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 17:59:31 -0500
X-Greylist: delayed 179 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 14:58:50 PST
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE419D07D;
        Mon, 28 Feb 2022 14:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646088948;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=dqH8VpKpHp6Ppb3BmpkraxlbOG5eMMt8r+ipCo9yp6E=;
    b=MkHeIQiJesf3XeP1Cey8nnMxMbEQs1y+L9AVlrFHRCKKnlyNl37NmqdpimGrj0Jq5v
    9g1S4GQ4vX8g0EROqv9hScmXX/LkpEn6WuNEKNRVeamVpkUk8UTGOtRHxHeoTeMFvd2R
    7SnAcNwWPjR7vjoUVI33OU7AqF/xZbcirEUeOkmgdoT2ah+1D7a4Rwdzm7dcqCTX5xf9
    /lMQGZnHDvpv+nUNTg17W6v8mvHLJns0ZILnu0oZAUsCPyiBs1e07OVHijXVEO5gLWrO
    1j8OJ92OMkyA9+VnJn+PKJ70jLv/5TVW9j0//u/5nGLN5yzgPAWwMQ9MrsFQgXWSghjY
    NoGg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyL/oVo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.40.1 AUTH)
    with ESMTPSA id kdc58dy1SMtlWqG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 28 Feb 2022 23:55:47 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8916: Add BAM-DMUX for WWAN network interfaces
Date:   Mon, 28 Feb 2022 23:54:00 +0100
Message-Id: <20220228225400.146555-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228225400.146555-1-stephan@gerhold.net>
References: <20220228225400.146555-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Changes in v2: None.
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0a0be43529f6..26b321d2dca1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1314,6 +1314,20 @@ spmi_bus: spmi@200f000 {
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
@@ -1357,6 +1371,22 @@ mpss {
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
2.35.1

