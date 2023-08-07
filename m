Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61798772241
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 13:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjHGLbF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 07:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbjHGLad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 07:30:33 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D22735B6
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 04:27:11 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-76cee0a4b70so19127785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691407583; x=1692012383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfFRGPeE2ZLo8C9JFiR7wWvNCzDdrS4O9P7I0rwozQE=;
        b=OFl03a0vmrFPq/13GzMB/yLiR6giOLDnbyihc8TThoj9MU0wea8wfcQksauT6ixlOr
         Lw9p0bgMb//O+SCumnBYZzuNpSMslLQsya8KlwpwqBuTtwXHbR71GJg3DG4zTAaMOk5N
         C2DkOhAIg2ssfEnOwX8eBvRSRVL76GLXiF7zqnrO7KDreun4X3Im9lLb+MF6AnaPfSvM
         a5A5a9sgpSKIgcvuWCiyxB88tgLatgQliTMBvEXKYJ0mM4/lHqTQ8jvzA/8DFzHUR5GV
         VI3jD8FXEIVbQeEbjCtarDWdjvuv6gbTUxoZy/yup48TvEGKutDMoJ1l8asaKKnmiosE
         JSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407583; x=1692012383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfFRGPeE2ZLo8C9JFiR7wWvNCzDdrS4O9P7I0rwozQE=;
        b=eJV3D7hEYf0+gBPHN5SN3Y/BEPFjU+Y7fYm7/DueDx9cAL04kchbLxsYRpSjdrbMxL
         Qcw7fsisIHQMSR3bblEMzs9GG7fDDDq4XPrTnEs6xKf8DKDulWcMlnZyKD18eZjfBCdD
         GF4QmmNLWrWJJZRihvg2S9a9Dl2bMUoZc+A25+WEVnnf4bmrAohi+snqAOY4bWajLJdV
         E3AW3dmrztiUT+MjLVSfUti98qitLOikwZhCZxQeGYyVvFUO/LEiJvc2uSV2sLIZhskz
         h7/POZW53Ktx2q0I9jlm9EcFDguSbu1J/NbnIbMGMQetNekHQkrt6h+9skZ5nu5ab+4c
         9TaA==
X-Gm-Message-State: ABy/qLY+HFBpG2/N5NjxjlECSv/10Vu/lpDYDWZf797OA8kwPHT5ElZ4
        KQqUmGBpQJYDL0Jy1HJZoFJWV9V6y19obEhI9Z8=
X-Google-Smtp-Source: APBJJlFKEuLPG6rXvjHQ/xhYlF3mJA1G+qTCCufEjWmHi053bG2lxjJC7FtDeUsrnl72QxE+YEuj1g==
X-Received: by 2002:a17:902:d503:b0:1bb:83ec:832 with SMTP id b3-20020a170902d50300b001bb83ec0832mr32625772plg.2.1691406854020;
        Mon, 07 Aug 2023 04:14:14 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:14:13 -0700 (PDT)
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
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 20/48] mm: thp: dynamically allocate the thp-related shrinkers
Date:   Mon,  7 Aug 2023 19:09:08 +0800
Message-Id: <20230807110936.21819-21-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
shrinkers.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 24 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 947001a7cd42..5d0c7a0b651c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags __read_mostly =
 	(1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
 	(1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
 
-static struct shrinker deferred_split_shrinker;
+static struct shrinker *deferred_split_shrinker;
+static unsigned long deferred_split_count(struct shrinker *shrink,
+					  struct shrink_control *sc);
+static unsigned long deferred_split_scan(struct shrinker *shrink,
+					 struct shrink_control *sc);
 
 static atomic_t huge_zero_refcount;
 struct page *huge_zero_page __read_mostly;
@@ -229,11 +233,7 @@ static unsigned long shrink_huge_zero_page_scan(struct shrinker *shrink,
 	return 0;
 }
 
-static struct shrinker huge_zero_page_shrinker = {
-	.count_objects = shrink_huge_zero_page_count,
-	.scan_objects = shrink_huge_zero_page_scan,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *huge_zero_page_shrinker;
 
 #ifdef CONFIG_SYSFS
 static ssize_t enabled_show(struct kobject *kobj,
@@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct kobject *hugepage_kobj)
 }
 #endif /* CONFIG_SYSFS */
 
+static int __init thp_shrinker_init(void)
+{
+	huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
+	if (!huge_zero_page_shrinker)
+		return -ENOMEM;
+
+	deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
+						 SHRINKER_MEMCG_AWARE |
+						 SHRINKER_NONSLAB,
+						 "thp-deferred_split");
+	if (!deferred_split_shrinker) {
+		shrinker_free(huge_zero_page_shrinker);
+		return -ENOMEM;
+	}
+
+	huge_zero_page_shrinker->count_objects = shrink_huge_zero_page_count;
+	huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
+	huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
+	shrinker_register(huge_zero_page_shrinker);
+
+	deferred_split_shrinker->count_objects = deferred_split_count;
+	deferred_split_shrinker->scan_objects = deferred_split_scan;
+	deferred_split_shrinker->seeks = DEFAULT_SEEKS;
+	shrinker_register(deferred_split_shrinker);
+
+	return 0;
+}
+
+static void __init thp_shrinker_exit(void)
+{
+	shrinker_free(huge_zero_page_shrinker);
+	shrinker_free(deferred_split_shrinker);
+}
+
 static int __init hugepage_init(void)
 {
 	int err;
@@ -482,12 +516,9 @@ static int __init hugepage_init(void)
 	if (err)
 		goto err_slab;
 
-	err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
-	if (err)
-		goto err_hzp_shrinker;
-	err = register_shrinker(&deferred_split_shrinker, "thp-deferred_split");
+	err = thp_shrinker_init();
 	if (err)
-		goto err_split_shrinker;
+		goto err_shrinker;
 
 	/*
 	 * By default disable transparent hugepages on smaller systems,
@@ -505,10 +536,8 @@ static int __init hugepage_init(void)
 
 	return 0;
 err_khugepaged:
-	unregister_shrinker(&deferred_split_shrinker);
-err_split_shrinker:
-	unregister_shrinker(&huge_zero_page_shrinker);
-err_hzp_shrinker:
+	thp_shrinker_exit();
+err_shrinker:
 	khugepaged_destroy();
 err_slab:
 	hugepage_exit_sysfs(hugepage_kobj);
@@ -2834,7 +2863,7 @@ void deferred_split_folio(struct folio *folio)
 #ifdef CONFIG_MEMCG
 		if (memcg)
 			set_shrinker_bit(memcg, folio_nid(folio),
-					 deferred_split_shrinker.id);
+					 deferred_split_shrinker->id);
 #endif
 	}
 	spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
@@ -2908,14 +2937,6 @@ static unsigned long deferred_split_scan(struct shrinker *shrink,
 	return split;
 }
 
-static struct shrinker deferred_split_shrinker = {
-	.count_objects = deferred_split_count,
-	.scan_objects = deferred_split_scan,
-	.seeks = DEFAULT_SEEKS,
-	.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
-		 SHRINKER_NONSLAB,
-};
-
 #ifdef CONFIG_DEBUG_FS
 static void split_huge_pages_all(void)
 {
-- 
2.30.2

