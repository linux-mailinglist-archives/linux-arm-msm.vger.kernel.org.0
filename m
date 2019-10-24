Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDABE2B57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2019 09:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408711AbfJXHsm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Oct 2019 03:48:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:54272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404701AbfJXHsl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Oct 2019 03:48:41 -0400
Received: from localhost.localdomain (unknown [122.181.210.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA9162166E;
        Thu, 24 Oct 2019 07:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571903320;
        bh=nEkaVq4FO8CG23Md1bkPeG2m5r7YUzla9UALRzU1j70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hO3qkVyVc663w59H6ohgAhIuoxUz6O5Mu7UFR6m9WQZMUjhG5Ng35FepQspy8909y
         dK8FENawcgQ4xhiGSo5RfkZKSSkwFg67+DRm2TQktjC46Io606SHpXJY0XjGbNVXMZ
         PnBGd+zGd8+Wpt3nqtQ4VBPye/il8uu8mj2/x4yA=
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
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: ufs: Add sm8150 compatible string
Date:   Thu, 24 Oct 2019 13:18:00 +0530
Message-Id: <20191024074802.26526-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024074802.26526-1-vkoul@kernel.org>
References: <20191024074802.26526-1-vkoul@kernel.org>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
index d78ef63935f9..415ccdd7442d 100644
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

