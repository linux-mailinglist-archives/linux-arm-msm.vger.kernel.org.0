Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 091FE75DCC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jul 2023 15:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjGVNZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jul 2023 09:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGVNZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jul 2023 09:25:05 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EF001BC
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jul 2023 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=k60bfgSHnufwdsuL/V
        rQCeHercaRykySi87mJviHCbE=; b=O52WPEgkyAqOE3k7iZ0aqSvyY2mkvulLiJ
        lfwexMVCTjLKLlLaeT0MFwt04Dxkj1yuu3wnRS+UsF0HVRvKwMjPRVcwSPocUar6
        /Ik+5OASM3u6+SrUuaV5uqpwqJYggb/HgLGqqGa/QXXUfUaOKvqODCvayVBpz/Qy
        J/vlV7osU=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wBnMYiG2Ltkd9wlBA--.18453S4;
        Sat, 22 Jul 2023 21:24:28 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     quic_bjorande@quicinc.com
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, ruc_gongyuanjun@163.com,
        vkoul@kernel.org
Subject: [PATCH v2 1/1] Soundwire: fix the return value checks of clk_prepare_enable()
Date:   Sat, 22 Jul 2023 21:24:19 +0800
Message-Id: <20230722132419.37197-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230721034540.GA1428172@hu-bjorande-lv.qualcomm.com>
References: <20230721034540.GA1428172@hu-bjorande-lv.qualcomm.com>
X-CM-TRANSID: _____wBnMYiG2Ltkd9wlBA--.18453S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF43tFWrur1rKryUAry7KFg_yoWkJFg_C3
        95Wrs3Wr45Wws2y347Ww43JrWkKa1kuF4SgF40vw4ftr9rJr9Ivr4kZr9rCws8Xw47Ary0
        yF15Za17ArySyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNOJ5UUUUUU==
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiUR605WDESYQCgAABs0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L4,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

in qcom_swrm_probe() and swrm_runtime_resume(), the return value
of function clk_prepare_enable() should be checked, since it may
 fail.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/soundwire/qcom.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 7970fdb27ba0..cf1e13a35023 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1555,7 +1555,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	clk_prepare_enable(ctrl->hclk);
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		goto err_init;
 
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
@@ -1673,7 +1675,9 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 			disable_irq_nosync(ctrl->wake_irq);
 	}
 
-	clk_prepare_enable(ctrl->hclk);
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		return ret;
 
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
-- 
2.17.1

