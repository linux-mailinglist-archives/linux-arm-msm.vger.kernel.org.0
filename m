Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFBD197AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 06:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfEJEey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 00:34:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38662 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfEJEeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 00:34:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id j26so2352246pgl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 21:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dq0IfhIwE0oJzF2M3hbnPUu/0PRVMLml8CA0YPhM3BQ=;
        b=oF4X8RnGi9iBZU3SfMGMa31yXLsb1FU8OPudWFd5Y7SgOeplISwKrM1bN+PBWwFj4V
         TjphKAwGQbCOgxtedE2O8zrVJcmfIomb9EFzv8vXWXC+SR9PnNgrvIH7lXER1eCSLifw
         n1Rnusg9gDhPVp9onVt5uwwyPcbE0m3msUpBEaMX4CjF3b2wcfXeIZNo2Zlass1tJozA
         Ky+1BGXx3clBBpmrMqUY7fCLf4jQWxtAf28p1EDfmod6H5CiDfek7ckDbMeis7QV/vK2
         at4gwvCIs+d3uKsw7qYlt1hqv9aEJ57SFAPRSEdBrd8lo9nKC3ZDuPnRqTaWNyrjYEwm
         XmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dq0IfhIwE0oJzF2M3hbnPUu/0PRVMLml8CA0YPhM3BQ=;
        b=oau1DeC1avczFAhUyoMTu5giyc9yGgo64PGdGezMJ91XFmfYvVH2u9fxp9prLHoAy4
         7UC1lSXti+v0fWLSot9NzvakpUpDbqfLwgUMYMf/1zH8r7/I+WJgAKfrescXSlhqjbLC
         iJjAvIGKnDdumQ2VeFiYU9sNJ+wXQa5kmnOhL+ne6aAGinP1SeaSr35C5r2cYCJNIeEP
         eXmI6F9AMgvydmbbKV5oiLN1QlVU13wX0ZAaHAr+d//tvLFrhmYCB02jrYVk9GeJslAF
         YLs22ThH5SRuICBWiT1aQ1aJjGiEgEiPg0/ndIX8ubI9Qr4ysmJcjivTAnL4io5Ayj9C
         c0ow==
X-Gm-Message-State: APjAAAXbDYP9HHGAjRo1NrV4DVs373csQDxS4B1hjMcujsCgxCX4yBT3
        s1T4Hx7aNNh48CYwkzZlfFmckg==
X-Google-Smtp-Source: APXvYqx8k83eUfp5LYdEv3Mnt7OktxsjQpg4XQyaqaHpUaOb1y2LuBte//YaeEQ0T5ElHTkAAvbzqw==
X-Received: by 2002:a63:309:: with SMTP id 9mr11132618pgd.49.1557462870512;
        Thu, 09 May 2019 21:34:30 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm4785317pfm.149.2019.05.09.21.34.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:34:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] arm64: dts: qcom: qcs404: Fully describe the CDSP
Date:   Thu,  9 May 2019 21:34:18 -0700
Message-Id: <20190510043421.31393-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add all the properties needed to describe the CDSP for both the
Trustzone and non-Trustzone based remoteproc case, allowing any child
devices to be described once by just overriding the compatible to match
the firmware available on the board.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 82 +++++++++++++++++-----------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3eb6089c8024..896f95817f23 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -113,37 +113,6 @@
 		};
 	};
 
-	remoteproc_cdsp: remoteproc-cdsp {
-		compatible = "qcom,qcs404-cdsp-pas";
-
-		interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog", "fatal", "ready",
-				  "handover", "stop-ack";
-
-		clocks = <&xo_board>;
-		clock-names = "xo";
-
-		memory-region = <&cdsp_fw_mem>;
-
-		qcom,smem-states = <&cdsp_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-
-		status = "disabled";
-
-		glink-edge {
-			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,remote-pid = <5>;
-			mboxes = <&apcs_glb 12>;
-
-			label = "cdsp";
-		};
-	};
-
 	remoteproc_wcss: remoteproc-wcss {
 		compatible = "qcom,qcs404-wcss-pas";
 
@@ -288,6 +257,57 @@
 			clock-names = "core";
 		};
 
+		remoteproc_cdsp: remoteproc@b00000 {
+			compatible = "qcom,qcs404-cdsp-pas";
+			reg = <0x00b00000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&xo_board>,
+				 <&gcc GCC_CDSP_CFG_AHB_CLK>,
+				 <&gcc GCC_CDSP_TBU_CLK>,
+				 <&gcc GCC_BIMC_CDSP_CLK>,
+				 <&turingcc TURING_WRAPPER_AON_CLK>,
+				 <&turingcc TURING_Q6SS_AHBS_AON_CLK>,
+				 <&turingcc TURING_Q6SS_AHBM_AON_CLK>,
+				 <&turingcc TURING_Q6SS_Q6_AXIM_CLK>;
+			clock-names = "xo",
+				      "sway",
+				      "tbu",
+				      "bimc",
+				      "ahb_aon",
+				      "q6ss_slave",
+				      "q6ss_master",
+				      "q6_axim";
+
+			resets = <&gcc GCC_CDSP_RESTART>;
+			reset-names = "restart";
+
+			qcom,halt-regs = <&tcsr 0x19004>;
+
+			memory-region = <&cdsp_fw_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,remote-pid = <5>;
+				mboxes = <&apcs_glb 12>;
+
+				label = "cdsp";
+			};
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,qcs404-pinctrl";
 			reg = <0x01000000 0x200000>,
-- 
2.18.0

