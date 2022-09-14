Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9375B826E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiINHzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiINHzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:55:18 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60DA13D3F
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:50 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id c24so13590421pgg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UaIe6nvb9frcJULOPfASw/VY+z26bpOj35NUY7Eb3q4=;
        b=CbZeoWcHgdnKn4qTwqT5ZttthixXdYEP2c+/hP1A4NhotUgT6wlYCHbqwuvYprNJa8
         JB3/aTnxEc+/d9uggCPEHpdZTpOTY0PZ94m3ftwlvHHUMrs/h83pB1K80CALEKyHt0JY
         uSbbXr7XeLfRWmT1xCLlSbKCAlaGiAiaVVz/Q07Yy1ygqq2DS/D5PgoP2DuV4wjqglze
         fMY1foSytf3d+d0M27/nN5Xep5VqKku3aYyaGTIHHheijQ3GFmd5inXrmaC2KDcT3GDu
         /+YiIVtLq5xSUHoJ8aH49OTyDzP+BNBhkunInul5BR2o59jAnue82XqfKS0pKvPPCeP9
         yuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UaIe6nvb9frcJULOPfASw/VY+z26bpOj35NUY7Eb3q4=;
        b=KtuEI8G9iUfkdHUE6avByFzvgH0qfRm4dbIotzQg2sJOKmpiTbduOR5r95mcoUX0cc
         EPpC7JVWhxtQZyAOitV+NYArliv9o+IPHkRmRw4ISvfzlxNOiZUR9Tmmln82tyMAMdYq
         3df+6xmEZcfwhV6A314nfp9krDbsRTPT0bqP3djxD1GNemteOu8J8tO4r9iB7m4f/Gpe
         M24MgY1uLiaDircVv+IawKgbeuhEzNOio4LTrnepV08CXVUNFEmbZ7vJubtx2MDTY1IV
         2yJbKH4ncQQYqIeuZ/WuTGDygkySj2NakIvQAjxdZKPPbeGdfwLkYVGs6fhZbpEl5Ock
         HxQQ==
X-Gm-Message-State: ACgBeo0P0oze5FkDTfIcR/EPon6EM9lUrT2C6RFGurRb3OeT7AgPmvss
        scjZr7okWq9HsumgsGuRJwGv
X-Google-Smtp-Source: AA6agR6sK2IA9cK0gctxDyi8ks8VgnfArTP4xHb+3VNl6dXRvSNetj++Yu3nGTUWsV6im5awJ5fwiw==
X-Received: by 2002:a63:4916:0:b0:439:57e4:5700 with SMTP id w22-20020a634916000000b0043957e45700mr3906450pga.369.1663142089588;
        Wed, 14 Sep 2022 00:54:49 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:54:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 08/12] dt-bindings: PCI: qcom-ep: Make PERST separation optional
Date:   Wed, 14 Sep 2022 13:23:46 +0530
Message-Id: <20220914075350.7992-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
References: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

