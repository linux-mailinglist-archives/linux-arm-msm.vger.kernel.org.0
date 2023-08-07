Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9730F7722C5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 13:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjHGLim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 07:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233065AbjHGLhw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 07:37:52 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7115359DC
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 04:34:37 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-268663fb09cso635071a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 04:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691408030; x=1692012830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=;
        b=fWE7ZZpfxre6cKLPJosewiAcjZvGGSEit8pb4JQphgF1TUE6haa7Np8azoFhdEVhSz
         7KwFImSmXZtx/mDZCi6YeE2+LUuIQrxaYK+ReiZ4hMteWiCVffJdNV7NQqZfZ9joCbt1
         1dV4t/LmtA2XkBt3k3y1I2FYmFkkbrn62fo+F/Y09WSKe85bLsZroXBELzqL6lNgr46T
         cZ6EQyM/fKpsa0M/VN3Rjhbs9weEo0P0srm8ebqqkh6Np16RSdBiaaHcVA4NcwmyLJmu
         xhY4ggpl2JDkvR/Gz7T8V01WXJxlqcLuXXkl0JlXqA078ztZe4sI59e7a1HQq0UHgVdd
         6xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691408030; x=1692012830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhs5C6wYTK112tB0Y3rKeCsMBEmGx3fQoCnqZ3HCCLA=;
        b=L2NRxz5Khnp7BH7lZogvPN4gvQR4ZhDEQ5NVthYWG5NaTOvcd5kRA6md2F0/3K7Wp4
         UXFrghhW5G5pzOkUZB1N68kKpAS7X7SgTw3l0BoyCkU9lBFDDNkZAPZxiNazUXF+OjC4
         ENr67H96dkKihuWXGbKAeVSC7NtNVej773MBwJqtd0t9lQ7Ppk6kSSH4zVI7h2zx32CA
         Jbe3IZNmMVu+aZWwwOvmf2iyok5suiqOGSBejdMxZvlBl9xkrj2MGQ5ahkHA2zTfVYdj
         n5nyycVrk/E0LZm7Wi3iAvDhTooEpoeHKEKf1YkWstXPBdJYA7Fhj+U4Ym2eVi4icjAU
         lO8w==
X-Gm-Message-State: ABy/qLawiYLYgwWuG7LbofgAjBDwcSDZETbm0jy15ZT+Qi01k8yodOda
        blzh3mwdz/Md90y36Wn8wL4UFpuAHtBV3jh9ack=
X-Google-Smtp-Source: AGHT+IF623rMYCfdnVm3rDQUM9QMv5wRA4teIiBc32f8XUPEVkH5VguN8eCSFu0xAaU5upe3gsVL9w==
X-Received: by 2002:a17:90a:6701:b0:269:32c7:24dc with SMTP id n1-20020a17090a670100b0026932c724dcmr6035493pjj.0.1691406994765;
        Mon, 07 Aug 2023 04:16:34 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:16:34 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
        vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
        brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
        steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
        yujie.liu@intel.com, gregkh@linuxfoundation.org,
        muchun.song@linux.dev, simon.horman@corigine.com,
        dlemoal@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-erofs@lists.ozlabs.org,
        linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
        linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
        rcu@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dm-devel@redhat.com, linux-raid@vger.kernel.org,
        linux-bcache@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 31/48] virtio_balloon: dynamically allocate the virtio-balloon shrinker
Date:   Mon,  7 Aug 2023 19:09:19 +0800
Message-Id: <20230807110936.21819-32-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the virtio-balloon shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct virtio_balloon.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 5b15936a5214..82e6087073a9 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -111,7 +111,7 @@ struct virtio_balloon {
 	struct virtio_balloon_stat stats[VIRTIO_BALLOON_S_NR];
 
 	/* Shrinker to return free pages - VIRTIO_BALLOON_F_FREE_PAGE_HINT */
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 	/* OOM notifier to deflate on OOM - VIRTIO_BALLOON_F_DEFLATE_ON_OOM */
 	struct notifier_block oom_nb;
@@ -816,8 +816,7 @@ static unsigned long shrink_free_pages(struct virtio_balloon *vb,
 static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 						  struct shrink_control *sc)
 {
-	struct virtio_balloon *vb = container_of(shrinker,
-					struct virtio_balloon, shrinker);
+	struct virtio_balloon *vb = shrinker->private_data;
 
 	return shrink_free_pages(vb, sc->nr_to_scan);
 }
@@ -825,8 +824,7 @@ static unsigned long virtio_balloon_shrinker_scan(struct shrinker *shrinker,
 static unsigned long virtio_balloon_shrinker_count(struct shrinker *shrinker,
 						   struct shrink_control *sc)
 {
-	struct virtio_balloon *vb = container_of(shrinker,
-					struct virtio_balloon, shrinker);
+	struct virtio_balloon *vb = shrinker->private_data;
 
 	return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
 }
@@ -847,16 +845,23 @@ static int virtio_balloon_oom_notify(struct notifier_block *nb,
 
 static void virtio_balloon_unregister_shrinker(struct virtio_balloon *vb)
 {
-	unregister_shrinker(&vb->shrinker);
+	shrinker_free(vb->shrinker);
 }
 
 static int virtio_balloon_register_shrinker(struct virtio_balloon *vb)
 {
-	vb->shrinker.scan_objects = virtio_balloon_shrinker_scan;
-	vb->shrinker.count_objects = virtio_balloon_shrinker_count;
-	vb->shrinker.seeks = DEFAULT_SEEKS;
+	vb->shrinker = shrinker_alloc(0, "virtio-balloon");
+	if (!vb->shrinker)
+		return -ENOMEM;
 
-	return register_shrinker(&vb->shrinker, "virtio-balloon");
+	vb->shrinker->scan_objects = virtio_balloon_shrinker_scan;
+	vb->shrinker->count_objects = virtio_balloon_shrinker_count;
+	vb->shrinker->seeks = DEFAULT_SEEKS;
+	vb->shrinker->private_data = vb;
+
+	shrinker_register(vb->shrinker);
+
+	return 0;
 }
 
 static int virtballoon_probe(struct virtio_device *vdev)
-- 
2.30.2

