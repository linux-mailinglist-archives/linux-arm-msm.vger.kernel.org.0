Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9D1A800A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 12:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfIDKKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 06:10:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbfIDKKS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 06:10:18 -0400
Received: from localhost.localdomain (unknown [122.182.201.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C7EA21881;
        Wed,  4 Sep 2019 10:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567591817;
        bh=OPdWI4gwz1pVPZA0+gFORvlpO0g9kNA1w64zDiEXc0E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XaRJMvnBbluOCTVHBaF/5zzUvmb+i0XG23lfnumY14li+7R5JJ3XHzoesULUNwyyk
         KkON5PElS/pImhoy1fdAVXhklOXops/6uB2X5io/tUR/+PHLzpjvR617yudDCbUUUk
         O2tqaRkWLbt7ojuUDALqQ78j+kf4SNaZBgtcVn1M=
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
Subject: [PATCH 1/3] dt-bindings: ufs: Add sm8150 compatible string
Date:   Wed,  4 Sep 2019 15:38:33 +0530
Message-Id: <20190904100835.6099-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904100835.6099-1-vkoul@kernel.org>
References: <20190904100835.6099-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document "qcom,sm8150-ufshc" compatible string for UFS HC found on
SM8150.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
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

