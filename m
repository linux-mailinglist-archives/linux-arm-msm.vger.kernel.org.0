Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B447737C1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 09:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjFUHW1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 03:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjFUHW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 03:22:26 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57049183
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:22:25 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f918922954so32087445e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332144; x=1689924144;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LvoAnY92IhuYKxUcIFqiF0B336ukPa8jJhL/uMvwzE=;
        b=fqb+Lk5qFDdI8tsOo384wsahnjd07gLKH1f6HgdRNIZpDEu+zO/YTZuQ+XhyUm9pmz
         4wK6gc/xZRmxT+Km9H9lXKMZT2or6+NA5NV/jRz9cP6EmBe9LuOdxICsvgPUs2qXU9Uv
         C5lFzWsrnwKKWtNg0XXySJ/s4z5KGXWz9pXGESAOmufwh5ZplHXxaOjS4oO1KlEXpOy5
         RmhJ+ZatkFLeblkVSgBQwQc7S81DhxysHCXiI/Cs/wGlRSNMsNUaSRRM4/1YeJmJYQrr
         3noxF2mMjzVStM7K7wELhUlk6eCqHCXBXl2RNoiI1v4ZHKChof/0ugZk2t7Ue+bsE2N+
         6YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332144; x=1689924144;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LvoAnY92IhuYKxUcIFqiF0B336ukPa8jJhL/uMvwzE=;
        b=bRVoZe1RJPx9nQKmyMg0IRjpXDRZwQ+lsYQThJ3sx/sPggftNE6ZJEIG1OmZ0FCuT0
         XeasMZS5u9l8GVXZTqXonKddw8uHyonJBwzUjgz81Xm1CIkd0lYjNnvckX8GFFEUovwC
         xeXobSPe2s8M3WzSKnjECME4gUhIKJnmpyfNLCdVTG+x6dtbQHtugbdG7xZN9nNiLY+l
         9GAo3LbNjKvq6oHR06z7fzZ0iDLDjOrSq0g18W8EIhScCJWaTF5zQ2nVIkL6cH4uFq/h
         ZEJz+4njiYSLqMZO8hXztcwSd1qDgyrQK15A1JCWO1SPhmMP8YHhZWayNve09/x+/uo+
         bTpg==
X-Gm-Message-State: AC+VfDxctgxq9CtqwchYEvrm4x8dcDxiKyPKoBemp3mihHbbKTECcsh6
        9ZhEZfIox8mEDgV7CG4A60ku2Q==
X-Google-Smtp-Source: ACHHUZ4OLioLcbMLtIFKz0PjiB4ajmxMhMKaALqVWaK0zxD//PQ2N3/uhDiKEOVC0pJwRkD5gwXahA==
X-Received: by 2002:a05:600c:211a:b0:3f6:e59:c04c with SMTP id u26-20020a05600c211a00b003f60e59c04cmr10030649wml.24.1687332143848;
        Wed, 21 Jun 2023 00:22:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l5-20020a1ced05000000b003f70a7b4537sm15211480wmh.36.2023.06.21.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:22:22 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:22:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 4/5] accel/qaic: move and expand integer overflow checks for
 map_user_pages()
Message-ID: <435abccc-9251-4c27-9b35-8fdf4bbd2433@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The integer overflow checking for find_and_map_user_pages() was done in
encode_dma().  Presumably this was to do it before the allocation.  But
it's not super important that the failure path is a fast path and it
hurts readability to put the check so far from the where the variable is
used.

Move the check to find_and_map_user_pages() instead and add some more
additional potential integer overflow checks.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I kind of went to town adding integer overflow checks here.  Please,
review this extra carefully.

 drivers/accel/qaic/qaic_control.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 96a26539df18..03932197f1ac 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -401,6 +401,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
 
+	if (in_trans->size == 0 ||
+	    in_trans->addr + in_trans->size < in_trans->addr ||
+	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
+	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)
+		return -EINVAL;
+
 	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
 				  resources->xferred_dma_size, PAGE_SIZE);
 
@@ -563,9 +569,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 		     QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
-	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
-		return -EINVAL;
-
 	xfer = kmalloc(sizeof(*xfer), GFP_KERNEL);
 	if (!xfer)
 		return -ENOMEM;
-- 
2.39.2

