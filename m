Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 496C5FCC3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfKNR4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:56:53 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:53106 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726953AbfKNR4x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:56:53 -0500
Received: from localhost.localdomain (unknown [10.0.11.2])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id BCB47C9921;
        Thu, 14 Nov 2019 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1573754211; bh=l1RyFP0TfBX+tWj8W5ntFICeDQ2UnIKbp0/AHSmX+4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xK9tTzBXG38FabJTjfioWpPwDGLpp3QqZ0RmxEFCk4hBhaXnC/M2cpaapQjbPyF21
         xGYYuf+DagLYbFWq2oOX5pBBQxJHGRHzUEYOw3ew/eguCUU/WFKpsPQdziW+gQoR7W
         la0YTrd1g2m7gvZwuawPMxBshY5EFULkjDhURuKM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: msm8974: Move ADSP smd edge to ADSP PIL
Date:   Thu, 14 Nov 2019 18:53:49 +0100
Message-Id: <20191114175348.288976-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191114175348.288976-1-luca@z3ntu.xyz>
References: <20191114175348.288976-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

With the introduction of SSR support in the ADSP PIL we should describe
the SMD edge inside the ADSP PIL node.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[luca@z3ntu.xyz: Add label for the smd edge]
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index b357cb51c0fb..9c8089e26a60 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -360,6 +360,15 @@ adsp-pil {
 
 		qcom,smem-states = <&adsp_smp2p_out 0>;
 		qcom,smem-state-names = "stop";
+
+		smd-edge {
+			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+
+			qcom,ipc = <&apcs 8 8>;
+			qcom,smd-edge = <1>;
+
+			label = "lpass";
+		};
 	};
 
 	smem {
@@ -1569,13 +1578,6 @@ reboot-mode {
 	smd {
 		compatible = "qcom,smd";
 
-		adsp {
-			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,ipc = <&apcs 8 8>;
-			qcom,smd-edge = <1>;
-		};
-
 		rpm {
 			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 			qcom,ipc = <&apcs 8 0>;
-- 
2.24.0

