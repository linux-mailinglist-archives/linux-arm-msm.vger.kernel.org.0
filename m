Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24525305E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 15:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhA0O06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 09:26:58 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:58873 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232633AbhA0O0Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 09:26:24 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 590914403E5;
        Wed, 27 Jan 2021 16:25:39 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] phy: qualcomm: support IPQ60xx USB PHY
Date:   Wed, 27 Jan 2021 16:20:26 +0200
Message-Id: <cover.1611756920.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The short series adds support for USB PHY on IPQ60xx based platforms. Tested 
on CP01 board.

The code is forward-ported from downstream codeaurora kernel at

  https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/

Baruch Siach (1):
  dt-bindings: phy: qcom,qusb2: document ipq6018 compatible

Kathiravan T (2):
  phy: qcom-qusb2: add QUSB2 support for IPQ6018
  arm64: dts: ipq6018: enable USB2 support

 .../bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts  |  8 ++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 48 +++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qusb2.c         | 44 +++++++++++++++++
 4 files changed, 101 insertions(+)

-- 
2.29.2

