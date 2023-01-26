Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457CA67CD23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjAZOAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjAZN7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:59:40 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B15F6FD03
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:18 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id q10so1866766wrm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwXf2047+hi/AeAqI5m/w1YUk4KylbD2BCgLR+1i3CE=;
        b=dSXKZWJcgPLKm97z6OFwwrz6aIf1Vx+18WpyiKVwo8JaUo0wJK8s1GqdhgWKhzJgBC
         Dd0PvI1W3PsQ5JVMvs7W+DpzAqeexYc6SGD5jGkqth4Ui7pQFH5smH+9fEy36obFB5/d
         l1dSrW4jT1WLZnPgX9orXg/0UZ6Sj6/ASatTi+MxOTeyonMosiNIAQIeyREsSzb7Ru61
         22HSlRuwfrXWLO+QDnybLmmKaEvTfTxTt4FqhfqlyJryu0Z/Kna8RGreyZexKrfawqOb
         KHIEIVFj04Arc1CCos8KloHZ5/GSdVr3LnyXk+nNHjKruCDDj032COQjThxkbqXP34L2
         9b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwXf2047+hi/AeAqI5m/w1YUk4KylbD2BCgLR+1i3CE=;
        b=k5Y3SRPgm/i9G775893u2Xo35Gca0AVPaozhr0Wysil79aZlWfmrDsIpvJwdLnO4qj
         8LRN3U/WF07CQR9logGpdr+1GreDTjiqalJvy/z+RcA5IhLs8a2htUVHSoL5d+0rUke6
         SGOOcpmJTt3PHQo3RfG6/Ia7OMn1RJn3fR2ajjEfaPl7TnyI+inYhrSF2O+K513hDEfk
         h8NjEHL16gz189wbibFHDiXfplNaSwf4xdz2qMOIyuD1Xe5Kp88WdhFDE+QC+G7w1VfM
         GIyO2hdTJ0VSwuNHxjzxtP5XcUPHDVAiVDQ0mii98bdN3N7lrxAOZ+USVkAFxqMvfkKd
         Op3g==
X-Gm-Message-State: AFqh2kr9gHF+zdvUaV6DJHKM98y9l9nk9d0zLprwClEXMvL3lvg45gZY
        4rpj3UjLfcb9GvvcWnN7RPGBFA==
X-Google-Smtp-Source: AMrXdXv1sxQUxwm9hhjE+Mpz3hy15gKvu4QtgIEtWRnt22nyf7jTGEttFz2syjCVSyAg6tHiucbzDg==
X-Received: by 2002:adf:e18c:0:b0:2be:493f:3b34 with SMTP id az12-20020adfe18c000000b002be493f3b34mr29630818wrb.26.1674741556524;
        Thu, 26 Jan 2023 05:59:16 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm1594067wrs.31.2023.01.26.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:59:16 -0800 (PST)
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
Subject: [RFC v2 2/7] dt-bindings: phy: qcom,snps-eusb2-repeater: Add phy related properties
Date:   Thu, 26 Jan 2023 15:59:04 +0200
Message-Id: <20230126135909.1624890-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126135909.1624890-1-abel.vesa@linaro.org>
References: <20230126135909.1624890-1-abel.vesa@linaro.org>
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
index 49a5dad486c2..3279ed0fd44f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -36,6 +36,15 @@ properties:
     description:
       Phandle to reset to phy block.
 
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

