Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104D550D1F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Apr 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234059AbiDXNXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Apr 2022 09:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbiDXNXm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Apr 2022 09:23:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56475AE65
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 06:20:39 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bq30so21935853lfb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Apr 2022 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=13bAhAMjv2je6RMOj1RTuCmatzo9I4F5Zv7WwkP8+gk=;
        b=u8Fh+X/orbfnwbnBJeGYv39MuQFzNu5KAHWMwplOnLS5OegN1HK15Tn+HV3iUo8hzm
         0HUpMnDgdSFyA6FliVEH2sUSdI1rYfwRzEmYF7X3drv4wto/dZ2sdyGKqT020K77fUe0
         brR4YoLvVs0ovkuBcw/R4K0ZbxszzwpNxvBaU0LGyzC/OtIG3G9lDDlSmWmV+MPh5Sf+
         6qV6z/Q4V8JrKUSjQ+sRegQZF80azSHOEB72tzpKQ5Fjxpn6EU12dmIOJIlo7A1bMA+p
         yQyN25HZjkwnZwgeB0x6+ljlLlSBt9YXFbLqrgRcHxGtXi3Sq/xN8CAQFK/EHb34ZQwl
         h51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=13bAhAMjv2je6RMOj1RTuCmatzo9I4F5Zv7WwkP8+gk=;
        b=ucHgg0vfv6cWXJaMTXqVvPtfIA2rhDMMHen60FmB/YnvOpbUhZY6Cbq7GF7I03Wb+g
         sCed/YOahJ5tRxxyMkpKinOF0vsQ4CpdDnv/cYK0u2ZmNu6nSz1cnzun79hQ5qNqCzXM
         38mHJED8C/DAmS5rfVvZRjqRld5OZvoruo7XHnuq71wFtfajfVLqyrTZBja9smnGzOoG
         c8BmePePfBZ3f7IdLcjhaD4pvarsi5X/tmtXTeZzmM7Mji7w+GSxBWr/nyELcHF1vOag
         fLTt9peSdicjqd/KfdZdix07f+z+mK5z3W2MtmE8FjkpfHXsyPVyJXBtjYNQe3OgsN1h
         rlCw==
X-Gm-Message-State: AOAM532Tv0BiKhEPEcN5Ran3Qoae67cadNahlqD4YZ0WlBFYjU3BnxGG
        yHkvXyz4rjCxPlrajPciBUBB5A==
X-Google-Smtp-Source: ABdhPJw3kncz5bBeFvGNHHjQHWuKAmMjfyyD4wJtaWuf72K9qaqlzxZROoUJU/oZxzv4EwKivcuIhg==
X-Received: by 2002:ac2:48ad:0:b0:472:4ef:d347 with SMTP id u13-20020ac248ad000000b0047204efd347mr892271lfg.422.1650806437307;
        Sun, 24 Apr 2022 06:20:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l12-20020a056512332c00b0046d0e0e5b44sm1015877lfe.20.2022.04.24.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 06:20:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/8] dt-bindings: pci/qcom,pcie: resets are not defined for msm8996
Date:   Sun, 24 Apr 2022 16:20:28 +0300
Message-Id: <20220424132034.2235768-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424132034.2235768-1-dmitry.baryshkov@linaro.org>
References: <20220424132034.2235768-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8996/APQ8096 platforms the PCIe controller doesn't have any
resets. So move the requirement stance under the corresponding if
condition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml         | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 496ba3baf6d2..3a1d0c751217 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -113,8 +113,6 @@ required:
   - interrupt-map
   - clocks
   - clock-names
-  - resets
-  - reset-names
 
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
@@ -502,6 +500,18 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      not:
+        properties:
+          compatibles:
+            contains:
+              enum:
+                - qcom,pcie-msm8996
+    then:
+      required:
+        - resets
+        - reset-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

