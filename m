Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA68B57CCB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 15:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiGUNxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 09:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiGUNxA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 09:53:00 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 651D5237E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tP+XB
        jVkj8uEQyRJn93Emo1dR7W9IpUCjt+ZQDRHLw8=; b=jN9BRVkPuZoQ98EMveFii
        HdDOt1D7yB3fHdKbt3mzF2gfyNgZb3ETPNZWlACt7bf205OHFoMnKxWPaeyJs907
        C5o00DQgfGaT9Uc3jgXKEeCN8CIbJO/ZY8dZFM+Hern+IFrGP0j0SGGAtkOtNGF2
        RFX2cl6SvaPIUOvdVMU8uE=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowADX1P0RWtliQtXcFQ--.28629S2;
        Thu, 21 Jul 2022 21:52:18 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        windhl@126.com
Subject: [PATCH 1/2] soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
Date:   Thu, 21 Jul 2022 21:52:16 +0800
Message-Id: <20220721135217.1301039-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowADX1P0RWtliQtXcFQ--.28629S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr1DKrWUXF1kXr4DCrW3KFg_yoW5Cry8pa
        yDAFZ0grW8GF4fCry2g3WkuasY9ryxtayUA3yv93s7Aasxtryqqr4vgFWYvFZ3GFy8Ww45
        JF4YvFWUua15Xr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z__MakUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hNFF1uwMcZLWAAAsU
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two refcount leak bugs in qcom_smsm_probe():

(1) The 'local_node' is escaped out from for_each_child_of_node() as
the break of iteration, we should call of_node_put() for it in error
path or when it is not used anymore.
(2) The 'node' is escaped out from for_each_available_child_of_node()
as the 'goto', we should call of_node_put() for it in goto target.

Fixes: c97c4090ff72 ("soc: qcom: smsm: Add driver for Qualcomm SMSM")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/soc/qcom/smsm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 9df9bba242f3..3e8994d6110e 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -526,7 +526,7 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	for (id = 0; id < smsm->num_hosts; id++) {
 		ret = smsm_parse_ipc(smsm, id);
 		if (ret < 0)
-			return ret;
+			goto out_put;
 	}
 
 	/* Acquire the main SMSM state vector */
@@ -534,13 +534,14 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 			      smsm->num_entries * sizeof(u32));
 	if (ret < 0 && ret != -EEXIST) {
 		dev_err(&pdev->dev, "unable to allocate shared state entry\n");
-		return ret;
+		goto out_put;
 	}
 
 	states = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_SHARED_STATE, NULL);
 	if (IS_ERR(states)) {
 		dev_err(&pdev->dev, "Unable to acquire shared state entry\n");
-		return PTR_ERR(states);
+		ret = PTR_ERR(states);
+		goto out_put;
 	}
 
 	/* Acquire the list of interrupt mask vectors */
@@ -548,13 +549,14 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	ret = qcom_smem_alloc(QCOM_SMEM_HOST_ANY, SMEM_SMSM_CPU_INTR_MASK, size);
 	if (ret < 0 && ret != -EEXIST) {
 		dev_err(&pdev->dev, "unable to allocate smsm interrupt mask\n");
-		return ret;
+		goto out_put;
 	}
 
 	intr_mask = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_SMSM_CPU_INTR_MASK, NULL);
 	if (IS_ERR(intr_mask)) {
 		dev_err(&pdev->dev, "unable to acquire shared memory interrupt mask\n");
-		return PTR_ERR(intr_mask);
+		ret = PTR_ERR(intr_mask);
+		goto out_put;
 	}
 
 	/* Setup the reference to the local state bits */
@@ -565,7 +567,8 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	smsm->state = qcom_smem_state_register(local_node, &smsm_state_ops, smsm);
 	if (IS_ERR(smsm->state)) {
 		dev_err(smsm->dev, "failed to register qcom_smem_state\n");
-		return PTR_ERR(smsm->state);
+		ret = PTR_ERR(smsm->state);
+		goto out_put;
 	}
 
 	/* Register handlers for remote processor entries of interest. */
@@ -595,16 +598,19 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, smsm);
+	of_node_put(local_node);
 
 	return 0;
 
 unwind_interfaces:
+	of_node_put(node);
 	for (id = 0; id < smsm->num_entries; id++)
 		if (smsm->entries[id].domain)
 			irq_domain_remove(smsm->entries[id].domain);
 
 	qcom_smem_state_unregister(smsm->state);
-
+out_put:
+	of_node_put(local_node);
 	return ret;
 }
 
-- 
2.25.1

