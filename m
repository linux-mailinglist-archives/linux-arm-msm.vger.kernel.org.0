Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138BE566654
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 11:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiGEJn3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 05:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiGEJn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 05:43:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D188D6C
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 02:43:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id n15so13792362ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ab413gdwtDugt/vVoNpZLN3OueUtdPSW3pOsPY0eIA=;
        b=aUrw39s7dVf37cIsqMKPx9I6HXW/P8HGStiA3MG9OJNRanVijJTRkmDPQs2yhgZHvv
         BiBoGbrGHQ80m/N4sj6hmoVLKkJn/tfMowHNQ5yTvI9RH9+Zrnm2kBxT79TIk5exMdok
         HVErmAizGVY+PCJpxKLS0ZwUrV2ZX501/Pzoy5VM093P2btiDL3jXm4E3ret4vn18ihL
         HpxiBydBzu9vgVkNYT7i2k1wRJndN6pS+xPqF6yvlXj2FKNCU1MKf/g5ViYuGFvIjDr4
         ndSR9D/9J1giUn9EHJZM285lRlwF43xOvWAebRoAFF02uj6TNjuvFRTVxe+BaGhf6PrD
         OryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ab413gdwtDugt/vVoNpZLN3OueUtdPSW3pOsPY0eIA=;
        b=vYnLu55M78c8G87AEkrgE5KIpHSvGdzta/i69Xgb8+2vTBDykklGn6EGSiLvj6sQfO
         Eo4apukrFb/ogSxEnD+l6hJNUnBd2cwjlwXadeqvZCEMBhK9vFbJqRO7T/VstUPR9RFS
         kHuiJKs/5cqFjeE+jPWoXQycYWaNgAmVeh25ZWyWFxP0ttuJzQmOYEX+XLGX37wdUzMH
         YIOiP0nHMet+MmQIfGCkGDmEQLZVlWwUiV/dbqeci5Xzqhba2O5rc/3PtczJp3sTlTVs
         35DjZA0FKpl9NcEhmn72y/YUAel6ff1J31/LJcqyKiR/a4/C6S8RVHkSzL23wATUEIgV
         kR/A==
X-Gm-Message-State: AJIora9qYQbHPrnFQxpKFwI+ppYVMlwUIFR9hH1J5EhOAsWlkl39B3oY
        EdCo1oH7Hr9g5pZhYkMll9wktg==
X-Google-Smtp-Source: AGRyM1t7whgeURk+a2fcEZ3EeONDU5tMsm89Rj4KPv/UI/jeGIA4bKTAT1ip1PACMPqrTiz5Zjey4Q==
X-Received: by 2002:a2e:8182:0:b0:25d:380e:402 with SMTP id e2-20020a2e8182000000b0025d380e0402mr814660ljg.160.1657014201878;
        Tue, 05 Jul 2022 02:43:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b00482f206b087sm491683lfs.39.2022.07.05.02.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 02:43:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 00/28] phy: qcom-qmp: split register tables
Date:   Tue,  5 Jul 2022 12:42:52 +0300
Message-Id: <20220705094320.1313312-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As discussed during sc8280xp PHY review, rework and split QMP register
tables. Create separate files for most of QMP register kinds. The only
things left are various DP registers, which will be handled separately.

Changes since RFC:
 - Rebased on top of phy/next

Dmitry Baryshkov (28):
  phy: qcom-qmp: fix the QSERDES_V5_COM_CMN_MODE register
  phy: qcom-qmp-ufs: remove spurious register write in the msm8996 table
  phy: qcom-qmp-combo,usb: add support for separate PCS_USB region
  phy: qcom-qmp-pcie: split pcs_misc region for ipq6018 pcie gen3
  phy: qcom-qmp: drop special QMP V2 PCIE gen3 defines
  phy: qcom-qmp: rename QMP V2 PCS registers
  phy: qcom-qmp: use QPHY_V4_PCS for ipq6018/ipq8074 PCIe gen3
  phy: qcom-qmp: move QSERDES registers to separate header
  phy: qcom-qmp: move QSERDES V3 registers to separate headers
  phy: qcom-qmp: move QSERDES V4 registers to separate headers
  phy: qcom-qmp: move QSERDES V5 registers to separate headers
  phy: qcom-qmp: move QSERDES PLL registers to separate header
  phy: qcom-qmp: move PCS V2 registers to separate header
  phy: qcom-qmp: move PCS V3 registers to separate headers
  phy: qcom-qmp: move PCS V4 registers to separate headers
  phy: qcom-qmp: move PCS V5 registers to separate headers
  phy: qcom-qmp: move PCIE QHP registers to separate header
  phy: qcom-qmp: split allegedly 4.20 and 5.20 TX/RX registers
  phy: qcom-qmp: split allegedly 4.20 and 5.20 PCS registers
  phy: qcom-qmp: split PCS_UFS V3 symbols to separate header
  phy: qcom-qmp: qserdes-com: add missing registers
  phy: qcom-qmp: qserdes-com-v3: add missing registers
  phy: qcom-qmp: qserdes-com-v4: add missing registers
  phy: qcom-qmp: qserdes-com-v5: add missing registers
  phy: qcom-qmp: pcs-v3: add missing registers
  phy: qcom-qmp: pcs-pcie-v4: add missing registers
  phy: qcom-qmp-usb: replace FLL layout writes for msm8996
  phy: qcom-qmp-usb: define QPHY_V2_PCS_PLL_LOCK_CHK_DLY_TIME register

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |   57 +-
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  |   34 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h  |  123 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  267 ++--
 .../phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h   |   17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h   |   72 +
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h    |   17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |   16 +
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h    |   17 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h    |   18 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h    |   31 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h    |   27 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h    |   34 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h    |   36 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h    |   46 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h    |  145 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h    |  135 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h |   15 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h    |   17 +
 .../qualcomm/phy-qcom-qmp-qserdes-com-v3.h    |  111 ++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v4.h    |  123 ++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v5.h    |  124 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com.h   |  140 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-pll.h   |   66 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h   |   68 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h   |  233 ++++
 .../phy-qcom-qmp-qserdes-txrx-v4_20.h         |   43 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v5.h   |  231 +++
 .../phy-qcom-qmp-qserdes-txrx-v5_20.h         |   60 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h  |  205 +++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |   45 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  153 +-
 drivers/phy/qualcomm/phy-qcom-qmp.h           | 1242 +----------------
 33 files changed, 2488 insertions(+), 1480 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcie-qhp.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v4_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v3.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v4_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v5_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx.h

-- 
2.35.1

