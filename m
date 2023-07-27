Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1690764DE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 10:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjG0Ina (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 04:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbjG0Im4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 04:42:56 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EDB346E5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 01:26:10 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-583b0190db4so1033657b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690446357; x=1691051157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubpyp4SIhGXjO6/VTKiZvWjlRzyN8ANvKHVN5xSGnIw=;
        b=GaSOAIt4dbEOYCGEfnd4KfHHdg6KTIFNWBWSMv67ngfdMfOY6bTViBfwLkDb/Y0H4b
         noK7gK16VTgqFxGKh48o3m+wOSqKRzNvmfI3mIRp91XfHW7WVWdyLNoUiiWMvwOZqAgD
         C7FMJ9eiJ5HWbHBj5dbCOP+RdC1vwjVY7F3mQtIsQTjzdMk1nIE4PEkhBe8YHkePaXlB
         Y1Iv63hRaPpctLxWYGpHvdZJKmVQ4SW9iiJ2rrF8d49HWg+2ncDfltKyHbRGvLLipZAn
         kmBQ9w0O90Nueg7G1WxHXyyyRpeLVLZbrxtHPvGOyU1FcWys70C4wYQ8XkMbjezAncmw
         BRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690446357; x=1691051157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubpyp4SIhGXjO6/VTKiZvWjlRzyN8ANvKHVN5xSGnIw=;
        b=IW+2CJkBfajAUwcnrBbGnTNB8YfC9cPQXtUgGZOvN2qF5CqyOqWobuGoYNWvbUgfwI
         KJA/VJ/eb61bv2ckrvhW36zQC8JMBpkgg9J/jdU00DocCGI0wRoXiXvODk8McZzNGl4B
         wElwGcNR+TGX4QVYoB+zmM2cvqWctR6PvdDsHF7keNMrHiE9QJ24ljIm6Nl32ZU/iZw8
         Prbo3uuJM+7fGtMnyCaq6QrHTSAhSkmnPVMR6vlBzbKLIB8SIQyNGz2E0lDP8GyweBPa
         GvHb7fSkLi0hnoG+1CZUeGHN0sKNFSiZfqSQVT2eesAGMrq43IxSU/idtWfvVn0/ShiY
         dVEg==
X-Gm-Message-State: ABy/qLaVJiTcqzO1YNyX2xmfx8D0SSWQRkxAaiq8f7h7DRSnI4mdECu1
        oWM7/SwwJQU9r/u9LMjxSCqhmDDRXQGR8LEI/K4=
X-Google-Smtp-Source: APBJJlH8Hm//FCUnZvKJ1Fsda02AnYQWQqq2rUtStc8LnYU5/NdJ+w8F5lFLyohrr/NHLskzxbNOmQ==
X-Received: by 2002:a05:6a00:2d09:b0:682:59aa:178d with SMTP id fa9-20020a056a002d0900b0068259aa178dmr4647270pfb.1.1690445272018;
        Thu, 27 Jul 2023 01:07:52 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:07:51 -0700 (PDT)
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
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 10/49] erofs: dynamically allocate the erofs-shrinker
Date:   Thu, 27 Jul 2023 16:04:23 +0800
Message-Id: <20230727080502.77895-11-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use new APIs to dynamically allocate the erofs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/erofs/utils.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/erofs/utils.c b/fs/erofs/utils.c
index cc6fb9e98899..6e1a828e6ca3 100644
--- a/fs/erofs/utils.c
+++ b/fs/erofs/utils.c
@@ -270,19 +270,25 @@ static unsigned long erofs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
-static struct shrinker erofs_shrinker_info = {
-	.scan_objects = erofs_shrink_scan,
-	.count_objects = erofs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *erofs_shrinker_info;
 
 int __init erofs_init_shrinker(void)
 {
-	return register_shrinker(&erofs_shrinker_info, "erofs-shrinker");
+	erofs_shrinker_info = shrinker_alloc(0, "erofs-shrinker");
+	if (!erofs_shrinker_info)
+		return -ENOMEM;
+
+	erofs_shrinker_info->count_objects = erofs_shrink_count;
+	erofs_shrinker_info->scan_objects = erofs_shrink_scan;
+	erofs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(erofs_shrinker_info);
+
+	return 0;
 }
 
 void erofs_exit_shrinker(void)
 {
-	unregister_shrinker(&erofs_shrinker_info);
+	shrinker_free(erofs_shrinker_info);
 }
 #endif	/* !CONFIG_EROFS_FS_ZIP */
-- 
2.30.2

