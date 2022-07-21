Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33F1257C311
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 05:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231557AbiGUD70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 23:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbiGUD7U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 23:59:20 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D6C785B6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 20:59:19 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id t3-20020a17090a3b4300b001f21eb7e8b0so3409973pjf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ecs-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6/RJ44c6WPJhfmO9ma5Gldiq3CilNd56Qp91tJ0wDiE=;
        b=m6CLRDADXWr8qmRx38QTrVaf4Hcahnf7dFT+Gf0x5qWCdivOgqvUfCk5aAXn7bTDG0
         sZeoZi5pFp3VbMIj/xqlb5cxPwB3PUpBid9KXy7G7zroMs2n2RmCZ09V0fpJCYIgu83q
         iZGZj7fz+/wieYaMRV0p8cP1CHnN/mDts+KPfhqyNdnzWeBiyApByuCKj+WiWlzP57NN
         TqSSB6n7o+zdNaU1b+VjUAhP7QOqHKBGXAlU1RXfp1OSkZZMcTfOeIHZzT7T+Gszm24r
         B0zW9bwk6bSprKZVKXME1R92IyWCKdiCWO5k1tdH9722kbNvaYkkn0QYNL+cAy1UmZK9
         lSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6/RJ44c6WPJhfmO9ma5Gldiq3CilNd56Qp91tJ0wDiE=;
        b=j3ngxZEsKJL2iAuB8DbvBiMSRF6kjbMjYKeo3m0wUcF+uF9HqqPPhKsheuR5S6SeFc
         CUgJvI+I07bUq/Har8Yn5TKfCK78SGIotCmWUjtOI0wYnR5vlhf2NA8msc/XpzxgsdMv
         sn+bipYFXw0ckhlYQjMQKQQEUDIX4ieowou/vB2MlOR3BveHV2EuzX99R8fZCHA/dnG8
         /U9ysJMPmUfeUAwuupCd1J4dsJpJIW7HZtxTGwp8ykqJ8Ub/prWb7nQZFisYMJjbhGTE
         TEKT1mXQLJd2MVNoY+f1LlUa2LDLB/VLZVfVFX/YLLz7pMHDvgtJPgugVIdSt6MP7TkK
         lctg==
X-Gm-Message-State: AJIora/1fpiaMEXiSTG8ilTiRrGsL3SBYWnFJ2Uo96lokvECeGCLARmk
        5Lc/8+tLM5ORwX6BrvDSIivIYs1ESb08mXAM
X-Google-Smtp-Source: AGRyM1vldKoZ9UAp5CvzfWmc31vlDWTZ5J/Arh6lXNh72F3Xynhjd21RyLXFt6K0AJtfxdEx626hHg==
X-Received: by 2002:a17:903:32c3:b0:16d:328f:8988 with SMTP id i3-20020a17090332c300b0016d328f8988mr647850plr.108.1658375959153;
        Wed, 20 Jul 2022 20:59:19 -0700 (PDT)
Received: from localhost.localdomain ([103.150.184.130])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090abd8f00b001f21f7821e0sm299956pjr.2.2022.07.20.20.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 20:59:18 -0700 (PDT)
From:   Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: arm: qcom: Document additional sku6 for sc7180 pazquel
Date:   Thu, 21 Jul 2022 03:58:43 +0000
Message-Id: <20220721033918.v3.2.I7ecbb7eeb58c5e6a33e32a3abf4d6874e6cb725c@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
References: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The difference between sku6 and sku4 is that there is no esim

 The different SKUs are:

   LTE with physical SIM _and_ eSIM
   LTE with only a physical SIM
   WiFi only
 Both sku4 and sku6 are LTE SKUs.
 One has the eSIM stuffed and one doesn't.
 There is a single shared device tree for the two.

Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
---

Changes in v3:
- Bindings and dts in the same series.

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847..ff0ed8d4d232 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -450,6 +450,7 @@ properties:
 
       - description: Google Pazquel with LTE and Parade (newest rev)
         items:
+          - const: google,pazquel-sku6
           - const: google,pazquel-sku4
           - const: qcom,sc7180
 
-- 
2.17.1

