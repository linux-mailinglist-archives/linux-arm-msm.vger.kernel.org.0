Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 994AB6F565E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 12:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbjECKlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 06:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjECKle (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 06:41:34 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A06C35A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 03:41:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3062678861fso2815321f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 03:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683110492; x=1685702492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHsnWChYQT1z+NaKAydFHIQbH8RXi8T5lYad1K4Txs0=;
        b=lGacC+qgxPocSkx1r674MI1CUDVr3KX2qyaKs/LsCsd9gQ/L9HAOC+KCgMpeAGwHgx
         XZ7GUfebWa4+59RX0Ga72c/xyzbT/7EpW4EaKXD8u97PwnF+mqnxGct/Yuh5MYQhKB2N
         U85TB8Ry2jIg/2qRWK+vm+tFOYJ82rfE84Uitj9E022wxbJqqugwo1jKuRfhU5WkEVpB
         JipQvWyKi3FFssIeYhpixXB1I9av0BbZ25sXKym5f9NV5gLDdlnvLrp2VALBlza0CP8q
         ZCOkrxihaH8Buw+PR4dgL19xmNf69WlnX4KUV4GpQ1IWgcilZzznXZIkWu5qQha0zI3A
         8//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110492; x=1685702492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHsnWChYQT1z+NaKAydFHIQbH8RXi8T5lYad1K4Txs0=;
        b=MfAb0TfgoYOHIfCfjgKsXnCZUE4tbGBz8YQiTPmX4u1e8CwQo87BnD8YM4TKaM7zHP
         kStgHfbU9O91eg1vum+jftu/+k4ZBk8JhPkIm8j1IAcFmFQRbBnQveCczp8EzzicUh+H
         W+t0kLKsWDU3SkOqL4gqpObs/5PzjX+12nMWTOiS/VCAGgfnnVUltvZQp0Aki0UBWf+I
         YBNXbvJwakdS4hvk8FYu+VOGBpKYwR0SFhqLdc/gNngVxXJd48+l88p+CbR2DOuVEEXQ
         fIXK/UbLTlcQoh6tMwA/WSgKqkAOBhuVmrnyeyMpEGmyEt3J3dv5YkieaZnmORVbuaHq
         6R9w==
X-Gm-Message-State: AC+VfDzm8I+pHie50j4lZ0aIGBg14pTbpirinmsg+pOyrdy74/XscUq9
        /NTgN6uXh40tXTqAxkbnStJgpQ==
X-Google-Smtp-Source: ACHHUZ4ALCcCvovKE4Kn+I+8rCSPqIU/QyVEb0IdNAZcF87Q/sIr8B4EDuni8XCKFY2XzWxIzm9ksw==
X-Received: by 2002:adf:ec04:0:b0:2f9:a798:602c with SMTP id x4-20020adfec04000000b002f9a798602cmr14969737wrn.12.1683110491914;
        Wed, 03 May 2023 03:41:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d574b000000b003049d7b9f4csm19417469wrw.32.2023.05.03.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:41:30 -0700 (PDT)
Date:   Wed, 3 May 2023 13:41:27 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Oded Gabbay <ogabbay@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/qaic: silence some uninitialized variable warnings
Message-ID: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Smatch complains that these are not initialized if get_cntl_version()
fails but we still print them in the debug message.  Not the end of
the world, but true enough.  Let's just initialize them to a dummy value
to make the checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index ff80eb571729..e10e8b603e37 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -263,7 +263,7 @@ static void qaic_destroy_drm_device(struct qaic_device *qdev, s32 partition_id)
 static int qaic_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
 {
 	struct qaic_device *qdev;
-	u16 major, minor;
+	u16 major = -1, minor = -1;
 	int ret;
 
 	/*
-- 
2.39.2

