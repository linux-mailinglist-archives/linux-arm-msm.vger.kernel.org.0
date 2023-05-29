Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57AB971473A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 11:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbjE2JpD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 05:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjE2JpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 05:45:02 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F042D8E;
        Mon, 29 May 2023 02:45:00 -0700 (PDT)
Received: from [192.168.122.1] (217-149-172-244.nat.highway.telekom.at [217.149.172.244])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 76460CFC23;
        Mon, 29 May 2023 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1685353499; bh=fKHguGMctFNCESACSZJ0OkdRQtMgSdg2Fb+SHug/OJY=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=bYRgCX1Ct/yYkMnlN9yCglsXXuZ1BQk3uiLrHhLsUtetfldu11etU/2uFd0IPxM8D
         A3ir4xouCPzZVRQXHVZ1j7RrHFoXmirxFrSCvoB4i5LkQS+ewEWFjUgOk+biEZ/7MA
         Zh0sxnYZqoS/IhwlJxL4oOq9a556IjcAyuFz9C4I=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 29 May 2023 11:43:58 +0200
Subject: [PATCH 1/7] dt-bindings: msm: dsi-phy-28nm: Document msm8226
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v1-1-679f335d3d5b@z3ntu.xyz>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
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
        linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=fKHguGMctFNCESACSZJ0OkdRQtMgSdg2Fb+SHug/OJY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdHQT9jqIw6A1vUzspKqvEWAMqlztD1SJhxJ7V
 eBnFLL0nG6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHR0EwAKCRBy2EO4nU3X
 VplIEADTELAz3DmTbckP/EXs0s8kIO2qRB8KJ/Gxh8KNnF7/ZIAfmfut/0ZvL90EA4Zg0DFlz1W
 XAg27cSf2RdPkngXT8HlHZOJTNbVmBk/I9r+er/qQHAV9Ab6yMEWs9qNk4KX1aKaHTS7E283kf+
 9X+Gwx9qwvsNoivbYSUryR17/67wARPVIO7Hwl+WWgmf3dtwbNNNp8N9Zm6sN/KMU2+wJyCVFlD
 I+wSPWUEs1nLX4uaPJdks84IlKzAzcAobwWe49l1kXVF5mQbOwsfIFTQREPNRsTFRmtf0Aqrw2q
 k8oJChDdnQ2ZJfaAF6lK92Y7Uywc7NDVLkQmg21VwKHGY9ZFLPmAivgf5y+acIluAnt0m9a9HgY
 Gx2FxW03P0FM0JRxHIHMFyDFM8kpB+UX9X0r3DxRMB2stX2hlhryH6HXjRv3AhyTqczUhQZ/gUZ
 L4mQr0epIMJrYt6aivv+6PeC6yowY97Jh/NqBypIGquta1VVUZhxI/eHkuSonJO9+wWcIqo9WTo
 2zlKxFWQVHOz1JhZgKaQoH6zgXXyZT8nyPLteelSEvG/1duBPmhJLNND+d4Ww5ATyOpCaT+xSBn
 fWUu+u7h1h7ObzKox0Vo9XaLr9mDYaU2a8XnoTs/3x1xs54VbAHMyiGH825y+GEsNVdS2ExWFm+
 WXDMKfb5l4dd9Xg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8226 SoC uses a slightly different 28nm dsi phy. Add a new
compatible for it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml | 1 +
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index cf4a338c4661..bd70c3873ca9 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -18,6 +18,7 @@ properties:
       - qcom,dsi-phy-28nm-hpm
       - qcom,dsi-phy-28nm-hpm-fam-b
       - qcom,dsi-phy-28nm-lp
+      - qcom,dsi-phy-28nm-8226
       - qcom,dsi-phy-28nm-8960
 
   reg:
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

