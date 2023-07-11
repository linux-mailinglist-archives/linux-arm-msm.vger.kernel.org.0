Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A87774E8E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 10:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjGKIVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 04:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjGKIVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 04:21:10 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49A5E74
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:21:06 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-31590e4e27aso2775096f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063665; x=1691655665;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
        b=NoUPMC6dZeoMa8/E+BW4bns/yzCS0r1fbf8fMVW/3pn/55f1coshgfIRntvLgKepPU
         UmXlRW5EmUaoEYdNzZ6Mrr6jQ9ST+5BL/E7VQ2BFvT0KDdAsuddaRd04URW1dGUtPi/m
         3IUZbKyCpU9VgMlfrTIojA5vupDmWzb/bAXOGiqesyAIUmanavE1BBAEBI8QlEm1UvrS
         Ng3XRi6SIGi/glvJojiwZT5u3EkzxpdHlbnXCPiYUHmSwKlx/M6Yrmw16nI1QXuGHXUc
         /upYTptuHBRUBpKAmfRpRsXNQ8xyaTRqam+j5RXAZoBisa4pHtu978I6q8ppvnCgTNeb
         1arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063665; x=1691655665;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p96yGLmqdrf7EnICZmRF6+JxSLRO9iWhLvWVcOetAfo=;
        b=jgoUAiRgqdJ5Ruyr72NdhieWz0amclwkqVp63thdrPzF2hdYtwrUgzfJkyTLhUBvOq
         FCIAlCafaaedYje0wlfM+lw85NhS40nnU8lorml5avqe3qEEm1q77yYRkzx1wym/iZC9
         4IpeebIV3BXtoVA3zml6KquBXMKp92VSFomAov9IktpTZgR4b9XXVGOOwKoQ/z+da2tT
         K/SJiGT08bUFSfWVVhOt+OKozcZGvOlqyOOAkXdgArLEqTDOQGIenYoZ4lnl1p9xZUo1
         ttB3rD49FdJtvXq7E2OezTXsu4q7FkRpIRHlAID4u2M+anGdIAbBGPnwZe3Zla49rUie
         miJw==
X-Gm-Message-State: ABy/qLYMoLiUPcYHgttJ5fzRSSsWm6+z0341TK8CHmRZKiGTKLEQHlGd
        IItJ/qgPIKstk852SeR9qLaodg==
X-Google-Smtp-Source: APBJJlE9i4XhHmQv1pBhQZUzsFzcV9eFjlSxljOGejA2W9oGWgdxxGZyfxWGUnUD4oZvCT2ekuvWAg==
X-Received: by 2002:a05:6000:1290:b0:315:a91c:1a8c with SMTP id f16-20020a056000129000b00315a91c1a8cmr169842wrx.22.1689063664992;
        Tue, 11 Jul 2023 01:21:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adff50a000000b003144bfbd0b3sm1576580wro.37.2023.07.11.01.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:21:04 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:21:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 3/5 v4] accel/qaic: Add consistent integer overflow checks
Message-ID: <ZK0Q7IsPkj6WSCcL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The encode_dma() function has integer overflow checks.  The
encode_passthrough(), encode_activate() and encode_status() functions
did not.  I added integer overflow checking everywhere.  I also
updated the integer overflow checking in encode_dma() to use size_add()
so everything is consistent.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: no change

 drivers/accel/qaic/qaic_control.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 752b67aff777..23680f5f1902 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -558,12 +558,10 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len > (UINT_MAX - QAIC_MANAGE_EXT_MSG_LENGTH))
-		return -EINVAL;
-
 	/* There should be enough space to hold at least one ASP entry. */
-	if (msg_hdr_len + sizeof(*out_trans) + sizeof(struct wire_addr_size_pair) >
-	    QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len,
+		     sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
+		     QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOMEM;
 
 	if (in_trans->addr + in_trans->size < in_trans->addr || !in_trans->size)
@@ -635,7 +633,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -719,7 +717,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
-- 
2.39.2

