Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E37E6B8A7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 06:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjCNFht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 01:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjCNFhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 01:37:48 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D732942C
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:37:36 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id v21so5299247ple.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678772255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfrJI5PNfrDYglmqcN7rbiKMpj3Qw+gQrMl67mX9taM=;
        b=VxX4X7hey+FJG4ADvS5aE9f0fwMwPgFPSWdfTwavquukBfTQKtwnylcPX3ML/JPSsx
         gA3/VOauMXaCVraEPlY+z0xRSWtvBsbpa2x3M3yOJrDTc/lA/gwwe58cRSJCVv8uV0ks
         FdWjYKl7Dxkx4jpzspR6Qjilt41YzKXLWEP5lt1ijRKCjHJV7Y8ziQ8QxgLltdpdCD8e
         FLWGxVaolAslAEGhJm25IBwYKZ6BedkzOmA/9ai7oGX2OyQq6eqbd6XXFooDtrAqaFiP
         AVFrvyFikj456RQ78dPT+V/EQJFgnJ6b4L4s9zPmMBWhAByBTXeYgWb8WvK+m5pet23O
         Ubcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678772255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfrJI5PNfrDYglmqcN7rbiKMpj3Qw+gQrMl67mX9taM=;
        b=LgEVp95oWvaesEvG+4Y+wuBGOWULJXt9A/3FELM1hpjLCd4y61zp7fOe4XabnQ7mH3
         stkQQaCqiJ9L4QTDjFb3KcpJLDVKifktAAQuEhTbfHo73+A/zvCmOIN8266k1YtCsQvl
         VhSmBO95fz4ys2ktviVHhVt/Fwdvv5xQ5itS7+w3tzLD0l5RC7UuPt/TDqaTo1f7gr30
         wU7n4dDTtKE+Wb+zTQkDAhP6S7PV3G1ysbBUT+p2UXbn1DL/Fx+A4EKzt+wi8u4RzpDU
         874wNwc91jeci6KuEh61aSXf3S55j9qCguHFfhgdFgnAO05dBx2T5ZcneyANhEXd6eAh
         LdOw==
X-Gm-Message-State: AO0yUKWl5Rh9jtCkJyxGKWlsDfXjxSeKlDhck+N//QAxRnjM6fFH2k5h
        d5R82pIeeiiz4sl50I0rurxK
X-Google-Smtp-Source: AK7set+1JjhX+Cy1WW/IT5ddeigUUZXYQSGObQMxvZc1n/t/tMLtkXEUqc6iM987MH4NWGdBC3eIZg==
X-Received: by 2002:a17:90b:4d12:b0:234:b786:6867 with SMTP id mw18-20020a17090b4d1200b00234b7866867mr38773216pjb.36.1678772255200;
        Mon, 13 Mar 2023 22:37:35 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id n126-20020a634084000000b005034a46fbf7sm675093pga.28.2023.03.13.22.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 22:37:34 -0700 (PDT)
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
Subject: [PATCH v7 00/13] Qcom: LLCC/EDAC: Fix base address used for LLCC banks
Date:   Tue, 14 Mar 2023 11:07:12 +0530
Message-Id: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
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

Manivannan Sadhasivam (13):
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
 drivers/edac/qcom_edac.c                      |  14 +-
 drivers/soc/qcom/llcc-qcom.c                  |  87 +++++++-----
 include/linux/soc/qcom/llcc-qcom.h            |   6 +-
 13 files changed, 213 insertions(+), 76 deletions(-)

-- 
2.25.1

