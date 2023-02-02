Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249CE687ED1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjBBNic (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjBBNib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:38:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB1C58937F
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:38:30 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id q8so1403216wmo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up0Y4t69U4vgRLlW0caJKF4/hXf0ON3DpzJiFVXhbIE=;
        b=nnEiHkSNiJ+p+F1/8ICk557Vb00bABie3SDKnfY+mmrX3lm/+LyMp9jQXFWCThUy4A
         emLcjBvidZffjZ06y5B9IzUK0z5itkYRXK9c/LgP8PEQvIIYwMvXAzTejMcg/YDmbNnJ
         0BP2trd1wjf+nIl1PsZo/AgAVA9mvSDKozL4HPhrlyt11j/dI8L9ksUeaONgI0saLEi6
         Y64Gou09MZB8ytU04DFcvZMsZojtLuXL34sM159o+G4i3brHpbOtfO1n5ubVYjN2aK7V
         kQJpxR+3rRVU8wuRutPXZ+MqhjPaBtxgHyEJNbTHZ1IrLxzGlwpiNas0LBDCNQKSX+R1
         Ctpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=up0Y4t69U4vgRLlW0caJKF4/hXf0ON3DpzJiFVXhbIE=;
        b=C5OlaKDKp2/OudFqE7PkrW4Y0eXugNV3xFpXWtSjcOYHZf9CUHlkAF1lMEPoXz1xbq
         Ry4P5lZhaxiKmy1xTSBQc9vFf73clRtaB9+hQDSHi+gbla4DBVl2b1ovWJT8eOMpv85I
         R6b4CMcno7/YfxKYvkI/UZOvk112CvUEXcZdYbX3amZ3nxMm15NAGEt+Kmps9xnhQ93L
         Dof3f+aWUfC/uB7Fq46y+EeCQPzULPmMCBGHTbTxpJzccZ38B4RF/X4tzNXwP1qcH0AN
         MYV2qdvVo7BjnuPQ2FzBKtKzZH4PRYWJAts5BxBDE2HpDmfQb5vDVb/fwKIKx+eUBGib
         XtSA==
X-Gm-Message-State: AO0yUKWg+VuWqrqlUVoL+bOhz9AkEbD/G0KE9rCcy9dGcHxT0syk5kPn
        KzuFfQ4LxMLThdT6SFxI7PiN3g==
X-Google-Smtp-Source: AK7set8e5D8nC7f9RQsyPu1b1/cHMG4COHxQnQLPr1DmsNkygYoQ85g2yKYhJrfhTRfiZJH/F/Lvrw==
X-Received: by 2002:a05:600c:4f95:b0:3dc:47f4:a022 with SMTP id n21-20020a05600c4f9500b003dc47f4a022mr1898542wmq.25.1675345110439;
        Thu, 02 Feb 2023 05:38:30 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c364a00b003daf7721bb3sm4672657wmq.12.2023.02.02.05.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:38:30 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v3 3/7] dt-bindings: phy: qcom,snps-eusb2-repeater: Add phy related properties
Date:   Thu,  2 Feb 2023 15:38:12 +0200
Message-Id: <20230202133816.4026990-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202133816.4026990-1-abel.vesa@linaro.org>
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The phy properties are used for allowing the eusb2 to interface
with the repeater, which is modelled as a phy driver. Add the phys
and phy-names properties.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml     | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index de72577e34a4..8efb09b2dc5c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -33,6 +33,15 @@ properties:
   resets:
     maxItems: 1
 
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 to USB 2.0 repeater
+
+  phy-names:
+    items:
+      - const: eusb2-repeater
+
   vdd-supply:
     description:
       Phandle to 0.88V regulator supply to PHY digital circuit.
-- 
2.34.1

