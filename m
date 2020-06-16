Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C87C1FBC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 19:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgFPRQB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 13:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbgFPRQB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 13:16:01 -0400
Received: from the.earth.li (the.earth.li [IPv6:2a00:1098:86:4d:c0ff:ee:15:900d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DD7C061573;
        Tue, 16 Jun 2020 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
         s=the; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
        Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=dbQoMBtrvJc0duBMGogI6Q7i8MYxJOUerLAn0kA1v6A=; b=IFnTibcoYkhRgl0owbzd+OjLr2
        KxHKhhfPdJtgiGhxvZtAjpC1PlZoVr9V5bJMz+Vc2EO8EWEE9b3MUkRmMHwjDmv4OThvEcQXbfJrH
        KSZfIBCuKwHWNzvpV02JOUeF0ue+b1CM9qrhwI/auPhhPnYl0eI5iUDZ+oyfRK3T2S66vS2UtgaLG
        XX9CdRH4WKq0T97IGCM/2KX9EN8TIxFsErgpQnapOTKrLgGOPpxAEmiz9UG6f8VRme+Evb+T4twW+
        tBFodIS6sR+HbCsWIDPkqZepCJsj5Uc/NlZRqgjbyq7lTIsy6wFM5ex7JqIuQYbin3W5u26ohQd/R
        MND8kOrA==;
Received: from noodles by the.earth.li with local (Exim 4.92)
        (envelope-from <noodles@earth.li>)
        id 1jlFBi-0001Vi-Ma; Tue, 16 Jun 2020 18:15:54 +0100
Date:   Tue, 16 Jun 2020 18:15:54 +0100
From:   Jonathan McDowell <noodles@earth.li>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: add qfprom definition to ipq806x
Message-ID: <20200616171554.GA5632@earth.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing qfprom definition for ipq806x SoC

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index b912da9a3ff3..8f299cae2628 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -425,6 +425,13 @@
 			qcom,controller-type = "pmic-arbiter";
 		};
 
+		qfprom: qfprom@700000 {
+			compatible = "qcom,qfprom";
+			reg = <0x00700000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-ipq8064";
 			reg = <0x00900000 0x4000>;
-- 
2.20.1

