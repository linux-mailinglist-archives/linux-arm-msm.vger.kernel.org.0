Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22663AB1E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 07:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392265AbfIFFLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 01:11:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732560AbfIFFLu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 01:11:50 -0400
Received: from localhost.localdomain (unknown [223.226.32.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DD932081B;
        Fri,  6 Sep 2019 05:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567746709;
        bh=8h2WHDT9y/qnU8gqaUSOOuGv/wzGUeapUE/cZcM+kHE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kL9vCf7/m22LDJZFgWa0+7eEvDqqdIGdc57xvB4T2FoXsyw09Ra+MT05dQwVdPA2e
         Nx8/+q7ejlkoROx3YzAdqCNB0iua6DMmQSkKxOUMcM7PWTnig1KVqkh+S08ijJG8Y3
         1FBIHwkCW9V76w02nSO6aKr1ZVCivHoGhhkjOnlg=
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
Subject: [PATCH v2 1/3] dt-bindings: ufs: Add sm8150 compatible string
Date:   Fri,  6 Sep 2019 10:40:15 +0530
Message-Id: <20190906051017.26846-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190906051017.26846-1-vkoul@kernel.org>
References: <20190906051017.26846-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document "qcom,sm8150-ufshc" compatible string for UFS HC found on
SM8150.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index a74720486ee2..7529e2c26127 100644
--- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
+++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
@@ -13,6 +13,7 @@ Required properties:
 			    "qcom,msm8996-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 			    "qcom,sdm845-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
+			    "qcom,sm8150-ufshc", "qcom,ufshc", "jedec,ufs-2.0"
 - interrupts        : <interrupt mapping for UFS host controller IRQ>
 - reg               : <registers mapping>
 
-- 
2.20.1

