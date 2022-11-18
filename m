Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2B863064B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Nov 2022 01:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbiKSAJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 19:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbiKSAJg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 19:09:36 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9479F9E973
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 15:32:51 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id r12so10657637lfp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 15:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvnyFdgcWdO/y4g/GZdtkoa/ckJSM/CaYgX7M7Lgruw=;
        b=Mf6BPIQL3AC+s2O6KnSFxSJ33V9BDuaVz0eE1Iux1WjDj4JJZww5cF088ubioQ65a9
         vGsrSNMWndMIT+0mXr0Sj6QosszPvs6czfpmW+8yZCOpzMeqhTVd/0jk6ZoXPv8X+iC+
         xHFPM65rg9ruTjp6wNLmPKEptZJMUaxO5bW0qQX2A9Q4as9kq9ZDxIH5qJiw43o3HjSs
         7dWktYJvThKbGR0LtxU0O5sAuUMSEwi6eEOL+RQVJl88w21SYJFQK6BCxxHdnRSJgN+C
         dPzBRSD5C/aZAfqAPzUq+L39wVWzUcjMn3GkttTDkg05SyvpCzp+CmHA9S5QOwXiOIXC
         oqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvnyFdgcWdO/y4g/GZdtkoa/ckJSM/CaYgX7M7Lgruw=;
        b=7hgdwQ3bCar1dYVsJH4qaDqX4q2PrSFPX4YpLNTypNHSBQRYQ+9wiMpNxkQAj+G/DI
         mWAUN6ezN5YTdeiUYZ+5OLuhuDpU52CrWYtO9cU4pP00mmfSbdF/GuwU0jTfzHHkceiJ
         91ZZ9NFg+KGZOl4Wzi+1lZeFKSkiX4dN9BxcSqjHyrLjnnLudOIuCd5IUGDMmbkH0R33
         E95+1TdGZtBfIIt6QEg99B0Y3O8+PusztlcWaQEk8HTBrG9qZsZzkqW89qwkoS21875s
         FClq+ZUeif72BcvCgciIzz6Nnumanf/MTuh0WmYmRd7Fca/MdBI8qEQVTBvhnFNKxRj/
         lbsA==
X-Gm-Message-State: ANoB5pn48ngigPy6jn/OHwoYWSzCoWpxeX3GgvKt2VZlLD8AQFgHwlfL
        ixukGSiff3HbCCe6jOPG2hLuXg==
X-Google-Smtp-Source: AA0mqf6Znugn88JXILPSHLaNOhRx0k3bTOgt1DQZ1HyWx4qmV0JGOalJkHboO03+sRVZ8iuaxcS2Uw==
X-Received: by 2002:ac2:4a62:0:b0:4aa:323f:e850 with SMTP id q2-20020ac24a62000000b004aa323fe850mr3123560lfp.492.1668814369953;
        Fri, 18 Nov 2022 15:32:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id k13-20020ac257cd000000b004947f8b6266sm843900lfo.203.2022.11.18.15.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 15:32:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v4 2/8] dt-bindings: phy: qcom,qmp-pcie: add sm8350 bindings
Date:   Sat, 19 Nov 2022 01:32:36 +0200
Message-Id: <20221118233242.2904088-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221118233242.2904088-1-dmitry.baryshkov@linaro.org>
References: <20221118233242.2904088-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the PCIe QMP PHYs found on SM8350.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 80aa8d2507fb..8a85318d9c92 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -19,15 +19,18 @@ properties:
       - qcom,sc8280xp-qmp-gen3x1-pcie-phy
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
       - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+      - qcom,sm8350-qmp-gen3x1-pcie-phy
 
   reg:
     minItems: 1
     maxItems: 2
 
   clocks:
+    minItems: 5
     maxItems: 6
 
   clock-names:
+    minItems: 5
     items:
       - const: aux
       - const: cfg_ahb
@@ -104,6 +107,25 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-qmp-gen3x1-pcie-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
-- 
2.35.1

