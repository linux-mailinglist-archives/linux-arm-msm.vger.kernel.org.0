Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9E6A77519C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 05:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbjHIDps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 23:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjHIDpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 23:45:43 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207911BC3;
        Tue,  8 Aug 2023 20:45:42 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLGB70k3szVklh;
        Wed,  9 Aug 2023 11:43:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:45:35 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
        <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <harry.wentland@amd.com>,
        <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <inki.dae@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <bskeggs@redhat.com>,
        <kherbst@redhat.com>, <lyude@redhat.com>, <kraxel@redhat.com>,
        <gurchetansingh@chromium.org>, <olvaffe@gmail.com>,
        <paulo.miguel.almeida.rodenas@gmail.com>, <wenjing.liu@amd.com>,
        <haoping.liu@amd.com>, <Charlene.Liu@amd.com>,
        <chiahsuan.chung@amd.com>, <george.shen@amd.com>,
        <sancchen@amd.com>, <tony.tascioglu@amd.com>,
        <jaehyun.chung@amd.com>, <tales.aparecida@gmail.com>,
        <drv@mailo.com>, <aurabindo.pillai@amd.com>,
        <quic_vpolimer@quicinc.com>, <jiasheng@iscas.ac.cn>,
        <noralf@tronnes.org>, <jose.exposito89@gmail.com>,
        <javierm@redhat.com>, <mairacanal@riseup.net>,
        <davidgow@google.com>, <arthurgrillo@riseup.net>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <nouveau@lists.freedesktop.org>,
        <virtualization@lists.linux-foundation.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 7/7] drm: Remove unnecessary NULL values
Date:   Wed, 9 Aug 2023 11:44:45 +0800
Message-ID: <20230809034445.434902-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The NULL initialization of the pointers assigned by kzalloc() first is
not necessary, because if the kzalloc() failed, the pointers will be
assigned NULL, otherwise it works as usual. so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/drm_agpsupport.c          | 2 +-
 drivers/gpu/drm/drm_atomic_uapi.c         | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c   | 2 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index a4ad6fd13abc..158709849481 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -384,7 +384,7 @@ int drm_legacy_agp_free_ioctl(struct drm_device *dev, void *data,
 struct drm_agp_head *drm_legacy_agp_init(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct drm_agp_head *head = NULL;
+	struct drm_agp_head *head;
 
 	head = kzalloc(sizeof(*head), GFP_KERNEL);
 	if (!head)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 98d3b10c08ae..5a433af75132 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -942,7 +942,7 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 static struct drm_pending_vblank_event *create_vblank_event(
 		struct drm_crtc *crtc, uint64_t user_data)
 {
-	struct drm_pending_vblank_event *e = NULL;
+	struct drm_pending_vblank_event *e;
 
 	e = kzalloc(sizeof *e, GFP_KERNEL);
 	if (!e)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index ea9f66037600..419d0afccdb9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -695,7 +695,7 @@ static int exynos_drm_ipp_task_setup_buffers(struct exynos_drm_ipp_task *task,
 static int exynos_drm_ipp_event_create(struct exynos_drm_ipp_task *task,
 				 struct drm_file *file_priv, uint64_t user_data)
 {
-	struct drm_pending_exynos_ipp_event *e = NULL;
+	struct drm_pending_exynos_ipp_event *e;
 	int ret;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..9accb2a12719 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -789,7 +789,7 @@ nv17_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_encoder *encoder;
-	struct nv17_tv_encoder *tv_enc = NULL;
+	struct nv17_tv_encoder *tv_enc;
 
 	tv_enc = kzalloc(sizeof(*tv_enc), GFP_KERNEL);
 	if (!tv_enc)
-- 
2.34.1

