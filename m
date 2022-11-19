Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0025630F4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Nov 2022 16:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiKSPjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Nov 2022 10:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiKSPjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Nov 2022 10:39:19 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5E4711AB
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Nov 2022 07:39:18 -0800 (PST)
Received: from g550jk.arnhem.chello.nl (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 60F8AD05A4;
        Sat, 19 Nov 2022 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1668872356; bh=evu+FYYy9RQwl2CSl1h+58RXeq7DbTqiw9xGE3WzZ9U=;
        h=From:To:Cc:Subject:Date;
        b=wnF7ylrzncnRzr6cwJJLxyb3XO8AWHDzwb7UmtKsgLouK/RaswFDQ7fsc+qEr6mp5
         a2UWtbHTfnRavzhISg7KXjMdYNMLT7zeLjD9UAZhnscMb7QvmxqEneEuRGi5uwJD7E
         pLw4RjxedLcXeiI4Jj7jTODysNnVI0lZQ+iZ3dn0=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 1/2] dt-bindings: nfc: nxp,nci: Document NQ310 compatible
Date:   Sat, 19 Nov 2022 16:39:02 +0100
Message-Id: <20221119153903.770853-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The NQ310 is another NFC chip from NXP, document the compatible in the
bindings.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
index b2558421268a..6924aff0b2c5 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -14,7 +14,9 @@ properties:
     oneOf:
       - const: nxp,nxp-nci-i2c
       - items:
-          - const: nxp,pn547
+          - enum:
+              - nxp,nq310
+              - nxp,pn547
           - const: nxp,nxp-nci-i2c
 
   enable-gpios:
-- 
2.38.1

