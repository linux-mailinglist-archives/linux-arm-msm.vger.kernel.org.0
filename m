Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B035651297
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 20:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbiLSTQE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 14:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbiLSTPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 14:15:05 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBE012D04
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:14:46 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id 4so9992039plj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9agN2hOf+CL4HJ9ZbGXzkjZqDPOgTWQAwGYfyipiHIQ=;
        b=btxnOBxzbKshtiQvz6qlHOmD0ilj28u9K1pdvGzXZo6Y+y5YVboduUvCynfNY55U8e
         aNaW42k2fyavRmJ0XxsPWkoHNJ8mUQi6AcvMnccBiakR3XkZOoS9DofZDWEJYqSVnC60
         OF29eYMnKHv8WCuCbUVwP7IyxidHWEnRpnx9MCmwRyXA4S7ZhGccP9sSFMQyydt4XotT
         GAN19uexcDovmj6S3jsVUtn65vk0LOy2cWlnLb82KA7kb8nawvOPvaTRAbN8W6huwVDC
         yFOGtD3YdmWrQqQi+fxscnp0vpKzF4OPvZSbzCz4uevgpgNXWi2buICfjgGYsdgNANsn
         633w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9agN2hOf+CL4HJ9ZbGXzkjZqDPOgTWQAwGYfyipiHIQ=;
        b=csYMXzSBiiUru72kx9j98BOjO7hYZP7IJqA8Y/JuLjbnYm4l2MXTAGQZXbo/BJ0Nb6
         NcsBo26hCEjuEdGQxMnnvxpR740T9hHD3tGXBlsQ611Y90XOyYmPlEPSyXCHBBdIAnBN
         5zR480sFKBxIIirxu/HwQMww4mvpC9pdp2dLinILX/iOoLkC02wI52xIAZqFRRBBba0P
         gTYr9Ce5kQz1LbKKbIZs0C8lBlbvhinnvmS42mGx4Ei+wkd1mUMpeL02v5k2ddrpJV4k
         4bYqelzN4z+42uYQtTl1tcLNLtRp5edY7L8OVvCe0QAD1A3Pcc74rSam8G0bClVIz2xj
         Pp1A==
X-Gm-Message-State: ANoB5pk3zaspbt949+w4MJfg8AO9x5tgIaoLdZbuaOaVr9hPf4ld6v8M
        gBmwuKeM+iEl9Y7uMY2eJPWe
X-Google-Smtp-Source: AA0mqf7+ed63KjB6ZCD3S3TNvfHlUCFvDU+43EXQVENXe0Iof9ZpFio8+fK5fukXHGANR/xjxogyJw==
X-Received: by 2002:a17:90a:fe0a:b0:219:8cba:cbbd with SMTP id ck10-20020a17090afe0a00b002198cbacbbdmr45654393pjb.32.1671477285810;
        Mon, 19 Dec 2022 11:14:45 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090a66c400b001f94d25bfabsm9485803pjl.28.2022.12.19.11.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:14:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] dt-bindings: PCI: qcom: Document msi-map and msi-map-mask properties
Date:   Tue, 20 Dec 2022 00:44:26 +0530
Message-Id: <20221219191427.480085-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219191427.480085-1-manivannan.sadhasivam@linaro.org>
References: <20221219191427.480085-1-manivannan.sadhasivam@linaro.org>
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

The Qcom PCIe controller is capable of using either internal MSI controller
or the external GIC-ITS for receiving the MSIs from endpoint devices.
Currently, the binding only documents the internal MSI implementation.

Let's document the GIC-ITS imeplementation by making use of msi-map and
msi-map-mask properties.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml       | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 02450fb26bb9..24c3e7ef14eb 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -100,18 +100,28 @@ properties:
     description: GPIO controlled connection to WAKE# signal
     maxItems: 1
 
+  msi-map: true
+
+  msi-map-mask: true
+
 required:
   - compatible
   - reg
   - reg-names
-  - interrupts
-  - interrupt-names
-  - "#interrupt-cells"
   - interrupt-map-mask
   - interrupt-map
   - clocks
   - clock-names
 
+oneOf:
+  - required:
+      - interrupts
+      - interrupt-names
+      - "#interrupt-cells"
+  - required:
+      - msi-map
+      - msi-map-mask
+
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
   - if:
-- 
2.25.1

