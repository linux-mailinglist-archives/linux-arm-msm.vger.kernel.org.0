Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA7D74E6F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjGKGNG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjGKGNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:13:05 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02109C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:13:04 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so54936755e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055982; x=1691647982;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxKFYbOeCPJfNoXrqBvsNS7aUlyz8/ToZjQNETQXPms=;
        b=FV97CtS+b2ivv2YRoRawAvvKMw4aLDa7Rm7BXE7rE3Rx9oKkP0hKVpGnlanhx9W4Md
         UNeGoquhfb66TgF0NvxLwG3gU1FDIa0WerFojuDRIocUcjdhpj1vTd0fPWnlilKDfdSY
         /di9GEWJlzXRPiTucNo2ocij0y/7vgoWuSqI1HAFtC7y5NqX/awQYh/ttw+QyI256Kz9
         1CqUVF0EdRS2WUj/HgHJ706fE8dFJPrrVSDb1OoNeQzRIxkFDn86T4JLJ372TGBBeXaa
         nNfik6T6DJ80R9Tx0TlnbzsIk2rVCMI0Apym+bBILOB4qR9VZZerFRyqa5+ZLbw9WmH9
         bi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055982; x=1691647982;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxKFYbOeCPJfNoXrqBvsNS7aUlyz8/ToZjQNETQXPms=;
        b=Qz7qgO8lIznSg749D0YuEQCFBWXonRVyh8vkUm2frGwoUI03tvg4rmLM4zX4Bhg1Xc
         i80lAgTn2ES/MtW6Dt0Hc9x4F35lWGl4eNVHHSn/eVPv8y7yiPwxlBzcx/9pkvRA0+MX
         NhEaWps/vYyYPOfU71Zlb70j9ThfS68091/lsiO6+BtuW84wrVoH27uWcT8fnwBMfJMp
         UUgZkLLPSjbSoDtIORhY9G72b5mpgvvgj4CgzL0HVKAh7vLYuQXQLZvzlQjay1V4q//q
         pRS8f74RozMwCqMkNkE0eEVSg5cbWGawcGnyckBEs2VaM5uUxijovk5RhcSpgecKnKmL
         k5fQ==
X-Gm-Message-State: ABy/qLZusbr5WAQI0bIQfu58O4PwEcfPLn3CS1hFR3M1Vve4XcLsVAb7
        L36ddt6+nQ5xhaEsr+ReBN/VCA==
X-Google-Smtp-Source: APBJJlFf+n6TNNYgruOps7eyqyNXpCn3snxsTrK5DfRFZuDu9k9jIoV4xxu6En2qffZVVMji6acx6g==
X-Received: by 2002:a1c:ed07:0:b0:3fb:d68d:4c6f with SMTP id l7-20020a1ced07000000b003fbd68d4c6fmr15023175wmh.14.1689055982600;
        Mon, 10 Jul 2023 23:13:02 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm10890231wmr.46.2023.07.10.23.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:13:01 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:12:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 4/5 v3] accel/qaic: move and expand integer overflow checks
 for map_user_pages()
Message-ID: <2efbbfb0-ca61-49eb-9347-04d8d00f87e1@moroto.mountain>
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
no change

 drivers/accel/qaic/qaic_control.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 23680f5f1902..d5ce36cb351f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -402,6 +402,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
 
 	xfer_start_addr = in_trans->addr + resources->xferred_dma_size;
 
+	if (in_trans->size == 0 ||
+	    in_trans->addr + in_trans->size < in_trans->addr ||
+	    in_trans->addr + resources->xferred_dma_size < in_trans->addr ||
+	    in_trans->size + offset_in_page(xfer_start_addr) < resources->xferred_dma_size)
+		return -EINVAL;
+
 	need_pages = DIV_ROUND_UP(in_trans->size + offset_in_page(xfer_start_addr) -
 				  resources->xferred_dma_size, PAGE_SIZE);
 
@@ -564,9 +570,6 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
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

