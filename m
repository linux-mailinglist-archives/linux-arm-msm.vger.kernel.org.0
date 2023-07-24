Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D55775F0E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 11:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjGXJyR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 05:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233174AbjGXJx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 05:53:59 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DEE1FE7
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 02:50:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b7dfb95761so5878855ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690192170; x=1690796970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys9vBHKFvUQ64/r6xhiUU0Z6Ew/XYgW4RHIRDMT4d8M=;
        b=TLqdX6PCGs3QdF4rJk6Dp4mqvaSF7WZDWFKpkIQIK8x+Dm7L2v/Mmjuy/WWJJoDq3k
         4QTs2F3hk0gGhN8kj+Hfm6DAsPH66e1EubuHJaj3BSCQ2bDE7mtMLy3HQFnk3pG2qxGI
         mySJ8OPh5Ng4If1TjW3fRjGo1FnLHFlF9cOfMjspWTnq0qLhrPsLNbiUzYS8/krmBF6Z
         ip5YJEdLLkDL+5vWc2rL+XgbqKHQL8jbw+nlxR7I6M2XcMg9/1dcKhOJPvHQuFHMHPIp
         ARop1lFeh6w8Ne+wa7O3N2fKRYrV/3XKoHW5Uidkt6fMf+4L1gxMXNtlDdxeKPGfvdg6
         p11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690192170; x=1690796970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys9vBHKFvUQ64/r6xhiUU0Z6Ew/XYgW4RHIRDMT4d8M=;
        b=CQsztaB0WSEuXg4wIhS3ganPmlWA5Hak92TSUy/UpT4VvnRnfwrgKwi9F9B4DnkUAU
         rGfHw3QjH4mIe5l7aXzJrgIJlHxeFIzczFaO250jSejcObpZFKFG54xARv0MVu9XfThb
         bXRkagpKhHvRDM3/3LIB0OSIFSQqqJo/HcRDvQ1OrW3+j8byH2AXg1W3EPiFGC3nxFys
         3biDk+PFhLekZ2TeT3NeI7hckHcB68wa5KPAC0zWjy7e9n3YnO08JUczkCWsvk2HazRG
         SdAmEu6/p7NRmjXRs1qM22sscWSQstecLNuUR2cRzzeoVsJvbcuru4ipf1OgiQHqK3e5
         ieJA==
X-Gm-Message-State: ABy/qLaegyFc2HP/dhHtDE9h2WzJBPdYr0GRW5ibthqJhPAL02HO8zYW
        8/3ESbeuUsV8enIklRWCDfXSbw==
X-Google-Smtp-Source: APBJJlFkBw02O8PtVItEXpmJ/bGWM9sp4fUOmnYSOIyG9XuieUTiinrCv3H33MrLETZpz/mqqXfPcw==
X-Received: by 2002:a17:903:32c9:b0:1b8:5827:8763 with SMTP id i9-20020a17090332c900b001b858278763mr12116030plr.4.1690192170396;
        Mon, 24 Jul 2023 02:49:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 02:49:30 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
        vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
        brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
        steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
        yujie.liu@intel.com, gregkh@linuxfoundation.org,
        muchun.song@linux.dev
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
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 22/47] drm/i915: dynamically allocate the i915_gem_mm shrinker
Date:   Mon, 24 Jul 2023 17:43:29 +0800
Message-Id: <20230724094354.90817-23-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the i915_gem_mm shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct drm_i915_private.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 30 +++++++++++---------
 drivers/gpu/drm/i915/i915_drv.h              |  2 +-
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 214763942aa2..a7409b8c2634 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -284,8 +284,7 @@ unsigned long i915_gem_shrink_all(struct drm_i915_private *i915)
 static unsigned long
 i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct drm_i915_private *i915 =
-		container_of(shrinker, struct drm_i915_private, mm.shrinker);
+	struct drm_i915_private *i915 = shrinker->private_data;
 	unsigned long num_objects;
 	unsigned long count;
 
@@ -302,8 +301,8 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 	if (num_objects) {
 		unsigned long avg = 2 * count / num_objects;
 
-		i915->mm.shrinker.batch =
-			max((i915->mm.shrinker.batch + avg) >> 1,
+		i915->mm.shrinker->batch =
+			max((i915->mm.shrinker->batch + avg) >> 1,
 			    128ul /* default SHRINK_BATCH */);
 	}
 
@@ -313,8 +312,7 @@ i915_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
 static unsigned long
 i915_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
 {
-	struct drm_i915_private *i915 =
-		container_of(shrinker, struct drm_i915_private, mm.shrinker);
+	struct drm_i915_private *i915 = shrinker->private_data;
 	unsigned long freed;
 
 	sc->nr_scanned = 0;
@@ -422,12 +420,18 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
 
 void i915_gem_driver_register__shrinker(struct drm_i915_private *i915)
 {
-	i915->mm.shrinker.scan_objects = i915_gem_shrinker_scan;
-	i915->mm.shrinker.count_objects = i915_gem_shrinker_count;
-	i915->mm.shrinker.seeks = DEFAULT_SEEKS;
-	i915->mm.shrinker.batch = 4096;
-	drm_WARN_ON(&i915->drm, register_shrinker(&i915->mm.shrinker,
-						  "drm-i915_gem"));
+	i915->mm.shrinker = shrinker_alloc(0, "drm-i915_gem");
+	if (!i915->mm.shrinker) {
+		drm_WARN_ON(&i915->drm, 1);
+	} else {
+		i915->mm.shrinker->scan_objects = i915_gem_shrinker_scan;
+		i915->mm.shrinker->count_objects = i915_gem_shrinker_count;
+		i915->mm.shrinker->seeks = DEFAULT_SEEKS;
+		i915->mm.shrinker->batch = 4096;
+		i915->mm.shrinker->private_data = i915;
+
+		shrinker_register(i915->mm.shrinker);
+	}
 
 	i915->mm.oom_notifier.notifier_call = i915_gem_shrinker_oom;
 	drm_WARN_ON(&i915->drm, register_oom_notifier(&i915->mm.oom_notifier));
@@ -443,7 +447,7 @@ void i915_gem_driver_unregister__shrinker(struct drm_i915_private *i915)
 		    unregister_vmap_purge_notifier(&i915->mm.vmap_notifier));
 	drm_WARN_ON(&i915->drm,
 		    unregister_oom_notifier(&i915->mm.oom_notifier));
-	unregister_shrinker(&i915->mm.shrinker);
+	shrinker_unregister(i915->mm.shrinker);
 }
 
 void i915_gem_shrinker_taints_mutex(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 682ef2b5c7d5..389e8bf140d7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -163,7 +163,7 @@ struct i915_gem_mm {
 
 	struct notifier_block oom_notifier;
 	struct notifier_block vmap_notifier;
-	struct shrinker shrinker;
+	struct shrinker *shrinker;
 
 #ifdef CONFIG_MMU_NOTIFIER
 	/**
-- 
2.30.2

