Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB089751606
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 04:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjGMCGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 22:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbjGMCGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 22:06:05 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC25E1FEE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 19:05:59 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R1dGM1zd9zVjf9;
        Thu, 13 Jul 2023 10:04:43 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 10:05:56 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <liviu.dudau@arm.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>,
        <sam@ravnborg.org>, <quic_eberman@quicinc.com>,
        <a39.skl@gmail.com>, <quic_gurus@quicinc.com>,
        <cuigaosheng1@huawei.com>,
        <angelogioacchino.delregno@somainline.org>,
        <james.qian.wang@arm.com>
CC:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 0/3] Fix IS_ERR() vs NULL check for drm
Date:   Thu, 13 Jul 2023 10:05:53 +0800
Message-ID: <20230713020556.1956639-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2:
- I'm sorry I missed some emails, these patches were submitted last year,
  now let me resend it with the following changes:
  1. remove the patch: "drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in msm_icc_get()"
  2. remove the patch: "drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms"
  3. add "Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>" to the second patch.

  Thanks!

v1:
- This series contains a few fixup patches, to fix IS_ERR() vs NULL check
  for drm, and avoid a potential null-ptr-defer issue, too. Thanks!

Gaosheng Cui (3):
  drm/panel: Fix IS_ERR() vs NULL check in nt35950_probe()
  drm/msm: Fix IS_ERR() vs NULL check in a5xx_submit_in_rb()
  drm/komeda: Fix IS_ERR() vs NULL check in
    komeda_component_get_avail_scaler()

 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c                      | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1

