Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD1E5A68EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 18:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbiH3Q6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 12:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbiH3Q6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 12:58:45 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A40B4E91
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:58:41 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c2so11717301plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=OViT7KJIKbsQIi7Ovfdiw80XFX5CkL26feBJvn1djIo=;
        b=YOFwfzCV4hShHUTDTWDJE9J7A4hUiPwjn7vRDHxtPjhgULfw9jymBiHujLf4OXKAUe
         GpvyTpIqUJVKEiXPXymg3dMcm6ZD/XZ+pBYVhs2eqXv0Rg4ieNh0j2//csSqvusWASRz
         8IHtrbKZxaPbiG3MtiFppoa5WzjYfVwwzP2/Y73xrtRS4PGAkeVSLaaodFLdbLd0o/iS
         cVPi1QRRanEB73Jh7hY9cuAXvr0kICJl6J768yRDs12u3pXZNdbdA097ejDK1u1bTpnh
         Uc0tb/UWlkNhHuYxs50FyTUDoBJX6/+ZQ1mQdkYoVNG+OPqTgGVyegJTFaU9nyeBcTvr
         LMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=OViT7KJIKbsQIi7Ovfdiw80XFX5CkL26feBJvn1djIo=;
        b=E/F76gombGE3i6EQBxccgl1UHN9thoriTj44XI8e4W2QHEqQ5CmDIauIIadjzDEMtE
         d5ZCKiSNQtSAU5xYP1GzlvvdSKw0zbWA15f2iWoRbugUZnTGzgL51+9ZUuPVyTGYZhBC
         FDNkIWPSkYvEHYoj0ff4becxHiy6f7pk2+E2a1zWI+9Vl0073g02bNDoCfPYhghLHHgU
         ZIKLFhELF2x5whZN4j/BXceyPWMSNoyz9Jr7kyvxilZwa4r2boW3kJMqsJ8q3xfWd06b
         6Mto9Rw5NjIFQhrmXfAW30YhhrLDbeUDaid/ljrvPDEWcdYXfxuAAKVNM3yKTxay0osk
         cEmQ==
X-Gm-Message-State: ACgBeo0cdg7V1mllJnsdvsCtyYXbLYQARArJuTOYOC0ienrROpL+6FmB
        I2CCw0qXkYYhwVad4eTBR2E7
X-Google-Smtp-Source: AA6agR4jCQYGAVab1WMqy53XmbD7/536x57CzzH53CJYzz324XJ8aNVjuyGJxqhGb4D/NXyyV5ZN/w==
X-Received: by 2002:a17:902:694a:b0:172:bd15:3ece with SMTP id k10-20020a170902694a00b00172bd153ecemr22391471plt.116.1661878721167;
        Tue, 30 Aug 2022 09:58:41 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id n59-20020a17090a5ac100b001f510175984sm8841261pji.41.2022.08.30.09.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:58:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/11] Improvements to the Qcom PCIe Endpoint driver
Date:   Tue, 30 Aug 2022 22:28:06 +0530
Message-Id: <20220830165817.183571-1-manivannan.sadhasivam@linaro.org>
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

Thanks,
Mani

Changes in v2:

* Fixed the comments on bindings patches
* Added Ack from Krzysztof

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

 .../devicetree/bindings/pci/qcom,pcie-ep.yaml |  88 ++++++++---
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 140 ++++++++++++++----
 2 files changed, 176 insertions(+), 52 deletions(-)

-- 
2.25.1

