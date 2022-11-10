Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7430623EE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 10:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiKJJpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 04:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiKJJoy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 04:44:54 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46272220DE
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:44:53 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N7H0r6xXZzJncC;
        Thu, 10 Nov 2022 17:41:48 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:44:50 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
        <mihail.atanassov@arm.com>, <brian.starkey@arm.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <robdclark@gmail.com>,
        <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <sean@poorly.run>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
        <emma@anholt.net>, <mripard@kernel.org>,
        <vladimir.lypak@gmail.com>, <quic_akhilpo@quicinc.com>,
        <dianders@chromium.org>, <cuigaosheng1@huawei.com>,
        <olvaffe@gmail.com>, <angelogioacchino.delregno@somainline.org>,
        <marijn.suijten@somainline.org>
CC:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms
Date:   Thu, 10 Nov 2022 17:44:45 +0800
Message-ID: <20221110094445.2930509-6-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
References: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The drm_atomic_get_new_private_obj_state() function returns NULL
on error path, drm_atomic_get_old_private_obj_state() function
returns NULL on error path, too, they does not return error pointers.

By the way, vc4_hvs_get_new/old_global_state() should return
ERR_PTR(-EINVAL), otherwise there will be null-ptr-defer issue,
such as follows:

In function vc4_atomic_commit_tail():
  |-- old_hvs_state = vc4_hvs_get_old_global_state(state); <-- return NULL
  |-- if (WARN_ON(IS_ERR(old_hvs_state))) <-- no return
  |-- unsigned long state_rate = max(old_hvs_state->core_clock_rate,
	new_hvs_state->core_clock_rate); <-- null-ptr-defer

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 5c97642ed66a..8fbeecdf2ec4 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -197,8 +197,8 @@ vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_new_private_obj_state(state, &vc4->hvs_channels);
-	if (IS_ERR(priv_state))
-		return ERR_CAST(priv_state);
+	if (!priv_state)
+		return ERR_PTR(-EINVAL);
 
 	return to_vc4_hvs_state(priv_state);
 }
@@ -210,8 +210,8 @@ vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
 	struct drm_private_state *priv_state;
 
 	priv_state = drm_atomic_get_old_private_obj_state(state, &vc4->hvs_channels);
-	if (IS_ERR(priv_state))
-		return ERR_CAST(priv_state);
+	if (!priv_state)
+		return ERR_PTR(-EINVAL);
 
 	return to_vc4_hvs_state(priv_state);
 }
-- 
2.25.1

