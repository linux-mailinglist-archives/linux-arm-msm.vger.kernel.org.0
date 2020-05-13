Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F112B1D19EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 17:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729561AbgEMPvW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 11:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbgEMPvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 11:51:22 -0400
X-Greylist: delayed 82 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 May 2020 08:51:21 PDT
Received: from mxa2.seznam.cz (mxa2.seznam.cz [IPv6:2a02:598:2::90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0B4C061A0C;
        Wed, 13 May 2020 08:51:21 -0700 (PDT)
Received: from email.seznam.cz
        by email-smtpc6b.ng.seznam.cz (email-smtpc6b.ng.seznam.cz [10.23.13.165])
        id 52fbe97b09f5bd1253522525;
        Wed, 13 May 2020 17:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1589385077; bh=aNMmxbEhQ4116ra/TFzsO/WUqMIRJ1ETfre2+VnJRMc=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=jQ/2ofxGw8oM4xo/Rv9UY2PnBABlc+GCQRAXJeIbUjXkTgD5ybptwHbzSONO7jjz6
         i8OMc626J4g1sDvHh9/Meizj5J1Tl6Jvn8nas2Di1oOuRmKV9WeESyfh1digR1kecW
         WTe2+ucJsV+dGOK3W/wlhApDSpq2IexHh6YLcNSQ=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
        by email-relay12.ng.seznam.cz (Seznam SMTPD 1.3.114) with ESMTP;
        Wed, 13 May 2020 17:49:49 +0200 (CEST)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <michael.srba@seznam.cz>
Subject: [PATCH] arm64: dts: qcom: disable the new cti nodes on devices with broken coresight
Date:   Wed, 13 May 2020 17:47:18 +0200
Message-Id: <20200513154718.17401-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Michael Srba <michael.srba@seznam.cz>

Attempting to enable these devices causes a "synchronous
external abort". Suspected cause is that the debug power
domain is not enabled by default on this device.
Disable these devices for now to avoid the crash.

See: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/

Fixes: b1fcc5702a41 ("arm64: dts: qcom: msm8916: Add CTI options")
Signed-off-by: Michael Srba <michael.srba@seznam.cz>

---
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts       | 6 ++++++
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index d1ccb9472c8b..28983b871a70 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -105,6 +105,12 @@ wcnss@a21b000 {
 		etm@85d000 { status = "disabled"; };
 		etm@85e000 { status = "disabled"; };
 		etm@85f000 { status = "disabled"; };
+		cti@810000 { status = "disabled"; };
+		cti@811000 { status = "disabled"; };
+		cti@858000 { status = "disabled"; };
+		cti@859000 { status = "disabled"; };
+		cti@85a000 { status = "disabled"; };
+		cti@85b000 { status = "disabled"; };
 	};
 
 	// FIXME: Use extcon device provided by charger driver when available
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 43c5e0f882f1..8569a1532a3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -98,6 +98,12 @@ wcnss@a21b000 {
 		etm@85d000 { status = "disabled"; };
 		etm@85e000 { status = "disabled"; };
 		etm@85f000 { status = "disabled"; };
+		cti@810000 { status = "disabled"; };
+		cti@811000 { status = "disabled"; };
+		cti@858000 { status = "disabled"; };
+		cti@859000 { status = "disabled"; };
+		cti@85a000 { status = "disabled"; };
+		cti@85b000 { status = "disabled"; };
 	};
 
 	gpio-keys {
-- 
2.24.0

