Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 046AE5AB543
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 17:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236908AbiIBPco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 11:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236548AbiIBPcY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 11:32:24 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4F729828
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 08:15:00 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b5so2722691wrr.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7Woa6saHlcsqIiHSXMMSyYnI6pEpe3JjUt9ToPHjSVc=;
        b=zvTQisGu7Utjpmg7NStfiBPYJGrLEtYn4b2DMeUfX2NFLX3/z+Mv0dXr5OlYgoqt7L
         oMzsQ0fhUGYvi0KdkycR04vYJbUzKI/NoZWzzYTVqFFdc3tleFmPiKo2d3ymZCgzJRbV
         dmTrgjfAGhddobhhTCJxDpYHydYF6VR1+T0EV9NLaq8YWSDf2oCO2VOrXQCmckTS7/9G
         H9z7A4sQgtFuWcYPw2w8ExFxSo0OmrC2cHyLCapJJW6cu5nVr7U58PU5WXzeVnUenYUf
         q/fkWnQBp5ZBf+fj9HLeKuvJwI1SqyJuXhubFkDYvRvR3GIfug8dGkDrY3j8mcghqEuq
         RLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7Woa6saHlcsqIiHSXMMSyYnI6pEpe3JjUt9ToPHjSVc=;
        b=WyU5flgclt4mpi4xR87BkhKkuI7uIo4oX2rjxP4TVpG748ZDHZQOAUMuznjeDCQhqO
         m3CEf5RtEP7uY9Q2w7RbbR4NJLMjdW2Roj77Yupsxh8XEkJU0/L6X3wC+Auc80xvxzJq
         3NW7I3BDUapwUw6ZthdP00+wQ4/jPeqt/oKSJ+ZsqmWlZ9IzSjIVW047r/UD79sOhkl7
         hItVBHT5XjdypVTnD49/yRAlaEvgxYLfrs2YW+DTaLh2FuwZm7vZLCmnwpUuhY/hczka
         DvpyMl8ZrUFM0AEwd8SpofPBBq1r73ea4LW6PzKEVhDRV6YIorK206KkeHktv9xIst6L
         qDXg==
X-Gm-Message-State: ACgBeo2/a8Yv+WLFl8ywsm8rSm98OeuNR7C+KbocU0x8Xh2Sr55yP2yI
        KITKRwP1kueW4TmFwdnkSRSm8Q==
X-Google-Smtp-Source: AA6agR47s6LZ7URck0z+aWYLm4j0Hqze93FHpXJcyDcX7Npe9C2JConVK4hs9FfI9+mXKSM6lA+1DQ==
X-Received: by 2002:adf:dec9:0:b0:226:e033:c048 with SMTP id i9-20020adfdec9000000b00226e033c048mr12330529wrn.577.1662131699369;
        Fri, 02 Sep 2022 08:14:59 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c014a00b003a4efb794d7sm2361493wmm.36.2022.09.02.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 08:14:58 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ola Jeppsson <ola@snap.com>
Subject: [PATCH 1/3] misc: fastrpc: Fix use-after-free and race in fastrpc_map_find
Date:   Fri,  2 Sep 2022 18:14:21 +0300
Message-Id: <20220902151423.3351414-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Currently, there is a race window between the point when the mutex is
unlocked in fastrpc_map_lookup and the reference count increasing
(fastrpc_map_get) in fastrpc_map_find, which can also lead to
use-after-free.

So lets merge fastrpc_map_find into fastrpc_map_lookup which allows us
to both protect the maps list by also taking the &fl->lock spinlock and
the reference count, since the spinlock will be released only after.
Add take_ref argument to make this suitable for all callers.

Fixes: 8f6c1d8c4f0c ("misc: fastrpc: Add fdlist implementation")
Co-developed-by: Ola Jeppsson <ola@snap.com>
Signed-off-by: Ola Jeppsson <ola@snap.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 93ebd174d848..0c816a11eeec 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -333,30 +333,31 @@ static void fastrpc_map_get(struct fastrpc_map *map)
 
 
 static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
-			    struct fastrpc_map **ppmap)
+			    struct fastrpc_map **ppmap, bool take_ref)
 {
+	struct fastrpc_session_ctx *sess = fl->sctx;
 	struct fastrpc_map *map = NULL;
+	int ret = -ENOENT;
 
-	mutex_lock(&fl->mutex);
+	spin_lock(&fl->lock);
 	list_for_each_entry(map, &fl->maps, node) {
-		if (map->fd == fd) {
-			*ppmap = map;
-			mutex_unlock(&fl->mutex);
-			return 0;
-		}
-	}
-	mutex_unlock(&fl->mutex);
-
-	return -ENOENT;
-}
+		if (map->fd != fd)
+			continue;
 
-static int fastrpc_map_find(struct fastrpc_user *fl, int fd,
-			    struct fastrpc_map **ppmap)
-{
-	int ret = fastrpc_map_lookup(fl, fd, ppmap);
+		if (take_ref) {
+			ret = fastrpc_map_get(map);
+			if (ret) {
+				dev_dbg(sess->dev, "%s: Failed to get map fd=%d ret=%d\n",
+					__func__, fd, ret);
+				break;
+			}
+		}
 
-	if (!ret)
-		fastrpc_map_get(*ppmap);
+		*ppmap = map;
+		ret = 0;
+		break;
+	}
+	spin_unlock(&fl->lock);
 
 	return ret;
 }
@@ -703,7 +704,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
 	struct fastrpc_map *map = NULL;
 	int err = 0;
 
-	if (!fastrpc_map_find(fl, fd, ppmap))
+	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
 		return 0;
 
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
@@ -1026,7 +1027,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
 		if (!fdlist[i])
 			break;
-		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
+		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
 			fastrpc_map_put(mmap);
 	}
 
-- 
2.34.1

