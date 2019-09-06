Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06874AB1E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 07:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392252AbfIFFLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 01:11:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732560AbfIFFLo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 01:11:44 -0400
Received: from localhost.localdomain (unknown [223.226.32.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41DDC2070C;
        Fri,  6 Sep 2019 05:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567746703;
        bh=IYBU8RWlqSgIbvGErYHD/EAnjlBL4u7Aj4RPOn5vpbM=;
        h=From:To:Cc:Subject:Date:From;
        b=zIgdjuZr2DOtl6+9KgEzceNxs+6sd3n3OVm5RgZ6JSi4TI6w20UsZv5j1okklgdhF
         xjy/ECeG16H146K0N6ECsJFs4kta5EdbUjT3nxZgYYO+2W9QUDyjHvqJ36lS3nDd5T
         oJ1fahH2VWhaO7inE068UC0AwAje0qe6XacohJcY=
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
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 0/3] UFS: Add support for SM8150 UFS
Date:   Fri,  6 Sep 2019 10:40:14 +0530
Message-Id: <20190906051017.26846-1-vkoul@kernel.org>
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

Changes since v1:
 - make the numbers a lower case hex
 - add review tags recieved

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

