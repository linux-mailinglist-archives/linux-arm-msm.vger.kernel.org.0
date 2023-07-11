Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B6074E8EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 10:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjGKIVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 04:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGKIVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 04:21:20 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337209C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:21:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so61727635e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063677; x=1691655677;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=sNdncJFBQWQQHoBuyDo6nEnrz9dHPFyKME3hzDj1IFW+Oe+v7zgrzJTAL5xygdkm9E
         EDmIrvmOywHsTYUSlT5hMCo+dtaEIp+GAEeAcHtpcD60xyWBARQ8uXJ/hHbV5FIA8lIG
         FTi26w/cmcPxCDxGBzPZnzkX6n890G9ffwdxsFdI7MnSiectzhfLylsg7jW/81IllmrH
         pCg/Lni8M4xbPkNyRfWFmy6gY3ijd7CYyutJZCDL9+uv13+a2JT/If67dNSa9UPMXv30
         +EeMbu/1hp6juM26OoZl5ugUCMk7oxM55pVndPW0YSquNXNB1KF9FgOAUcKR06WI4qFV
         lWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063677; x=1691655677;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2awPYd3HXRNroCTB0hVa1fxOdnTXbZ1UrJBzoM/lTFw=;
        b=hpMhC0KMrI5fcwzSiA2h2EEN3X5JQr6XqW4UeFrOZygCNGUVoEqs03Cw41ocOpQiQz
         hiVDoWg71Fp1gRDF26ag6Sf2BpSewM+kPTi2LQfQOw6YrTwXmw4LVq8RG0iMV3B8C6UF
         aPGzfFhiwQPLG/wHPw7xVfQlAZqZYlQGRZ4AOAd21HnXjcLvzD+Sdujcr0aUKdSpt/1h
         ibzEn3G4ahw2JWhkbUrfsCjKRigwEM5GQK/Hd4TVLRwxj305dW9EiEgSMjkbaBAz2wnp
         cGDYS/FrUUDiw2vu3tw3vWJVGEXpCD7hqdHLx7v2xOUTAoWNnzPLXWjZelhAGQPEm08Z
         Ak8w==
X-Gm-Message-State: ABy/qLaEp7SEoNwLsMB8vm0UHw61Bz4hTK9cuBXyGkRmhg4Nlc0TIsMy
        Iu49+SBa7cEH2VAx89jqCBpm1DcGmRTcJZCc2nc=
X-Google-Smtp-Source: APBJJlF0sfiUbbYqGKeYHW/O/nho5Vvwq2P2b8qilFz9LEbAguLpt78XKqS7uFSN5tRMm3Cd+LFlrg==
X-Received: by 2002:a1c:f706:0:b0:3fb:b637:22a7 with SMTP id v6-20020a1cf706000000b003fbb63722a7mr16076656wmh.4.1689063677747;
        Tue, 11 Jul 2023 01:21:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c18-20020a7bc012000000b003fbd2a9e94asm1825480wmb.31.2023.07.11.01.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:21:16 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:21:13 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 5/5 v4] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <ZK0Q+ZuONTsBG+1T@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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

