Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85D95B824D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbiINHyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiINHyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:54:02 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4122A72B62
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:01 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id fv3so13765140pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=i92P129jwcnuZH816qZJ1IWu3zvfW04AJO+Q2M5LqcQ=;
        b=hB3UKKDDyW2WRbdD3HlbHciPD2CGHw2rIq6ppt7ntDzNlb1fzUDfwIhrAEvuZmEOFN
         +T/iwDwyH93yCQb4eWan/BGAmyDvj/btQGAifjtphyr11dTXdVtmwXRTIlQGxoWCYj+t
         kPFRXBL2zSieVT4f13gkxffw07EjR3E2Yxa3BlUAJoyYIilfyI7uX5ayeIJR05xo4ISs
         lQshzI0qquUUEZvZDR6+r9c7qVrSwHWIyuh/Y1Vr4QgL9KUHnbOmjsrTPHxq2MDo4CI0
         Irutl/Q7aTT2BVK9xBfYuLC0Qt+RKvO7OVOJjkhyU/ZkO2YXbyh9G647yzXNEzyDq+8R
         UVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=i92P129jwcnuZH816qZJ1IWu3zvfW04AJO+Q2M5LqcQ=;
        b=pAV5KbrfNTpgpFPo7K9dRdnmz6qv8cuhNEx1if5AJ1kjLKqKRfGX70FeAl0YUyHHiV
         TEacsmLQKZMn/jP1rodD+b4faAcOMkmIoQJ0NDZkjjGp/VwnkmuEFKD3VfC4yqsQEa7q
         7Q5+L/KTRLK/aS0YHxh8nfOOhcRMtXBJ9uLm6HXbDph+nKWjILf6iosRdeHy31BsXl7M
         s/4tqbN+9EaX2Hc3i7oVkkXjHZ7TS0WQrdSgvm3Hc3pnuDYhdlY8ejoVHDnPQVGp5vJ6
         rqaMM0sJ6PmOPCM9SxJFg8AFxKeA2hknAtO2KDx7XqusIb18ex4vugsg+WbpGLuROLM5
         KI7Q==
X-Gm-Message-State: ACgBeo0GOxfbqM4HR/ItBxsv5W5XaeHPbVm9tiTTEIVnfrEoXNwAPsNb
        TPg9AaWBc8q2EDJULyaIj8Eo
X-Google-Smtp-Source: AA6agR6YoJex0y5EYdcUci15/PySROE0FYkHTQfY4GRinhXGyDd7mvbTWPskVAxdyehD3vAByV6DZA==
X-Received: by 2002:a17:902:b08b:b0:178:48b6:f5a8 with SMTP id p11-20020a170902b08b00b0017848b6f5a8mr6441535plr.3.1663142040732;
        Wed, 14 Sep 2022 00:54:00 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:54:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 00/12] Improvements to the Qcom PCIe Endpoint driver
Date:   Wed, 14 Sep 2022 13:23:38 +0530
Message-Id: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hello,

This series contains improvements to the Qualcomm PCIe Endpoint controller
driver. The major improvements are the addition of SM8450 SoC support and
debugfs interface for exposing link transition counts.

This series has been tested on SM8450 based dev board.

NOTE: Since the bindings are ACKed, the whole series could be merged to the
PCI tree.

Thanks,
Mani

Changes in v4:

* Collected tags for bindings patches
* Reworded the subject of patch 2/12

Changes in v3:

* Removed the maxItems property from "items" list
* Reworded the debugfs patch
* Dropped the eDMA patch since that depends on ongoing eDMA series from Sergey
* Added two new patches that helps in saving power during idle and low power
  state

Changes in v2:

* Fixed the comments on bindings patches
* Added Ack from Krzysztof

Manivannan Sadhasivam (12):
  PCI: qcom-ep: Add kernel-doc for qcom_pcie_ep structure
  PCI: qcom-ep: Rely on the clocks supplied by devicetree
  PCI: qcom-ep: Make use of the cached dev pointer
  PCI: qcom-ep: Disable IRQs during driver remove
  PCI: qcom-ep: Expose link transition counts via debugfs
  PCI: qcom-ep: Gate Master AXI clock to MHI bus during L1SS
  PCI: qcom-ep: Disable Master AXI Clock when there is no PCIe traffic
  dt-bindings: PCI: qcom-ep: Make PERST separation optional
  PCI: qcom-ep: Make PERST separation optional
  dt-bindings: PCI: qcom-ep: Define clocks per platform
  dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC
  PCI: qcom-ep: Add support for SM8450 SoC

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml |  86 +++++++---
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 154 ++++++++++++++----
 2 files changed, 188 insertions(+), 52 deletions(-)

-- 
2.25.1

