Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C1C2EA7DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbhAEJrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbhAEJr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:47:26 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB5DC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:46:45 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 15so20945224pgx.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yVV9kmjNBGzeolxcSu2/RU1f6qfMMqar3Kf3d/jlk0=;
        b=XROUrAJ4b18ZKynkMT7YjZSO2MQHh3TAuSk7XLcfe3gU1gdZsHQjrhkKvFKaxktRwP
         zdwSROP6I6/E3Lsr9WtEvHRPu/xV4h5du16GZoIPoAO7HaBsHGji9xsMb8uEWYqSeyVI
         6jORKesJSpXccXJFPX8L1iX5pFl+tA2unk3XpCp1fnZDlT1gYOCxvLQrcOlqo18H1QdU
         qcOc2SMJXSYYGVTmrA/WoTb3SwV18UMEZD9i/ub7RMFz24/yEtxe1fLCINibPcitLgoo
         QFPE6EUQdLl1qaRS3eHLekc8FHWuJV198Og+ylZXyAXOHMCiUGvt0A5FHo/Cjgo99zjA
         q63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6yVV9kmjNBGzeolxcSu2/RU1f6qfMMqar3Kf3d/jlk0=;
        b=HIha6rFHW3rIFLRUM2ju+E9TbFcf+mXsmhgQAeH5FZpRDi8pyGtYBdWOdC2EEemexC
         GL93eoZmj121ELPQuV34N6FGvC14KPdUKZ4+PqHs1KoIo/0zro9JFtsmrqXoDKgwhnwM
         v1g4RJLmQbZ4rHbFd9pwoLNj26jkZBAO4bI7Nus9CpOfWNgMf2aQzxTj6/pV01MNPmH2
         TIV3QrnS6Qqgjk7DF89tdz/Q7j7+L160/fnZBh6PcRWhHAgz9IU0eqCJ/PbaGgjEkMBL
         1Dyzgy3vfV9MMkmF6HCl0fFIRvcMrNnfIdFwfbORaR3X4qhUnEogpHhdqyB5/gU6+S3K
         IQuA==
X-Gm-Message-State: AOAM530iEbmNKF0Ol0CD+X9cdSJ0KqVTAo8w2BQWMVkxsgs5PMZjgsvr
        VG+YSXrPGODR0JUBdPG2MwM9d6+ivX6C
X-Google-Smtp-Source: ABdhPJyxyYjwE/4BEIA3xhCYgizBfeWIZ99n9X82SZm1LeYllWYtc/N/CHaa09FspWscyOducQTPSw==
X-Received: by 2002:a63:6344:: with SMTP id x65mr49483787pgb.172.1609840004861;
        Tue, 05 Jan 2021 01:46:44 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:46:43 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/18] Devicetree update for SDX55 platform
Date:   Tue,  5 Jan 2021 15:16:18 +0530
Message-Id: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

This series updates devicetree for the SDX55 platform and the MTP board.
Most of the SDX55 specific driver codes are already merged and some of
existing driver support got reused.

Thanks,
Mani

Bjorn Andersson (1):
  ARM: dts: qcom: sdx55: Enable ARM SMMU

Manivannan Sadhasivam (9):
  dt-bindings: mmc: sdhci-msm: Document the SDX55 compatible
  ARM: dts: qcom: sdx55: Add support for SDHCI controller
  dt-bindings: arm-smmu: Add binding for Qcom SDX55 SMMU
  ARM: dts: qcom: sdx55: Add support for TCSR Mutex
  ARM: dts: qcom: sdx55: Add Shared memory manager support
  ARM: dts: qcom: sdx55: Add QPIC BAM support
  ARM: dts: qcom: sdx55: Add QPIC NAND support
  ARM: dts: qcom: sdx55-mtp: Enable BAM DMA
  ARM: dts: qcom: sdx55-mtp: Enable QPIC NAND

Vinod Koul (8):
  ARM: dts: qcom: sdx55: Add pincontrol node
  ARM: dts: qcom: sdx55: Add reserved memory nodes
  ARM: dts: qcom: sdx55: Add spmi node
  ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
  ARM: dts: qcom: sdx55-mtp: Add pmx55 pmic
  ARM: dts: qcom: sdx55: Add rpmpd node
  ARM: dts: qcom: Add PMIC pmx55 dts
  ARM: dts: qcom: sdx55-mtp: Add regulator nodes

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   1 +
 .../devicetree/bindings/mmc/sdhci-msm.txt     |   1 +
 arch/arm/boot/dts/qcom-pmx55.dtsi             |  91 +++++++
 arch/arm/boot/dts/qcom-sdx55-mtp.dts          | 197 +++++++++++++++
 arch/arm/boot/dts/qcom-sdx55.dtsi             | 234 ++++++++++++++++++
 5 files changed, 524 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-pmx55.dtsi

-- 
2.25.1

