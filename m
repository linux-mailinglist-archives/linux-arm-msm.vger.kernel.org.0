Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C099623EE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 10:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiKJJo5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 04:44:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbiKJJox (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 04:44:53 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5536A6B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:44:49 -0800 (PST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N7H442TPczRnxF;
        Thu, 10 Nov 2022 17:44:36 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 17:44:46 +0800
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
Subject: [PATCH 0/5] Fix IS_ERR() vs NULL check for drm
Date:   Thu, 10 Nov 2022 17:44:40 +0800
Message-ID: <20221110094445.2930509-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
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

This series contains a few fixup patches, to fix IS_ERR() vs NULL check
for drm, and avoid a potential null-ptr-defer issue, too. Thanks!

Gaosheng Cui (5):
  drm/panel: Fix IS_ERR() vs NULL check in nt35950_probe()
  drm/msm: Fix IS_ERR() vs NULL check in a5xx_submit_in_rb()
  drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in msm_icc_get()
  drm/komeda: Fix IS_ERR() vs NULL check in
    komeda_component_get_avail_scaler()
  drm/vc4: kms: Fix IS_ERR() vs NULL check for vc4_kms

 .../gpu/drm/arm/display/komeda/komeda_pipeline_state.c    | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c                     | 2 +-
 drivers/gpu/drm/msm/msm_io_utils.c                        | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c             | 2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                             | 8 ++++----
 5 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.25.1

