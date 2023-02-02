Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446D9687F21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjBBNup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjBBNup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:50:45 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6568466020
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:50:42 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id v10so2046571edi.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyyxA354CEcCAn/p3vZ7ZVyh41xSHBm4ydIo5hp9G4g=;
        b=cv5okb1osUNexr4VjqsMCz8/gJdDVLeHDUScMHepVFbRBR4MxuU7AkbKXCLEjswF3J
         31MySBezZ/dPtOH6zztc7S7SUnwth72Q1vSKcHCnaKQhDY1A07Gz0HhKHjsfnzg9EbCC
         CJxhwkLMi0ZASuOlyoShK4Qj3oGPHfy/7NMjgNaoZMPm7mc55dmSzc6exR2iuE4fyanq
         GGlY52jN3nv7RDDRamsvnscF90M7bFv3WAvo4TTr1CyrMz172Sr50fyF6AvfArcmN840
         LB/cXNy4nC8qOPOrXFOglaDm/Z/caHaZ1pzbxWL9wWqMQgpbe0NtwoLqrDLNjReZZhze
         QPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyyxA354CEcCAn/p3vZ7ZVyh41xSHBm4ydIo5hp9G4g=;
        b=iuwirLQWnBq8pE961CNUcTXuDOjfm0zQV4Dhi/BzMsZ+owZfGKTtiMkVelHQQZ5NHY
         EPUeuRrINm0fm7v9VtRSl4Pt7yzM3+ycBtuLJwisJunYsogxUBBnMbXrVYDvvNh7Hbvx
         Ws3xkleDF9xdiiO14xdnHJThPp7k/IwIDxe3bJJblqk7iliM7gchyJ5KVvAeho7uoN/b
         ZCRJMjlKqe32fV+e6BxZp8w0eRMQfXC1BceYx5FmLySNvmoVlfekKZzfoPAW/7q4WwCO
         uqxh5T2nBfyVUZzSzPKnLnJMNvR/aKA/eqWLWOiqZV+zxpHcri2vY+0T8/W+wIK3H13v
         EWiA==
X-Gm-Message-State: AO0yUKXLAiTsrqhR4AM3k5O23NejxT2FqqbFD82GLAWseV9nfccrrvFa
        Pcb+3sdAfoZZZly81kp52RqCmQ==
X-Google-Smtp-Source: AK7set/mvZ5AxdAWrhmEnkpf8fVqafZHU30S13S5Gq5U1Kgj5yA+ZToYpSB7XpWIaXsoRsLhHerymA==
X-Received: by 2002:a05:6402:5511:b0:490:ff75:7aa with SMTP id fi17-20020a056402551100b00490ff7507aamr7145346edb.1.1675345840954;
        Thu, 02 Feb 2023 05:50:40 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7c157000000b0049e1f167956sm7596332edp.9.2023.02.02.05.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:50:40 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: [PATCH v8 0/9] crypto: qcom-qce: Add YAML bindings & support for newer SoCs
Date:   Thu,  2 Feb 2023 15:50:27 +0200
Message-Id: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

The series contains Qualcomm Crypto Engine dts and driver changes,
which modify a set of accepted compatible property values, this is
needed to provide a unified and fine-grained support of the driver
on old and new platforms. In addition due to QCE IP changes on new
Qualcomm platforms, it is reflected in updates to valid device tree
properties, namely added iommu, interconnects and optional clocks.

Changes since v7:
=================
- v7 can be found here: https://lore.kernel.org/linux-arm-msm/20220920114051.1116441-1-bhupesh.sharma@linaro.org
- Added a change by Neil Armstrong to document clocks and clock-names
  properties as optional,
- At the moment do not add Bhupesh as a new QCE driver maintainer,
- Minor updates to device tree binding documentation and qce driver,
  in particular added more compatibles and fixed lesser issues.

Changes since v6:
=================
- v6 can be seen here: https://lore.kernel.org/linux-arm-msm/30756e6f-952f-ccf2-b493-e515ba4f0a64@linaro.org/
- As per Krzysztof's suggestion on v6, clubbed the crypto driver and
  dt-bindings changes together. Now the overall v5 patchset into 3
  separate patchsets, one each for the following areas to allow easier
  review and handling from the maintainer:
	arm-msm, crypto and dma

Changes since v5:
=================
- v5 can be seen here: https://lore.kernel.org/lkml/20211110105922.217895-1-bhupesh.sharma@linaro.org/
- As per Bjorn's suggestion on irc, broke down the patchset into 4
  separate patchsets, one each for the following areas to allow easier
  review and handling from the maintainer:
	arm-msm, crypto, dma and devicetree
- Addressed Rob's, Vladimir's and Bjorn's review comments received on
  v5.
- Added Tested-by from Jordan received on the v5.

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

Qualcomm crypto engine (qce) is available on several Snapdragon SoCs.
The qce block supports hardware accelerated algorithms for encryption
and authentication. It also provides support for aes, des, 3des
encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
authentication algorithms.

Bhupesh Sharma (6):
  dt-bindings: qcom-qce: Convert bindings to yaml
  MAINTAINERS: Add qcom-qce dt-binding file to QUALCOMM CRYPTO DRIVERS section
  dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
  dt-bindings: qcom-qce: Add 'iommus' to optional properties
  dt-bindings: qcom-qce: Add new SoC compatible strings for qcom-qce
  crypto: qce: core: Add new compatibles for qce crypto driver

Neil Armstrong (1):
  dt-bindings: qcom-qce: document clocks and clock-names as optional

Thara Gopinath (2):
  crypto: qce: core: Add support to initialize interconnect path
  crypto: qce: core: Make clocks optional

 .../devicetree/bindings/crypto/qcom-qce.txt   | 25 -----
 .../devicetree/bindings/crypto/qcom-qce.yaml  | 98 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/crypto/qce/core.c                     | 34 ++++++-
 drivers/crypto/qce/core.h                     |  1 +
 5 files changed, 130 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml

-- 
2.33.0

