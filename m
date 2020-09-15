Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA618269F5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgIOHNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:13963 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbgIOHNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153979;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4mZq5TJMN3K2Alyzx1awyVO/XSfb2AHdezwuFDev+Aw=;
        b=FVTFidrWn363/OFDDPYSWP3NxaqvjMH2q8dFe8gQQ0yx9D0SzDjuBVZTPhpof48wBs
        rzaxS/1Qabiku3yVbOdd0Aisp77quT979TwLnpOEj7PuJAu/V1lMvBZPDLnb/oSAJwH5
        RbkK0sgjv6lDXhxjoEDDrQGgAFOV9SYJCrJBMugZc7Hdho48iwurPuLQcMYEYeAp9Tfn
        5lpHwE/sby709PSfx8GImMI9ho4U5Thzdw9OPfA1PVuBbgvzKWb1XuPtUofpH7T3gk2H
        XGgQLFAtB5jlH3PaGxQKnIInVYqK690HnM+F7mADFiDK66Qm5qM1XMhbLpuLEqBonI6e
        3U3g==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7Cvrdp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:12:57 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 02/14] arm64: dts: qcom: msm8916: Remove one more thermal trip point unit name
Date:   Tue, 15 Sep 2020 09:12:09 +0200
Message-Id: <20200915071221.72895-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit fe2aff0c574d2 ("arm64: dts: qcom: msm8916: remove unit name for thermal trip points")
removed the unit names for most of the thermal trip points defined
in msm8916.dtsi, but missed to update the one for cpu0_1-thermal.

So why wasn't this spotted by "make dtbs_check"? Apparently, the name
of the thermal zone is already invalid: thermal-zones.yaml specifies
a regex of ^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$, so it is not allowed
to contain underscores. Therefore the thermal zone was never verified
using the DTB schema.

After replacing the underscore in the thermal zone name, the warning
shows up:

    apq8016-sbc.dt.yaml: thermal-zones: cpu0-1-thermal:trips: 'trip-point@0'
    does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-_]{0,63}$', 'pinctrl-[0-9]+'

Fix up the thermal zone names and remove the unit name for the trip point.

Cc: Amit Kucheria <amit.kucheria@linaro.org>
Fixes: fe2aff0c574d2 ("arm64: dts: qcom: msm8916: remove unit name for thermal trip points")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index d6a5b60846d9..d84118fb4403 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -229,14 +229,14 @@ pmu {
 	};
 
 	thermal-zones {
-		cpu0_1-thermal {
+		cpu0-1-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
 			thermal-sensors = <&tsens 5>;
 
 			trips {
-				cpu0_1_alert0: trip-point@0 {
+				cpu0_1_alert0: trip-point0 {
 					temperature = <75000>;
 					hysteresis = <2000>;
 					type = "passive";
@@ -259,7 +259,7 @@ map0 {
 			};
 		};
 
-		cpu2_3-thermal {
+		cpu2-3-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-- 
2.28.0

