Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70FA505F03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 22:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347833AbiDRU6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 16:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347838AbiDRU6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 16:58:04 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7015E15810
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 13:55:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mm4-20020a17090b358400b001cb93d8b137so375366pjb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JoIn1027OXzmCOA2cCIKja8ksqjeKwGtO2KGzYKS9Ks=;
        b=sFoUtadypX7gqBjas8UAvAivDUUHJ3TkJ/7D7V3FS7IidpuxNkl4+GnnY+T3HKSvCp
         9IBVuxpeTza06vtoznlZWV7zu5d+yj7uueGiZdOoFqdSlDxPYA/bFH9Pw8h7KUuDPeHa
         BYnA+pPQbi7Xqwa1r/WvifijgtO7RkTqck03FcrEdONmeCkB4AIB/QKT16U2v9BdumXa
         +XhSrs7Q5rQRNldzVYtpTeGhW+VZrnXhk/QgYIq2g29edpPA+xS68aULSj8Htqlfrdkh
         i6azEtVU1NyL6F9XcKbHAMoqhKZqHQCTwAVVDg7tPY9pTq3J71uhUkfIPRJpaY14Jc0O
         o6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JoIn1027OXzmCOA2cCIKja8ksqjeKwGtO2KGzYKS9Ks=;
        b=lY7n5f+kNp7i35PtvfR29krmiX0Q9GMgNJ9mYltBrn50tQG80/uaJKMC91IgsaMkJ0
         EIJG5iyWF4mXYeYfpqNyZkdOrU0oIa9qs65Av4wuX7B8m2ncKhScYFZurMaqx/q21F+p
         pQdsd0RUaLUAheXoApJI4NWD+FeRbOJy6rwnn44Z395tjchHVuRTGgUNnQW1iJjdTK4t
         9XPnDOOAy26TETrhPnDT0H5RtbL+QAX4qmt7+ICPJO335oMYgcHi2QmMGH2MrmSQjn/d
         IpwoIZr6Q/Fajv5HXSTiTyB+cTikXfjSJrQgvzms3wiqwm4uZX5tB0MAmzYqsXl7S9g+
         uA0g==
X-Gm-Message-State: AOAM533/DCLR7uBxiKfOoUzfwT6XxmRIQHDp9RJha8fH3Re4YvtY+hWj
        vCKcG+SfHm4WMtMGDpmlhwY8UeSXKjZC0A==
X-Google-Smtp-Source: ABdhPJya8fFGhzAYTYuKY4DalPfaHk5aNAbffZoalJqGmb12zkn+RpS27NCCDphkFcei7WJjWEBecw==
X-Received: by 2002:a17:90b:1b52:b0:1d2:8d55:ad6d with SMTP id nv18-20020a17090b1b5200b001d28d55ad6dmr8382779pjb.223.1650315323758;
        Mon, 18 Apr 2022 13:55:23 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id q60-20020a17090a17c200b001cd567fecaesm13498859pja.26.2022.04.18.13.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 13:55:23 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, vkoul@kernel.org,
        bjorn.andersson@linaro.org
Subject: [PATCH v3 1/4] dt-bindings: phy: qcom,qmp: Mark '#clock-cells' as a 'optional' property
Date:   Tue, 19 Apr 2022 02:25:06 +0530
Message-Id: <20220418205509.1102109-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418205509.1102109-1-bhupesh.sharma@linaro.org>
References: <20220418205509.1102109-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'#clock-cells' is not a required property for qmp-phy(s) in the
'/' node, but it should be is used in 'phy@' subnode (where it is
actually a 'required' property). Fix the same.

This also fixes the following 'make dtbs_check' warning(s):

sm8350-microsoft-surface-duo2.dt.yaml: phy@1d87000:
  '#clock-cells' is a required property

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 8b850c5ab116..c39ead81ecd7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -66,9 +66,6 @@ properties:
       - description: Address and length of PHY's common serdes block.
       - description: Address and length of PHY's DP_COM control block.
 
-  "#clock-cells":
-    enum: [ 1, 2 ]
-
   "#address-cells":
     enum: [ 1, 2 ]
 
@@ -112,11 +109,13 @@ patternProperties:
     description:
       Each device node of QMP phy is required to have as many child nodes as
       the number of lanes the PHY has.
+    properties:
+      "#clock-cells":
+        enum: [ 0, 1, 2 ]
 
 required:
   - compatible
   - reg
-  - "#clock-cells"
   - "#address-cells"
   - "#size-cells"
   - ranges
@@ -468,7 +467,6 @@ examples:
     usb_2_qmpphy: phy-wrapper@88eb000 {
         compatible = "qcom,sdm845-qmp-usb3-uni-phy";
         reg = <0x088eb000 0x18c>;
-        #clock-cells = <1>;
         #address-cells = <1>;
         #size-cells = <1>;
         ranges = <0x0 0x088eb000 0x2000>;
-- 
2.35.1

