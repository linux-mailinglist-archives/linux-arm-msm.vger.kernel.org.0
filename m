Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6479867209E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbjARPJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjARPJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:09:14 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8ABF1A49C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:09:13 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 78so24714680pgb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJRpDkAWdNVeG+3ux4pXN9X9wp3s1VOm2aF1gDmoa0E=;
        b=N5jLJ5iTNyZpiLoDMHJQRhnO+YbrZvnSwRFOp/YFXp6rJ1NpFoKZBfPC+gD65c1zmF
         786APahvfRyOO8v9N5vI1ojuskFWN+LBwLBjxSgAcT/6N1SHp5e7JQIPjHT6cH9bxNkd
         xZZnPIvQleeF/SqNdElbdeVdJCQg+fXTBh8VvojT+xMn+87m4D5fco7ydyC57hfkZ3DR
         PGxgAnIHq0JOyZS36ib0gMqtzPVy1VD7fNo5CI93dSiDtPJlZ14v1wWhbcszI2eYG+yh
         pyq/rM9YBRN7i29/O0H62NpSGoZo6rldORMwvPdkTFZ+lD3D6O7Z250Y24DxzqHv8sIG
         FDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJRpDkAWdNVeG+3ux4pXN9X9wp3s1VOm2aF1gDmoa0E=;
        b=1NT40nFJMfZqpDn4rhIKY2mskVfPYzfg4cekYHcLxFVE3pcpo2El72RcLyg9qfLK85
         ga4LY/rFyO1u+dVHNOtdiSL12CNn7yaN0Jx1mkGIH/okojsN+3PPcogR6Yg38nmx1TgD
         xn814jNpj4dnKBP55X/a4KgHTGoiShij0njZ5dYDNtXwDSFhpf1GiwevggaWIVa25rlk
         JQ1t2aX2QzolvraWElVtQ1dqbqW7gvraRkYC7HFQGanm3JmO6EvE/ygBqxX/SpZhRE66
         30pqSTi4/pNkamNmxOgZ6WkKn/Njs7ZLjf8FaS5XfAubH5ulYBX5QKCttCbTG0evEw/w
         x1VA==
X-Gm-Message-State: AFqh2kqrTSzH1rYqLPrK4DrQ0pV0RK+MOZ1qEXbuXSJgmf+lg6vjxwgk
        P5XZW94XnjeZJQugv+Q7uehb
X-Google-Smtp-Source: AMrXdXvSilF39mYwBYHz843iCklsdE2CDWk1LmcEd6ufWUM17OBhnwXxwqYBQopC/dczMRMohwX77A==
X-Received: by 2002:a05:6a00:70f:b0:581:1f4b:d1e5 with SMTP id 15-20020a056a00070f00b005811f4bd1e5mr8195246pfl.12.1674054553291;
        Wed, 18 Jan 2023 07:09:13 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.61])
        by smtp.gmail.com with ESMTPSA id i15-20020aa796ef000000b0058d9623e7f1sm6721544pfq.73.2023.01.18.07.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:09:12 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 00/17] Qcom: LLCC/EDAC: Fix base address used for LLCC banks
Date:   Wed, 18 Jan 2023 20:38:47 +0530
Message-Id: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm LLCC/EDAC drivers were using a fixed register stride for
accessing the (Control and Status Regsiters) CSRs of each LLCC bank.
This offset only works for some SoCs like SDM845 for which driver support
was initially added.
    
But the later SoCs use different register stride that vary between the
banks with holes in-between. So it is not possible to use a single register
stride for accessing the CSRs of each bank. By doing so could result in a
crash with the current drivers. So far this crash is not reported since
EDAC_QCOM driver is not enabled in ARM64 defconfig and no one tested the
driver extensively by triggering the EDAC IRQ (that's where each bank
CSRs are accessed).

For fixing this issue, let's obtain the base address of each LLCC bank from
devicetree and get rid of the fixed stride.

This series has been tested on SM8250, SM8450, SM6350, SC8280XP, SA8540P,
and SDM845.

Merging strategy
----------------

All patches should be merged to qcom tree due to LLCC dependency.

Thanks,
Mani

Changes in v6:

* Incorporated comments from Borislav for the EDAC patches and collected
  review tags.

Changes in v5:

* Reduced the size of llcc0 to 0x45000 on SDM845 due to overlapping with BWMON
* Added a patch to disable creation of EDAC platform device on SDM845
* Rebase on top of v6.2-rc1
* Moved the EDAC specific patches to the start so that they can be applied
  independently of LLCC patches

Changes in v4:

* Added a patch that fixes the use-after-free bug in qcom_edac driver

Changes in v3:

* Brought back reg-names property for compatibility (Krzysztof)
* Removed Fixes tag and stable list as backporting the drivers/binding/dts
  patches alone would break (Krzysztof)
* Fixed the uninitialized variable issue (Kbot)
* Added a patch to make use of driver supplied polling interval (Luca)
* Added a patch for module autoloading (Andrew)
* Didn't collect Review tags from Sai as the dts patches were changed.

Changes in v2:

* Removed reg-names property and used index of reg property to parse LLCC
  bank base address (Bjorn)
* Collected Ack from Sai for binding
* Added a new patch for polling mode (Luca)
* Renamed subject of patches targeting SC7180 and SM6350

Manivannan Sadhasivam (17):
  EDAC/device: Respect any driver-supplied workqueue polling value
  EDAC/qcom: Add platform_device_id table for module autoloading
  EDAC/qcom: Do not pass llcc_driv_data as edac_device_ctl_info's
    pvt_info
  dt-bindings: arm: msm: Update the maintainers for LLCC
  dt-bindings: arm: msm: Fix register regions used for LLCC banks
  arm64: dts: qcom: sdm845: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sc7180: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sc7280: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8250: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8350: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm8450: Fix the base addresses of LLCC banks
  arm64: dts: qcom: sm6350: Fix the base addresses of LLCC banks
  qcom: llcc/edac: Fix the base address used for accessing LLCC banks
  qcom: llcc/edac: Support polling mode for ECC handling
  soc: qcom: llcc: Do not create EDAC platform device on SDM845

 .../bindings/arm/msm/qcom,llcc.yaml           | 128 ++++++++++++++++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |   5 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  10 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   7 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   7 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   7 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   7 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   7 +-
 drivers/edac/edac_device.c                    |  15 +-
 drivers/edac/qcom_edac.c                      |  76 ++++++-----
 drivers/soc/qcom/llcc-qcom.c                  |  80 ++++++-----
 include/linux/soc/qcom/llcc-qcom.h            |   6 +-
 14 files changed, 253 insertions(+), 106 deletions(-)

-- 
2.25.1

