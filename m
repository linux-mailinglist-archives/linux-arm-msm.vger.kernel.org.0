Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68C973D968
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 10:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjFZIQU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 04:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbjFZIQR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 04:16:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FA5E7A
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:16:15 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98bcc533490so358647566b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1687767374; x=1690359374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qYVAKY+YXta+7lNsRy1YDUkvZipC4+LBE/XMbcyVzw=;
        b=hXMORbxHbiqd1R5ySQVoMsVvKySIATv0WYQh9ag/q66Xwn39vSiJ4I0zp36NiWPL3f
         KXPHOfwu6nMiEbnjHTfqbmtVcxUhkz6GFlvE9ikNHwduC6O0g71hglFBaZ0tgdTCXwOO
         Z4obE1b69ZoP0qVejeYquadiqV1u1y2uVcfpdeiiWnK/cPxs+YfNgWh7IvXdl8IjqHSl
         +b4TqgNtlk7zheuVsJ4qGFeOaohC04YxM01yXLXbznbDd7GaStWyoBJgBkQZk2wa1UGn
         MzNiTq9xJfEtYCkmutfi2OjgAzTdln3lnMg6DIDbwO2tMBpBVyu3HBYe6axmxmTAX0vn
         WK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767374; x=1690359374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qYVAKY+YXta+7lNsRy1YDUkvZipC4+LBE/XMbcyVzw=;
        b=l25rUGFe0VW7Wbd+WkB1v4U4TuuGxOpMI8Dq/fP3hmdiawSlwPd7zNcxsUt27x6gAf
         XGFxJGUfM8d3wQpaCmrjjn2PmZcAXFPQBP8gi2/pd7znwhp4yXczVPJWWRKXhsHdKLtQ
         Xqipmqf0aD+asAPdfwEMWrs9+oy1J598HWkfzSKQu7YhrqWd3bygrrIdLRmCr9lUsAwb
         VBu21reeBUsln8Q9NSYPJuyDLy9PheB1xw7iD7WRjryEfgmNWdhXFmYuXYXZYURs0TBp
         LCyuOuLPwfwYvVBsusS1RvJ8TGd3QnlIfb1cGRp1dCTLW14C/33H7rQQh+odGijKCf7s
         qfZQ==
X-Gm-Message-State: AC+VfDwfm4QELP92jvlKX/DvwYXZHE5HVR7+g/zuKDDLJEFN0Uy6YQnM
        5UBq2rjT3X0IMlEqvLsJVXeFYA==
X-Google-Smtp-Source: ACHHUZ47pncw01pYHXeFImQ9SI1IByvUweJTMAMLRerk7QNk0YToQ6hGCEwBmjEXpsAx+PpQYFEvBQ==
X-Received: by 2002:a17:906:eecd:b0:988:6491:98db with SMTP id wu13-20020a170906eecd00b00988649198dbmr18334296ejb.17.1687767374137;
        Mon, 26 Jun 2023 01:16:14 -0700 (PDT)
Received: from [172.16.240.113] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b0094f07545d40sm2935617ejb.220.2023.06.26.01.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:16:13 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 26 Jun 2023 10:15:58 +0200
Subject: [PATCH v4 2/3] dt-bindings: ufs: qcom: Add reg-names property for
 ICE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v4-2-14ced60f3d1b@fairphone.com>
References: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v4-0-14ced60f3d1b@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Eric Biggers <ebiggers@google.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The code in ufs-qcom-ice.c needs the ICE reg to be named "ice". Add this
in the bindings so the existing dts can validate successfully.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Iskren Chernev <me@iskren.info>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index eb3de2fde6b0..b5fc686cb3a1 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -80,6 +80,10 @@ properties:
     minItems: 1
     maxItems: 2
 
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
   required-opps:
     maxItems: 1
 
@@ -135,6 +139,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        reg-names:
+          maxItems: 1
 
   - if:
       properties:
@@ -163,6 +169,12 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        reg-names:
+          items:
+            - const: std
+            - const: ice
+      required:
+        - reg-names
 
   - if:
       properties:
@@ -191,6 +203,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        reg-names:
+          maxItems: 1
 
   - if:
       properties:
@@ -216,6 +230,12 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        reg-names:
+          items:
+            - const: std
+            - const: ice
+      required:
+        - reg-names
 
     # TODO: define clock bindings for qcom,msm8994-ufshc
 

-- 
2.41.0

