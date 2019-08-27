Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0F739E797
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbfH0MPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:15:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35488 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729969AbfH0MPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:15:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id d85so14032985pfd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=A5EmULFtDl5i5Z5Rzq6bwCLJMqdhrquKs6z6Oe0kR7k=;
        b=w8Oc3pFTLBEG/TCudB+3yJrs26KIoXt8+oquaINe8ipfHBdCvRtTU91u9i6DY4GYt+
         8eY3a1EtCU596QzEwlekxoIyrRWYiGX+xds3Hdr9pFDWU5xYL+aRQ08Ox/2lVe3GcK4w
         1rDJcbz0JF660l/Fbj9uk8WqP9yLlXMLcVXKb7SEOeCcTG+e8Ir95+L31hFrP28xZB3z
         6+u2oLuZyYU5JrbaCo9d7gx5EcjVMVCrdaYMyCostqbCap80ct7DaJP+sKFELi4OW4tt
         raFuviw9pDZdduFFpSy3BOhU0FdEL3hGDFbsxG8GOsZiAaShDUm8nIrcxWOOPD9+vauJ
         whHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=A5EmULFtDl5i5Z5Rzq6bwCLJMqdhrquKs6z6Oe0kR7k=;
        b=lyUSEDlX/6mUowQ54aPtiVl7Ykm0eC49HauISqvvE7IxtUXNAFn97TwY1FBYOckIPe
         1gfvVDyvIF3r74xi+zXWTX531Hzgwz1nwIdzdNN2EN57OHdZM2WkF1ULCKke/lYkE1le
         PlVZhAMsNPaAMYkQ0WwHW7kjE7iboQkNzBitQdJlHLgRRZcZw5df5hyE0aR91qgxQiKm
         Oy35mCo19rvtvnZt4CJv71PiYTsK5krhemlGszWUN68UUZjZloOsP2y99SfKgh5x/zGh
         AQ5cdie0ixXfWheXVtKva6tyAdNuNpXt37vsZPnK/n4cHSNi8fSvytWrjB8TNj8cUKYO
         89cA==
X-Gm-Message-State: APjAAAVdLuqkvPbg/Dmaehlx3Yw6pmE10yYstors8X7muQLySxWvQbxA
        w0Gg1J6UDRwK+E/BedQMQws/tQ==
X-Google-Smtp-Source: APXvYqzv4AuLKMaw1mkPE5w73Uh2fp1sJoQ5QLxaSyFcMnMWCK68xN0Gcw7rMKK8p7MKqYEXVR5/3Q==
X-Received: by 2002:a63:c009:: with SMTP id h9mr20902459pgg.166.1566908108909;
        Tue, 27 Aug 2019 05:15:08 -0700 (PDT)
Received: from localhost ([49.248.54.193])
        by smtp.gmail.com with ESMTPSA id d3sm3159687pjz.31.2019.08.27.05.15.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:15:08 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        sboyd@kernel.org, masneyb@onstation.org, marc.w.gonzalez@free.fr,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Tue, 27 Aug 2019 17:44:07 +0530
Message-Id: <74b10329041835ea1b019817729fe2d87f83e65b.1566907161.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 42 +++++++++++++++-------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3d0789775009c..065a60d50a07f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -280,6 +280,8 @@
 			nvmem-cells = <&tsens_caldata>;
 			nvmem-cell-names = "calib";
 			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -1071,8 +1073,8 @@
 
 	thermal-zones {
 		aoss-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 0>;
 
@@ -1086,8 +1088,8 @@
 		};
 
 		q6-hvx-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 1>;
 
@@ -1101,8 +1103,8 @@
 		};
 
 		lpass-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 2>;
 
@@ -1116,8 +1118,8 @@
 		};
 
 		wlan-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 3>;
 
@@ -1131,8 +1133,8 @@
 		};
 
 		cluster-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 4>;
 
@@ -1165,8 +1167,8 @@
 		};
 
 		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 5>;
 
@@ -1199,8 +1201,8 @@
 		};
 
 		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 6>;
 
@@ -1233,8 +1235,8 @@
 		};
 
 		cpu2-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 7>;
 
@@ -1267,8 +1269,8 @@
 		};
 
 		cpu3-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 8>;
 
@@ -1301,8 +1303,8 @@
 		};
 
 		gpu-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
 
 			thermal-sensors = <&tsens 9>;
 
-- 
2.17.1

