Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 725EA6541ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbiLVNbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235280AbiLVNbs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:31:48 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8098D15706
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:31:47 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 130so1222309pfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOniKrb0GQ9WjhoUQcWo7o7ITGbjHRsfNlny869TuiA=;
        b=RXfCUc6DuscK6pSxe4TWf7ROX9vnBY/mOBG8/W2FUvubLqbhzjVOE3w/Hf6dXzf8gh
         IkhVVvyKBH3hEhzV0bTP+hgPrXzgs4uUUnpdTjeBKY6BQRbkDWcvGqyAQCHRa/0xtUgx
         mwAoA30aOtXjknVTCEVlt22ks/lj6ule3aPYzWYon0qjYDxjY2pgTVOcwpStvlibqdHk
         QXlyOfIrhAwFBG+Ms7WL8WDih0el88qT7UFslSFORnuJ8ycSfZJede76gZoOuB9COoud
         F9sghyxBYljYN7xJZIEfN8dDdvxJEI88GK6P3bZYiN1lW3i6UPcBWQgc3Gk9TC5CJh4R
         W/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOniKrb0GQ9WjhoUQcWo7o7ITGbjHRsfNlny869TuiA=;
        b=0kpjKLgT8xv36yrzaQOV0LzSq0UzTfA6mDQhp62heh41CSV+iuvVSe4/EmTEbcyK/U
         thm5ErvLpcCcPEMHB2S+ti+s1nhNHHLrd+3sWmZgsd4Q+RhSImg4gkaLKceoCLqxm0BM
         5EhE6QeJjI3F4n0SerHniCflsbt5aBvJuA2veedaZDmfW1vZBbZLExqwZa/J6zE8xt6p
         T9uLB0tuSrfynU+QVOu7KrH/fkV23zgYjDQvxO97HobZ7bL0KozY8vmYMkSedBhiXkdE
         L4+WQuw6DuIb0LJry6WiYAZ1LxMhJ2sHiSMliAh6Aoj0yJq65P27xwI3asYlgqCOoCKw
         v+nQ==
X-Gm-Message-State: AFqh2ko1p/vYdT2bcnVmzaB1bSIuTqze+ECO5VjsB2lWQMRi8de7c1HD
        PY32Oe5ANvXdUjHBfFE2p1mm
X-Google-Smtp-Source: AMrXdXvq2jEi5GKhsl6hQVoJsM6pxaidM2iYeGzG5EDQ7gb5qjUobCUHSESWRvwVjcKeenBcvarSaQ==
X-Received: by 2002:a05:6a00:13a4:b0:57f:f7a4:511a with SMTP id t36-20020a056a0013a400b0057ff7a4511amr8553345pfg.2.1671715906971;
        Thu, 22 Dec 2022 05:31:46 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id f66-20020a623845000000b00573a9d13e9esm737467pfa.36.2022.12.22.05.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:31:46 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: PCI: qcom: Document msi-map and msi-map-mask properties
Date:   Thu, 22 Dec 2022 19:01:22 +0530
Message-Id: <20221222133123.50676-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222133123.50676-1-manivannan.sadhasivam@linaro.org>
References: <20221222133123.50676-1-manivannan.sadhasivam@linaro.org>
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
msi-map-mask properties. Only one of the implementation should be used
at a time.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 02450fb26bb9..10fec6a7abfc 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -104,14 +104,20 @@ required:
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

