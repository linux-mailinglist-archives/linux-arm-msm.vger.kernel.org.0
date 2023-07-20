Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9133475A58E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 07:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjGTFln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 01:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjGTFll (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 01:41:41 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B4E172E
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 22:41:37 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso247569a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 22:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689831696; x=1690436496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX3sPcIP3SsQXddpGgAhiwMO6lb232ip/HjkD9sXmB4=;
        b=yCVL+jhEN1Oh2sYC6UYeNoQ7XLMkp6OH71WlTC+48hRJ4bropeSJoK9O+cpU1jRuvi
         M1giWWbGJEKuJUX155tKQTH703KGX/tJj+C1NXQPBUZ/VcyhpRb06ORQzmpUBboXQo2D
         PZ0GKgg/h/XIYywl1zOO1h/Xgn/qAGGp+clYslNCogqmueF/gzosWwgk8G3D5bLD9vUV
         u3Y9hYoKlgi2cjpQ8FqWXmx9TiWZbyXq1zMd4CPNQVxq5CQWyuV6PY7XEccwXWXUFcFx
         cMFSrqNd5dANNVCPABPiaXqZFMGNjsuZfWL82nJfSWdhJP/U4xy/l+UJ5avZj9aEbeZa
         Eu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689831696; x=1690436496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX3sPcIP3SsQXddpGgAhiwMO6lb232ip/HjkD9sXmB4=;
        b=YDul3RR/gWkpTI86pxjaE2JxxD0vEshOaYQqvIJAHbLMIhS3A/0Lnk53GsOUfBw8JH
         xwYyffo7kVgASqqPaaq4xGs0eOFUcXcHonEPsuYxy5Z32rVEN0iYRFM0KuHgbg2X3BPc
         n0s5oI3w20B2zvd5gIabgfAa4+0MVNU0ZC0yTnXMRI41OVutj8On1HWpzBjIYsPY9V3b
         fMgiKMHLkSazJ8a/wsAKWfKyUDA/1WzZ1upCuWAqb2J62wc/iE7TxIca5qBPGlHTlgzM
         dz+hhSHQZBoeFJttrBgCcZ4DjKlINWfJ5vqR1jG9iMX8PrzgdWJLIxw8lA3BAOStnbBc
         zn9w==
X-Gm-Message-State: ABy/qLYrOk43Wa4S8dKdxfksfqZcJgACzyTvt5R/gRyCWeDDpuKpJcu4
        WO9zIqpYazrkr8JAKQTWfy+k
X-Google-Smtp-Source: APBJJlGuoiG5jhK0GEKCqWzFf4wpTeZuuwQHb5mHbfI80zig7BA8VTBgaV0Go4XUbyclN4iSOD+dhA==
X-Received: by 2002:a17:903:124b:b0:1b8:9225:4367 with SMTP id u11-20020a170903124b00b001b892254367mr6102527plh.65.1689831696656;
        Wed, 19 Jul 2023 22:41:36 -0700 (PDT)
Received: from localhost.localdomain ([117.206.119.70])
        by smtp.gmail.com with ESMTPSA id r2-20020a170902be0200b001b85bb5fd77sm263367pls.119.2023.07.19.22.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 22:41:36 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        quic_nitirawa@quicinc.com, quic_narepall@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_richardp@quicinc.com,
        quic_nguyenb@quicinc.com, quic_ziqichen@quicinc.com,
        bmasney@redhat.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 01/15] dt-bindings: ufs: common: add OPP table
Date:   Thu, 20 Jul 2023 11:10:46 +0530
Message-Id: <20230720054100.9940-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230720054100.9940-1-manivannan.sadhasivam@linaro.org>
References: <20230720054100.9940-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Except scaling UFS and bus clocks, it's necessary to scale also the
voltages of regulators or power domain performance state levels.  Adding
Operating Performance Points table allows to adjust power domain
performance state, depending on the UFS clock speed.

OPPv2 deprecates previous property limited to clock scaling:
freq-table-hz.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
2.25.1

