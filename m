Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F9F74E6F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjGKGNT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbjGKGNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:13:17 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ACFCE64
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:13:14 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso55797385e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055993; x=1691647993;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=ua13UnqckABF68hPbE6UQ667TIjzCruxMjbB+tXJdXEa5EnCIObMJPMAD1R6ih5FN+
         JSDlVQCQB2uLnwfDQ7ZFI5078E/gjT4swVWLVME+lexeTTp9f5Nwu5uD7ed0ZC9kHlun
         gOdU13Q336J1sSiOeGR+RIDHdUGw6fQ8WVZn1eFK++9PZA8LTuITH/cSh4tyuQURLHY5
         4uDMwuPJIyBzzcKmJurnxSzpG5uLLkRHUJoOjKBxHPVNihrOHgvrHyq11YOWUG9TuFUZ
         caxybXwFxRLKvH8iExuZLD6a9ctf4YWj3ODfdf2BSKfn4lu9qpFDOuTZOpcxRWapfihS
         iZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055993; x=1691647993;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=BId8wQzUEiJKkBXXi/qMgehmnwC2NFUkgJ8NebESrTZq6+lUu8iV8NBlXLYm/eW/Gy
         FKVEYdDrGZoCn2lzoDMGri88zkNhinKmuWKxOxN0DQCFzJr3rcu2LFlYrqH2QIX73iu/
         nKoSumds9qCUySv1P9IUUE7gXB/+nY1r0iIue+rEoqunMP9NFeClM4Xm23nS8JxghHgi
         GI4up04ComiYvdsCM9wM49yyQvTLtbRRaTbFLXbbuwe5rI1zrKRTnkOjZ9FUOzdWt1EC
         TooR4uDMiRXyWoOMN8Xvh9g4QDncjznSzSNiMIIyfRshHq9+Z7m/ZR5984ZMjmVQR8R8
         /XSw==
X-Gm-Message-State: ABy/qLbhAV1+9WU3i3aJ6MC6461h+Ikd6nMEiTLmH7rNIXmiEdzwa1zG
        onOnhiv4CFxvbqxvLarYZkxccg==
X-Google-Smtp-Source: APBJJlGcVeS8URI28QoRPtrIWEWXAZd+Ufs2ZNLU4RJde8pqFYDhqzEmnE1m+xncQYFNft/X/DotqA==
X-Received: by 2002:adf:e682:0:b0:315:a17d:dbc6 with SMTP id r2-20020adfe682000000b00315a17ddbc6mr3020069wrm.14.1689055993304;
        Mon, 10 Jul 2023 23:13:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb46000000b0030ae3a6be4asm1263546wrs.72.2023.07.10.23.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:13:12 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:13:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 5/5 v3] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If get_user_pages_fast() allocates some pages but not as many as we
wanted, then the current code leaks those pages.  Call put_page() on
the pages before returning.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
no change

 drivers/accel/qaic/qaic_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index d5ce36cb351f..9a6f80f31c65 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -425,9 +425,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 	}
 
 	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
-	if (ret < 0 || ret != nr_pages) {
-		ret = -EFAULT;
+	if (ret < 0)
 		goto free_page_list;
+	if (ret != nr_pages) {
+		nr_pages = ret;
+		ret = -EFAULT;
+		goto put_pages;
 	}
 
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
-- 
2.39.2

