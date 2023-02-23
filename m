Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F3D6A0F35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 19:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjBWSKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 13:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbjBWSKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 13:10:36 -0500
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540A754A1F;
        Thu, 23 Feb 2023 10:10:23 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 693F41C0068;
        Thu, 23 Feb 2023 19:10:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-073-085-163.092.073.pools.vodafone-ip.de [92.73.85.163])
        by srv01.abscue.de (Postfix) with ESMTPSA id E9A451C006E;
        Thu, 23 Feb 2023 19:10:20 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8917
Date:   Thu, 23 Feb 2023 19:09:34 +0100
Message-Id: <20230223180935.60546-4-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223180935.60546-1-otto.pflueger@abscue.de>
References: <20230223180935.60546-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the qcom,rpmcc-msm8917 compatible.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
 - Added Krzysztof's Acked-by
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index 2a95bf8664f9..3665dd30604a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,rpmcc-msm8660
           - qcom,rpmcc-msm8909
           - qcom,rpmcc-msm8916
+          - qcom,rpmcc-msm8917
           - qcom,rpmcc-msm8936
           - qcom,rpmcc-msm8953
           - qcom,rpmcc-msm8974
@@ -107,6 +108,7 @@ allOf:
               - qcom,rpmcc-mdm9607
               - qcom,rpmcc-msm8226
               - qcom,rpmcc-msm8916
+              - qcom,rpmcc-msm8917
               - qcom,rpmcc-msm8936
               - qcom,rpmcc-msm8953
               - qcom,rpmcc-msm8974
-- 
2.39.1
