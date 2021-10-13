Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE45B42BE01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 12:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhJMK6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 06:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbhJMK6B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:01 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC60AC06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:55:57 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k23-20020a17090a591700b001976d2db364so1953512pji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xbAijj6QaI02gvcAy4f4tAKGg3l2cqTKGjVN7HjQges=;
        b=fQ7aY8AEbwdT3LQeqkDE/J85tNeDdlbIsT6osfMpW5w9jnmB03akGA8MegjotgZCzJ
         +bR4FdfJvLIZojey+EdVN9QFdPMmD8KY9L/uyvGk03eqxCIIvkKsD0dMWr6nXLWfTWK4
         QqTVQtGyK1+xitzNO4W/qD9ojtZ7beCPSfoCLbiqDpealxd5PJn3uHXWqm1VOqnNBwNP
         eMvaKonKVXstGw4cKhht/rtR62kyTfOwAdpK02oHnZWEAExCppbCEHwTgo4oVyLZOjiW
         4mY3zaKyoUeyPmctNcORz6R8cAMrX2H8E474lG553AeVqqmTl7GV+QMHeHpCyw6eoBoR
         wI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xbAijj6QaI02gvcAy4f4tAKGg3l2cqTKGjVN7HjQges=;
        b=zmVUDb/E+8Owg+sw6jb73GoYW9SYN7QejB16MoT+GAoM8QUmhUPFVCfGAwnbv7ysXD
         CZ4PD+Sc/gPTgMOkcq6Q94wsW1ykCPjMQfjF2w72J5K0O9K20NgYJP/D/qBNvu58mA2h
         5Ayurymod0YlMI2DMCWhxM+q6GvfGhaAhNzq4aouvc1HTVDqis976xywJ8XxxbZH9iNn
         4cgXwL+LGwEy7VLwdFdgAdUBRZFu8YyKgn5KAlgICrUa+1mCWacNKIDWV8fSBDyoJGlh
         l+2UDhUlurYnq0RNAP7bluqG9hx8bjjx+E28wETLVlSvAtCxoK1s9ZYgMhpOyUs9V4Lb
         YSLA==
X-Gm-Message-State: AOAM532zbVw06eyj+bo4zX3hTDhpf0lV3fp2cnKcZZDP7Pno34LsO8r3
        Jm6U+gUWmxl3NfUyFBIsE15G5fm7kuj2fg==
X-Google-Smtp-Source: ABdhPJyznrmr6OjfULh94pwo6WFj5BKiEuGBJkYn8+rdV5DctaT54a82qvxMRhQvN508YJl2jVSoHg==
X-Received: by 2002:a17:902:e8ce:b0:132:b140:9540 with SMTP id v14-20020a170902e8ce00b00132b1409540mr35175652plg.28.1634122556807;
        Wed, 13 Oct 2021 03:55:56 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:55:56 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 00/20] Enable Qualcomm Crypto Engine on sm8250
Date:   Wed, 13 Oct 2021 16:25:21 +0530
Message-Id: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorry for a delayed v4, but I have been caught up with some other
patches.

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

Qualcomm crypto engine is also available on sm8250 SoC.
It supports hardware accelerated algorithms for encryption
and authentication. It also provides support for aes, des, 3des
encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
authentication algorithms.

Tested the enabled crypto algorithms with cryptsetup test utilities
on sm8250-mtp and RB5 board (see [1]) and also with crypto self-tests,
including the fuzz tests (CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y).

Note that this series is rebased on a SMMU related fix from Arnd applied
on either linus's tip of linux-next's tip (see [2]), without which
the sm8250 based boards fail to boot with the latest tip.

[1]. https://linux.die.net/man/8/cryptsetup
[2]. https://lore.kernel.org/linux-arm-kernel/CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com/T/

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>

Bhupesh Sharma (17):
  arm64/dts: qcom: Fix 'dma' & 'qcom,controlled-remotely' nodes in dts
  arm64/dts: qcom: ipq6018: Remove unused 'qcom,config-pipe-trust-reg'
    property
  arm64/dts: qcom: ipq6018: Remove unused 'iface_clk' property from
    dma-controller node
  dt-bindings: qcom-bam: Convert binding to YAML
  dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to
    optional properties
  dt-bindings: qcom-bam: Add 'iommus' to optional properties
  dt-bindings: qcom-qce: Convert bindings to yaml
  dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to
    optional properties
  dt-bindings: qcom-qce: Add 'iommus' to optional properties
  arm64/dts: qcom: sdm845: Use RPMH_CE_CLK macro directly
  dt-bindings: crypto : Add new compatible strings for qcom-qce
  arm64/dts: qcom: Use new compatibles for crypto nodes
  crypto: qce: Add new compatibles for qce crypto driver
  crypto: qce: Print a failure msg in case probe() fails
  crypto: qce: Defer probing if BAM dma channel is not yet initialized
  crypto: qce: Add 'sm8250-qce' compatible string check
  arm64/dts: qcom: sm8250: Add dt entries to support crypto engine.

Thara Gopinath (3):
  dma: qcom: bam_dma: Add support to initialize interconnect path
  crypto: qce: core: Add support to initialize interconnect path
  crypto: qce: core: Make clocks optional

 .../devicetree/bindings/crypto/qcom-qce.yaml  |  90 +++++++++++++++
 .../devicetree/bindings/dma/qcom_bam_dma.txt  |  50 --------
 .../devicetree/bindings/dma/qcom_bam_dma.yaml | 107 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  10 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  10 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  28 +++++
 drivers/crypto/qce/core.c                     |  66 +++++++----
 drivers/crypto/qce/core.h                     |   1 +
 drivers/dma/qcom/bam_dma.c                    |  16 ++-
 12 files changed, 302 insertions(+), 86 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml

-- 
2.31.1

