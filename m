Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3CC252AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 16:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfEUOtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 10:49:42 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46736 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbfEUOtm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 10:49:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6DBE260A00; Tue, 21 May 2019 14:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558450182;
        bh=YPGcPjW1YGrs1F3/ICCgcunTHbniPxqUU3hRT7sKowA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aDX69x7uQxqQNY8qqxe29lKQAhnTez8EGtb6viWRrPhmBEjA1K//H5B6lO4o0q6E7
         3kRCnT48SZxlVVYo/o6t/pFZ6oK38JfRkAVlwV2z+Ctz6rLPJWEFChUfHmPm495YVg
         /ceAZdXDUdUdcfTpDRCu3y5kcjbSWGe7S+5AeLZU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10058605FC;
        Tue, 21 May 2019 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558450177;
        bh=YPGcPjW1YGrs1F3/ICCgcunTHbniPxqUU3hRT7sKowA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HY1q1k/uhy+17uhmkcdViky44+TWAbeMVnmuI9P+RbdSZmn+GXLv2z2YkUaq2dlZf
         QQyT68Oo8SOd2FK9XKOqzSmnzjQkb4HVWI8SDtfaukwkBF1cUG01mf2DcbTwpYpB2G
         rDDH1tOgulv2bMeGeCZ12GhkvHDQTX9vq/Qm/kKE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10058605FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        david.brown@linaro.org
Cc:     marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v4 6/6] arm64: dts: qcom: msm8998: Add mmcc node
Date:   Tue, 21 May 2019 08:49:27 -0600
Message-Id: <1558450167-21094-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 Multimedia Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 141488e..5a32dfe 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/clock/qcom,mmcc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -1066,6 +1067,19 @@
 			status = "disabled";
 		};
 
+		mmcc: clock-controller@c8c0000 {
+			compatible = "qcom,mmcc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x0c8c0000 0x40000>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>;
+			clock-names = "xo",
+				      "gpll0";
+		};
+
 		timer@17920000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

