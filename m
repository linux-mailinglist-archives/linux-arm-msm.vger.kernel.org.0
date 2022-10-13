Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D670D5FE50F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Oct 2022 00:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJMWND (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 18:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiJMWNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 18:13:02 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A987186D71;
        Thu, 13 Oct 2022 15:13:01 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 22BCF80250;
        Fri, 14 Oct 2022 00:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665699179;
        bh=Swfy0gFOl+unhotQmbb1ygGE8XeTWqMe0AbLQNmRM0w=;
        h=From:To:Cc:Subject:Date:From;
        b=vgU30Q9MCHAoNAao0D3X6bkvHdRoCjqDkNT90wGinlMH7Xazmhd5nJYA5M0aZ+oXg
         Hz7mPiylJhcQ2PEgv9/AfXgNrL96ivXaUy9vb/UmDEwxxD6twuZG6jtVzljgoGmGVH
         bBSxyLMrQ5EFCMzdueFPk45a2fit8/YiaPJcGRbaZo3beGYQqmOzMEWcY/v8F9xUbD
         kap1mr3YdFNKSGy8F5nN1SlRvsI2ApwqQkPvq7IPzO9F4lpEFryyHBR/Io0MLEwkM4
         JZ9yYUcM4mxGHkKXNYcGnhENdxLLcIinSif+AHm29+iO/knIyDl/DCvfnnxiAlsvlm
         Qs+4nl/Pp6VGQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 1/3] dt-bindings: mmc: arm,pl18x: Document interrupt-names is ignored
Date:   Fri, 14 Oct 2022 00:12:40 +0200
Message-Id: <20221013221242.218808-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to inconsistency of existing DTs regarding the content of this IP
interrupt-names DT property, document this such that interrupt-names
is not used by this IP bindings.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Yann Gautier <yann.gautier@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
V2: Add deprecated:false to interrupts: description
---
 Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
index 1e69a5a42439b..1c96da04f0e53 100644
--- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
+++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
@@ -95,7 +95,9 @@ properties:
       PIO (polled I/O) interrupt and occurs when the FIFO needs to be
       emptied as part of a bulk read from the card. Some variants have these
       two interrupts wired into the same line (logic OR) and in that case
-      only one interrupt may be provided.
+      only one interrupt may be provided. The interrupt-names property is
+      not used due to inconsistency of existing DTs regarding its content.
+    deprecated: false
     minItems: 1
     maxItems: 2
 
-- 
2.35.1

