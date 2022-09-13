Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2395B7B62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 21:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiIMTb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 15:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiIMTbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 15:31:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CD77173D;
        Tue, 13 Sep 2022 12:29:54 -0700 (PDT)
Received: from dimapc.. (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C157B660201D;
        Tue, 13 Sep 2022 20:29:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663097393;
        bh=33E5tVDHFxGXPr2cUF6T6eAWMoPvmkCLqaU2W4y9Eis=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X3Uefvf35jVDzgpjNp1P0cXlQM9d14IaIW5T1BImIwUQH1djUJ7RPUACwNYvD9YVS
         0dRJoZKFtxTLTZWeiyVQebfrqNdH93LaBU4bZZksRfg+LFInvgPlhZNdbpvYvYh1Jz
         qy5dghD6qCcTEnfdfNAUrxjfLpG4hXig4M1PPwlHrLB94ai59Anqdpo4++xvK1zHN5
         K6G3wAy+2xESKLYzir3nOL8wUA9KLaS7KVyN0qEGfY2iUYt/kjmody+79shWgmF23c
         QnNCXAJlOObFUbziCPzwhD+LRhSAgsfUpaXsOLrntiDXUoJyNVQKRzWP35RjwkQzDj
         xKnQAt5wOVc1Q==
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
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Ruhl Michael J <michael.j.ruhl@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        kernel@collabora.com, virtualization@lists.linux-foundation.org,
        linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 19/21] dma-buf: Document dynamic locking convention
Date:   Tue, 13 Sep 2022 22:27:55 +0300
Message-Id: <20220913192757.37727-20-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
References: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add documentation for the dynamic locking convention. The documentation
tells dma-buf API users when they should take the reservation lock and
when not.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 Documentation/driver-api/dma-buf.rst |  6 +++
 drivers/dma-buf/dma-buf.c            | 64 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index 36a76cbe9095..622b8156d212 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -119,6 +119,12 @@ DMA Buffer ioctls
 
 .. kernel-doc:: include/uapi/linux/dma-buf.h
 
+DMA-BUF locking convention
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/dma-buf/dma-buf.c
+   :doc: locking convention
+
 Kernel Functions and Structures Reference
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8821a3ad9530..c359bdbdf5be 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -795,6 +795,70 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
 	return sg_table;
 }
 
+/**
+ * DOC: locking convention
+ *
+ * In order to avoid deadlock situations between dma-buf exports and importers,
+ * all dma-buf API users must follow the common dma-buf locking convention.
+ *
+ * Convention for importers
+ *
+ * 1. Importers must hold the dma-buf reservation lock when calling these
+ *    functions:
+ *
+ *     - dma_buf_pin()
+ *     - dma_buf_unpin()
+ *     - dma_buf_map_attachment()
+ *     - dma_buf_unmap_attachment()
+ *     - dma_buf_vmap()
+ *     - dma_buf_vunmap()
+ *
+ * 2. Importers must not hold the dma-buf reservation lock when calling these
+ *    functions:
+ *
+ *     - dma_buf_attach()
+ *     - dma_buf_dynamic_attach()
+ *     - dma_buf_detach()
+ *     - dma_buf_export(
+ *     - dma_buf_fd()
+ *     - dma_buf_get()
+ *     - dma_buf_put()
+ *     - dma_buf_mmap()
+ *     - dma_buf_begin_cpu_access()
+ *     - dma_buf_end_cpu_access()
+ *     - dma_buf_map_attachment_unlocked()
+ *     - dma_buf_unmap_attachment_unlocked()
+ *     - dma_buf_vmap_unlocked()
+ *     - dma_buf_vunmap_unlocked()
+ *
+ * Convention for exporters
+ *
+ * 1. These &dma_buf_ops callbacks are invoked with unlocked dma-buf
+ *    reservation and exporter can take the lock:
+ *
+ *     - &dma_buf_ops.attach()
+ *     - &dma_buf_ops.detach()
+ *     - &dma_buf_ops.release()
+ *     - &dma_buf_ops.begin_cpu_access()
+ *     - &dma_buf_ops.end_cpu_access()
+ *
+ * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
+ *    reservation and exporter can't take the lock:
+ *
+ *     - &dma_buf_ops.pin()
+ *     - &dma_buf_ops.unpin()
+ *     - &dma_buf_ops.map_dma_buf()
+ *     - &dma_buf_ops.unmap_dma_buf()
+ *     - &dma_buf_ops.mmap()
+ *     - &dma_buf_ops.vmap()
+ *     - &dma_buf_ops.vunmap()
+ *
+ * 3. Exporters must hold the dma-buf reservation lock when calling these
+ *    functions:
+ *
+ *     - dma_buf_move_notify()
+ */
+
 /**
  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
-- 
2.37.3

