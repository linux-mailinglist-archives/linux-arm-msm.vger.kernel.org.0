Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A38FE75F91D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 16:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjGXOAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 10:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjGXOAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 10:00:42 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCFAFF
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 07:00:40 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R8hcM0mrRz1KCD6;
        Mon, 24 Jul 2023 21:59:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:00:36 +0800
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
Subject: [PATCH v5 0/3] Fix IS_ERR() vs NULL check for drm
Date:   Mon, 24 Jul 2023 22:00:33 +0800
Message-ID: <20230724140036.1022676-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v5:
- Update the third patch, change IS_ERR to IS_ERR_OR_NULL.
  Thanks!

v4:
- 1. Update the second patch's commit messages.
  2. Update the first patch, use dev_err_probe() instead of dev_err().

  Thanks!

v3:
- Update the second patch:
  1. change IS_ERR to IS_ERR_OR_NULL
  2. add Dmitry's R-b in this revision:
  link: https://patchwork.freedesktop.org/patch/511035/?series=110745&rev=1

  Thanks!

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
  drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
  drm/komeda: Fix IS_ERR_OR_NULL() vs NULL check in
    komeda_component_get_avail_scaler()

 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c                      | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

