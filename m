Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5990302386
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 11:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbhAYKOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 05:14:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:44442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727333AbhAYKMG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 05:12:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C01E222F9;
        Mon, 25 Jan 2021 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611569361;
        bh=TkT+ypujt2p8pA33Wjsa9W2l077mMS3GDY+RwaLe/X8=;
        h=From:To:Cc:Subject:Date:From;
        b=iWoucnVMCZc0rVivAThCiMfgwgnrQUoewAmIVFedb7NjeyS6dOEhfxBUhVZ5zfn52
         wugUPiK98vqqg8cD0JLX8b0hmbJDn1O7RCMVzznrq95K0sZMA+ythIgvlnxh+BpWfW
         cyXJoTvZgCaJ4fw3WKqBVG4slsWV69fmbj/0T/YKqnqKASyIIJebjTWDaLjmEjfI6h
         eDrBikeubte6ed6Bz2tHZ7P0zN2neQ0z3OT6HW0ECzzjOlPtVx+PXUb7su4YTTCeqb
         penmATeKy1uZSt3j/jT3zbtnpIELQ0hBRfQ2P7IsC0sbaGtbcC2bP6Yvw6N2zEfbTj
         tx+Hd5dp+yzuw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add Support for SM8350 UFS
Date:   Mon, 25 Jan 2021 15:39:02 +0530
Message-Id: <20210125100906.4004908-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for UFS found in SM8350 SoC. First we add UFS HC
compatible strings, along with missing one for SM8250. This can go thru SCSI
subssystem.

Then we add binding for UFS phy and new regsiters and nw offsets specific to
SM8350 followed by UFS phy tables. This can go thru phy subsystem.

Vinod Koul (4):
  scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible strings
  dt-bindings: phy: qcom,qmp: Add SM8350 UFS PHY bindings
  phy: qcom-qmp: Add UFS v4 registers found in SM8350
  phy: qcom-qmp: Add support for SM8350 UFS phy

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   1 +
 .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 127 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  27 ++++
 4 files changed, 157 insertions(+)

-- 
2.26.2

