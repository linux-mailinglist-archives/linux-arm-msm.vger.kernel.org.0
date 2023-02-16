Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C92D69955A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjBPNOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjBPNOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:37 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A5DE3A0BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:35 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id g14so1869796ljh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676553274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClQapo/dsN1bF/deV1V/AAHhScmS3/R8gpne//aTEGA=;
        b=uu4LyzPd+7hKEhelINHQW226V+ztAgsgZ1/HqnE4SPa+YgiWHHAWdeLIELEP3gRGA/
         MtJcRA1UKdgnyXnjzWQrXUmJvUa+9bcUv1YF562eyC+BJO1ZH2LwXRRqinnfnkJyMuxm
         7fUT09mhfu5PwePYUHoxiR+PWETK076VIiebOTXf5CAkOrLWiRnF9s3WVA0wnqewMbhy
         SmZ3S9UWrFMSwbnHRpP5EWSogmySMKRKhPwKYx3O5vN/ZIaHurgMnkkzrvDl5NH4H+gI
         fMO2zBdZxAKVvIFH/N0F6lOXl92Kaj2lGZUraQC8A2j2e3z5N0YAtyG/00S1ybT/60eF
         Ty4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676553274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClQapo/dsN1bF/deV1V/AAHhScmS3/R8gpne//aTEGA=;
        b=R+d1EUan8Z2mkIYlamQv2f2Fl15N3zfVKuK1/o5CNPRCsqexDbuxedNfbDvT4kTiPq
         aGYqn0NaiZv3BbfeTBfIdPMU0+lHxtK531Sl+xBWMP19ViVWMZb+tkDLrZszXMyRki8N
         397NJu1CGP/a4SFhYAlxVJPc47hOVW0tZzHalmeWqIBEF4ZCn7+ZHbhSWWTpaRMUpPG6
         ZpHbQWC3AzxWm/PyfNHeqlokxT9jg0AuCubhl6/M6+mXvN7V5Lu0kH1WTRRwh8Jcxc0k
         wQUnIuH00fcObS5kDgQxJL7NVGg3VInf0HOLdMf3X8DFWUKx4dt/BrUvOof1oCfZPPrs
         omDA==
X-Gm-Message-State: AO0yUKWDUp1XVTegxkOKd5F6eT73UQpv8sHmEYFtmOY0Zxeh7TUjWnWE
        krnQ2vBk4PRFCtfG5G5VQdZfzg==
X-Google-Smtp-Source: AK7set9PWWyY56php9hQhrjlAHyOZfJTa0rnVSlKfilEdzvvsKMOAh1YwkKP8vX391mjdhyoVDnqIA==
X-Received: by 2002:a2e:9913:0:b0:293:4eac:734a with SMTP id v19-20020a2e9913000000b002934eac734amr1593248lji.0.1676553273715;
        Thu, 16 Feb 2023 05:14:33 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:33 -0800 (PST)
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
Subject: [PATCH v10 00/10] crypto: qcom-qce: Add YAML bindings and support for newer SoCs
Date:   Thu, 16 Feb 2023 15:14:20 +0200
Message-Id: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
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

The series contains Qualcomm Crypto Engine DT bindings documentation and
driver changes, which modify a set of accepted compatible property values,
which is needed to provide a unified and fine-grained support of the driver
on old and new platforms. In addition due to QCE IP changes on new Qualcomm
platforms, it is reflected in updates to valid device tree properties,
namely added iommu, interconnects and optional clocks.

Qualcomm crypto engine (QCE) is available on several Snapdragon SoCs.
The QCE block supports hardware accelerated algorithms for encryption
and authentication. It also provides support for aes, des, 3des
encryption algorithms and sha1, sha256, hmac(sha1), hmac(sha256)
authentication algorithms.

Changes since v9:
=================
- v9 can be found here: https://lore.kernel.org/linux-crypto/20230208183755.2907771-1-vladimir.zapolskiy@linaro.org/
- Added a new generic 'qcom,qce' compatible name, since IP is runtime
  discoverable, however two new SoC name based compatibles are left
  due to necessity to differentiate various lists of required properties.
- Updated documentation according to review comments by Krzysztof.
- Removed platform specific changes in dtsi files, only one bisectable
  change in sm8550.dtsi is left in the series.
- Added some commit tags, however a few given tags by Krzysztof are not
  added, since the previous tagged changes were noticeably reworked.

Changes since v8:
=================
- v8 can be found here: https://lore.kernel.org/all/20230202135036.2635376-1-vladimir.zapolskiy@linaro.org/
- Rebased the series on top of linux-next, sm8550 qce support is already
  found in the tree.
- Reduced the list of QCE IP compatibles in the driver, added one more
  compatible for backward DTB ABI compatibility.
- Replaced a documentation change from Neil Armstrong by a more advanced
  version of it per review comments from Krzysztof Kozlowski about clock
  and clock-names properties.
- Added changes to all relevant Qualcomm platform dtsi files according to
  the changes in the scheme file.
- Added QCE support on SM8250 platform.

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
- Addressed Rob's, Vladimir's and Bjorn's review comments received on v5.
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

Bhupesh Sharma (4):
  dt-bindings: qcom-qce: Convert bindings to yaml
  MAINTAINERS: Add qcom-qce dt-binding file to QUALCOMM CRYPTO DRIVERS section
  dt-bindings: qcom-qce: Add 'interconnects' and 'interconnect-names'
  dt-bindings: qcom-qce: Add 'iommus' to optional properties

Thara Gopinath (2):
  crypto: qce: core: Add support to initialize interconnect path
  crypto: qce: core: Make clocks optional

Vladimir Zapolskiy (4):
  dt-bindings: qcom-qce: Add new SoC compatible strings for Qualcomm QCE IP
  dt-bindings: qcom-qce: document optional clocks and clock-names properties
  arm64: dts: qcom: sm8550: add QCE IP family compatible values
  crypto: qce: core: Add a QCE IP family compatible 'qcom,qce'

 .../devicetree/bindings/crypto/qcom-qce.txt   |  25 ----
 .../devicetree/bindings/crypto/qcom-qce.yaml  | 123 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |   2 +-
 drivers/crypto/qce/core.c                     |  23 +++-
 drivers/crypto/qce/core.h                     |   1 +
 6 files changed, 145 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
 create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml

-- 
2.33.0

