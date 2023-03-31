Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A13B6D25F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 18:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbjCaQpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 12:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCaQpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 12:45:03 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2F910C6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:43:44 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id r7-20020a17090b050700b002404be7920aso21982161pjz.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680281014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLr+iiNqb1ZBQGvqnlVWR+X2NxcFaq++wph0hIOBr8U=;
        b=P1oF/yAS5meoHqrtMYIHxYP1rDgoZl+Eugm/jMw89X0wiAkGSvLbeD0CBLTcrLeJ8+
         SnNUdf4/ANcLWjz7365AhnL+WfxC9gFEwDlPonnzDV3kOqktlOQ/FcHseLwWeUSwf8/8
         329KK18UiqFsHQLAW1ZL4UM3axAk9H1FvCYxnCjcKer8x3uwlSnPaDceSa7V++bT06ta
         tZ78t6jdVRDZeCHQ+TQqfzQcR8rvQ2PqrEIg9844gUbjO1h5ff2RAOLSsi8gnlitoj71
         m/dF6dN2jijI52R/GY8lH6IuyuXIYAcVSMJQbTpUeyr6kSCpsVPFtB+KS6NCVaoBX0cu
         4LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680281014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLr+iiNqb1ZBQGvqnlVWR+X2NxcFaq++wph0hIOBr8U=;
        b=Hf5OERiP9anaLpj6nyQa4FI/E5T5AWMFJb7drtzRezLv8XicDwAsTKx/PipaknmSHs
         BgA6Ojr+fzctXJ6YrObjQ+mLLW7BkWHqwH6l7HCsgdmsiSrdLs/dMXkeXJ9MWUO26bFf
         muzlgIb6fP/jzSv4SGKIkdbkZzpGySHZo01vCQez/SQdVtwDR4f9nafRnYObzBBv8GWD
         zhKa5Bo2tnMivkz+1TLy9SrT6WMnrLlGPrQTxkW22cs2W120R9dtGQn15s66lACWg5Eq
         mBHJojALKCleWI+M437iCt1bbzMyJCb5VsOjqDJJtcFXV1oxBYRwsKOSLf4aT+KMLmAd
         danw==
X-Gm-Message-State: AAQBX9dfDza0/KB96aiYNHk2JVqc7n41abBDnG9ntVgaaT3IAGJgy1eC
        cdUlEJOd4yotKNjSiXwFXcNPEb3T911DdqR0T3Q=
X-Google-Smtp-Source: AKy350ajd8QCmQ2AlNsN3xm7jpE7Mh5DmDG/CisUsSsJLZumDbwxPugMr400ybSBcJQQ53A+iOSWqg==
X-Received: by 2002:a17:902:ecc2:b0:19c:da68:337a with SMTP id a2-20020a170902ecc200b0019cda68337amr35223895plh.31.1680281014407;
        Fri, 31 Mar 2023 09:43:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:53ce:1f39:30a5:d20f:f205])
        by smtp.gmail.com with ESMTPSA id x13-20020a170902b40d00b0019b089bc8d7sm1798767plr.78.2023.03.31.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:43:34 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v4 00/11] arm64: qcom: Enable Crypto Engine for a few Qualcomm SoCs
Date:   Fri, 31 Mar 2023 22:13:12 +0530
Message-Id: <20230331164323.729093-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
-----------------
- v3 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230328092815.292665-1-bhupesh.sharma@linaro.org/
- Collected Acks from Krzysztof for a couple of patches sent in v3.
- Fixed review comments from Krzysztof regarding DMA binding document
  and also added a couple of new patches which are required to fix the
  'dtbs_check' errors highlighted after this fix.

Changes since v2:
-----------------
- v2 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230322114519.3412469-1-bhupesh.sharma@linaro.org/
- No functional change since v2. As the sdm845 patch from v1 was accepted in linux-next,
  dropped it from this version.

Changes since v1:
-----------------
- v1 can be viewed here: https://lore.kernel.org/linux-arm-msm/20230321190118.3327360-1-bhupesh.sharma@linaro.org/
- Folded the BAM DMA dt-binding change.
  (sent earlier as: https://lore.kernel.org/linux-arm-msm/20230321184811.3325725-1-bhupesh.sharma@linaro.org/)
- Folded the QCE dt-binding change.
  (sent earlier as: https://lore.kernel.org/linux-arm-msm/20230320073816.3012198-1-bhupesh.sharma@linaro.org/)
- Folded Neil's SM8450 dts patch in this series.
- Addressed review comments from Rob, Stephan and Konrad.
- Collected Konrad's R-B for [PATCH 5/9].

This patchset enables Crypto Engine support for Qualcomm SoCs like
SM6115, SM8150, SM8250, SM8350 and SM8450.

Note that:
- SM8250 crypto engine patch utilizes the work already done by myself and
  Vladimir.
- SM8350 crypto engine patch utilizes the work already done by Robert.
- SM8450 crypto engine patch utilizes the work already done by Neil.

Also this patchset is rebased on linux-next/master.

Bhupesh Sharma (10):
  dt-bindings: dma: Add support for SM6115 and QCM2290 SoCs
  dt-bindings: dma: Increase iommu maxItems for BAM DMA
  arm64: dts: qcom: sdm8550: Fix the BAM DMA engine compatible string
  arm64: dts: qcom: sdm845: Fix the slimbam DMA engine compatible string
  dt-bindings: qcom-qce: Fix compatible combinations for SM8150 and
    IPQ4019 SoCs
  dt-bindings: qcom-qce: Add compatibles for SM6115 and QCM2290
  arm64: dts: qcom: sm6115: Add Crypto Engine support
  arm64: dts: qcom: sm8150: Add Crypto Engine support
  arm64: dts: qcom: sm8250: Add Crypto Engine support
  arm64: dts: qcom: sm8350: Add Crypto Engine support

Neil Armstrong (1):
  arm64: dts: qcom: sm8450: add crypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml  |  8 ++++++
 .../devicetree/bindings/dma/qcom,bam-dma.yaml | 22 +++++++++------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 22 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 22 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 22 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 22 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 28 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  2 +-
 9 files changed, 140 insertions(+), 10 deletions(-)

-- 
2.38.1

