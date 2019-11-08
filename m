Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA0EF4D72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 14:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfKHNpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 08:45:35 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:11767 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbfKHNpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 08:45:35 -0500
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 08:45:33 EST
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Nov 2019 19:09:24 +0530
IronPort-SDR: NWkI7rgL15orLupgRLT1GeV9BYDxTslGyQtTOhFGy4B+0G3VzwbWz4Re9HT5IIqunHcrUkYa+o
 bpcDX/OMf84FkvdTEAmN5/L2mmiwJplaCRgC8/PBNDfl51QnOKcxlu242AQZ8oEiCIUlyCAWYj
 Bz7e59YhBrYNhb+KK5tqE9gwjuqHr/VNUL0cFXuaeF164X/UtxTivynR1jt81ozGSDPTVkkXsT
 +tVSJzn1smua0TMXo83+FBlkYFdJomJEu4nL+0tzAaoG+Q8EIcauNPy6No0c6YbRP3HWSO2nec
 sP2JpV3JtjVYi5w6cT/N+WMA
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Nov 2019 19:09:00 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id C56B34949; Fri,  8 Nov 2019 19:08:58 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, georgi.djakov@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, sboyd@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC-v2 1/2] dt-bindings: mmc: sdhci-msm: Add Bus BW vote supported strings
Date:   Fri,  8 Nov 2019 19:08:38 +0530
Message-Id: <1573220319-4287-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Bus bandwidth voting supported strings for qcom-sdhci controller.

Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---
 .../devicetree/bindings/mmc/sdhci-msm.txt          | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
index da4edb1..22fb140 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
@@ -39,6 +39,25 @@ Required properties:
 	"cal"	- reference clock for RCLK delay calibration (optional)
 	"sleep"	- sleep clock for RCLK delay calibration (optional)
 
+Optional Properties:
+* Following bus parameters are required for bus bw voting:
+- interconnects: Pairs of phandles and interconnect provider specifier
+		 to denote the edge source and destination ports of
+		 the interconnect path. Please refer to
+		 Documentation/devicetree/bindings/interconnect/
+		 for more details.
+- interconnect-names: List of interconnect path name strings sorted in the same
+		order as the interconnects property. Consumers drivers will use
+		interconnect-names to match interconnect paths with interconnect
+		specifiers. Please refer to Documentation/devicetree/bindings/
+		interconnect/ for more details.
+- msm-bus,name: string describing the bus path
+- msm-bus,num-cases: number of configurations in which sdhc can operate in
+- msm-bus,num-paths: number of paths to vote for
+- msm-bus,vectors-KBps: Takes a tuple <ib ab>, <ib ab> (2 tuples for 2
+				num-paths) The number of these entries *must*
+				be same as num-cases.
+
 Example:
 
 	sdhc_1: sdhci@f9824900 {
@@ -56,6 +75,19 @@ Example:
 
 		clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
 		clock-names = "core", "iface";
+		interconnects = <&qnoc 50 &qnoc 512>,
+				<&qnoc 1 &qnoc 544>;
+		interconnect-names = "sdhc-ddr","cpu-sdhc";
+		msm-bus,name = "sdhc1";
+		msm-bus,num-cases = <3>;
+		msm-bus,num-paths = <2>;
+		msm-bus,vectors-KBps =
+		/* No Vote */
+		<0 0>, <0 0>,
+		/* 50 MB/s */
+		<130718 200000>, <133320 133320>,
+		/* 200 MB/s */
+		<1338562 4096000>, <1338562 4096000>;
 	};
 
 	sdhc_2: sdhci@f98a4900 {
-- 
1.9.1

