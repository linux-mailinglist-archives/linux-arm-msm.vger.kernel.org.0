Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D6B69F7F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 16:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjBVPdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 10:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjBVPdk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 10:33:40 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2433800A
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 07:33:25 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id a7so4851418pfx.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 07:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PaLsYMr6sPMtYqx6/6slHF8podsGBf53BiFDK64HXmc=;
        b=JEBZurARAxQd3WPnYht6AlUxWoexdJT4GuVbJuj2TNvtAmqOtDcuSHkAB+/FkThthL
         7qWRTZIn8jk+bsjchrH92/Lahul3ev6xyNyHIJm5gIrMjYloEcY8VW0pziQQR5cn9qgB
         po4lKozQvt01/1mGRD9OpAISz31pkXX16DmvKAc8FqOiZ3+oJyGMGpB9HoHlj44Kp5S/
         o+lF4v6FSjVeRx5MpCxDNa4ZQWORf1/2cBnavuyojKMSQ5ms9bLd7v9gCGwqAigA3FXW
         T6tOokotW0pk6Eb3d74AAxskhjgl8k0Mh4PdrqveEa/QcIQwD3QCXVO/3rMFW/QYDtD2
         ZARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaLsYMr6sPMtYqx6/6slHF8podsGBf53BiFDK64HXmc=;
        b=asRPfvyZiru4EnOSidMj6XreNRCOi/E3y4fI4IXg8hbaJImGpCBHVliOxcBldb3BKk
         d4G3t9ffj46h8Q8HKIzNT14YWmnVomjUbC0u2DmrDAlf0Uo6fu9BmwzYpd2nZHk3k0sl
         Sk52f9xxqhtF8+I8aoxkOBi9qmb35lQrh2DEqag6slZj5fvHw930X+NIX04PJb3wzsKt
         a1QtOcAwc55OetEeGg6pDNVcwy76j9JdANji3Yf3OF8vgCPd2bkoVlg7wnSxxlE8QJhT
         eqwhZqBZ9ZzK7l8PxwOUx/OD93bZcN8AErZCcsFqFGZu9dc2e7kHKlzItkpI3YRlmwJi
         OgQA==
X-Gm-Message-State: AO0yUKUKph5pPNqXdd/E6n0qvSsmAZztHM5YbsY0WsfMGyqyVUJ+KKif
        +mdOnczuvkdJRoGAOds0DsmH
X-Google-Smtp-Source: AK7set93D/+Y65fUkj+aXuUylHYlgnEkSZkMhiKK4SYK1nAUmRkyHQgVA/Le0tEFmwP3SHdHAyegWA==
X-Received: by 2002:a62:168a:0:b0:5aa:7ef7:f44d with SMTP id 132-20020a62168a000000b005aa7ef7f44dmr7605073pfw.2.1677080004421;
        Wed, 22 Feb 2023 07:33:24 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.15])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b005ac419804d3sm5222482pfd.186.2023.02.22.07.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 07:33:24 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 04/11] dt-bindings: PCI: qcom-ep: Fix the unit address used in example
Date:   Wed, 22 Feb 2023 21:02:44 +0530
Message-Id: <20230222153251.254492-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
References: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
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

Unit address of PCIe EP node should be 0x1c00000 as it has to match the
first address specified in the reg property.

Fixes: 31c9ef002580 ("dt-bindings: PCI: Add Qualcomm PCIe Endpoint controller")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index 8d7eb51edcb4..c1800e44f3da 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -164,7 +164,7 @@ examples:
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

