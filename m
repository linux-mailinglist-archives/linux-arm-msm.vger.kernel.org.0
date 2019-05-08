Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A1316EEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 04:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbfEHCUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 22:20:11 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:33197 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfEHCUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 22:20:11 -0400
Received: by mail-yw1-f65.google.com with SMTP id q11so15004192ywb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3xn9aUdHTXUU+Zzxyk2IpkpM9si4DJKJs9eF/WREL/I=;
        b=tf95ZE3nCfdgu1pnTDfH+dgBMFO5i/a0a0gc+zEHdvOxf2q0PDyUZTkgfr0o2qjpd1
         hWUGkOWMovWzFekc8yXWkTxPxt3P0Hncn+FNwVdnpTQz+Wqx/ZWSJT5TQcA5Xe56LVbh
         C6qfw3gcsRulLCzxPE3aJpvYdOKxDQlHPwcudUVP6ZlWK8cuhdBmQFhKuFcUzt+nFgJt
         5RsKHcugdpgvojQKpjzuNAvPSBpmKMewr0ZcPUzCqmMVeHksBlZK39fhYfsnkePHWrxH
         McbkxCCCe6G+E354jNQiFHZ5j6GBUwgWGt2hoMWaIw+pnAwWd9adUaSyoUJfnk10VMKv
         fi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3xn9aUdHTXUU+Zzxyk2IpkpM9si4DJKJs9eF/WREL/I=;
        b=McQaijH09Dcjgjl/nW9XK8OfxX5+keKBK31FK8oVe7Pwn1kzgWjEcMB2hGFaQx6Zi9
         OAJqtiGlwts9qpKJc2mrAcqbavxVTW9K+L6K4wzPgTlhMz3dUbNX8L/gALEF+MaxoPNZ
         URr2fErDESh+/gqVAgGH7Q5efAAwwBJgTB+G89wOxFpMGEKgadEQezUQ5beVKNgH2ign
         VDK9I1vpc3YGTwpSW9yMO51PPYweZoaYgzEWjbzs8HtODEATTzbyQmTah2ETWZVHlf3O
         tpEFYrUDIOd1gP2TBgTgxx5lO+ZkNx94b0hZtxK4872Sz3Rm1zlZuHJiSMblyjczh+EY
         Ac9Q==
X-Gm-Message-State: APjAAAU26m/pkEVhfvCqgsHXU8KRSyW3Z7Rp7j9wodEVdh8/swGgLEWQ
        7Vx2JrDAWlD7gHH16BinTVCXsQ==
X-Google-Smtp-Source: APXvYqyecJI9uSLoBVIG2oni2XR7jmB3bIQR/Y9OHbOtXUCo3QF+8holn3bu3+ZduqAFuRNVS5n6Og==
X-Received: by 2002:a81:518c:: with SMTP id f134mr7492739ywb.0.1557282010773;
        Tue, 07 May 2019 19:20:10 -0700 (PDT)
Received: from localhost.localdomain (li931-65.members.linode.com. [45.56.113.65])
        by smtp.gmail.com with ESMTPSA id s4sm1168116yws.48.2019.05.07.19.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 19:20:10 -0700 (PDT)
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
Cc:     Leo Yan <leo.yan@linaro.org>, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 04/11] ARM: dts: ste: Update coresight DT bindings
Date:   Wed,  8 May 2019 10:18:55 +0800
Message-Id: <20190508021902.10358-5-leo.yan@linaro.org>
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

This patch switches to the new bindings for CoreSight dynamic funnel and
static replicator, so can dismiss warning during initialisation.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index 81fabf031eff..4bdd247b9534 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -98,7 +98,7 @@
 		};
 
 		funnel@801a6000 {
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x801a6000 0x1000>;
 
 			clocks = <&prcmu_clk PRCMU_APETRACECLK>, <&prcmu_clk PRCMU_APEATCLK>;
@@ -133,7 +133,7 @@
 		};
 
 		replicator {
-			compatible = "arm,coresight-replicator";
+			compatible = "arm,coresight-static-replicator";
 			clocks = <&prcmu_clk PRCMU_APEATCLK>;
 			clock-names = "atclk";
 
-- 
2.17.1

