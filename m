Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96234573D98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 22:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237032AbiGMULI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 16:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbiGMULH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 16:11:07 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72452A420;
        Wed, 13 Jul 2022 13:11:05 -0700 (PDT)
Received: from localhost.localdomain (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 30C693F79E;
        Wed, 13 Jul 2022 22:11:02 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Document Sony Xperia 1 IV (PDX223)
Date:   Wed, 13 Jul 2022 22:10:44 +0200
Message-Id: <20220713201047.1449786-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible for the PDX223 device.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c06d1bfc046..e19f5511ebc1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -305,6 +305,7 @@ properties:
           - enum:
               - qcom,sm8450-hdk
               - qcom,sm8450-qrd
+              - sony,pdx223
           - const: qcom,sm8450
 
 additionalProperties: true
-- 
2.37.0

