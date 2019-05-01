Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C63C103FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 04:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfEAC2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 22:28:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42948 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfEAC2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 22:28:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 78307608D4; Wed,  1 May 2019 02:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556677688;
        bh=7ABu47+yVEBXxQwFhrXF6PtuwFeTfQJoNeNLqYuasrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G9cacA+b6kSEYPdIXegiMScLtN1/rvmMnaq0wcTHNyPKXabPbZt+zh4dRpYIlR9Q3
         zv4Xpt/lxyzD4iEuvilSRWNHoRzwfYP1sGJNgbp8QuR0dzfIRGOnrFzqVnS+7eX2x+
         epDaFREYj6YfrGL57bwKYCePwQwL5ZBKja8YSvbk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D530602F3;
        Wed,  1 May 2019 02:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556677687;
        bh=7ABu47+yVEBXxQwFhrXF6PtuwFeTfQJoNeNLqYuasrs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QvfLK0kxe2J+uJLqU3AD232IfD3zaixYpjbBvCxXEQG9XK8jXim6nTztIQnXcXFgE
         CYfOhCc22qcI7Cw9/U5aun1zaBZ1t2Ai98I830uffUokoKleOEwOiECI/YlV0m1AJK
         nNxUQ/NwJoYmPAb1zYS7jW49atV6BzTQmFASbObA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D530602F3
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
Subject: [PATCH v3 6/6] arm64: dts: qcom: msm8998: Add mmcc node
Date:   Tue, 30 Apr 2019 20:27:59 -0600
Message-Id: <1556677679-29465-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 Multimedia Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 9c88801..5b63fa2 100644
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
+			clock-names = "xo",
+				      "gpll0";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>;
+		};
+
 		timer@17920000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

