Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC906B0117
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjCHIZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjCHIY7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:24:59 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744171C7F5
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:24:50 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so1196498pjg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678263890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMlNAANegEf4xx1NXIuCik/6RdcS3sC+7JZ54OhQzec=;
        b=eBibBaaC8WjGYl5ji9LuEtbfgqV8KIqyx/OB3HDqFwG7s8TlYGGwzWdaI+QbXuTTar
         2KQ/Pmc3gWpIj44n29MKHsmZH4FlPMfLHiMM41Qou1AC9/Q0B+aetKpEYskgzH+wI5UL
         5q2E6TiRCv1hBimV/xy8MIu/ZSrFqQ5LdfSbfeXqkmxyx00UbrkG9YzF8EXnJk1rwo03
         p24664/E1wnl9qAVIhH/BWkcvi7amecMYJL/0Tk0HjrYrRShMSLHrUGkwmxh2nZrUYZO
         /QWrtj+5Ql0sZMb6BJ2M1RY6bD6P6adr1HNiJTROIu7a+A1iMbB7SAKTud1HcYAy13XY
         hYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cMlNAANegEf4xx1NXIuCik/6RdcS3sC+7JZ54OhQzec=;
        b=0OXbsXCUe14Ep8uPPKIW0DdfqqbFCt0AdAZjfHBz0E1t4ec8nxZefdQ9I5Q4goRMAx
         f+zYMzKWhbfQ7n1xRssW9MiYGHC7DbSqAW0eiMROUCqit0RToXDXU/rEIQ1HPPKnzExn
         gCy2rN7UOk3TEN9FIqsjTw4X0gmfxWvyNf5ia335C5FbyfcGB0MlMAfP7RLtzpiR7FF0
         m474Emfstkb5cyyUqx/6cSwWmyil5/17tRmLlFiJ8GRDpFh064BQWMEvgaTgHLfF+0AH
         2az59hNxhj1jgors3LAO+/OCWokYoAX7j8Pqw/VWzankRf3SrEMa2LEEzUFsrwPtCEiB
         1gmw==
X-Gm-Message-State: AO0yUKV+u6wFgAwgAwNCRVEYgsOGhw0kcgm3bWOZ62Vtrv97y7A7ureh
        jWHIenv2VuQpgvha4f0pNr1D
X-Google-Smtp-Source: AK7set/4JPpqY/DEaCsjMr/Q40idU76TpT65q6X/mbVl72aZv/GG+oCgBUuvTqz10mgmE96actYxpA==
X-Received: by 2002:a17:902:9b8a:b0:19e:7182:b54f with SMTP id y10-20020a1709029b8a00b0019e7182b54fmr14919592plp.36.1678263889918;
        Wed, 08 Mar 2023 00:24:49 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b0019aaab3f9d7sm9448086plg.113.2023.03.08.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:24:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/13] dt-bindings: PCI: qcom-ep: Fix the unit address used in example
Date:   Wed,  8 Mar 2023 13:54:15 +0530
Message-Id: <20230308082424.140224-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308082424.140224-1-manivannan.sadhasivam@linaro.org>
References: <20230308082424.140224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unit address of PCIe EP node should be 0x1c00000 as it has to match the
first address specified in the reg property.

Fixes: 31c9ef002580 ("dt-bindings: PCI: Add Qualcomm PCIe Endpoint controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 89cfdee4b89f..b7f6fbaa0ba0 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -166,7 +166,7 @@ examples:
     #include <dt-bindings/clock/qcom,gcc-sdx55.h>
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pcie_ep: pcie-ep@40000000 {
+    pcie_ep: pcie-ep@1c00000 {
         compatible = "qcom,sdx55-pcie-ep";
         reg = <0x01c00000 0x3000>,
               <0x40000000 0xf1d>,
-- 
2.25.1

