Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C9B623EE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 10:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiKJJpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 04:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbiKJJox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 04:44:53 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2B711A12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:44:51 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N7H436vQRz15MWQ;
        Thu, 10 Nov 2022 17:44:35 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:44:48 +0800
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
Subject: [PATCH 3/5] drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in msm_icc_get()
Date:   Thu, 10 Nov 2022 17:44:43 +0800
Message-ID: <20221110094445.2930509-4-cuigaosheng1@huawei.com>
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

The of_icc_get() function returns NULL or error pointers on error path,
so we should use IS_ERR_OR_NULL() to check the return value.

Fixes: 5ccdcecaf8f7 ("drm/msm: lookup the ICC paths in both mdp5/dpu and mdss devices")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/msm/msm_io_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index d02cd29ce829..950083b2f092 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -133,7 +133,7 @@ struct icc_path *msm_icc_get(struct device *dev, const char *name)
 	struct icc_path *path;
 
 	path = of_icc_get(dev, name);
-	if (path)
+	if (IS_ERR_OR_NULL(path))
 		return path;
 
 	/*
-- 
2.25.1

