Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F606527DA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 08:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240298AbiEPGcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 02:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240303AbiEPGcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 02:32:15 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E89028E18
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:14 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 137so13196914pgb.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 May 2022 23:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKuEdgC6cXyYmX22Bawlaq+lxNFeROynSrx/FPpZN2U=;
        b=yyRQJNFN3bheE/7sJQmOi2/U7LkTDZgn11qd5B8F7C3RUduRmNCpQFKnBRicWBQYgE
         54Q7IoSIuLalehwp/NBc3OYqoZxzC62YKARj1o9B0Ah/+5zyAP/8Y55FOCmnGosUqyZz
         Xygp1oEkZtV1pgATydDV16MLY18jF3Ts/W/Aj0lKBJLql+yoKb7bhAM7GwI48ythZHNi
         bqzsrQz3QbZj9GmGRwyjjBrbWRys4wED29qnMzz+w4s9tRWGaQ5XeO7S9BvF99hEZ1Go
         ap9dBAoct/rNjxt0uTJxlIFjG7JDHlOGOHNz41SHfJ8WPHyKv7gTaxZT2zL3e9X7ISU8
         lIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKuEdgC6cXyYmX22Bawlaq+lxNFeROynSrx/FPpZN2U=;
        b=OopYKw1oPQIjl971HoYPpyIEfVVsD9ZZ+WFzkRsNSgGL32YFFbjr8Xd1HyHBkyAj15
         QC8ExzDfxMJO3wnKYoZz7cWKuzTJWZJk9ZA6T2ybs9uIxXskqe6ERHoAmfeLZjmamcm5
         oxgi86kXAlxjIgBwdqXF3QI40RIVHuSr7q/ZZe67wFtyijAjdA8oXF4aH9NNAB8s6x/q
         jxsYFfji/2UshfOf93VncrC38779aCkBwxULHhaBInmSezz9BqULVzE/xTwiWNncV8Lu
         1JQ4I74PAwH6pztU6sXv5r+uV4QsoN30+WajN1Pn79c0dEmhi9fthTPYyEkppKnuCYqy
         EOpA==
X-Gm-Message-State: AOAM531Wb37lkaMUvB29+rV5RF8wfmh+QtmAnHmETgtcEUneJgeBRBas
        WcjIejdsmTQ8QiaPhmQkhqCwStCb5jqxew==
X-Google-Smtp-Source: ABdhPJylXrsnGYYOIsSy3nL9TLYTDxgzeFreC7InjnzrowQmv5f7yCP4WAAR0UUE/P4Ioe8gBkkSWA==
X-Received: by 2002:a65:6d15:0:b0:382:4e6d:dd0d with SMTP id bf21-20020a656d15000000b003824e6ddd0dmr13758141pgb.333.1652682733250;
        Sun, 15 May 2022 23:32:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:931c:dd30:fa99:963:d0be])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709027fc900b0015e8d4eb1e2sm6053647plb.44.2022.05.15.23.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 23:32:13 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org,
        konrad.dybcio@somainline.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: phy: qcom,qmp: Shift '#clock-cells' property to phy (child) node
Date:   Mon, 16 May 2022 12:01:52 +0530
Message-Id: <20220516063155.1332683-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
References: <20220516063155.1332683-1-bhupesh.sharma@linaro.org>
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

Since the clock comes out of the phy (child) node,
so clocks are actually not provided by the parent device.
The qmp-phy dt-bindings specify the same incorrectly at
present. Fix the same.

This change helps fix the following 'make dtbs_check' warning(s):

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
2.35.3

