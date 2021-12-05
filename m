Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2613C468A64
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Dec 2021 11:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhLEKtf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Dec 2021 05:49:35 -0500
Received: from bzq-84-110-109-230.cablep.bezeqint.net ([84.110.109.230]:47300
        "EHLO mx.tkos.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232844AbhLEKtf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Dec 2021 05:49:35 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id D60094409F0;
        Sun,  5 Dec 2021 12:45:50 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1638701151;
        bh=UwdlYousIPAAES5zZmOlQjQcd79JOwHjVsvCqp+rtm0=;
        h=From:To:Cc:Subject:Date:From;
        b=kw8YNYcMaMGJIQvzxX9SPmGZLBW8noCBiZjkZj89Krjq/0+AwdFPtBN7iKi7BFLlo
         QswRcpS0zNhk/Xcjl3Hz7sLOiSO/PoJbQjlBnSU0D02Ka50JBgGH738+G208G3l5Ya
         Uc04U8kRfB5wUOWwsesW7tHdCd5AVMGj/2htwnB4qNGzitGo8ffzJ74jo/LrZ9psWY
         FoHsq5XE/oHSYeFxZaKt2fA3WkDkqFyLtunimVoFDfR82WWSfwVxOwulfGJ0sDssjE
         vS0ACdHhoXYaZam4NsYFJgEm6cVxcV1CKFb4wIVEOeSZmTuDgfjwArf7sq5X0qf0mf
         Z3R5Y+bQwGpqw==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Baruch Siach <baruch@tkos.co.il>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH] usb: dwc3: dwc3-qcom: Fix registration when tx-fifo-resize exists
Date:   Sun,  5 Dec 2021 12:45:45 +0200
Message-Id: <e7ee9012055a4ba9afcb1ffbbeda25f113f171b6.1638701145.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit cefdd52fa04 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize
property by default") added the tx-fifo-resize property. But when this
property exists already, of_add_property() fails with -EEXIST, thus
breaking core registration. This regresses the IPQ6018 platform that has
tx-fifo-resize in its device-tree.

Don't fail when tx-fifo-resize exists.

Fixes: cefdd52fa045 ("usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default")
Cc: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 9abbd01028c5..bbd8e401a82c 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -667,7 +667,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 
 	prop->name = "tx-fifo-resize";
 	ret = of_add_property(dwc3_np, prop);
-	if (ret) {
+	if (ret && ret != -EEXIST) {
 		dev_err(dev, "unable to add property\n");
 		goto node_put;
 	}
-- 
2.33.0

