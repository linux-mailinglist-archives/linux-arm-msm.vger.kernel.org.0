Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AED4737C65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 09:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjFUHWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 03:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbjFUHWp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 03:22:45 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350E21A1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:22:44 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f9b258f3d8so25133195e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332162; x=1689924162;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz2evvxynfo3GpNLQFS4FwB3difDSTskdd0+liW6jTE=;
        b=DWjFbl9ja+2c9aIXWX3Oh9IqIpBzGQDkRm4zFFdPNcFa8siG6zB+EGrWIJ/7OTxOU+
         hfshTn5wArKKPiOka5N5SqyErZkho7Wb/PY27cS4+26IdiqLBQxEYGb9JeRkQ5rwuUr5
         POi1K2WtPHVwn0DTPek3aPCkF7gNV131a0W/3dAk54eHga883QzJZXegEasc2AaI1UII
         5Sd/Pzl8LWtTfPUNK2eYTxRuq+SXEji6uQBRILIAA8MiX6MTTjQKLfRdrzEyLf0sVRA3
         pNaGgYBwQmIfmIzeYo2PLV2zf1syWNu9FD5Q/V1vUne4VspEv2ud3hntSbFrnvLGWy01
         h+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332162; x=1689924162;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz2evvxynfo3GpNLQFS4FwB3difDSTskdd0+liW6jTE=;
        b=g612uVBOYPQYYsi0vlXgSPAgFdnb4l9Dmv33PizSO3vQzDUmGXWrEGjiEyfr8akxNw
         511KagDwz+PusOZlOk8FiPadwUoMqN9fSZi67MoaGYtldGiEYHpjXUiMTqfKzz8yDh4L
         Trh4j0nkUZxfBXm1E5UMrcnZZc3yuBdJ1lFGfgnbDwDw4dRw93h5tAg+C/hDWvwgLMI7
         4ItXUlgMlTXnPupHGJ4wSj3KzHpgfZeeGNIO4dq1wSFT+fqZCNcWBLCq1M7kZKahSwTF
         mOLNTtaBuqz8wKNUcrLU+hj/QFMstnyjr+Ds4TUH6UUky2vdf+NuHdXllGc/xKM/jugV
         BBiQ==
X-Gm-Message-State: AC+VfDxtzuafbOI6NQbxeFuDih/K7cusmDgNfUmoYOtFsY4qz0LLd9IN
        T28ouyydHT1p2ilLV/t4JUpGHQ==
X-Google-Smtp-Source: ACHHUZ53ONPx1oNStMjM74vkhEhb3eMLUz1J+VK37q5osvP2XR/IJPwufysddaekoV0Ufnicb76YQg==
X-Received: by 2002:a1c:cc07:0:b0:3f7:c92:57a0 with SMTP id h7-20020a1ccc07000000b003f70c9257a0mr13018372wmb.14.1687332162699;
        Wed, 21 Jun 2023 00:22:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y10-20020a5d4aca000000b0030ae6432504sm3687548wrs.38.2023.06.21.00.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:22:41 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:22:38 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 5/5] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <d04e5fc2-7b2b-4fb1-a9d7-17b55ecb9986@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af83549b-ccb4-4a8d-b036-9359eba9d39f@moroto.mountain>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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
 drivers/accel/qaic/qaic_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 03932197f1ac..7c3f9009617f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -424,9 +424,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
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

