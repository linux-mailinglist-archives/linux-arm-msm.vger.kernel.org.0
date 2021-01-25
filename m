Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A18303448
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729889AbhAZFVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:21:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:44462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727339AbhAYKLh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 05:11:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45DBE225A9;
        Mon, 25 Jan 2021 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611569365;
        bh=/caSJlOzi9QwZYCHXZhLX4f0JgFeqHckEpX4/pNTF1c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jIb89LY/RphhYgJMIj8DSE0x9sKFQnKTMasNpMzLiZJlXQ4gXjCoPVV/0ZcO8F1db
         +NcRsq4f8PDU95GKM8iLSQoG34eu+47I0iEcSHjVLkEpDNq1Yp7+yPx3Y/JbFw3FvS
         9DUxaxD7MdehfLVjQGO+p8NdAJfNxwgWpnaZEKCTtUif3bXdNLWNPTQZOY/Dl/MWJe
         5vmIaFk1+FjT5ZzJ6p4QByYbyhggwrb9iQKgpc9OABiQtf2Fgq/ApbaHemnIvdUCj6
         DpNBjvzfK5gDyLQacny6OXy6DCx0lbwPTisgdUmg1XCUuO5oFy76mXUKMAyvCU7fah
         MsoqWvn16iGjg==
From:   Vinod Koul <vkoul@kernel.org>
To:     "Martin K . Petersen" <martin.petersen@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible strings
Date:   Mon, 25 Jan 2021 15:39:03 +0530
Message-Id: <20210125100906.4004908-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125100906.4004908-1-vkoul@kernel.org>
References: <20210125100906.4004908-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index 415ccdd7442d..d8fd4df81743 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -14,6 +14,8 @@ Required properties:
 			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
+			    "qcom,sm8250-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
+			    "qcom,sm8350-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 - interrupts        : <interrupt mapping for UFS host controller IRQ>
 - reg               : <registers mapping>
 
-- 
2.26.2

