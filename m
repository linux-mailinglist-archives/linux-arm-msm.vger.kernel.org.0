Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17502FECEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 15:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbhAUOcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 09:32:10 -0500
Received: from m12-14.163.com ([220.181.12.14]:40685 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730872AbhAUO1n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 09:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=mRrXWTfO5bQ9bVZqp5
        gY4L7jsQlsJ0kDsPmVU8rsXus=; b=ctj26Fmq3goGflfXydIZLJl5ZUQv4o9Dh5
        6mC/9vp4kgcoAuD/BsGqt9rFTHS165wfTBHrF2Tkva04jOBRStCHvOHrN14Xo9NH
        /R76KLU/O0Pt3tzvElgz1XGv/RBJ5ddNAkTRif8BUMABY4eUFauyNAz23tkoEnQ4
        uaB5hy6Q0=
Received: from localhost.localdomain (unknown [119.3.119.20])
        by smtp10 (Coremail) with SMTP id DsCowAA3tio0aglgrnuehA--.22787S4;
        Thu, 21 Jan 2021 19:49:12 +0800 (CST)
From:   Pan Bian <bianpan2016@163.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pan Bian <bianpan2016@163.com>
Subject: [PATCH] bus: qcom: Put child node before return
Date:   Thu, 21 Jan 2021 03:49:07 -0800
Message-Id: <20210121114907.109267-1-bianpan2016@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DsCowAA3tio0aglgrnuehA--.22787S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyDGw13CF4UAF4DXrW7twb_yoWfZwb_C3
        92qFWxGrsY9F47ZanFqw4UZr92qF1Dur18uFWSqa4av34UXa1DWrn5Zr95W34furW7tas0
        kF98AF18ur1xZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeAOzDUUUUU==
X-Originating-IP: [119.3.119.20]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/1tbiDgghclXly8w3ewABsv
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Put child node before return to fix potential reference count leak.
Generally, the reference count of child is incremented and decremented
automatically in the macro for_each_available_child_of_node() and should
be decremented manually if the loop is broken in loop body.

Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
Signed-off-by: Pan Bian <bianpan2016@163.com>
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
2.17.1


