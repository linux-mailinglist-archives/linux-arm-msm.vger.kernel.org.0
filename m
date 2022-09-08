Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18CF5B25A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 20:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbiIHSZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 14:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbiIHSZR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 14:25:17 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91574F66E;
        Thu,  8 Sep 2022 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ACy8fcxhODwopnJSNeuaIJQMvE3xuVQvg+iYnRaqvI0=; b=Wd4Rh1UNmVzymW+conktrkPiL9
        awSVsiC33a31hjgTc7v/E06iuOgIhy7uEklino4ZKMniREPz2ZWuYqsGmiJGqMIKoxMv0aAjekHGa
        2UjFGE4TeTQlzDJAsGBYFMOfndhR7NS5ZpmXasc/Vypn5Mq9wgGLc4ANaEVPDZUC+UBuhp5j/s3PI
        cFK7gRsA+ILt/2oUecnuoC3FDY0yAKP2SOvMAE5x56h7EiB4zuuisWboAfgL7TeXEcCxYIp3sewaQ
        B/YrzZe3bA7p1FS0e0gD6dESurgwxbIS5gLM3Rp1i9ul28cPCrAysad66t9IrDwlMsnOuOFKyZHt1
        oH1gD/cg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oWMD4-004g9E-3n; Thu, 08 Sep 2022 20:25:06 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8909
Date:   Thu,  8 Sep 2022 20:24:30 +0200
Message-Id: <20220908182433.466908-5-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the "qcom,msm8909-mss-pil" compatible for the modem remote
processor on MSM8909. It is used pretty much exactly like the existing
one for MSM8916.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Fix typo in commit subject (qcom,q6v5-pil -> qcom,msm8916-mss-pil)
  - Add Krzysztof's Acked-by
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index d7d05f9ec8ae..250bf4afab10 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
           - qcom,msm8974-mss-pil
 
-- 
2.30.2

