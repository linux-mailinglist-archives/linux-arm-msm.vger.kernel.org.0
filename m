Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCAF6B0102
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjCHIZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjCHIYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:24:53 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A0311E
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:24:36 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id i3so16951586plg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678263876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hku7GI8fxnyC2ugXj0rjNviSGHzIDWLdfW64e83ph/U=;
        b=S2IrAmdHcm7bUgPqWiRffn0Hlsp2BqnYwJv4XBFQgfPcJI+vFmaDXjPCWfARaed2IH
         wIrPT0Fe/TNOMIF+Lb9G93gvD2TWYGJ4fKJXgRzUGfQtkyjg1wxeXNlDu28qFDtclfKo
         p+S/QhmEhYh8mUs11wPkrAqZl0FYgSZ5Y2MxAJPRx9g1XHCpKIvREMFt4rPbnQ2ObMas
         bo5mij/kUtqhHkVyYDGWNrseFO7SRy4jHVVyfMR6saiNOkS9WxxFYJyjl6Q3/ipIosB9
         m6OhFbIvpb9Ya4NILIg1L/Vt7q4y7HhbMzAbkvxRiqtXVaz64VFovjXvvALw/Y2zkvv1
         tzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hku7GI8fxnyC2ugXj0rjNviSGHzIDWLdfW64e83ph/U=;
        b=NRwWNjiPj+rFmecOSwQOwec3u+PQS/HAT0lUTMBDhi0+39tz2awask1JttCe2glwL1
         jyGGThWMTXCdIV10s6F4o9aH4EbHueWw7ycpr+HGCj02yi9mdA+O9MT/mU4XQiMU5uVz
         bFo3nb3gR5QVKbaMO4sE66Nhw2mG2pBUa75uXjHXFXYN0g2RzpkXZxqt8Zcsn8dChkuU
         cXRF3M4QeFCd8reQT43mvBeEJkFSMP3pGnURV6vrqSY1v781T/Y7zrAskpNeNLiRMvqf
         MXTB0+ggCxeRmRFlqpIs64uQt37c0t5Fn36IsZ8zzK0a7FsP/3I3zeP6qKYobcRgr3kL
         e3nA==
X-Gm-Message-State: AO0yUKXg3pFss+pPrQyuwwktYEw7cNaOY42O9xh/FpAdacO2dUfXN1r0
        moqBfBk/+VhqBi15X/uThrA8
X-Google-Smtp-Source: AK7set+z2ohjLMrW/ySDf6/Oh+UEPC1wQb+tHc0FTJS9Kcx/n4N6wSZuXNOT6xuA5n5AkVTr9Gltmg==
X-Received: by 2002:a17:902:b282:b0:19a:b151:bf68 with SMTP id u2-20020a170902b28200b0019ab151bf68mr17535437plr.38.1678263876361;
        Wed, 08 Mar 2023 00:24:36 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b0019aaab3f9d7sm9448086plg.113.2023.03.08.00.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:24:36 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/13] dt-bindings: PCI: qcom: Update maintainers entry
Date:   Wed,  8 Mar 2023 13:54:12 +0530
Message-Id: <20230308082424.140224-2-manivannan.sadhasivam@linaro.org>
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

Stan is no longer working with MMSOL and expressed his interest to not
continue maintaining Qcom PCIe driver. Since I took over the driver
maintainership, I'm stepping in to maintain the binding also.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index fb32c43dd12d..92eb273581f6 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -8,7 +8,7 @@ title: Qualcomm PCI express root complex
 
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
-  - Stanimir Varbanov <svarbanov@mm-sol.com>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 
 description: |
   Qualcomm PCIe root complex controller is based on the Synopsys DesignWare
-- 
2.25.1

