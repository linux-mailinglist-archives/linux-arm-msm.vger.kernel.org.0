Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B85816EFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 04:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfEHCUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 22:20:41 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:36766 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfEHCUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 22:20:41 -0400
Received: by mail-yw1-f65.google.com with SMTP id q185so14991965ywe.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 19:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2Bpgr+A7spO4G6xG1o8X5Nj3Ve9xjSTX28GmWNncxVY=;
        b=SfmmCjcvk9Y21x1LfjHYxUkIQw9bgTk0QhnF1djSDcjZiSPGKSrTrTEYang4HBroMy
         YZ0P/Fgt4s5zBAK1hnyK711Cg9C31QbZumEGeaa5M5FsRv+Ce3e52h9uY+7qvJXmRkUC
         +0EX0xyuXES9oqa6ZHwewEAZAOBBLjBY0A3MS+VYMzbUAeWCOq2XyBRvoOOhpTMqqdHY
         2IE31whDVQpvwtquaQ2GitvxfbfvFT4wftJlhq8Y8ny2T2Hh8yQcVnO8aK3tPI1FDKaX
         xLWZ/SI2dO5J/MySmYLrCfc7WdjHgRqYLb9UJIrIzDcKzBA5jZlko5QuiVPNAdWAOWDy
         yvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2Bpgr+A7spO4G6xG1o8X5Nj3Ve9xjSTX28GmWNncxVY=;
        b=dkksdODkUPQXuvf4PMgUOzWkzUWMZJRePFDU0cvqhIK0T4gD3D54ueZTGr2llfWoI2
         pHf0E/pouHWuomG1YLlVWka5xrLZ9mRsTwdeeIGGOm03ImwR3eu2oozMNrLy4cp8HQwJ
         F/8vd0leDi4j7WfpoYf6a8YQSEc00t6252gCEW3rTY1iPIynAJuR7QkS72pW3Vd1Kxjo
         wU8zWmraRRUI1TBGPBpoSN/8p1GXL8qP2/LanDDhbk8CzcLu3Qu2BOXwR4Dm77Ihv5Na
         8FR00CWJWQd00w2ZfV4GvcL1R6g0H6vEAbdzI3mLbdowSjOHzIt4I8PKWq9maBLA31Jw
         Lzjg==
X-Gm-Message-State: APjAAAXzFAJqEUX03FmMZlGf+O7AyAE3ATV0jQgkokmr1P/efjQc3T8E
        g/QlQuiJHM41C2TWpUJDV7184A==
X-Google-Smtp-Source: APXvYqwW/sU9i8WFXuedix5B3visshOvwFzz/UJY//oEMVD5Ht2WeqcQvvFu6G9uzUT9ZYWujIRGvQ==
X-Received: by 2002:a0d:cd03:: with SMTP id p3mr22253182ywd.192.1557282040243;
        Tue, 07 May 2019 19:20:40 -0700 (PDT)
Received: from localhost.localdomain (li931-65.members.linode.com. [45.56.113.65])
        by smtp.gmail.com with ESMTPSA id s4sm1168116yws.48.2019.05.07.19.20.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 19:20:39 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 08/11] arm64: dts: juno: Update coresight DT bindings
Date:   Wed,  8 May 2019 10:18:59 +0800
Message-Id: <20190508021902.10358-9-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508021902.10358-1-leo.yan@linaro.org>
References: <20190508021902.10358-1-leo.yan@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CoreSight DT bindings have been updated, thus the old compatible strings
are obsolete and the drivers will report warning if DTS uses these
obsolete strings.

This patch switches to the new bindings for CoreSight dynamic funnel,
so can dismiss warning during initialisation.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi    | 6 +++---
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 7446e0dc154d..26a039a028b8 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -150,7 +150,7 @@
 
 	/* main funnel on Juno r0, cssys0 funnel on Juno r1/r2 as per TRM*/
 	main_funnel: funnel@20040000 {
-		compatible = "arm,coresight-funnel", "arm,primecell";
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x20040000 0 0x1000>;
 
 		clocks = <&soc_smc50mhz>;
@@ -281,7 +281,7 @@
 	};
 
 	funnel@220c0000 { /* cluster0 funnel */
-		compatible = "arm,coresight-funnel", "arm,primecell";
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x220c0000 0 0x1000>;
 
 		clocks = <&soc_smc50mhz>;
@@ -366,7 +366,7 @@
 	};
 
 	funnel@230c0000 { /* cluster1 funnel */
-		compatible = "arm,coresight-funnel", "arm,primecell";
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x230c0000 0 0x1000>;
 
 		clocks = <&soc_smc50mhz>;
diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
index cf285152deab..eda3d9e18af6 100644
--- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 / {
 	funnel@20130000 { /* cssys1 */
-		compatible = "arm,coresight-funnel", "arm,primecell";
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x20130000 0 0x1000>;
 
 		clocks = <&soc_smc50mhz>;
@@ -47,7 +47,7 @@
 	};
 
 	funnel@20150000 { /* cssys2 */
-		compatible = "arm,coresight-funnel", "arm,primecell";
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x20150000 0 0x1000>;
 
 		clocks = <&soc_smc50mhz>;
-- 
2.17.1

