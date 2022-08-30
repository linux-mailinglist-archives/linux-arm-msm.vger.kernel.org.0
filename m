Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884855A690D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbiH3Q76 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 12:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbiH3Q7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 12:59:35 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA96E97C8
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:59:22 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id p18so11700643plr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=UaIe6nvb9frcJULOPfASw/VY+z26bpOj35NUY7Eb3q4=;
        b=hitW9hbwLBSxHNayK49JF5ArwQqrJeOxOxW1C+UiyuIgpAH9ZR1mv06WLURY7HQ+VD
         +2pZ6LIBbNBmyN9zegNKsarW2LgDyAujQ1Wqcp6CQo51mlfZTFGDjlUilznZWQvC2QVd
         0Gjw7Y13K5zVXU0gBtq1X1zNQwKba0i/wdTsROv6i3Pk5H39bdGUDrGx9fRmNT0F74I+
         m5r2ECNe6eAhJ9nsN4TEhyGj1GRWP9wPRYzLPqPUFaUpkLVFYxxBSc9hPV2KNI43bTyM
         GZDXy8F/TsxWHb/S5asGuTXjKM9Bs5Dg5J1EnbLTP7Iewva2r33p3c5et+RjpZlGOZ53
         1dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=UaIe6nvb9frcJULOPfASw/VY+z26bpOj35NUY7Eb3q4=;
        b=qd5fLJcoumpOaSj3LM2HmF2IEN4RlSxM8y8K7ho+J4ED1usGvXRCB/FndMRW2WpMUs
         tZY0x+ZCVgM+K6YbksnDc65i/znJSXLmp6+ext+v9isbofKKGkTMyTZOyCi4AdfioV91
         I4qoOODh231N8dL64VCvASz5Mb0QkciViCvihxP/atkXH6P8yjEntz4tRJ8VC7CHaB1+
         bpvf+OIVEBotFk2rlFemmtl+12bNV+jGZkM34XcMlBBq5HDvhORKW8z31vGqu/stC08S
         xXkoYgyGlRbmoX+wW3mCOJauqzJ8xJbBqoGKeDMHwpUHXvKHpYFN8d2j4cOAqU+n7xPE
         BR7Q==
X-Gm-Message-State: ACgBeo13PC8ySM48C8Ty40D1YNaGKrojz4wL6xyS4O00Du743Lynhl+/
        ebuxSZ0MdGT7dHt4MUzD+5wJ
X-Google-Smtp-Source: AA6agR6OxuuAcOe3ofjgEL/FypzzZuaumsVigWO3yWd4uCKf96ZKLzSl+8j+IuditYFIgqFzG5WCNw==
X-Received: by 2002:a17:902:f68d:b0:172:a34c:ff96 with SMTP id l13-20020a170902f68d00b00172a34cff96mr22025807plg.26.1661878761986;
        Tue, 30 Aug 2022 09:59:21 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id n59-20020a17090a5ac100b001f510175984sm8841261pji.41.2022.08.30.09.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:59:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/11] dt-bindings: PCI: qcom-ep: Make PERST separation optional
Date:   Tue, 30 Aug 2022 22:28:13 +0530
Message-Id: <20220830165817.183571-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
References: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PERST separation is an optional debug feature used to collect the crash
dump from the PCIe endpoint devices by the PCIe host when the endpoint
crashes. This feature keeps the PCIe link up by separating the PCIe IP
block from the SoC reset logic.

So remove the corresponding property "qcom,perst-regs" from the required
properties list.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 3d23599e5e91..b728ede3f09f 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -105,7 +105,6 @@ required:
   - reg-names
   - clocks
   - clock-names
-  - qcom,perst-regs
   - interrupts
   - interrupt-names
   - reset-gpios
-- 
2.25.1

