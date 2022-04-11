Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4674A4FC155
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 17:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348174AbiDKPqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 11:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348171AbiDKPqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 11:46:24 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3B26154
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 08:44:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g18so6797786ejc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mbNpbkkEChotn+zfIrEUISzZtq6Ebit9E8w1dEveKi4=;
        b=aYr0ukfkZGIsCt/4FT/QKR69G8IU6TdAGT0VhxtNMxD/ZM2av3R60rfzy0Lr+z2jqX
         RNffGh7JAzN/ky5V6U8TCJAnWdy3iGs3KhP04uuK3EugGOnpLwwcGZ2fTIgLFM56bQaF
         tbuWxvmlORJFEJxu81ME/WoTRcDnrFtKZ4M8HuZecRxEPgqPKITFt+ju1BeHb2YcHKUa
         iR8iLpWXca6o/Mwk8EvwYFqlUBxH0JRF0IUfHs1g6bPNU08wkfwWhQOP7w/whgOjQjfI
         YX1kzMwC0NEyR+1iPz3swS1o1S5TWeDzVAip9VKO1Jfd+vnYpKHzQSkH5s+HiHLRM0Jw
         MFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mbNpbkkEChotn+zfIrEUISzZtq6Ebit9E8w1dEveKi4=;
        b=Gzf23i2SnyWqlWW8HKnoy8DnhPdgxjTBM2eCOdw9beYCOXhKGq3zDOHpdaZVbCymJn
         1N7H7oC8UM68yFFbkkypyvvCr5XbNa2oqZuAvaC3cVmOJ+OuOl3UHwGqa501917/QTpI
         5I1iOMNGj/GcNjXm9dFj6qdR9c1WpMtjsq8dp76apKcVDe6sTUjUyWOxosoPjoCbYApI
         Tke4cVv3XRm8oTimTkB2pBlRTXhWl5IJTCjXJUZ4wPvYmM5OaFATL8W2+7ilUH6JdG5L
         RBxfQFJklxrVz9EcPToupRaKNRsS7+siOs0VYRvryocsEEooZ5ANNAQ5Zhde3d3Qq8kX
         H3GA==
X-Gm-Message-State: AOAM532ffy18IYCcoRVrZQzIu066JpaeKC2fOAS7YbEDqLFngHEUF7Wb
        oCW7TWMmPdVxrnaNdV3JCVLyrg==
X-Google-Smtp-Source: ABdhPJwrK+vLq5FHXsKcsbi/1tugMQSwYKotl7aV7TAwegLV/VGDWOX0mMt4H3we7pNjfWm9PA2Pzg==
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id b8-20020a170906d10800b006e87765a70bmr8961267ejz.436.1649691847786;
        Mon, 11 Apr 2022 08:44:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906608e00b006d1455acc62sm12173177ejj.74.2022.04.11.08.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:44:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH v2 3/6] dt-bindings: ufs: common: add OPP table
Date:   Mon, 11 Apr 2022 17:43:44 +0200
Message-Id: <20220411154347.491396-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
References: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
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

Except scaling UFS and bus clocks, it's necessary to scale also the
voltages of regulators or power domain performance state levels.  Adding
Operating Performance Points table allows to adjust power domain
performance state, depending on the UFS clock speed.

OPPv2 deprecates previous property limited to clock scaling:
freq-table-hz.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Rob's review tag because patch changed significantly.
---
 .../devicetree/bindings/ufs/ufs-common.yaml   | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
index 47a4e9e1a775..d7d2c8a136bb 100644
--- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
+++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
@@ -20,11 +20,24 @@ properties:
       items:
         - description: Minimum frequency for given clock in Hz
         - description: Maximum frequency for given clock in Hz
+    deprecated: true
     description: |
+      Preferred is operating-points-v2.
+
       Array of <min max> operating frequencies in Hz stored in the same order
-      as the clocks property. If this property is not defined or a value in the
-      array is "0" then it is assumed that the frequency is set by the parent
-      clock or a fixed rate clock source.
+      as the clocks property. If either this property or operating-points-v2 is
+      not defined or a value in the array is "0" then it is assumed that the
+      frequency is set by the parent clock or a fixed rate clock source.
+
+  operating-points-v2:
+    description:
+      Preferred over freq-table-hz.
+      If present, each OPP must contain array of frequencies stored in the same
+      order for each clock.  If clock frequency in the array is "0" then it is
+      assumed that the frequency is set by the parent clock or a fixed rate
+      clock source.
+
+  opp-table: true
 
   interrupts:
     maxItems: 1
@@ -75,8 +88,23 @@ properties:
 
 dependencies:
   freq-table-hz: [ 'clocks' ]
+  operating-points-v2: [ 'clocks', 'clock-names' ]
 
 required:
   - interrupts
 
+allOf:
+  - if:
+      required:
+        - freq-table-hz
+    then:
+      properties:
+        operating-points-v2: false
+  - if:
+      required:
+        - operating-points-v2
+    then:
+      properties:
+        freq-table-hz: false
+
 additionalProperties: true
-- 
2.32.0

