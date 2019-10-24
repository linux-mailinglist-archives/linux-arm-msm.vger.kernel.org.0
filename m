Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30310E2F09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 12:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409181AbfJXKby (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 06:31:54 -0400
Received: from onstation.org ([52.200.56.107]:37242 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409175AbfJXKbq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 06:31:46 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 5B0EF3F25B;
        Thu, 24 Oct 2019 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1571913105;
        bh=0PQxYq2jCdswV9xIvHJF+/W+GWlE+ha9RuMZB12R9dY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bZ/lmAPKYuR1uR+nja/k0YA7gVTt4jS65c7cNPXJL6FETz2pBV8W8UN1PjhcfAIZT
         hmDiulSrlfythn1NLj7ubAcpNi+vQHNKZg+SLoLWy9ndIJFxosmB0EdK74SSlbC3N5
         lT1XDpz83M68vhx/YH5ONYpJ3p3XwkyVaKOhiShc=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        georgi.djakov@linaro.org
Subject: [PATCH v2 3/4] ARM: dts: qcom: msm8974: add ocmem node
Date:   Thu, 24 Oct 2019 06:31:39 -0400
Message-Id: <20191024103140.10077-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191024103140.10077-1-masneyb@onstation.org>
References: <20191024103140.10077-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ocmem node that is needed in order to support the GPU upstream.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v1:
- None

 arch/arm/boot/dts/qcom-msm8974.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 39a3a1d63889..bdbde5125a56 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1087,6 +1087,25 @@
 			};
 		};
 
+		ocmem@fdd00000 {
+			compatible = "qcom,msm8974-ocmem";
+			reg = <0xfdd00000 0x2000>,
+			      <0xfec00000 0x180000>;
+			reg-names = "ctrl",
+			            "mem";
+			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+			         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
+			clock-names = "core",
+			              "iface";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gmu_sram: gmu-sram@0 {
+				reg = <0x0 0x100000>;
+			};
+		};
+
 		mdss: mdss@fd900000 {
 			status = "disabled";
 
-- 
2.21.0

