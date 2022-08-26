Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 419455A2E26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 20:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbiHZSTi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 14:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbiHZSTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 14:19:36 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFB0E2C5D
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 11:19:35 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id s206so2071005pgs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rcABYEF+X05lTkf1vCRtoGVctLnQghu4RYAK8IcZhIE=;
        b=L5MwBYt21+ofglYFFC6r3rcvDFB1cS2ZJunNikgx5awnPR94AzTmwty0Z+ZRroKo9K
         rnZPq7W9GvU2zpUVpnRa7b0fUTRaaK998pLLcaZBNLhCuFm3Elmx9VNI9O2LGGsvGk1F
         Dn6fBK7Ws+1ZcwtirlcFaXcFAL3UCoV363kAjs92NTTkcr/L3QivxUZHs8rrGwfVN7Yn
         JRl9q1N9Qh0SD+5wpXk3Jyo/NPQOzb9dqeuJSOwbZF3hQGPRg0M5AukCjmNxyU/O4rgr
         qNVjFFk8ohQq/zo6zJD77m09L9NE/6NAZXyiGqcCBe/2wD2voNQrQRTps1lZ0U/VZNTm
         /jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rcABYEF+X05lTkf1vCRtoGVctLnQghu4RYAK8IcZhIE=;
        b=KRYsGrH9ozEFyjBFT8MO9afjRle9o20gkQpbBo4Oryd+IjKVNzakWeI6QFFqxMJHHB
         besJrmd351Rz9iKU7q03eTj8DERukTdFFst2po1zc/RY06HZuiik3OOoXX4z76suqG31
         kwxfCY4/sHI1AEVHoxP2t7QmUY1K3vy2avrK62U/sCPdFWCTSs3bnlgyJR4Nsj4YZbeE
         fQzqBaJ+bYx8ymoJEP93fGpvSRHbYtS133424DtWWsii/ruCmXq4k5hAuQTBKbSUXK/x
         4PMysyLVR/WietvM73rrgbj9RWHxxGCgPBnaT1br+sZd5YUDKWybRqOhCVeMPgcxZRzf
         8SqQ==
X-Gm-Message-State: ACgBeo3EGydVAn3HjH4dOU+7MZq6/lpHgIRuOIinLvN98ewLAE82kbcm
        wsmOTj92dxEH6p3SLFPbznU+
X-Google-Smtp-Source: AA6agR5SIKVYXr6MKYnRycMvBY+Jm95emDpYcLsMNcP2o3dM/UE8N//22a3eUnNhpVPA4OO5Pxy3YA==
X-Received: by 2002:a05:6a00:98a:b0:536:4469:12e6 with SMTP id u10-20020a056a00098a00b00536446912e6mr5108862pfg.9.1661537974604;
        Fri, 26 Aug 2022 11:19:34 -0700 (PDT)
Received: from localhost.localdomain ([117.193.214.147])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902b18500b00173368e9dedsm1881868plr.252.2022.08.26.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 11:19:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/11] Improvements to the Qcom PCIe Endpoint driver
Date:   Fri, 26 Aug 2022 23:49:12 +0530
Message-Id: <20220826181923.251564-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series contains improvements to the Qualcomm PCIe Endpoint controller
driver. The major improvements are the addition of SM8450 SoC support and
debugfs interface for exposing link transition counts.

This series has been tested on SM8450 based dev board.

Thanks,
Mani

Manivannan Sadhasivam (11):
  PCI: qcom-ep: Add kernel-doc for qcom_pcie_ep structure
  PCI: qcom-ep: Do not use hardcoded clks in driver
  PCI: qcom-ep: Make use of the cached dev pointer
  PCI: qcom-ep: Add eDMA support
  PCI: qcom-ep: Disable IRQs during driver remove
  PCI: qcom-ep: Add debugfs support for expose link transition counts
  dt-bindings: PCI: qcom-ep: Make PERST separation optional
  PCI: qcom-ep: Make PERST separation optional
  dt-bindings: PCI: qcom-ep: Define clocks per platform
  dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC
  PCI: qcom-ep: Add support for SM8450 SoC

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml |  70 ++++++---
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 140 ++++++++++++++----
 2 files changed, 159 insertions(+), 51 deletions(-)

-- 
2.25.1

