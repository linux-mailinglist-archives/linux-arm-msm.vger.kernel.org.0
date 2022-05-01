Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6685B5167AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 22:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242266AbiEAUYi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 16:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245167AbiEAUYK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 16:24:10 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E741837F;
        Sun,  1 May 2022 13:20:34 -0700 (PDT)
Received: from localhost.localdomain (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id F1B953F639;
        Sun,  1 May 2022 22:20:31 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: thermal: tsens: Add msm8992/4 compatibles
Date:   Sun,  1 May 2022 22:20:24 +0200
Message-Id: <20220501202025.211567-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.36.0
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

Add the compatibles for msm8992/4 TSENS hardware.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
(no changes)

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index b6406bcc683f..08e6764152ec 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -37,6 +37,8 @@ properties:
         items:
           - enum:
               - qcom,msm8976-tsens
+              - qcom,msm8992-tsens
+              - qcom,msm8994-tsens
               - qcom,qcs404-tsens
           - const: qcom,tsens-v1
 
-- 
2.36.0

