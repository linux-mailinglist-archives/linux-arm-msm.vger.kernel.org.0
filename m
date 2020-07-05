Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F026B214D16
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2020 16:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgGEOZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jul 2020 10:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgGEOZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jul 2020 10:25:46 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D32C061794;
        Sun,  5 Jul 2020 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=n2oBhT8zsGL2xabMeM+zfCIKEki/CC4cOhyGVHtuRsg=; b=OazDIygei+P8LbsZeVu+rDqRJi
        bYT/GhnHuWkkBQ7FdeZcJSMIOffBqMhMs83xXXAyI89YdWQxudFYBl80Hi8izkBj1QvtB3MjZydvi
        3i2J3XT7fA7P4pq6pdTSEg1EDPzV0PJWT2cGx1gcZGjnZM45PwVc9XhiWL+jHZp3491t6MFZlsbdk
        5kL5M7yg79dJxL8vb+rssRDuQ3pzCws1uLq5+JXlCR/XDZA7xnkIn9Y9ZU/SKqBVVP2yw4+iqhhGr
        6ipdEWNBKvQvipxmoGIlYRGJUSfGaSHekyfIATUfu8nTsbretmMZ0Rb0ecXQtboavAP4VD5Gn0b9/
        0NiGx8ww==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1js5aS-0000v6-TL; Sun, 05 Jul 2020 15:25:44 +0100
Date:   Sun, 5 Jul 2020 15:25:44 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: add prng definition to ipq806x
Message-ID: <20200705142544.GA3389@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing prng definition for ipq806x SoC

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index b912da9a3ff3..22e0669b9133 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -386,6 +386,13 @@ gsbi7_serial: serial@16640000 {
 			};
 		};
 
+		rng@1a500000 {
+			compatible = "qcom,prng";
+			reg = <0x1a500000 0x200>;
+			clocks = <&gcc PRNG_CLK>;
+			clock-names = "core";
+		};
+
 		sata_phy: sata-phy@1b400000 {
 			compatible = "qcom,ipq806x-sata-phy";
 			reg = <0x1b400000 0x200>;
-- 
2.27.0

