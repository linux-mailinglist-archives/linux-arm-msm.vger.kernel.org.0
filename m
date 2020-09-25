Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D733279523
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 01:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729495AbgIYXvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 19:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729480AbgIYXvH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 19:51:07 -0400
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Sep 2020 16:51:06 PDT
Received: from agrajag.zerfleddert.de (agrajag.zerfleddert.de [IPv6:2a01:4f8:bc:1de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F148DC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 16:51:06 -0700 (PDT)
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
        id 293B55B2095A; Sat, 26 Sep 2020 01:45:04 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:45:04 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bus: qcom: ebi2: fix device node iterator leak
Message-ID: <20200925234504.GA18813@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the for_each_available_child_of_node loop of qcom_ebi2_probe, add a
call to of_node_put to avoid leaking the iterator if we bail out.

Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")

Signed-off-by: Tobias Jordan <kernel@cdqe.de>
---
 drivers/bus/qcom-ebi2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index 03ddcf426887..0b8f53a688b8 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -353,8 +353,10 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 
 		/* Figure out the chipselect */
 		ret = of_property_read_u32(child, "reg", &csindex);
-		if (ret)
+		if (ret) {
+			of_node_put(child);
 			return ret;
+		}
 
 		if (csindex > 5) {
 			dev_err(dev,
-- 
2.20.1

