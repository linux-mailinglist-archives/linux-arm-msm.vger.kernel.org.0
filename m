Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 404297C6018
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 00:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbjJKWAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 18:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbjJKWAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 18:00:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5403FC6
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 15:00:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5046bf37daeso464324e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697061603; x=1697666403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dnOwyLkeu2poleUggkw2VTOJ6asuAXQcOkA3t8XKg0=;
        b=wfIVmYyQq+oBZ4cSHn/eUkQa8mdTyZUq2GyvQ3AmN8Lggt/KTiLSMNa7muNAkibjY/
         IEnP2016UqwdN1BS5wCMeHyTvRQhuqpd0EnDbKiJb3WrwmuJfiSVkCeJFXyfziyouceY
         WK+vfN3PSz3X5YHTcTddsZlUr2jp3TLoqwe9KnEHHhow1J3TouVTFTppBuFpIlRXhcxK
         tkMN28BI5ITOo9xV2BClzlpgK/V53tUxLzg5paRHENqIbIsRpG0gJGEuJKCYV2i5RHEw
         cXS4lo3XLHPPCZFIf/sOoQ4Fy+EpU6GIinAu4y60K8GxJvASHNP8MOY95OfLbFahi12s
         BeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061603; x=1697666403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dnOwyLkeu2poleUggkw2VTOJ6asuAXQcOkA3t8XKg0=;
        b=TBGdjNpqWt4loMdUjNxQHmFTMDPVy1VxlLoU4nLjPB5meJTbZzjtjTqx0kr77sP+Er
         y6/smUoUGLwJAhZI8wUY/6yPG5NCLDCkX6v+pe2XWhAKq2wbuhdfy5lg+eeVftzqFcYH
         rLg7mHTe258h8ka/RYu6v4aLjhxK9dlolZuSrhmiPrpejBeaa9CVRSwaqUNi9Xqkg0oB
         PI6aOqgtruhwtie1wI0FMQK1uaV17j8o2aL6svShRS45DIBELdKjsgYp/ShIJhUZLMsD
         xte57jTakJDrP2/9GMijRJdHRk7B68PquILk9zAAz838mEnGQfobTTvxUuPsHeJPjRj3
         hYnQ==
X-Gm-Message-State: AOJu0Yy8U/Z9O9VxEEA2BCVsk5SjTvokCvKxZUG4h2cH0tkphpmFwARd
        dzFIqAkYMqRmAsJ2nlVY2uIINQ==
X-Google-Smtp-Source: AGHT+IF/kXNPyNqyu2vPC5qLpcYMwT3qAa/akcYT73kRn3qd6eUvszcXinR7fcSIFXWGYFvfd5mowg==
X-Received: by 2002:a05:6512:128a:b0:503:3278:3221 with SMTP id u10-20020a056512128a00b0050332783221mr23787913lfs.69.1697061603349;
        Wed, 11 Oct 2023 15:00:03 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a14-20020ac2520e000000b00502b04e2722sm2461092lfl.3.2023.10.11.15.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 15:00:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/bridge: lt9611uxc: fix the race in the error path
Date:   Thu, 12 Oct 2023 01:00:02 +0300
Message-Id: <20231011220002.382422-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If DSI host attachment fails, the LT9611UXC driver will remove the
bridge without ensuring that there is no outstanding HPD work being
done. In rare cases this can result in the warnings regarding the mutex
being incorrect. Fix this by forcebly freing IRQ and flushing the work.

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:582 __mutex_lock+0x468/0x77c
Modules linked in:
CPU: 0 PID: 10 Comm: kworker/0:1 Tainted: G     U             6.6.0-rc5-next-20231011-gd81f81c2b682-dirty #1206
Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
Workqueue: events lt9611uxc_hpd_work
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __mutex_lock+0x468/0x77c
lr : __mutex_lock+0x468/0x77c
sp : ffff8000800a3c70
x29: ffff8000800a3c70 x28: 0000000000000000 x27: ffffd595fe333000
x26: ffff7c2f0002c005 x25: ffffd595ff1b3000 x24: ffffd595fccda5a0
x23: 0000000000000000 x22: 0000000000000002 x21: ffff7c2f056d91c8
x20: 0000000000000000 x19: ffff7c2f056d91c8 x18: fffffffffffe8db0
x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000000
x14: 000000000006efb8 x13: 0000000000000000 x12: 0000000000000037
x11: 0000000000000001 x10: 0000000000001470 x9 : ffff8000800a3ae0
x8 : ffff7c2f0027f8d0 x7 : ffff7c2f0027e400 x6 : ffffd595fc702b54
x5 : 0000000000000000 x4 : ffff8000800a0000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7c2f0027e400
Call trace:
 __mutex_lock+0x468/0x77c
 mutex_lock_nested+0x24/0x30
 drm_bridge_hpd_notify+0x2c/0x5c
 lt9611uxc_hpd_work+0x6c/0x80
 process_one_work+0x1ec/0x51c
 worker_thread+0x1ec/0x3e4
 kthread+0x120/0x124
 ret_from_fork+0x10/0x20
irq event stamp: 15799
hardirqs last  enabled at (15799): [<ffffd595fc702ba4>] finish_task_switch.isra.0+0xa8/0x278
hardirqs last disabled at (15798): [<ffffd595fd5a1580>] __schedule+0x7b8/0xbd8
softirqs last  enabled at (15794): [<ffffd595fc690698>] __do_softirq+0x498/0x4e0
softirqs last disabled at (15771): [<ffffd595fc69615c>] ____do_softirq+0x10/0x1c

Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 7835738a532e..e971b75e90ad 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -929,9 +929,9 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	init_waitqueue_head(&lt9611uxc->wq);
 	INIT_WORK(&lt9611uxc->work, lt9611uxc_hpd_work);
 
-	ret = devm_request_threaded_irq(dev, client->irq, NULL,
-					lt9611uxc_irq_thread_handler,
-					IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
+	ret = request_threaded_irq(client->irq, NULL,
+				   lt9611uxc_irq_thread_handler,
+				   IRQF_ONESHOT, "lt9611uxc", lt9611uxc);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		goto err_disable_regulators;
@@ -967,6 +967,8 @@ static int lt9611uxc_probe(struct i2c_client *client)
 	return lt9611uxc_audio_init(dev, lt9611uxc);
 
 err_remove_bridge:
+	free_irq(client->irq, lt9611uxc);
+	cancel_work_sync(&lt9611uxc->work);
 	drm_bridge_remove(&lt9611uxc->bridge);
 
 err_disable_regulators:
@@ -983,7 +985,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
 {
 	struct lt9611uxc *lt9611uxc = i2c_get_clientdata(client);
 
-	disable_irq(client->irq);
+	free_irq(client->irq, lt9611uxc);
 	cancel_work_sync(&lt9611uxc->work);
 	lt9611uxc_audio_exit(lt9611uxc);
 	drm_bridge_remove(&lt9611uxc->bridge);
-- 
2.39.2

