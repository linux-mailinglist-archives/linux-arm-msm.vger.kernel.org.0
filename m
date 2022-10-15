Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C705E5FF9F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 13:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiJOLzr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 07:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiJOLzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 07:55:46 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A7A4C2CA
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 04:55:45 -0700 (PDT)
Received: from localhost.localdomain (95.49.31.41.neoplus.adsl.tpnet.pl [95.49.31.41])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 658203F257;
        Sat, 15 Oct 2022 13:55:42 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: firmware: document Qualcomm SM6375 SCM
Date:   Sat, 15 Oct 2022 13:55:35 +0200
Message-Id: <20221015115535.150037-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible for Qualcomm SM6375 SCM.

SCM consumes a single clock (core / RPM_SMD_CE1_CLK), though it does
not matter whether Linux enables it, as one of the billion levels of
firmware ensures it's on anyway. Still, mark it as used for the sake
of correctness.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- Add the compatible to allOf to indicate core clock is used
- Rewrite the commit description to match changes

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index c5b76c9f7ad0..be1b5746eddb 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -47,6 +47,7 @@ properties:
           - qcom,scm-sm6115
           - qcom,scm-sm6125
           - qcom,scm-sm6350
+          - qcom,scm-sm6375
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
@@ -88,6 +89,7 @@ allOf:
               - qcom,scm-apq8064
               - qcom,scm-msm8660
               - qcom,scm-msm8960
+              - qcom,scm-sm6375
     then:
       properties:
         clock-names:
-- 
2.37.3

