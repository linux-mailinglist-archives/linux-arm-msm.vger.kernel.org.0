Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E548A4200BE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 10:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbhJCIdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 04:33:50 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37924 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhJCIds (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:48 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 5CB29C90F6;
        Sun,  3 Oct 2021 08:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249920; bh=cPDamchJW0mjeP0iNR4px+LzJKosMc9BhKEa6fAGkEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BgwdoVZK00Phlxx9j2cPArOU41IJLf+WuzAx8sBtrjmL6KL36eIkM0zvD0IibkcS+
         QuDda7ArDPaIVwuIp2NwnWELPCOK3nQTCZvOlYaBySuTq8OxpBm4CAvfDJGJTEFHGD
         NPDkr6BBaHO5CzQKJz5okoqgNDjWivQhhnNLabaA=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: regulator: qcom,rpmh: Add compatible for PM6350
Date:   Sun,  3 Oct 2021 10:31:25 +0200
Message-Id: <20211003083141.613509-3-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible string for pm6350 used in sm6350 boards.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 34de38377aa6..b959504e0ea4 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -35,6 +35,7 @@ description: |
     PMIC. Supported regulator node names are
       For PM6150, smps1 - smps5, ldo1 - ldo19
       For PM6150L, smps1 - smps8, ldo1 - ldo11, bob
+      For PM6350, smps1 - smps5, ldo1 - ldo22
       For PM7325, smps1 - smps8, ldo1 - ldo19
       For PM8005, smps1 - smps4
       For PM8009, smps1 - smps2, ldo1 - ldo7
@@ -52,6 +53,7 @@ properties:
     enum:
       - qcom,pm6150-rpmh-regulators
       - qcom,pm6150l-rpmh-regulators
+      - qcom,pm6350-rpmh-regulators
       - qcom,pm7325-rpmh-regulators
       - qcom,pm8005-rpmh-regulators
       - qcom,pm8009-rpmh-regulators
-- 
2.33.0

