Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF686511782
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 14:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiD0MUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 08:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233748AbiD0MUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 08:20:11 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A126A4EA1B
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 05:17:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y32so2804725lfa.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cLYJ0GysdHluMMr2clkUv2N03QTSVxRZN8GILwf5WB4=;
        b=jnLB1M/Z1nnafctw7GO8Q909Mae3PoL/DfRgh0yP+tVrcbYUoj4tHZ0weWrluv893u
         k79ZQk4xO/TaL656AFqFg7i2UaO4siI72QG93iio0T1v1ZYpm7rfN69i5+t6KQDc3xtq
         EA4GDbLJbXPKD5KXmUI4PawbaMWVVyjg2z76IxyxIwkGILLCDnAQpFRUkPIOMUCZc1Mu
         aVaG5NeQI9H1IemN+1H/izixpqz1jKp3LZTM0bSFAVJRrmghDNsMG2FVYfz6lH5xmUJb
         seJK9gmf/qNcfXlsORVhsRFUBnLCUhwThWn4MX/5joApCc0OFbLpxbXrmL/KI5cAi3yT
         Ikbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cLYJ0GysdHluMMr2clkUv2N03QTSVxRZN8GILwf5WB4=;
        b=yfUp1pvyeBhVofL45tMNKC/35EbkDATi0VPTnCFLuuCBQeBYAWA+8F0mz6V/6FkZJ7
         PpNGt1wVxcyjKoGSdpvdoVy/cggJyzv3DSelslNL7c4b6Uje8aT/REIIe6ag6GBjvhp7
         YYabWbt65krkIu56+K/aqWWVhEBBWDz3u0GUmJwWHnfHyZQljnbOFfiZp0L/AkoU9FuY
         FckwA82s68jEOFSYwPCCoLxKumdDPUSajQpO7jzcuAYodP/enHvbBnEQmW6mpJXCdc8a
         10QIZlUq1pG0B/U2rafXhNoTd/cbN8wyi6DNGmjjQUjyEDoqq2uP1i//KQJNg+hIoLEQ
         8GbQ==
X-Gm-Message-State: AOAM531w/TrCDrZbtsbx0Tk/75Eh59g+qKCb9Wkj8kuW5FXssTZcHq3n
        S1zaGkkfpJh/M1UtOpqk/EQV0g==
X-Google-Smtp-Source: ABdhPJw58095SdUUdrJzp7HdEZXP2UF/S+ebEQUHfPVJLoauSNg2gxYOevOxfcP8s5q1QrG0LNoKoQ==
X-Received: by 2002:a05:6512:3da1:b0:472:28c9:851b with SMTP id k33-20020a0565123da100b0047228c9851bmr2606638lfv.359.1651061818840;
        Wed, 27 Apr 2022 05:16:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y1-20020a0565123f0100b0044584339e5dsm2043388lfa.190.2022.04.27.05.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 05:16:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: pci/qcom,pcie: support additional MSI interrupts
Date:   Wed, 27 Apr 2022 15:16:52 +0300
Message-Id: <20220427121653.3158569-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427121653.3158569-1-dmitry.baryshkov@linaro.org>
References: <20220427121653.3158569-1-dmitry.baryshkov@linaro.org>
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

On Qualcomm platforms each group of 32 MSI vectors is routed to the
separate GIC interrupt. Document mapping of additional interrupts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 48d56b073564..8447076bef97 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -42,11 +42,21 @@ properties:
     maxItems: 5
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   interrupt-names:
+    minItems: 1
+    maxItems: 8
     items:
       - const: msi
+      - const: msi2
+      - const: msi3
+      - const: msi4
+      - const: msi5
+      - const: msi6
+      - const: msi7
+      - const: msi8
 
   # Common definitions for clocks, clock-names and reset.
   # Platform constraints are described later.
-- 
2.35.1

