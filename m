Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABBC5BB06C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 17:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiIPPl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 11:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiIPPlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 11:41:23 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2203BAEDB1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:22 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bj12so50212184ejb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Lj5Qy7j6i9yUUDEm9MCuBWibYcbm/wliYlayeG3Sqfs=;
        b=eqqapHPooE3Ic6fOAG2r7DlrSEr4TXMYmciVXT38BnP0AjwrE4BAWjD88aPsBL7dJK
         7Kjc8lZnGzPcuGN1Szp7utcGquEJcTQJj+MhNLfucUZFPacI/upojZhRWPg/9PemEqM6
         lmyxWGbGdwCaLpdoW/kWYshBSmfwPFz//zx/8iYEepPEcbghYEFFAyiEJZ7hsMnOycb/
         D7EKAi9WtALUM0q1LeNtw2RkPnBWYpwwmjOi1NnEZ5VhCVcZSD8R5VaCQV460zai2iF2
         ejXOu0Om6tc58HpW7cvD61F14N0l3Mg6vYwId4zZUVDDQwey0MvwCQszHeXssM2HejvJ
         r2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Lj5Qy7j6i9yUUDEm9MCuBWibYcbm/wliYlayeG3Sqfs=;
        b=5AEI+jnMR9mKwH8MzZrLBYVt+/7gPaIN1w0cVwFxsiStyCGFqiCSxIN60oyncKQaZI
         T8MHlB6NXvk4AyJUHqyB1ZiKYL6wu5+lDGoDTa/WFsCst30494T7Bxe6K7EtYSHjQqpl
         xecSEi3DaI8X7cXz2LjD+6R7Dkmxm/qqPG8aYiWMOpbjZxZ7mccSyBZSOG+KFe6oor+C
         05jl3ir0tjAAswBk8BGZB4++X5q64nnoNiJXyu7LuDzk6pDZ8NWSre1RqM2YWpV/DS1r
         2YqBgX4NleAmbOiSz8MyJI2+rnpdPjW0RKOuzA9HyIUUVIo4o5u9l1xeJ9/REgHU+ZH3
         Oo5w==
X-Gm-Message-State: ACrzQf0Xb4TMUeev4PG9CesukUbTjGFOuqH1qnODmnwK2RA4yjqc+B04
        FWbkKhSUVpigZofVaj3aVkz3IA==
X-Google-Smtp-Source: AMsMyM78d4mfBSGV2VcyrDog5A0UNYzxzHi3lmAJzkky6t2kJs+8a/a7okZnIF6t/0p4x6R+huAl8w==
X-Received: by 2002:a17:907:6e8a:b0:780:7379:2c76 with SMTP id sh10-20020a1709076e8a00b0078073792c76mr3911670ejc.643.1663342880330;
        Fri, 16 Sep 2022 08:41:20 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062c0a00b0073d638a7a89sm10567707ejh.99.2022.09.16.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:41:19 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Himateja Reddy <hmreddy@quicinc.com>,
        Anirudh Raghavendra <araghave@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/9] misc: fastrpc: Use fastrpc_map_put in fastrpc_map_create on fail
Date:   Fri, 16 Sep 2022 18:40:57 +0300
Message-Id: <20220916154102.1768088-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916154102.1768088-1-abel.vesa@linaro.org>
References: <20220916154102.1768088-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the kref_init right after the allocation so that we can use
fastrpc_map_put on any following error case.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9e83743eaca1..0d9f1eb9a0ed 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -745,6 +745,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&map->node);
+	kref_init(&map->refcount);
+
 	map->fl = fl;
 	map->fd = fd;
 	map->buf = dma_buf_get(fd);
@@ -771,7 +773,6 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 	map->size = len;
 	map->va = sg_virt(map->table->sgl);
 	map->len = len;
-	kref_init(&map->refcount);
 
 	if (attr & FASTRPC_ATTR_SECUREMAP) {
 		/*
@@ -801,7 +802,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 attach_err:
 	dma_buf_put(map->buf);
 get_err:
-	kfree(map);
+	fastrpc_map_put(map);
 
 	return err;
 }
-- 
2.34.1

