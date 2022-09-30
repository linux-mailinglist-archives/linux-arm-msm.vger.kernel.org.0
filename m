Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02C495F0AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbiI3LiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbiI3Lhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:37:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8F6156FAF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 10so6431127lfy.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=vIDkgRqfhjUmomvSduq4fmHrKuO3RUgAcTc+dtt+CUk=;
        b=ydif9lIzqY90u1FKGEvclXnG0M4jrWUiGoWw66bONL4ZH83s/hZ7iVtd0w6zHJOFKk
         nXaN29Ezvl/5v0w2vOATyDYepokt282vfrrkXYXeviuMeAVMXaPTjpndLAbmCIRwXym9
         L29GCMOaz6utHHIwV3ePujlPA9c1YGcNPB/ZbC4NxebyzpkNdfRUM1+vWe0vdNWHO5Xn
         YwIul7tso9uu5h9xt711G/ZRrfrXq+iBe60yW4g8vk18mwMlrLoLN1dz54bw+zH/kxFO
         upSOZZzdYTFeCwNtJfcgSLzVx5qoWcNSctSYSRTSd9kJmKh7g0QywbnjYzZlD1sspeqD
         rceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=vIDkgRqfhjUmomvSduq4fmHrKuO3RUgAcTc+dtt+CUk=;
        b=2Ud6fh8tXNPjtHTZYEcA6eTOKsnw+9szcMG+zlzxoK43VV549i4D/uNQqc5QYzzpbh
         /gScG5KUwevJkZI1wbeBsuN3cEIuJTPn0VUd2o6owbf79i9/hCOvv1KvrgIPm04DjYWV
         ecZSfQNfqwxUvrGOxGS3DhMu+apIVD30AvONHl9HS9+o30/bYFjLs/4HXHASKXXeHQtu
         Uc3VP+i2ij/6WQAOTT3ITdPM9CjeElGArzPrD8nCwVjX+Soo8oA/Zs+uqFIFy550g6fm
         jS7Pfo19F3077ux4pwKPXzyBFyky2Yt13OoJsZPmEE9A1R1JchPbdRyKReEFyssNwNpc
         HPCA==
X-Gm-Message-State: ACrzQf1ShcEpOBYpRsIYewGHRXvzPJgAevF+PtG91yjEEUC5DYQtavmq
        y79ZS8i/mhUAMfDAF9wGztTjsQ==
X-Google-Smtp-Source: AMsMyM5GHJYmHYi+WA7TC3udjalv2izE9wNvILZWrIGaM3yMYD4vj3nkc2fzDBxu5P/WNZxBwYkcbg==
X-Received: by 2002:a19:f515:0:b0:49e:da3d:1710 with SMTP id j21-20020a19f515000000b0049eda3d1710mr3120877lfb.600.1664537367841;
        Fri, 30 Sep 2022 04:29:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 00/12] phy: qcom-qmp: rework register layout tables
Date:   Fri, 30 Sep 2022 14:29:14 +0300
Message-Id: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Rework register layout tables in QMP PHY drivers to use defined symbolic
names rather than bare numbers. Also rename each register layout array
to name the exact QMP version. While doing this, drop few unused
registers and apply other misc cleanups.

Dependencies:
 - https://lore.kernel.org/linux-arm-msm/20220929092916.23068-1-johan+linaro@kernel.org/
 - https://lore.kernel.org/linux-arm-msm/20220929190017.529207-1-dmitry.baryshkov@linaro.org/

Changes since v1:
 - Rebased on top v2 of Johan's patchset rather than including a set of
   patches from him
 - Fixed the ipq8074 regs layout name

Dmitry Baryshkov (12):
  phy: qcom-qmp-pcie: rework regs layout arrays
  phy: qcom-qmp-pcie: rename regs layout arrays
  phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
  phy: qcom-qmp-ufs: split UFS-specific v2 PCS registers to a separate
    header
  phy: qcom-qmp-ufs: rework regs layout arrays
  phy: qcom-qmp-ufs: rename regs layout arrays
  phy: qcom-qmp-usb: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
  phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
  phy: qcom-qmp-usb: rework regs layout arrays
  phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
  phy: qcom-qmp-combo: rework regs layout arrays
  phy: qcom-qmp: move type-specific headers to particular driver

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 32 +++++----
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  6 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 65 +++++++++----------
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h    | 25 +++++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h    |  3 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    |  4 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    | 19 +++---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 65 ++++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 64 +++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 13 ----
 10 files changed, 154 insertions(+), 142 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h


base-commit: 9aa0dade8f6b4cdcbb114e1a06037939ee3238bc
prerequisite-patch-id: a215a53b87b45ab7b9d05f5f16c7b482ae028718
prerequisite-patch-id: 010c26cf77c7f56fedaaa66a1f8fadc9939aae71
prerequisite-patch-id: 2e8310286716f8b3bcf331853d3c5a1797c032cb
prerequisite-patch-id: d775ed1ac260031e17fd271ab2cb34313a8b6c53
prerequisite-patch-id: 930f311572ae61bd84705076758e33034e04ea92
prerequisite-patch-id: aca076a9c695e1467647de0b4b84d952bed6c16d
prerequisite-patch-id: 73e929b730cac661568299f48d82306d8261ebcf
prerequisite-patch-id: 24317186315a38af3d28e4982885d845863c6e37
prerequisite-patch-id: c21d2af14dbafd48588286d2fb13ea9d53073798
prerequisite-patch-id: 5d4e6d0b71cf42a8119ef7ea89927fde78272dae
prerequisite-patch-id: 3b233d85169099f8d1de48cebee66123d100ec85
prerequisite-patch-id: 7439ce7f28477d7e47b66425fad86ecfd0854c7a
-- 
2.35.1

