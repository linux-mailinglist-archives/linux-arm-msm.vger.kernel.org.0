Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E0B48E6E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 09:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237363AbiANIvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jan 2022 03:51:04 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:36464 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237046AbiANIvD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jan 2022 03:51:03 -0500
Received: from localhost.localdomain (unknown [124.16.141.244])
        by APP-05 (Coremail) with SMTP id zQCowACHjwNfOeFhURcyBg--.44770S2;
        Fri, 14 Jan 2022 16:50:40 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: apr: Remove redundant 'flush_workqueue()' calls
Date:   Fri, 14 Jan 2022 08:50:19 +0000
Message-Id: <20220114085019.42904-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjwNfOeFhURcyBg--.44770S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF17GrW7uF4rCr4rWFW7urg_yoWxKFb_KF
        ZFkrWxWF4UCrZ7C347JF1YvFyvva97Zw12qa1aqF9IyFyjyw1YvFWqvr1kXrWUXw4UCF17
        uryDX34UXrn3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
        IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8JPE3UUUUU==
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCggGA1z4kSyk7QAAsX
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/soc/qcom/apr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 82ca12c9328a..3caabd873322 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -653,7 +653,6 @@ static void apr_remove(struct rpmsg_device *rpdev)
 
 	pdr_handle_release(apr->pdr);
 	device_for_each_child(&rpdev->dev, NULL, apr_remove_device);
-	flush_workqueue(apr->rxwq);
 	destroy_workqueue(apr->rxwq);
 }
 
-- 
2.25.1

