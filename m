Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921945EE9EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233911AbiI1XK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234109AbiI1XKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A11D183B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id b6so15901112ljr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=X0NOTACpx4gos0GrFhmPRT3Qd6/8r9KDHNKmLpoawNI=;
        b=MjRLCW7tChVww6tVVgFX0+WtYQQ6sFktR301e9qC0Y8cidh0tiz1Z83s/WlaN8ENaI
         loajrs3a4bMd1crzI/D+QDh+aHqqEDtCaENBWSj7CIqHQvcxzNDBo1IbRNQunTTbmAUJ
         XqGUJN1pKCU+P2lsNnHitOJa9YiUbKZzLpPHqsMpVOxBZSsoNaJ9OfImdsGhlCQ2lpXL
         kfg+UMm4r6mngia4mDVtuSSLyLfZEVggpujKoRUFkU7vWKuhydktNOBnWCkJb4GO8zDv
         FSqWEaed2mSbMZsc/sE7uya/SL7RChaIrYK40LZ9sbrXQbFNphGVeZn9gpb8CNjec0GJ
         Of8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=X0NOTACpx4gos0GrFhmPRT3Qd6/8r9KDHNKmLpoawNI=;
        b=HBIMt3JJN+5SYMXxCbD3KtNbq7P/1jxu3y3nC+C1vJQN+AIeWuiWyi65RGO83COu/p
         MCVl1JT2UG2nIvNXkJ/8YNQ6NpiTmwOHFjbg0kt/k91bBRxxdASKx7uGXD39UVJW5B+E
         i56aV4EXQZmjJDQw5z6K70OOEdT60+L8iDaEvW3LvND67hrHt9eUW6gygfgicXtHjAiy
         sl45sie4WO1eGHZXEVD7bqbcN5hN90aj31dt+BoA769rGq5KtYtMALzTNn2uilLqXHDS
         O9uFQc8kxXOYCGp2qGvyyeI2mfT84UBjc5IRisfButWbEZQtW0xidIejZdL2l3EjT+/e
         d+5A==
X-Gm-Message-State: ACrzQf2v0cN7w7KKvs0YoPC4XYFOBDhYl6A75G0PZvkChfuJo5QwLs59
        kaJg72NSGlKqf6/bFdI2tzrz58d1lFkpuw==
X-Google-Smtp-Source: AMsMyM71QRt0u6mDSPzAgz2TW30gsYkTZ0fY0orNieeH8IsaaSTzSqLVrz+O7q8aZMiNt79xEhEuqA==
X-Received: by 2002:a05:651c:2108:b0:26c:6102:5d3b with SMTP id a8-20020a05651c210800b0026c61025d3bmr66272ljq.168.1664406616263;
        Wed, 28 Sep 2022 16:10:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 00/18] phy: qcom-qmp: rework register layout tables
Date:   Thu, 29 Sep 2022 02:09:56 +0300
Message-Id: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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

This is an alternative implementation of the QMP PHY driver cleanup
proposed by Johan at [1]. This patchset changes register layout tables
to use symbolic names instead of bare values and attempts to tie the reg
layout with the version of the QMP PHY.

[1] https://lore.kernel.org/linux-phy/20220928152822.30687-1-johan+linaro@kernel.org

Dmitry Baryshkov (12):
  phy: qcom-qmp-pcie: rework regs layout arrays
  phy: qcom-qmp-pcie: rename regs layout arrays
  phy: qcom-qmp-ufs: split UFS-specific v2 PCS registers to a separate
    header
  phy: qcom-qmp-ufs: rework regs layout arrays
  phy: qcom-qmp-ufs: rename regs layout arrays
  phy: qcom-qmp-usb: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
  phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
  phy: qcom-qmp-usb: rework regs layout arrays
  phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
  phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
  phy: qcom-qmp-usb: rework regs layout arrays
  phy: qcom-qmp: move type-specific headers to particular driver

Johan Hovold (6):
  phy: qcom-qmp-pcie: drop unused common-block registers
  phy: qcom-qmp-pcie: clean up power-down handling
  phy: qcom-qmp-pcie-msm8996: clean up power-down handling
  phy: qcom-qmp-combo: clean up power-down handling
  phy: qcom-qmp-ufs: clean up power-down handling
  phy: qcom-qmp-usb: clean up power-down handling

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 49 ++++------
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 16 +---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 91 ++++++++-----------
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h    | 25 +++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h    |  3 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    |  4 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    | 19 ++--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 81 ++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 82 +++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 13 ---
 10 files changed, 175 insertions(+), 208 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h

-- 
2.35.1

