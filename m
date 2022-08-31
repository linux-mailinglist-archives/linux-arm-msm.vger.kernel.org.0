Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2F55A8182
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 17:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbiHaPji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 11:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbiHaPjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 11:39:35 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138DDD9D45;
        Wed, 31 Aug 2022 08:39:31 -0700 (PDT)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C1B16601DF1;
        Wed, 31 Aug 2022 16:39:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661960370;
        bh=0d0E/K4G1VpCa944vVBlmjIzTakzf/Ny/1hT+JzAxgI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SSYw/8l7HkRDOU35x76FkU3THpRsV9TQ90B07NN0rXBmj1uULWKXKDb05m5kBcSV5
         2QMU/aHfsgznYxJoN8zVPOMXnpyBk81L1FdV+W+EClTphtQm6AcrWhh+r2SXcOhmFG
         Y2rIMZSTxL14ue9sv8oE5w3tcFwE5h75YcJyLZrMJDrACUeIiHPg8q5DNdXmxl6qIY
         ONFOO+57WajunpTHluO3XwimozfEbUjkuCkuNbGAqdQTKCISbQerJxhLwlnuvnsSHF
         fcCrB0xf3Y4e3YH3rvDzaDCPE5TnvhY4DhFpdnIn/cjdUV5Aw5nRI1Bbn0uOLVBmPS
         qulFOiJc2o4nw==
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Gert Wollny <gert.wollny@collabora.com>,
        Gustavo Padovan <gustavo.padovan@collabora.com>,
        Daniel Stone <daniel@fooishbar.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        Qiang Yu <yuq825@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christian Gmeiner <christian.gmeiner@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kernel@collabora.com, virtualization@lists.linux-foundation.org,
        linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 05/21] drm/armada: Prepare to dynamic dma-buf locking specification
Date:   Wed, 31 Aug 2022 18:37:41 +0300
Message-Id: <20220831153757.97381-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Prepare Armada driver to the common dynamic dma-buf locking convention
by starting to use the unlocked versions of dma-buf API functions.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/armada/armada_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 5430265ad458..26d10065d534 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -66,8 +66,8 @@ void armada_gem_free_object(struct drm_gem_object *obj)
 	if (dobj->obj.import_attach) {
 		/* We only ever display imported data */
 		if (dobj->sgt)
-			dma_buf_unmap_attachment(dobj->obj.import_attach,
-						 dobj->sgt, DMA_TO_DEVICE);
+			dma_buf_unmap_attachment_unlocked(dobj->obj.import_attach,
+							  dobj->sgt, DMA_TO_DEVICE);
 		drm_prime_gem_destroy(&dobj->obj, NULL);
 	}
 
@@ -539,8 +539,8 @@ int armada_gem_map_import(struct armada_gem_object *dobj)
 {
 	int ret;
 
-	dobj->sgt = dma_buf_map_attachment(dobj->obj.import_attach,
-					   DMA_TO_DEVICE);
+	dobj->sgt = dma_buf_map_attachment_unlocked(dobj->obj.import_attach,
+						    DMA_TO_DEVICE);
 	if (IS_ERR(dobj->sgt)) {
 		ret = PTR_ERR(dobj->sgt);
 		dobj->sgt = NULL;
-- 
2.37.2

