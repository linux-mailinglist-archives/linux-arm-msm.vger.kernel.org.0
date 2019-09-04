Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C76FCA8008
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 12:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfIDKKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 06:10:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:40174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbfIDKKD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 06:10:03 -0400
Received: from localhost.localdomain (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A466221881;
        Wed,  4 Sep 2019 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567591802;
        bh=Aw79mLTqa2kwkYl2YhNG5h7HCrO6r1u9MxIbyMHIMGQ=;
        h=From:To:Cc:Subject:Date:From;
        b=ouggbG2sksRb3hDfkIcZCU2V/9FmlXAZRgl+X+p35vZPVJNXzp5JYq7AJ2xm7488V
         eDavLnbEw+ugBjndvzO3yXtUd1s7DXNDCriLfH8FWuHrHQC/50G4Ruto9kGfVviL/8
         bOohPunHHdQVWMs5mSUwBCiFed/Aj6y9tfoBweS8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Evan Green <evgreen@chromium.org>,
        Can Guo <cang@codeaurora.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/3] UFS: Add support for SM8150 UFS
Date:   Wed,  4 Sep 2019 15:38:32 +0530
Message-Id: <20190904100835.6099-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds compatible strings for ufs hc and ufs qmp phy found in
Qualcomm SM8150 SoC. Also update the qmp phy driver with version 4 and
support for ufs phy.

Vinod Koul (3):
  dt-bindings: ufs: Add sm8150 compatible string
  dt-bindings: phy-qcom-qmp: Add sm8150 UFS phy compatible string
  phy: qcom-qmp: Add SM8150 QMP UFS PHY support

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   7 +-
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 125 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  96 ++++++++++++++
 4 files changed, 228 insertions(+), 1 deletion(-)

-- 
2.20.1

