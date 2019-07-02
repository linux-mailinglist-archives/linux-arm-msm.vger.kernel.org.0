Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 515BB5CF2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2019 14:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfGBMMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 08:12:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35732 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfGBMMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 08:12:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 718D6607CA; Tue,  2 Jul 2019 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562069566;
        bh=RLBvnxM+OVbNv4r5AYHQOxPu145fE2liFYRI6/iiGbU=;
        h=From:To:Cc:Subject:Date:From;
        b=J08daGH6gIrUYLRP0hlqHmrTtP68/8CkE4bEd2q5+AQ4K8gOmB03MnzeXvBcORbSe
         62rqnfpvym72/rxCulhpq6NjZZpy2UQqBfQ7tpeM7D2ZB9Q1u3YdVEpvihBd44jmbQ
         Y3lxSETWvroB6ZhlCTjTcPNBBJwgnGloUMduDTWo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E35AD607B9;
        Tue,  2 Jul 2019 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562069565;
        bh=RLBvnxM+OVbNv4r5AYHQOxPu145fE2liFYRI6/iiGbU=;
        h=From:To:Cc:Subject:Date:From;
        b=jZq88CHDAP2GN0GIQdcRABMvIW/2zjcU2ARY+JZNyQpT92erEpVBr35mSDR4fGjmG
         ajue6NMTi4E77O7gpnbcxajVRJ+CQeMmr4J3FFKoaxLkMzRZ2FnX82GfKojbQH90SF
         w1kduKUmPBlIDaEDglnE4SgnJ1yP1xxdExFFMFis=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E35AD607B9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <mgottam@codeaurora.org>
Subject: [PATCH v3] arm64: dts: sdm845: Add video nodes
Date:   Tue,  2 Jul 2019 17:42:29 +0530
Message-Id: <1562069549-25384-1-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Malathi Gottam <mgottam@codeaurora.org>

This adds video nodes to sdm845 based on the examples
in the bindings.

Signed-off-by: Malathi Gottam <mgottam@codeaurora.org>
Co-developed-by: Aniket Masule <amasule@codeaurora.org>
Signed-off-by: Aniket Masule <amasule@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb9330..f3cd94f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1893,6 +1893,36 @@
 			};
 		};
 
+		video-codec@aa00000 {
+			compatible = "qcom,sdm845-venus";
+			reg = <0 0x0aa00000 0 0xff000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&videocc VENUS_GDSC>;
+			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
+				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			iommus = <&apps_smmu 0x10a0 0x8>,
+				 <&apps_smmu 0x10b0 0x0>;
+			memory-region = <&venus_mem>;
+
+			video-core0 {
+				compatible = "venus-decoder";
+				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
+				clock-names = "core", "bus";
+				power-domains = <&videocc VCODEC0_GDSC>;
+			};
+
+			video-core1 {
+				compatible = "venus-encoder";
+				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+				clock-names = "core", "bus";
+				power-domains = <&videocc VCODEC1_GDSC>;
+			};
+		};
+
 		videocc: clock-controller@ab00000 {
 			compatible = "qcom,sdm845-videocc";
 			reg = <0 0x0ab00000 0 0x10000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

