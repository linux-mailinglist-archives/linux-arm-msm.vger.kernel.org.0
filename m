Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07D524A562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 19:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgHSR7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 13:59:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:35698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgHSR7U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 13:59:20 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26451207BB;
        Wed, 19 Aug 2020 17:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597859959;
        bh=Pw00uDHv0w9ajiJYnlNTh7BVUE/3W1DjnoMCQt50UtA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ca3EWteZPoUDsf8iW+Z5M/bioKnDZyxe5WKbblVyuOR8U8Lp46h0MDxG5MU5LXRPj
         DSxpR27FNtknS55skeAzvxdCw0083VfZIIpmj7uYC2cEdaaSPfOICHugtFGV7kOXy9
         vKFvGahDrY7go4pEXpP2L38qL3Ta4RAeFJukAMZQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Barry Song <baohua@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 4/5] ARM: dts: tango: Align L2 cache-controller nodename with dtschema
Date:   Wed, 19 Aug 2020 19:58:52 +0200
Message-Id: <20200819175853.21492-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175853.21492-1-krzk@kernel.org>
References: <20200819175853.21492-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix dtschema validator warnings like:
    l2-cache-controller@20100000: $nodename:0:
        'l2-cache-controller@20100000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/tango4-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index 54fd522badfc..d584da314500 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -51,7 +51,7 @@
 		};
 	};
 
-	l2cc: l2-cache-controller@20100000 {
+	l2cc: cache-controller@20100000 {
 		compatible = "arm,pl310-cache";
 		reg = <0x20100000 0x1000>;
 		cache-level = <2>;
-- 
2.17.1

