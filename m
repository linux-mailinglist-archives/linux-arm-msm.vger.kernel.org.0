Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6957CCBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 15:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiGUNxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 09:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiGUNxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 09:53:22 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C225730F67
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=9WUSH
        KpTDGtpJQdkvs44td0NYxZqoL3r5fHjZJDYeg8=; b=Do1bQFHRfRLr15DaMv7t5
        jKaXW6Pf3rzaLT5NpkWD9KeRrFngrd8armAcFrT+neoGLL6zmTjY3g+bg+f4zaB/
        cdLIOnAle8tTgWtfNEk5fdNPhM9iGAoxiLssm/LpbHKIUk2e+od4dQJ3BP8hwOAd
        2XcoXqk1WBjPt/m6HCtDY0=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowADX1P0RWtliQtXcFQ--.28629S3;
        Thu, 21 Jul 2022 21:52:19 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        windhl@126.com
Subject: [PATCH 2/2] soc: qcom: smem_state: Add refcounting for the 'state->of_node'
Date:   Thu, 21 Jul 2022 21:52:17 +0800
Message-Id: <20220721135217.1301039-2-windhl@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721135217.1301039-1-windhl@126.com>
References: <20220721135217.1301039-1-windhl@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowADX1P0RWtliQtXcFQ--.28629S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr1ruFy8WF48urW5uryrXrb_yoW8GrWUpw
        4vk3sI9r1UXr4xWws7Aa45ZFZYg3WxKrWUCrZ2y347XFy3Jryrtr1qqFy5A39xJFW8Gw1x
        Xw1IyFnxJa1FkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEOzsiUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhRFF18RPiIKDQAAsd
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In qcom_smem_state_register() and qcom_smem_state_release(), we
should better use of_node_get() and of_node_put() for the reference
creation and destruction of 'device_node'.

Fixes: 9460ae2ff308 ("soc: qcom: Introduce common SMEM state machine code")
Signed-off-by: Liang He <windhl@126.com>
---
I have learned that the 'state->of_node' is used to match client
lookups. But I do not know if there will be a premature free or UAF
if we do not refcount this new reference created in to 'state->of_node'.
Please check it carefully.


 drivers/soc/qcom/smem_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
index 31faf4aa868e..e848cc9a3cf8 100644
--- a/drivers/soc/qcom/smem_state.c
+++ b/drivers/soc/qcom/smem_state.c
@@ -136,6 +136,7 @@ static void qcom_smem_state_release(struct kref *ref)
 	struct qcom_smem_state *state = container_of(ref, struct qcom_smem_state, refcount);
 
 	list_del(&state->list);
+	of_node_put(state->of_node);
 	kfree(state);
 }
 
@@ -205,7 +206,7 @@ struct qcom_smem_state *qcom_smem_state_register(struct device_node *of_node,
 
 	kref_init(&state->refcount);
 
-	state->of_node = of_node;
+	state->of_node = of_node_get(of_node);
 	state->ops = *ops;
 	state->priv = priv;
 
-- 
2.25.1

