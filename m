Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2384769CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 18:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjGaQe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 12:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbjGaQex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 12:34:53 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EB6199C
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 09:34:49 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bbc2e1c6b2so29848475ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 09:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690821289; x=1691426089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX3sPcIP3SsQXddpGgAhiwMO6lb232ip/HjkD9sXmB4=;
        b=sxjBY4EcBKD8rOJdEAcs94Imqm+WJDZIpX1z4GmauK2JROoM25d4+MHecpoCBhjqy/
         5/pF99yqdcn08WQV2MqMgkVv2YjjORuERyieER5O/KoZ+6YIanyHxupN3JmwRKIFdfty
         /InPAlAgjkIXxqGRMLG1aLxE3EIpVFDgDlSDUMiJLNrSat9mF3BljLreBrEcfEZ6zELT
         f6vLtwypT1nUIRJmEAshl5Z1WA7lEqhNWxlF3NpGkV6YzFmeyKGP4+OC005xulzFw94O
         S6malptvul2yzhHMbAy+5RQqp5BGicB7SmhcgYNlcg2zx9WGrSbwT56JFFoduluVAoqh
         sdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690821289; x=1691426089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX3sPcIP3SsQXddpGgAhiwMO6lb232ip/HjkD9sXmB4=;
        b=W0H8GTiRYMhNtvWoV2LJuqXVADpAB3H72mam1xNcClaVHEpNTkcrBI+zqabYCeyn7H
         0J1yEjedTOsoiESRFe7/OIbNhofECFJM1Wk0njFbPt7izQrBLdw/OJdmkGXxvQsLztv+
         h8PZst+Vx1VuH5WNlgcCfj6sUaMRr+VNB0GjKMtkVEm9dEFjvpR0ZTuBkdcPDIW0xXlJ
         fcUmq+fR72kxdFZbTCRaQXgj7q8FcC6AmC8yqhVQKHQcEO82r+890Dswlxc9RdDeVe/v
         hkvADazLq5Vorohrz4xlE8L+G7VgNPhtORad5wkrW6lnqGgB5uVpFSROhq0jPqF/UiSO
         Cb6Q==
X-Gm-Message-State: ABy/qLb0ITWjoYIBr9uF5hxjQZcKTFoRbV1d7QqTFcXu78DMDsA4R57i
        qcOYeLOJrnAE5QurUTmNeQSl
X-Google-Smtp-Source: APBJJlHA0K0DAiCD2MprcSrvKYTFO9zT9E+gdRmDiJw6T1/qozlROTZZFEhddBFPY4ugRurtHideVQ==
X-Received: by 2002:a17:902:c950:b0:1bb:833c:6ba8 with SMTP id i16-20020a170902c95000b001bb833c6ba8mr10659806pla.56.1690821289270;
        Mon, 31 Jul 2023 09:34:49 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.129])
        by smtp.gmail.com with ESMTPSA id w8-20020a170902e88800b001bb1f09189bsm8779541plg.221.2023.07.31.09.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 09:34:48 -0700 (PDT)
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
Subject: [PATCH v3 1/6] dt-bindings: ufs: common: add OPP table
Date:   Mon, 31 Jul 2023 22:03:52 +0530
Message-Id: <20230731163357.49045-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731163357.49045-1-manivannan.sadhasivam@linaro.org>
References: <20230731163357.49045-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

