Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941375650D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 11:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbiGDJcB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 05:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbiGDJbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 05:31:45 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C7FDF72
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 02:30:42 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id v126so8416622pgv.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=72m7epCKc8DRYc24vKvm2IZvvf4jAtJWITsZpUnezm8=;
        b=blWIqK+YPLczSwFFpFvxMHpuLKD1i7l9cU7XpIkKtx3GqDxZ1nKppBQcRJiBeJIWoi
         vUAbMikhw6SgBzcJZGW/Z8uj7FrOlsXLBNuzliHLqZGTc/OBose0BfSsMaFb/eL6Hale
         j0NdxRTKR9ZK8hGC7enZTehdi8jHAD9ZQrMVhc/YBmisGFHIvQSfzusArZQhM/BBCEPI
         IaJ3pK7bDpf2v/yk0iR35ugaE/U4HpuAG+KWT7ROHNkVcCRcfLp51tqCL2caDWkpNBkk
         dS3iF+yJQ3789yYqgAr2bHbLV8YPmczajP3WBXv6BtHqJ1SANsCXFlatzq1WjLKnlFBe
         t4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=72m7epCKc8DRYc24vKvm2IZvvf4jAtJWITsZpUnezm8=;
        b=ubPxJoIP5oVHz7M0tZZfjSCB84qjmy3Msf1Rx2RgsKO+S2vBvz0jF3AEDDZ4GUCvZf
         L7bnR4xKJl6vjO/HqmwtevxriS3JfQRTky0E2zZHRSgwsbmSkoLXmYa4RasbMkuNaOZ8
         6N/1E6xRv97BRLrNvlN5PEKG2B4krRxBrEx8DLbHygocgVFHjGZZEq7utphcUXDCKuqD
         i8O5nz6k071NH1byWgiBFi6xg/1eS52Eim4J8D0FeWuomkNdcRSyoVCYsAiKWxW3MzXw
         putkx0om2rz7l26jOuy9xDQ5ciCSyoRNDynC3xZXnqNRx5KXPMIVN7xVeaOADBCKkQs8
         qZ5A==
X-Gm-Message-State: AJIora/DIOtDG9RlMkwj+8+IrDlGnhdrMDshLugOts3wEcdaIDX7TCHt
        52EXX5/hb07PR0a0rbg04MgzFA==
X-Google-Smtp-Source: AGRyM1tD1ms854Jvb6ejo2BaDKtErbzQrX2QO6fPEHFSPxLfHTiJjwP3IyXM10WaCMCRe4iD+LdqxQ==
X-Received: by 2002:a62:b514:0:b0:525:1ccd:4506 with SMTP id y20-20020a62b514000000b005251ccd4506mr34508280pfe.8.1656927041886;
        Mon, 04 Jul 2022 02:30:41 -0700 (PDT)
Received: from leo-build-box.lan ([154.3.32.171])
        by smtp.gmail.com with ESMTPSA id ms16-20020a17090b235000b001ef81bac701sm2926177pjb.42.2022.07.04.02.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 02:30:41 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: interconnect: Update property for icc-rpm path tag
Date:   Mon,  4 Jul 2022 17:30:25 +0800
Message-Id: <20220704093029.1126609-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704093029.1126609-1-leo.yan@linaro.org>
References: <20220704093029.1126609-1-leo.yan@linaro.org>
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

To support path tag in icc-rpm driver, the "#interconnect-cells"
property is updated as enumerate values: 1 or 2.  Setting to 1 means
it is compatible with old DT binding that interconnect path only
contains node id; if set to 2 for "#interconnect-cells" property, then
the second specifier is used as a tag (e.g. vote for which buckets).

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../devicetree/bindings/interconnect/qcom,rpm.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index 8a676fef8c1d..cdfe419e7339 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -45,7 +45,12 @@ properties:
       - qcom,sdm660-snoc
 
   '#interconnect-cells':
-    const: 1
+    description: |
+      Number of interconnect specifier. Value: <1> is one cell in a
+      interconnect specifier for the interconnect node id, <2> requires
+      the interconnect node id and an extra path tag.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [ 1, 2 ]
 
   clocks:
     minItems: 2
-- 
2.25.1

