Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A3D5E58CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 04:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiIVCrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 22:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiIVCrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 22:47:08 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F7AAB413;
        Wed, 21 Sep 2022 19:47:07 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id a2so481503iln.13;
        Wed, 21 Sep 2022 19:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7NNBB64006/DpYpkl2kFn/TR6nlhz9oGsFnrTcwseMk=;
        b=FEPfNIrm5C6FxYP9xjZ2PqHLruMUJwTaAwDHQ2sykFfthW05e+Wrw9BN04ZGOYfPqq
         1UyDND0z+setlK1DDZ4BULnZTlaFWD1N1AvKXKQdGhPE/zepjQEQoY/3hXDGzztmFvaa
         XgDvj/vat3HHGbF3FIJ/OjPcE8PSz1KgufYnD0DyTLm/ogxX56KV0yiNvRM9EVBoZHs+
         d8E+RpB2y4jFLHycy20ms+OEMXrt0aXA8z3fKeMK1di4wDvGg59kzFPDTeEcOm2KH18J
         Pg1s1X+QgMfRWJHRnz6b9fQfe8ada0orOTGplnQ9mKTrcjgnqTmV0mrei0qBFTOAqISe
         fZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7NNBB64006/DpYpkl2kFn/TR6nlhz9oGsFnrTcwseMk=;
        b=HVmdlYlU9ybvghO6a63MTXWDazU6N1Nu9dEpRbOjqnMah0hcY6wDoc4l0z9ppbmOzN
         xjwAH8FHdZnEtWIs20Ec9YZwfBXPJ5jH688Ta5oZ5Di6MMrvPj71dNANL8RCROzRhRXl
         Fj35ezn9BoMhKVtpfjuB94FR29/qzCTZg7ReEuAid49HWLTJep7yww5RYCgeJLhLABd/
         Kk0lV+8gpin0qiyPYe/kUGqQqVausHiBmCwvubCCHOOXKhLsFiprOs5TqE1XS7iu4+3k
         tRfYGdeEW5+5dC+CBVlfTklZIcYiYV3H8RAh85jrWF6q7aGTVS86IgpKrO+rmmtlzpFj
         MfEw==
X-Gm-Message-State: ACrzQf0HbMO6SO31Jj0RLEoOpoReRHDgYt5td761h4uknunA36kaahGg
        Aen18LoKfsRb5Z+3tRATj2pxNftOLs0=
X-Google-Smtp-Source: AMsMyM4dMk9hysziB1zvJLQuLhOCDGHS5HcEFabPrDzXL6e/zXbezppn8WnuCCt1kjK7FCMVsRKHsg==
X-Received: by 2002:a05:6e02:180f:b0:2f3:4a2f:7907 with SMTP id a15-20020a056e02180f00b002f34a2f7907mr622775ilv.141.1663814827120;
        Wed, 21 Sep 2022 19:47:07 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::61a4])
        by smtp.gmail.com with UTF8SMTPSA id h3-20020a05660208c300b0067b75781af9sm1847316ioz.37.2022.09.21.19.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 19:47:06 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: usb: dwc3: add sdm670 compatible
Date:   Wed, 21 Sep 2022 22:46:56 -0400
Message-Id: <20220922024656.178529-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922024656.178529-1-mailingradian@gmail.com>
References: <20220922024656.178529-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 has DWC3 USB support. Add a compatible to reflect
that.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index cd2f7cb6745a..94b05e32792c 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sc7280-dwc3
           - qcom,sc8280xp-dwc3
           - qcom,sdm660-dwc3
+          - qcom,sdm670-dwc3
           - qcom,sdm845-dwc3
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
@@ -175,6 +176,7 @@ allOf:
               - qcom,msm8998-dwc3
               - qcom,sc7180-dwc3
               - qcom,sc7280-dwc3
+              - qcom,sdm670-dwc3
               - qcom,sdm845-dwc3
               - qcom,sdx55-dwc3
               - qcom,sm6350-dwc3
@@ -344,6 +346,7 @@ allOf:
               - qcom,msm8994-dwc3
               - qcom,qcs404-dwc3
               - qcom,sc7180-dwc3
+              - qcom,sdm670-dwc3
               - qcom,sdm845-dwc3
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
-- 
2.37.3

