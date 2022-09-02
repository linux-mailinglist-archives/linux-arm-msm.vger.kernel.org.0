Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55CB85AB192
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237421AbiIBNhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbiIBNgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:36:20 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96A4C1229
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:15:32 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e20so2245003wri.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=blbmrFpJ9v4eZ8XtVb/9BQ24QeOnYxz1Q7arIgGoVBE=;
        b=JkMK5OzLYFHwYGJkH+rJgVL2TXyIeszHxwCz+5aDOVBJPPpq8XrVl8OYIuQHSxSCJp
         BLEbXQX3r5/3pXknb0xdPg5cOJel8nLrsAvMuqpDIewgODYkKZWHacnjrIg3mHVOWPZq
         CivERmwWkfqGEsMo40rqUtArQztACHGG4RW6ZsInO7ONCw+m4MyEbvK6D22gYgkjfwl3
         ru1v3hjmip+LvvyOl41JtMwfGqIyk2Wzz6lCRmRl6fNZnqtljNqSvV1bR07faw2JQMxt
         XmHgO9JNrtOng4XeOCrl3Oi87G+U8JCbC1CrsswSR+wIH7tDJsKMGr0syzI0zFaBXFHx
         0l8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=blbmrFpJ9v4eZ8XtVb/9BQ24QeOnYxz1Q7arIgGoVBE=;
        b=Tuz/aqAZYzd06PxIw/Z/tyrfYGh8gRqr2iwqdWL3ouAXY5p7ptMcbuo++Bsc7yjS5z
         p2IuIh4F0Zf9HMC3mpDD8Mi/4b9pyosuRuCqnC/v8BOOEtaPZiZdor0xIlUMSaoulRUD
         jbuJZ4rNhbN4uPetw7zfFbc0/rarU/pW+Vhfuk3pLEEOyzElm4WrsOKBNhVVNF+p7xeG
         voXKbjnB+yH3iVCSnVlaQiiKoMeLUPffFk4t/rPD+sFMu2KtaGMD4N53L4BL4qyO8ko/
         sMENz5VHVi2zIa/JQZ69uDu3FLqv/46OPdAFlRTFcQu4CDwVEZALwsp5dIMIIiN8WW3E
         /g1g==
X-Gm-Message-State: ACgBeo1w8Wr4Y9IAFcZhqUD6mWXScH56sFp8bRaDknz8c7W9xAnRevGx
        SmjwOiw5/k6YzLRPPhHdYAz1d//nbdbgynlE
X-Google-Smtp-Source: AA6agR635/f4JPmMaovAepr83BQhxnemnllSa7fgOEtLDvqVJBZAPT36PfDqSGdGiT/AsgWwDvBDoQ==
X-Received: by 2002:a5d:47a6:0:b0:228:473c:b84b with SMTP id 6-20020a5d47a6000000b00228473cb84bmr1178709wrb.556.1662124464603;
        Fri, 02 Sep 2022 06:14:24 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:23 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ola Jeppsson <ola@snap.com>
Subject: [PATCH 03/14] misc: fastrpc: Fix use-after-free race condition for maps
Date:   Fri,  2 Sep 2022 16:13:33 +0300
Message-Id: <20220902131344.3029826-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902131344.3029826-1-abel.vesa@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ola Jeppsson <ola@snap.com>

It is possible that in between calling fastrpc_map_get() until
map->fl->lock is taken in fastrpc_free_map(), another thread can call
fastrpc_map_lookup() and get a reference to a map that is about to be
deleted.

Rewrite fastrpc_map_get() to only increase the reference count of a map
if it's non-zero. Propagate this to callers so they can know if a map is
about to be deleted.

Fixes this warning:
refcount_t: addition on 0; use-after-free.
WARNING: CPU: 5 PID: 10100 at lib/refcount.c:25 refcount_warn_saturate
...
Call trace:
 refcount_warn_saturate
 [fastrpc_map_get inlined]
 [fastrpc_map_lookup inlined]
 fastrpc_map_create
 fastrpc_internal_invoke
 fastrpc_device_ioctl
 __arm64_sys_ioctl
 invoke_syscall

Signed-off-by: Ola Jeppsson <ola@snap.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 50c17f5da3a8..58654d394d17 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -332,10 +332,12 @@ static void fastrpc_map_put(struct fastrpc_map *map)
 		kref_put(&map->refcount, fastrpc_free_map);
 }
 
-static void fastrpc_map_get(struct fastrpc_map *map)
+static int fastrpc_map_get(struct fastrpc_map *map)
 {
-	if (map)
-		kref_get(&map->refcount);
+	if (!map)
+		return -ENOENT;
+
+	return kref_get_unless_zero(&map->refcount) ? 0 : -ENOENT;
 }
 
 
-- 
2.34.1

