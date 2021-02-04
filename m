Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E4E30F8DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 18:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238275AbhBDQ7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 11:59:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:53986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238263AbhBDQ7C (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 11:59:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80E9964F6D;
        Thu,  4 Feb 2021 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612457902;
        bh=WniXKSEweVW4boGaWhvQjrrd1IfyB2lMkz2bhCMs+FM=;
        h=From:To:Cc:Subject:Date:From;
        b=EBJsHFk2MECiKYYToG5hb0K7Wl19wE8FmgUID1V5Y351HGw2GoeknZ7iM7KYejynn
         as/uVTIjZPQeRbCE9KpfqXr6aNu2DN6mwE9xEdy0DEtrDlte2/pnB82thK1ZMZ/vgX
         rLQC0FBs67DkgwKuoW2+P2l9k4OOA5ifweMz9EZF8PVv78C99QTxVjcQcM1po0BxFV
         SMF2uqUmRHOCqZmX7qptLVQe2BTwLmtBaWycqSrF6tFbdrNhaXcRiZ0/t3yQ+p86Iz
         Klop8GfqXXKpLkqIplgNHBAQcKx/ErBkpj3XlyYLL1bnnrcSu2L3gR8BZAcfIxIoxE
         HZscsMxTJemPA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] phy: Add Support for SM8350 UFS
Date:   Thu,  4 Feb 2021 22:28:02 +0530
Message-Id: <20210204165805.62235-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
rom:    Vinod Koul <vkoul@kernel.org>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for UFS found in SM8350 SoC.

We add binding for UFS phy and new regsiters for QMPv5 followed by UFS phy
tables.

Vinod Koul (3):
  dt-bindings: phy: qcom,qmp: Add SM8350 UFS PHY bindings
  phy: qcom-qmp: Add UFS V5 registers found in SM8350
  phy: qcom-qmp: Add support for SM8350 UFS phy

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 127 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  47 +++++++
 3 files changed, 175 insertions(+)

-- 
2.26.2

