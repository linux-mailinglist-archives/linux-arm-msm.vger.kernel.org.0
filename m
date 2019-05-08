Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5363816EF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 04:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfEHCUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 22:20:34 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:36763 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfEHCUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 22:20:33 -0400
Received: by mail-yw1-f67.google.com with SMTP id q185so14991803ywe.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2019 19:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TAc/GxMoJ12hlCOKjFhOOuRo1hB5yjbAsEcA/xgu61o=;
        b=Eg5kI3qCSpK3XZPhkRqPo+oVbC77BreWmlwyhoojn5j2LlMdObG210c+a+fDiE1uUi
         QEmxB70VH2Uqq+5Y7JTUyj5ZFqHAcgCD1VCtgRYuIpzOyLDVq+pwWem8hLocVWiMsUco
         W0D0/vLcdUSJOIqBd7IgYQJoHSEZeDEq+Q7Nagto/LhwP5ghW84TVK1i5lDspAZWGCI5
         OzWMD7FO0Uw/YfPvSmARA+LElMYCbnMWJvY9u5YANfW8MfyhqXmm2xV0PSrxMxPpw+r4
         YZe9BcQiF0MHRPZTvVunfxNxPuVuBCyEqv6BkiliyuxW2CfS3ymYcOK4EgX7LkRcjD3t
         UGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TAc/GxMoJ12hlCOKjFhOOuRo1hB5yjbAsEcA/xgu61o=;
        b=jKQOqOmoS0NziLoUiTinmw+0gWil9HozTuhf44KvB7Y5hsrmLQVimH8irEwo6GPi2V
         qjrmVNYvUTE8PWJ6KyoBx1g4mPMmwHH/aA4VcuQ0fZMURi10v+m2Sn/2PYa6lYxShIwC
         s/pzvvGy/kxnVHIbNM4RSg+tV/c6g+rCLs5xVqmmfN7yVCmvnaY70XJOI8JUz+XY16ur
         M5mmDG2K8p3gjVX5qsJn40xgQUCprfDuZlNoFPgsTnI95MlSg5e5zQILPKO9SHuVotJr
         1N0VE+V5yPryTx4+SWZ0fXIQ1q4Z+oyLbLuoSicSzh90Y+sGyL3u8qr8XLuIk9Cf/SwU
         SJjQ==
X-Gm-Message-State: APjAAAXqT3ERoyOht2BCkope0yzbx45dIbVkj+UIqehVyvmIX5fRxXWV
        vXLJABOjcQtYIG/8K+KVTFsBcQ==
X-Google-Smtp-Source: APXvYqzk9BHBwOpSjsEO+DnEKaJxR99GL7ibPg5s4a2YFp1iHsfA6y6hU3vx6atjzY8D9Bdr0cfr0g==
X-Received: by 2002:a81:1388:: with SMTP id 130mr23630836ywt.36.1557282033177;
        Tue, 07 May 2019 19:20:33 -0700 (PDT)
Received: from localhost.localdomain (li931-65.members.linode.com. [45.56.113.65])
        by smtp.gmail.com with ESMTPSA id s4sm1168116yws.48.2019.05.07.19.20.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 19:20:32 -0700 (PDT)
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
Cc:     Leo Yan <leo.yan@linaro.org>, Guodong Xu <guodong.xu@linaro.org>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>
Subject: [PATCH v2 07/11] arm64: dts: hi6220: Update coresight DT bindings
Date:   Wed,  8 May 2019 10:18:58 +0800
Message-Id: <20190508021902.10358-8-leo.yan@linaro.org>
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

Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 68c52f1149be..5a34217d823a 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -15,7 +15,7 @@
 / {
 	soc {
 		funnel@f6401000 {
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0xf6401000 0 0x1000>;
 			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
 			clock-names = "apb_pclk";
@@ -65,7 +65,7 @@
 		};
 
 		replicator {
-			compatible = "arm,coresight-replicator";
+			compatible = "arm,coresight-static-replicator";
 			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
 			clock-names = "apb_pclk";
 
@@ -133,7 +133,7 @@
 		};
 
 		funnel@f6501000 {
-			compatible = "arm,coresight-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0 0xf6501000 0 0x1000>;
 			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
 			clock-names = "apb_pclk";
-- 
2.17.1

