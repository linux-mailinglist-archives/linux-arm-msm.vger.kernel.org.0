Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B1C44BF5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 11:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhKJLC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhKJLC2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:02:28 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B702FC0613F5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:59:41 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id k4so2639166plx.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ivExlr+ZHhxGz2pIDkKmpQf/RoryVkuEzBBKkgF+HMs=;
        b=Bzpbn7SceepRLuLkqFR40e4H7SzQYDpC2iTZW/f6OsKuLqbGRr/Icwcc9pFwTc/WT8
         uGgbohpoRCOLORBjk2npB9BKxT/kq9vqqRaeJ6+mtUT53PXp4M09cQyEyX7RH7X42MhC
         LkK2FD5FH4CSwJncopb5dwDg1JtPZKdO+oIpRESwg33CUyRaThkAXqcIpQ2nVzbnsI3o
         VtzUuHoZ7kBNvcYXbtML1r9zw2yWkvApbNVCjzAvi3Ggm9dHOES+NJbaOLibF+WtXBXB
         7AH0yD47BYRAZh9HF0cShXwIpCNuiljGo7TeCH94WbuzdynSto+gLNusP94mTJ6+2F87
         OSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ivExlr+ZHhxGz2pIDkKmpQf/RoryVkuEzBBKkgF+HMs=;
        b=GNkV7bZYPkJdD3t6h10Io+VIUN/71TipvdOz+YFOmz/e/siIrJPuYSaXBrV+MoR93x
         UT1osHCvTWUOP11yV+bXNuLmyGB3jhn0hwZcEW5RfhiY2ZeODovT70K9JwJ6xG1WVrgX
         ax82o3SeeLO2hUo8oXmOV1kA6atyRX+hNCWSyLU+GwvWKizxMdPmMnz6eNZRLfs+EcTD
         6kljVNe9qOyaS1Bks4aIPfy/7c479VRFp8tQBOUO0lcXcD6dDDmJH00cy9weNdS13Hjy
         SZh2oM3sQis65j1LMbilqlMdN4hPJqH6pVrAyrM8aqZE44EWtFxqS2GbZ7BX+8h6WS4C
         elrA==
X-Gm-Message-State: AOAM531N/0j/2A5eU2c53kStPPETif3OwhStvEHwmZ+H8g31BjCiEoLa
        SBmebn1q4vYExaCKpDi1NMr/wD+H7YpikQ==
X-Google-Smtp-Source: ABdhPJwuI+oenFLr4BXNTSV5M4QNJx3LAHgpyNPB06rLVvtQV+UOG5/waLJlMmb9jM8QQREIjcRinQ==
X-Received: by 2002:a17:90a:d3c3:: with SMTP id d3mr15771831pjw.209.1636541981059;
        Wed, 10 Nov 2021 02:59:41 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 02:59:40 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 00/22] Enable Qualcomm Crypto Engine on sm8150 & sm8250
Date:   Wed, 10 Nov 2021 16:29:00 +0530
Message-Id: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v4:
=================
- v4 for sm8250 can be seen here: https://lore.kernel.org/linux-arm-msm/20211013105541.68045-1-bhupesh.sharma@linaro.org/
- v1 for sm8150 qce enablement can be seen here: https://lore.kernel.org/linux-arm-msm/20211013165823.88123-1-bhupesh.sharma@linaro.org/
- Merged the sm8150 and sm8250 enablement patches in the same patchset,
  as per suggestions from Bjorn.
- Dropped a couple of patches from v4, as these have been picked by
  Bjorn already via his tree.
- Addressed review comments from Vladimir, Thara and Rob.
- Collect Reviewed-by from Rob and Thara on some of the patches from the
  v4 patchset.

Changes since v3:
=================
- v3 can be seen here: https://lore.kernel.org/linux-arm-msm/20210519143700.27392-1-bhupesh.sharma@linaro.org/
- Dropped a couple of patches from v3, on basis of the review comments:
   ~ [PATCH 13/17] crypto: qce: core: Make clocks optional
   ~ [PATCH 15/17] crypto: qce: Convert the device found dev_dbg() to dev_info()
- Addressed review comments from Thara, Rob and Stephan Gerhold.
- Collect Reviewed-by from Rob and Thara on some of the patches from the
  v3 patchset.

Changes since v2:
=================
- v2 can be seen here: https://lore.kernel.org/dmaengine/20210505213731.538612-1-bhupesh.sharma@linaro.org/
- Drop a couple of patches from v1, which tried to address the defered
  probing of qce driver in case bam dma driver is not yet probed.
  Replace it instead with a single (simpler) patch [PATCH 16/17].
- Convert bam dma and qce crypto dt-bindings to YAML.
- Addressed review comments from Thara, Bjorn, Vinod and Rob.

Changes since v1:
=================
- v1 can be seen here: https://lore.kernel.org/linux-arm-msm/20210310052503.3618486-1-bhupesh.sharma@linaro.org/ 
- v1 did not work well as reported earlier by Dmitry, so v2 contains the following
  changes/fixes:
  ~ Enable the interconnect path b/w BAM DMA and main memory first
    before trying to access the BAM DMA registers.
  ~ Enable the interconnect path b/w qce crytpo and main memory first
    before trying to access the qce crypto registers.
  ~ Make sure to document the required and optional properties for both
    BAM DMA and qce crypto drivers.
  ~ Add a few debug related print messages in case the qce crypto driver
    passes or fails to probe.
  ~ Convert the qce crypto driver probe to a defered one in case the BAM DMA
    or the interconnect driver(s) (needed on specific Qualcomm parts) are not
    yet probed.

Qualcomm crypto engine is also available on sm8150 and sm8250 SoCs.
The qce block supports hardware accelerated algorithms for encryption
and authentication. It also provides support for aes, des, 3des
encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
authentication algorithms.

Tested the enabled crypto algorithms with cryptsetup test utilities
on sm8150-mtp, sa8155p-adp, sm8250-mtp and RB5 boards (see [1]) and
also with crypto self-tests, including the fuzz tests
 (CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y).

[1]. https://linux.die.net/man/8/cryptsetup

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>

Bhupesh Sharma (19):
  arm64: dts: qcom: msm8996: Fix qcom,controlled-remotely property
  arm64: dts: qcom: msm8996: Fix 'dma' nodes in dts
  dt-bindings: qcom-bam: Convert binding to YAML
  dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to
    optional properties
  dt-bindings: qcom-bam: Add 'iommus' to optional properties
  dt-bindings: qcom-bam: Add "powered remotely" mode
  dt-bindings: qcom-qce: Convert bindings to yaml
  dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
  dt-bindings: qcom-qce: Move 'clocks' to optional properties
  dt-bindings: qcom-qce: Add 'iommus' to optional properties
  dt-bindings: crypto : Add new compatible strings for qcom-qce
  arm64/dts: qcom: Use new compatibles for crypto nodes
  crypto: qce: Add new compatibles for qce crypto driver
  crypto: qce: Print a failure msg in case probe() fails
  crypto: qce: Defer probing if BAM dma channel is not yet initialized
  crypto: qce: Add 'sm8250-qce' compatible string check
  crypto: qce: Add 'sm8150-qce' compatible string check
  arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.
  arm64/dts: qcom: sm8150: Add dt entries to support crypto engine.

Thara Gopinath (3):
  dma: qcom: bam_dma: Add support to initialize interconnect path
  crypto: qce: core: Add support to initialize interconnect path
  crypto: qce: core: Make clocks optional

 .../devicetree/bindings/crypto/qcom-qce.txt   |  25 ----
 .../devicetree/bindings/crypto/qcom-qce.yaml  |  90 ++++++++++++++
 .../devicetree/bindings/dma/qcom_bam_dma.txt  |  50 --------
 .../devicetree/bindings/dma/qcom_bam_dma.yaml | 115 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  28 +++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  28 +++++
 drivers/crypto/qce/core.c                     |  66 +++++++---
 drivers/crypto/qce/core.h                     |   1 +
 drivers/dma/qcom/bam_dma.c                    |  11 ++
 12 files changed, 326 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml

-- 
2.31.1

