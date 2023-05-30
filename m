Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE713716C30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 20:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjE3SYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 14:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjE3SYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 14:24:30 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC153A7;
        Tue, 30 May 2023 11:24:28 -0700 (PDT)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at [84.115.214.73])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9641ECFBF1;
        Tue, 30 May 2023 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1685471066; bh=liwsTCjCFh4bjc2tccmTcIdepPTZlH+GSHh7zUBFyD8=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=dhksoKsGL2grQYBlSfAvCvfjGmBo6+Oa16homBpPILDBH37GjJaG5Tr2OcBXj1cSy
         jzi/cHjDzRgN4vvUDQaeqa1Al3CkSgdwAqBMwnulu8oTQhy1PCekXM65oXljYuKDJr
         Kp8c1t5ls34irWI+TQeMiLjFxsmwrpOk6ZYrZkEM=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Tue, 30 May 2023 20:24:11 +0200
Subject: [PATCH v2 1/7] dt-bindings: msm: dsi-phy-28nm: Document msm8226
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v2-1-e005b769ee28@z3ntu.xyz>
References: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=liwsTCjCFh4bjc2tccmTcIdepPTZlH+GSHh7zUBFyD8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdj9SjUruR4ADWTpHi7+GTTaTpMZj6bZzb6Qfv
 0RkZVneKzKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHY/UgAKCRBy2EO4nU3X
 Vk2DEACiZgwSlgjzsFFEgTllFUUs27lF3o3FSBCPBPo/Fw2X8wJbyk5OpS1IH00YE4tK2Pe6VIl
 T8DX7+k37Bj+1piISY6ufoZ3UOvYs/pTwC7YwcCYG+MGyXHFpCOX3rXElruK8rtni85WP0hLXDV
 AkDAv03OdcvvAPhJygI9RSSbSJeJj12N/ue1XAvgM81t5butJIaBL9lbfGjT7/zVtuLJub0yZiX
 7T4QsT3MGgVJBaV+KA5Uii4+6+uBlRxUejTrE546knHx5CJHlJ0DcSzbnLnLpGqE5YckYVKLe62
 GknDT+at8VZm1gssdWsH/1/WF9PiY51TlTPEl7aHkD87yFr9BHo7L5EyzNhUUfjKo6SAp3SY07M
 l8KKxSLObaZjeis05pKbTOLu3IqQORyG6a9BW36RgUO0xLET/1fz87U5lK4UqLjhksChfOa34eG
 jyrnDt8XGMwhQ63QSa2/mX7JWWmipphiz3ZxDDlrYf8CO5b4khLwXSnm4gBiTLuBDA74RBUGvai
 7bRe3Pyk+J9BTev9BKzUJP1BO0MpukeohzIwEW12C2jex28M9QnhMXlJhBrTKTtX0XlbLWgnWcf
 hbYXfFDlFjD06Mtgs9Ac5E4pKpuyDxQO7QfdyTQW/gJ2/uzrxXOUobDarjVLIuZM3v1rmNoQNTN
 rI0NC3AJv+pDjSA==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8226 SoC uses a slightly different 28nm dsi phy. Add a new
compatible for it.

And while we're at it, in the dsi-phy-28nm.yaml move the 8960 compatible
to its correct place so its sorted alphabetically.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml | 3 ++-
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml    | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index cf4a338c4661..62fb3e484eb2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -15,10 +15,11 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-28nm-8226
+      - qcom,dsi-phy-28nm-8960
       - qcom,dsi-phy-28nm-hpm
       - qcom,dsi-phy-28nm-hpm-fam-b
       - qcom,dsi-phy-28nm-lp
-      - qcom,dsi-phy-28nm-8960
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index b0100105e428..db9f07c6142d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -125,6 +125,7 @@ patternProperties:
           - qcom,dsi-phy-14nm-660
           - qcom,dsi-phy-14nm-8953
           - qcom,dsi-phy-20nm
+          - qcom,dsi-phy-28nm-8226
           - qcom,dsi-phy-28nm-hpm
           - qcom,dsi-phy-28nm-lp
           - qcom,hdmi-phy-8084

-- 
2.40.1

