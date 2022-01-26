Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1404549CB93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 14:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241753AbiAZNyy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 08:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241737AbiAZNyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 08:54:40 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763C7C06176F
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:38 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id f17so25925769wrx.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 05:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKsf6dGO619i7ojy2wbleRyI3TRP+wgyPNagaXmtvTU=;
        b=c7yiZrG4/TyIvSNHYNZnb10q3lmZMebSVvAJlr3i5scF1Hj/EfHqt/z/P5a4ROFfKD
         X/HgALPBPiHcpqCGJO/MOhRCv+Pu6OyK1llbwcHnJHvHvgjLdP77TacG714tWZNxz4ox
         KEUsg396RWk1eZ+xniAh2m4X2ctOJb/cFnJ1HZ6HmJcz+8IMJrWfeydYDfoM8KYuy3aV
         y9VXFq0SDfmhdClORdVj6TNW/8YiUyTBR8XD5VTfyerOBtTWBoM0wPmfOju4u/nNWCY8
         jth/Ripzl5I52L6jb9Kh8aAVS+xJ5PIGg9AstgepmSP7RH8aI9TXJHqFxNEVqyeW5l5r
         w+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKsf6dGO619i7ojy2wbleRyI3TRP+wgyPNagaXmtvTU=;
        b=OQlt2Q96Ke26FCZuXI2OhrlVG6QkBAjOWC5TTaA/ycurLTUnpiYS2hhPXf3ktH9C7Y
         pnwf893Q85aJ+EA8UmoN1W7Qzbi0UJuwI1eHGyJ+3uJjo4/5V3USsZ28Q18c0UuFaQIq
         DJP6Q7luYdGIw7z/tBXVnZhOC3GwF0RWOQcOHKHpgFT+IPQA3QVFgEgNNFMdWTaIVSym
         x23FMpXmcYoorK/hQt1zOenBCGmhIfUhHFtYPaoAxV2WCHG86L8zAIs3MPLSTTp6wt6g
         YFf0tEDDWFa+p6YQ9oVbeje9iGqFpjLQ/KqDpNQeB9bcUBgWIRIx4zTarqiXJvAomSke
         laMQ==
X-Gm-Message-State: AOAM5330cX9pUZcBHGEpEK7c936EVH39eLjlu6qfNUPPbKZGqcny3icg
        eJIylZCEGzyjVITSJ4KQBO98Jw==
X-Google-Smtp-Source: ABdhPJzeRGH+zsgttK1iV0aSGOWXWhbvvWfYyqpBupgxLD/fRvNMwITNpQYK76Ot2fpf1trlYB0Vnw==
X-Received: by 2002:adf:f7cd:: with SMTP id a13mr7502095wrq.517.1643205277045;
        Wed, 26 Jan 2022 05:54:37 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id n15sm3356593wmr.26.2022.01.26.05.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 05:54:36 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 10/12] misc: fastrpc: Add fdlist implementation
Date:   Wed, 26 Jan 2022 13:53:02 +0000
Message-Id: <20220126135304.16340-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
References: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>

Add fdlist implementation to support dma handles. fdlist is populated by
DSP if any map is no longer used and it is freed during put_args.

Signed-off-by: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1c1815bed2c2..6052a9cb9e2c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -319,7 +319,8 @@ static void fastrpc_map_get(struct fastrpc_map *map)
 		kref_get(&map->refcount);
 }
 
-static int fastrpc_map_find(struct fastrpc_user *fl, int fd,
+
+static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 			    struct fastrpc_map **ppmap)
 {
 	struct fastrpc_map *map = NULL;
@@ -327,7 +328,6 @@ static int fastrpc_map_find(struct fastrpc_user *fl, int fd,
 	mutex_lock(&fl->mutex);
 	list_for_each_entry(map, &fl->maps, node) {
 		if (map->fd == fd) {
-			fastrpc_map_get(map);
 			*ppmap = map;
 			mutex_unlock(&fl->mutex);
 			return 0;
@@ -338,6 +338,17 @@ static int fastrpc_map_find(struct fastrpc_user *fl, int fd,
 	return -ENOENT;
 }
 
+static int fastrpc_map_find(struct fastrpc_user *fl, int fd,
+			    struct fastrpc_map **ppmap)
+{
+	int ret = fastrpc_map_lookup(fl, fd, ppmap);
+
+	if (!ret)
+		fastrpc_map_get(*ppmap);
+
+	return ret;
+}
+
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
@@ -410,7 +421,7 @@ static void fastrpc_context_free(struct kref *ref)
 	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
 	cctx = ctx->cctx;
 
-	for (i = 0; i < ctx->nscalars; i++)
+	for (i = 0; i < ctx->nbufs; i++)
 		fastrpc_map_put(ctx->maps[i]);
 
 	if (ctx->buf)
@@ -968,9 +979,19 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 			    u32 kernel)
 {
 	struct fastrpc_remote_arg *rpra = ctx->rpra;
-	int i, inbufs;
+	struct fastrpc_user *fl = ctx->fl;
+	struct fastrpc_map *mmap = NULL;
+	struct fastrpc_invoke_buf *list;
+	struct fastrpc_phy_page *pages;
+	u64 *fdlist;
+	int i, inbufs, outbufs, handles;
 
 	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
+	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
+	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
+	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
+	pages = fastrpc_phy_page_start(list, ctx->nscalars);
+	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
 
 	for (i = inbufs; i < ctx->nbufs; ++i) {
 		if (!ctx->maps[i]) {
@@ -987,6 +1008,13 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
 		}
 	}
 
+	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
+		if (!fdlist[i])
+			break;
+		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
+			fastrpc_map_put(mmap);
+	}
+
 	return 0;
 }
 
-- 
2.21.0

