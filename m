Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE41302385
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 11:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbhAYKMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 05:12:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:44480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727340AbhAYKLh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 05:11:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4982A22512;
        Mon, 25 Jan 2021 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611569369;
        bh=q5VWWPzg4C4SUHCK+RykuznWauwMATDOUvYvmNmEm1k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A6GpUSnHC44x1/0BB5hRB699hn4GLDV5+HLXYe3ujy5l8moQ2B/PwZCLcNQofxjY/
         FQQ5J4m9FiKdj3L+Fkm7Lwj8LRNQtQVSTIFnNXQIKBpSZkALs35r3j4fYCGPvl6m9K
         ysZJkS50sgX3hACbEdRmA/vLFRSIsxMcHSh54IXrYryEYmCFEU+KPq7MEMAGkCWaJy
         5f/pQeuzEYumoi9Yhwqt5xv6VfGaFYNhty/7CWIkc7Bp8qarwUghLWfCB9EUCaqP+j
         tUGOKvoiN5zBCAa+1zOHjqssHb7MQuYxyt2kWU8i1nR6kppPCM+nZohnzYdQK2hFWT
         PWp3I/thJMduw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: phy: qcom,qmp: Add SM8350 UFS PHY bindings
Date:   Mon, 25 Jan 2021 15:39:04 +0530
Message-Id: <20210125100906.4004908-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125100906.4004908-1-vkoul@kernel.org>
References: <20210125100906.4004908-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible strings for the UFS PHY found on SM8350 SoC.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 62c4f2ba5b9f..bf804c12fa5f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -38,6 +38,7 @@ properties:
       - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8250-qmp-usb3-phy
       - qcom,sm8250-qmp-usb3-uni-phy
+      - qcom,sm8350-qmp-ufs-phy
       - qcom,sm8350-qmp-usb3-phy
       - qcom,sm8350-qmp-usb3-uni-phy
       - qcom,sdx55-qmp-usb3-uni-phy
-- 
2.26.2

