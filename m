Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184E15B692E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 10:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiIMIGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 04:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiIMIGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 04:06:46 -0400
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5E62C5A148;
        Tue, 13 Sep 2022 01:06:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [124.16.138.126])
        by APP-01 (Coremail) with SMTP id qwCowAAXH_MMOiBj4S4uAg--.25111S2;
        Tue, 13 Sep 2022 16:06:36 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     quic_jjohnson@quicinc.com, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH v3] soc: qcom: apr: Add check and kfree
Date:   Tue, 13 Sep 2022 16:06:35 +0800
Message-Id: <20220913080635.1733565-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXH_MMOiBj4S4uAg--.25111S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4ruFWrXFyfKrykGFW5Awb_yoW8Zr4kpa
        1avas8Ary8JFs3ury3Cr1kWa45Ka1Iy3ykWrZ7J3429rn5XrnayrnrtFy09rWUuFWkAa1U
        Xr13XF95CF4UWFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
        6r126r1DMxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
        73UjIFyTuYvjfU5GQDUUUUU
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As idr_alloc() and of_property_read_string_index can return negative
numbers, it should be better to check the return value and deal with
the exception.
Moreover, if device_register() fails, the adev should also be freed in
order to avoid memory leak.
Therefore, it should be better to use goto statement to deal with the
exception.

Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog:

v2 -> v3:

1. Change the title and use goto statement to deal with the exception.

v1 -> v2:

1. Add dev_err and put_device in order to maintain the code consistency.
---
 drivers/soc/qcom/apr.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index b4046f393575..b1a197155b2d 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -454,20 +454,34 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	adev->dev.driver = NULL;
 
 	spin_lock(&apr->svcs_lock);
-	idr_alloc(&apr->svcs_idr, svc, svc_id, svc_id + 1, GFP_ATOMIC);
+	ret = idr_alloc(&apr->svcs_idr, svc, svc_id, svc_id + 1, GFP_ATOMIC);
 	spin_unlock(&apr->svcs_lock);
+	if (ret < 0) {
+		dev_err(dev, "idr_alloc failed: %d\n", ret);
+		goto error;
+	}
 
-	of_property_read_string_index(np, "qcom,protection-domain",
-				      1, &adev->service_path);
+	ret = of_property_read_string_index(np, "qcom,protection-domain",
+					    1, &adev->service_path);
+	if (ret < 0) {
+		dev_err(dev, "of_property_read_string_index failed: %d\n", ret);
+		goto error;
+	}
 
 	dev_info(dev, "Adding APR/GPR dev: %s\n", dev_name(&adev->dev));
 
 	ret = device_register(&adev->dev);
 	if (ret) {
 		dev_err(dev, "device_register failed: %d\n", ret);
-		put_device(&adev->dev);
+		goto error;
 	}
 
+	goto end;
+
+error:
+	put_device(&adev->dev);
+	kfree(adev);
+end:
 	return ret;
 }
 
-- 
2.25.1

