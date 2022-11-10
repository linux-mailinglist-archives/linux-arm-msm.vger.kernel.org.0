Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A404624A89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiKJTWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiKJTWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:22:52 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFA348760
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:51 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u2so2071608ljl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrNpg77ahRGEeTxAe9TFC45qA5bJL7st8wtKiHZ8uas=;
        b=rtxETIm4InRDMRkVYJbmbeZX6R/9E239duFoSda+BPk4jYypOBm+KJ7L/FLNY2qoBO
         S+4sUKCBd3qQkOCfIqV5GM7nyiBL+ySATYawA0LX9z/ycXnL0W5GQk4MJglsqbzcU3gq
         +z0SXLf4OUx1Vo9MJ8C3SN/X7GopAiSYDLIMXkAO2e9cRnxOG4LBtMlnwUNHUoRj4SW/
         nc2TshyuTKeyeCkU7DHNdoaEVe9rV3jZ2x2fJCMDNVWfHBJJ+8Br/sp7/UNzO2U2nvwz
         b/faZVw4yxGLpj2FArshJz4Lzmzf+08enJ1WOYZYUA/xelO6g2Q1PfGoEP2b+PaqbEwK
         chJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrNpg77ahRGEeTxAe9TFC45qA5bJL7st8wtKiHZ8uas=;
        b=Il2NBpOVXC7K3YytGdGKT3WSHuFm+v6GnQgf0n23ChNJYbg1syBrAJLSJ8b2HYgw0K
         n28XCD80qOeQMSYAhh0CyD+mtSkZh4hbE2ohQiDKKymcy7SYWnMjtCsOVoiKLGFfmeb1
         1HZQwgVB/k55lffsqIEsPtbMY0j4ZhwqrcAhYJs9v89QJmb3y7xq7Ur824eY1PmntbV6
         uctkfeETLVirBJjkgjiYwboiBjNn0uo9KDanVsVD5C1Wsms8CFxRNrQxYaVTGCZR9XLa
         8LBYV49KzQuE6fFQYkGnE75F0QrNMTYq+Dt0pk7BsXm9QHHy7VTEC7l9XTnnVhY++Anl
         8z4g==
X-Gm-Message-State: ACrzQf2cNjIm78YCMY9fduk6bQdXmC+ACdqLWL5KXdiO25K7sljurjjk
        Uyol9NjoSn/DvWwLEuoyjMhFPw==
X-Google-Smtp-Source: AMsMyM6ymy+U6hwgMTw5b9I7p/kKDSr2005t0hmOwsiHcwtLZDTzvGVa1akOwmCgD0g8kHq+9DPQNw==
X-Received: by 2002:a2e:bf0b:0:b0:277:63f7:492c with SMTP id c11-20020a2ebf0b000000b0027763f7492cmr9079122ljr.259.1668108169386;
        Thu, 10 Nov 2022 11:22:49 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027758f0619fsm40345ljh.132.2022.11.10.11.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:22:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 00/13] phy: qcom-qmp: rework register layout tables
Date:   Thu, 10 Nov 2022 22:22:35 +0300
Message-Id: <20221110192248.873973-1-dmitry.baryshkov@linaro.org>
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
- phy/next
- https://lore.kernel.org/linux-phy/20221110103345.729018-1-dmitry.baryshkov@linaro.org/
- https://lore.kernel.org/linux-phy/20221110151748.795767-1-dmitry.baryshkov@linaro.org

Changes since v2:
 - Rebased onto phy/next
 - Added two generic fixes
 - Dropped combo changes, they will be sent after Johan's pending
   series
 - Fixed names of the ufs regs layout tables

Changes since v1:
 - Rebased on top v2 of Johan's patchset rather than including a set of
   patches from him
 - Fixed the ipq8074 regs layout name

Dmitry Baryshkov (13):
  phy: qcom-qmp: fix typo in QSERDES_COM_CMN_RSVD5 value
  phy: qcom-qmp: remove duplicate v5_5nm register definitions
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
  phy: qcom-qmp-usb: fix regs layout arrays
  phy: qcom-qmp: move type-specific headers to particular driver

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  3 +
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |  6 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 82 ++++++++++---------
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h    | 25 ++++++
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h    |  3 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    |  4 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    | 19 ++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h    |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   |  2 +-
 .../phy-qcom-qmp-qserdes-txrx-v5_5nm.h        |  5 --
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 67 ++++++++-------
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 76 ++++++++---------
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 14 +---
 13 files changed, 168 insertions(+), 142 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v2.h

-- 
2.35.1

