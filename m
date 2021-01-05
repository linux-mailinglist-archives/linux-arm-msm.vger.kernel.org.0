Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0104A2EAAB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730115AbhAEM1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:27:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730084AbhAEM1h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:27:37 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E7FC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:26:57 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id q4so16280265plr.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1la+fQtkZ8TIcBjt9Vrgq2GKSiZKbd18hkE15RjGGEU=;
        b=T3/THY+/Z6fpb4+Q9RRN/OKdEDGK8BbsxetLBpaXt73M/j3hLOEhqoSRPh3pqkkQlf
         hqM96201pw7qIuX0oMlPlMhpcuIJPLRrqj05Hg2lzoW8HiKvpeApmf2Z2NTf2GM58KSR
         nMKbneixncFIZZvERgdgmYSBTbc8GGoVwS+eHlKARNnA7WqH57tNkmSRWxBKEg1r3ZDB
         rawhmPT54XMzrU6OzFNGxtAZ9gaX0NCM9NUqCfGfsLKAuVIb73ePUGpgTipxkbxBfAvx
         BnunIvrL3NJU3D+FQJhuCSpKUe96viBUvPcQWbtfiaZ1v/LKOJlF2YP76RninBRfkexk
         7JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1la+fQtkZ8TIcBjt9Vrgq2GKSiZKbd18hkE15RjGGEU=;
        b=Rh7p1AdcXTrwt5MWlNm5R6irbmdenC/cW6aTOcibus7TRJ7rMVYq3bA+bZgNikJTop
         /GZjkgtkyWrKCvY2m2moT5DHC+oDMgvq80KIYPb+nG9uWWxcbsllKFaLXdbppEpxOdUA
         2utv4QCuNubygDH1/l9mPuh1qbm0vyZmFK1SOf4D05/ptZToOb8AYoqvE4UtFgX1aAyf
         +TE4Td5U9JP4zwhQ4jPdCHfVoN9kF3WrXqmC9gBNsMq0nFVOe608/CJuus/6INqk5+lr
         0jIr8YaOtwFzxSVeHgklycoFokALcdmt9/9/6ZEX/U5iOcjylKHdoLD1yTGywbQ7iSrB
         WpMw==
X-Gm-Message-State: AOAM533lqVRh6v/LBsFbpHH8pXQa7+zO/bYT/tSEZQzVKh8jmAU1o4i0
        Dei5rKUmKGWTpy5R5koCKuclpqpQZ+sj
X-Google-Smtp-Source: ABdhPJwfR0AE4xNyTw0szT984qgVCAsZZRYtuW4la2C/tvlXkgLHTifXmz7SmS3VSV9VrWpEtinAsg==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id z10mr3888082pjn.67.1609849616559;
        Tue, 05 Jan 2021 04:26:56 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:26:55 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/18] Devicetree update for SDX55 platform
Date:   Tue,  5 Jan 2021 17:56:31 +0530
Message-Id: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
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

Changes in v2:

* Changed "SoC" to "platform" and modified FIXME in commit message

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

