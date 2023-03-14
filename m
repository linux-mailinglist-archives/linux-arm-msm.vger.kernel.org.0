Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65B606B8C6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 09:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjCNIE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 04:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjCNIE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 04:04:56 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843592CC56
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:04:54 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so14317728pjp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678781094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dmMEtF/DxNbbIt8KW7LJ7bN8W8tf7JP8ul4am/r9wI=;
        b=sMKypdnmpfEpVa6EOVgCAoGmxc1dhoE2MDp7v/W4wE6Kwot8hsP2iyZWxN5N5Modxc
         L8/O8zRySgQcdw9fHj60FnAkspW3e43a/WXyT3N78tgRbjh53HooSIRWHYqnYEocdEjQ
         vM/jLK0uaoMS1SyT7oOEAQFxcNEfnZvBpAJidvjmZFgq7Gf9lkExpojq1SOiUtA72mAy
         NRC+BzpGwEA/pSifNtM2LbdjAlVxPynYuiK+D5p7ROdtfDtHJqO/3Gxe9/SrRUlG1in9
         sMg1tgjCUvjplyE4WFhax5CroYodSuiWxchHx00KmFPvtSJ6tpdNRkJKqQNci9iobzJp
         zBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678781094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dmMEtF/DxNbbIt8KW7LJ7bN8W8tf7JP8ul4am/r9wI=;
        b=NWxSJUlDwgHXtDIIFPbMXUF/sSP1MhpIdLXR9MItL8GJkF3C0UtZOwZ+rpBRy7eU+Z
         ANoOLH4IZvdOg1IaZb4ggKFUs4HfLDniWTtZRar8kGqOjXqHChtk+nJaPwcoZG7b4U+t
         8hKjVplkHoMANCczXITA/xK/ZCIIQXQa3W+m3/cPnNg0PufdO4LcPgTKlSpWeKAfdlj3
         Ge2ZQxdCN6kMHPmqDEZPpy9zi3iI5QsrmnqN3ikvfF2YSCBD+Fr/P5tLyPJnkTllOy2z
         Gq58h7RuKD6KgWCtdQvDPLsMHYMvd9WECjSnyzXaaMsJUy4MUUHar98bXOoflFSFEa7t
         BNXw==
X-Gm-Message-State: AO0yUKWbFo/xgGdUIzWkAwwfG1ezJnwW7Mh5Rqb7TEb0M390m85qd7Bq
        rShU1ykJTs5eWCIdODIEp1/s
X-Google-Smtp-Source: AK7set++2Fch8021JfdflP53d5kef2+8kllhyolL1sbO0pRQBiyx5mfybXDkUWm/6usJy7tcivL5vw==
X-Received: by 2002:a17:903:41c4:b0:19c:c184:d208 with SMTP id u4-20020a17090341c400b0019cc184d208mr44096134ple.66.1678781093920;
        Tue, 14 Mar 2023 01:04:53 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id l8-20020a170902f68800b001994a0f3380sm1078022plg.265.2023.03.14.01.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:04:52 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 00/14] Qcom: LLCC/EDAC: Fix base address used for LLCC banks
Date:   Tue, 14 Mar 2023 13:34:29 +0530
Message-Id: <20230314080443.64635-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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

Changes in v8:

* Added the ECC polling support patch that was missed in v7

Changes in v7:

* Rebased on top of v6.3-rc1
* Dropped the patches applied for v6.3
* Dropped Sai from the binding maintainers list since he left Qcom

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

Manivannan Sadhasivam (14):
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
 drivers/edac/qcom_edac.c                      |  64 +++++----
 drivers/soc/qcom/llcc-qcom.c                  |  87 +++++++-----
 include/linux/soc/qcom/llcc-qcom.h            |   6 +-
 13 files changed, 242 insertions(+), 97 deletions(-)

-- 
2.25.1

