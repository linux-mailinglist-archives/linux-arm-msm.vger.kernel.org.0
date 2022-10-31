Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE826613CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 18:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJaR5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 13:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiJaR5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 13:57:45 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A3712AEB;
        Mon, 31 Oct 2022 10:57:43 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A9EEDD03F3;
        Mon, 31 Oct 2022 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1667239061; bh=D4aOP4rVu2Hox79R9QC9lulgqlPpIOo4CTGeNtePUpo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=E8kC0TMXVnEKfEtMDBVFpXPv9e4+sYSqBZlMucxv7MUOgevjjBcgCqtYOwW9fyp27
         Bh/wmLUMRdpJMZotHhtp3YQyLRtVpJ511ExaP1Jjyoiak5WgMMLvgNqMKZISn9EzCP
         qDbdm4v25Vh9U+ZMmdpgtfNu0y0G8kUhpFWqmiUE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: qcom: pm8941: rename misc node name
Date:   Mon, 31 Oct 2022 18:57:16 +0100
Message-Id: <20221031175717.942237-3-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031175717.942237-1-luca@z3ntu.xyz>
References: <20221031175717.942237-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The spmi-pmic bindings is now using usb-detect@ for this node, so adjust
the dts to match.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 7a4467e03aa1..863e598591b7 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -27,7 +27,7 @@ pwrkey@800 {
 			bias-pull-up;
 		};
 
-		usb_id: misc@900 {
+		usb_id: usb-detect@900 {
 			compatible = "qcom,pm8941-misc";
 			reg = <0x900>;
 			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
-- 
2.38.1

