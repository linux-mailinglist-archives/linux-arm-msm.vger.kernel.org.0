Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CED613CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiJaSCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiJaSCj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:02:39 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191B313D71
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:02:37 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id p21so7567156plr.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUeGzsrZuppVjIQtllMBu80KGrOeXpmn2SHkGIO0dZI=;
        b=PfJeKC0nW0q3FOQ1HV8xzNPscrseO9wqTqzlujbVfJPQuw7OoUcyI8/HA/e6PYuwT9
         3NterFjq9Q098c76cYnNqbeUtlN+WMHXuh7lACe917zc5WAf39BIAwfLrMwS2/aQsYZD
         B/OV3MzAXaa5x35p7F+o9zFuK0yDd5yBkAWrVkResNl6h/sBsLhwxS3rkKfV9dj8UdIC
         DW3vG619Oo5+c4yO875QCVLCP4aDNBfHKzCERADUuVj7MvxDl+0UGwOODaIF28SjJfdf
         1X9F3SBkWggTSH/xUQYCndFrMatu+5Rcoxkbt8VfJQLekIMJ/7qVYlfL7fC53l2wotZ3
         LDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUeGzsrZuppVjIQtllMBu80KGrOeXpmn2SHkGIO0dZI=;
        b=J44nRAPqbUnF9IG3EX4rwXFJt+AEYYF7GQG0CRHGir+c2j7jzlBw28mOHchgziznXI
         SxaOaiZcKgAfZQjFNYL3FUyiIrHd6sl4Zq7bgb/XYRmi0OWtxz1w8S7Wuw6R6+OLzTud
         c7eM3Xtmzv5NuApko4xnrW3OAf+rfNlbG1dJT7xLO/haIvuLG9TKNIDIYlGjo8iFHjd9
         mklEL1CtknHhzrsfX1R+T7JQzRIzWM74rsOTBp0rgY1iXslssIQjlwpYsitUgzaXtBaF
         UWoRLZFLZAI0Y+yCOFlhlLPmpQy4gmoxJMaCFV2heiFptYP0YNb6z0zC92bg5nVmoiRa
         zKFg==
X-Gm-Message-State: ACrzQf16USx9j3hrS/jefsEGdGAaCKZ6bepb52ZV3mTbBOp0/Vv/f37N
        PoHxK6XgTp4Z6MbzQg7iDvVd
X-Google-Smtp-Source: AMsMyM6KutCiKgVhfqnh64n0pNMgZINaIjYKukeENSzy9/oeepbkEm7QVIBjPIPLzso18X716IcE3g==
X-Received: by 2002:a17:90b:153:b0:213:b853:5db1 with SMTP id em19-20020a17090b015300b00213b8535db1mr13077729pjb.168.1667239356552;
        Mon, 31 Oct 2022 11:02:36 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.221])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b00186c6d2e7e3sm4742224plb.26.2022.10.31.11.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:02:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/15] ufs: qcom: Add HS-G4 support
Date:   Mon, 31 Oct 2022 23:32:02 +0530
Message-Id: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
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

Hello,

This series adds HS-G4 support to the Qcom UFS driver and PHY driver.
The newer Qcom platforms support configuring the UFS controller and PHY
in dual gears (i.e., controller/PHY can be configured to run in two gear
speeds). This is accomplished by adding two different PHY init sequences
to the PHY driver and the UFS driver requesting the one that's required
based on the platform configuration.

But this requires both the UFS controller and UFS device to agree to a
common gear. For finding the max supported gear, a separate register is
used for the UFS controller and devicetree is used for the UFS device.
Based on the max gear of both, the UFS driver will decide which gear to
use during runtime.

This series has been tested on Qcom RB5 development platform powered by
SM8250 SoC that uses HS-G4.

Merging Strategy:
-----------------

The PHY patches are expected to go through PHY tree and UFS, MAINTAINERS
patches are expected to go through SCSI tree. Finally, the binding and
devicetree patches can go through ARM MSM tree. There is no build dependency
between the patches.

Thanks,
Mani

Changes in v2:

* Collected reviews from Dmitry
* Renamed "max-gear" property to "max-device-gear"
* Used min() for deciding which gear to use instead of open comparision
* Added comment about the old register name

Manivannan Sadhasivam (15):
  phy: qcom-qmp-ufs: Move register settings to qmp_phy_cfg_tables struct
  phy: qcom-qmp-ufs: Add support for configuring PHY in HS Series B mode
  phy: qcom-qmp-ufs: Add support for configuring PHY in HS G4 mode
  phy: qcom-qmp-ufs: Add HS G4 mode support to SM8250 SoC
  phy: qcom-qmp-ufs: Move HS Rate B register setting to tables_hs_b
  dt-bindings: ufs: Add "max-device-gear" property for UFS device
  arm64: dts: qcom: qrb5165-rb5: Add max-device-gear property to UFS
    node
  scsi: ufs: ufs-qcom: Remove un-necessary goto statements
  scsi: ufs: ufs-qcom: Remove un-necessary WARN_ON()
  scsi: ufs: ufs-qcom: Use bitfields where appropriate
  scsi: ufs: ufs-qcom: Use dev_err_probe() for printing probe error
  scsi: ufs: ufs-qcom: Fix the Qcom register name for offset 0xD0
  scsi: ufs: ufs-qcom: Factor out the logic finding the HS Gear
  scsi: ufs: ufs-qcom: Add support for finding HS gear on new UFS
    versions
  MAINTAINERS: Add myself as the maintainer for Qcom UFS driver

 .../devicetree/bindings/ufs/ufs-common.yaml   |   5 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 350 +++++++++++++-----
 drivers/ufs/host/ufs-qcom.c                   | 175 +++++----
 drivers/ufs/host/ufs-qcom.h                   |  68 ++--
 6 files changed, 390 insertions(+), 217 deletions(-)

-- 
2.25.1

