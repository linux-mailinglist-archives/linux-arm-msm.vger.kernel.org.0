Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0668C16F0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 04:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfEHCVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 22:21:02 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:36792 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfEHCVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 22:21:02 -0400
Received: by mail-yw1-f68.google.com with SMTP id q185so14992461ywe.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 19:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VT/DoumIOruXiAt+IEfHVTj8xFMF06dsPV76vTKLKmU=;
        b=qIQj7mU4c7YJHHe7BHgZEUYGBUP8UfrrrZBbYdGM5Yu+nz6qHXQGamhEyeAGJrzMJ9
         3gl8WGLMdi3K4E4XsP8ft4URWKos/ny2JcrGqYZcBd90V+IfE4RpP28jyXsIZ+wDbVpZ
         sLWdTy+6Q6P96HNODOJIlLlCDRoFLonAdzVThLDnR2hShGvXw6aRh8HRhyPtoIEWmms3
         OY5Dc8BO/PrYgDGwP3JAfuXxgZeQvYQAgv7NYNxIU6nWHrIl3KJf56MWOJ7PX91e2Kn2
         Erpnd30Fb/uVAnXAp3vpywTsDvqCZKUg0agcDNdzQOSl3OPlWni+s0jYRalouzi03tDj
         ufXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VT/DoumIOruXiAt+IEfHVTj8xFMF06dsPV76vTKLKmU=;
        b=bSoJ9XPaMF2rLyJ+KlhorH/jMe32UCsGynRoUkeTUo+vCiJs6MzV5f4cTXYjGR4xYD
         Ng/amp+CV29ZVKu/Gvl7SE4ilQJELUPHX/CJLzhuKEHwGzfRlkdPK6baH36yCFpYXF21
         3vCzVa7ZRQPgJwdtGhz1hX2yvgiliqeUYGh4D4kfuZTrRUb4zxWvZzyA4iLorNkFrNpH
         3muLi3n9p+JV/kkNvVb9LHaTnGY61coFWQTzWQFSXx82rGvqrR3lbvu90QevN0kHGckE
         J+sZZL1vVfwrR63nar56ogSI4GDiB8lq8iKdsunJrGA8DMk8/enmWM9HI0eRJu7mkN/Z
         1TbA==
X-Gm-Message-State: APjAAAX3+kVShgsKNq5/SmYu9r1v/4AIqsZC5CWXggfExz3owU00UpO6
        OvU3ZPgzy0qW3dQjn0BL1lGICg==
X-Google-Smtp-Source: APXvYqwUV2PSsioGsTEJtGNisNfeTjMAt5+acFaEPT1kWqqPlXnSGAxrpT/5JBTWNkf7gyrMX5zVZw==
X-Received: by 2002:a81:6d87:: with SMTP id i129mr20367881ywc.424.1557282061711;
        Tue, 07 May 2019 19:21:01 -0700 (PDT)
Received: from localhost.localdomain (li931-65.members.linode.com. [45.56.113.65])
        by smtp.gmail.com with ESMTPSA id s4sm1168116yws.48.2019.05.07.19.20.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 19:21:01 -0700 (PDT)
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
Cc:     Leo Yan <leo.yan@linaro.org>,
        Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: [PATCH v2 11/11] arm64: dts: sc9860: Update coresight DT bindings
Date:   Wed,  8 May 2019 10:19:02 +0800
Message-Id: <20190508021902.10358-12-leo.yan@linaro.org>
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

Cc: Chunyan Zhang <zhang.chunyan@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
Acked-by: Chunyan Zhang <zhang.chunyan@linaro.org>
---
 arch/arm64/boot/dts/sprd/sc9860.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
index b25d19977170..e27eb3ed1d47 100644
--- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
@@ -300,7 +300,7 @@
 		};
 
 		funnel@10001000 { /* SoC Funnel */
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x10001000 0 0x1000>;
 			clocks = <&ext_26m>;
 			clock-names = "apb_pclk";
@@ -367,7 +367,7 @@
 		};
 
 		funnel@11001000 { /* Cluster0 Funnel */
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x11001000 0 0x1000>;
 			clocks = <&ext_26m>;
 			clock-names = "apb_pclk";
@@ -415,7 +415,7 @@
 		};
 
 		funnel@11002000 { /* Cluster1 Funnel */
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x11002000 0 0x1000>;
 			clocks = <&ext_26m>;
 			clock-names = "apb_pclk";
@@ -513,7 +513,7 @@
 		};
 
 		funnel@11005000 { /* Main Funnel */
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0x11005000 0 0x1000>;
 			clocks = <&ext_26m>;
 			clock-names = "apb_pclk";
-- 
2.17.1

