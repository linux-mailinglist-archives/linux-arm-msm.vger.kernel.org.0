Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032A074E6E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjGKGKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231223AbjGKGKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:10:49 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEB0E4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:10:45 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbdfda88f4so54378015e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055843; x=1691647843;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
        b=Ze8PzEdUz4HE8I7eSSzJ76ZK2Uh8DracZb2nq0ssaV9RuGgo9BVN/0t0YvIrJ+J5QD
         n3xzjBNMxJ0M2IZfmXVTZWZzdtGIlcKZvvu4LTI7lYiFmhe85IRG3osRpz6EvONjuAvE
         yqOFdvS+BNTjpWbKM6meyk/bfYSEi4XkDZn5pQNztHb+fbsynhX2emksje4H/7EiE8TI
         FrKHtC1seiz3rtgWDqJ9djnRxC+l/ZAzTe+VtxXS97PPKnE+jzCq/DHUT2EXjHOPaceG
         Ex9/YGOXSz6XORR1aHDWnug7ZMf4VfU6H/IZvP4VZVRb88/OqpdBcZzvc3vKI2rWYMvB
         t9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055843; x=1691647843;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
        b=YJ844TR/4KTmKq/VBUjvvQSQUzkD0KRInYiGNMqLf1W/16GDiza6VB4EQ9YSTLHxAb
         NnOdwO6wrXQ0+++S03N4dMPNZhYUVzTFWaD3cztw4BlXSM7bgKzn2agPbtlXBrxN+3eK
         cJTVo2c6ag1iGLh7NYOtq2yQEPp9zhWtTm+q0q7Csi6FtBWfdDyRszL+tiEuDPTZBXVW
         foIOAmZZ8DH0Fp6Lah75z2d0ntTRX0AxwAdspw1jDK3XautUpELMu4xEenkwBXOFy7kT
         aJ/C0YcuYj7MzU5RMgm9trTEmpbaWhLt33hZr7ASTYSXAEhPDLo5/Rg4gdXFcl5b32W2
         okCA==
X-Gm-Message-State: ABy/qLaf6Egx3hzQHiYZENUBq5cQmTotZUfxdP05cC/fSt1KMjYDhEJk
        CEil/jbKtaDogfBXccBU2mlHrg==
X-Google-Smtp-Source: APBJJlGdAcXpWlULRWAexBF1MkCVD8fekFkTckTPUVtXuIJ0qsN2xCBn2qOMjMHMVUISI9i3vY5oSw==
X-Received: by 2002:adf:fa8f:0:b0:313:f548:25b9 with SMTP id h15-20020adffa8f000000b00313f54825b9mr12144824wrr.40.1689055843557;
        Mon, 10 Jul 2023 23:10:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d5510000000b0031417b0d338sm1258094wrv.87.2023.07.10.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:10:42 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:10:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/5 v3] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <ZKzyXx0z1gWDDJII@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are several issues in this code.  The check at the start of the
loop:

	if (user_len >= user_msg->len) {

This check does not ensure that we have enough space for the trans_hdr
(8 bytes).  Instead the check needs to be:

	if (user_len >= user_msg->len - sizeof(*trans_hdr)) {

That subtraction is done as an unsigned long we want to avoid
negatives.  Add a lower bound to the start of the function.

	if (user_msg->len < sizeof(*trans_hdr))

There is a second integer underflow which can happen if
trans_hdr->len is zero inside the encode_passthrough() function.

	memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - sizeof(in_trans->hdr));

Instead of adding a check to encode_passthrough() it's better to check
in this central place.  Add that check:

	if (trans_hdr->len < sizeof(trans_hdr)

The final concern is that the "user_len + trans_hdr->len" might have an
integer overflow bug.  Use size_add() to prevent that.

-	if (user_len + trans_hdr->len > user_msg->len) {
+	if (size_add(user_len, trans_hdr->len) > user_msg->len) {

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This is based on code review and not tested.

 drivers/accel/qaic/qaic_control.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 5c57f7b4494e..a51b1594dcfa 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	int ret;
 	int i;
 
-	if (!user_msg->count) {
+	if (!user_msg->count ||
+	    user_msg->len < sizeof(*trans_hdr)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	}
 
 	for (i = 0; i < user_msg->count; ++i) {
-		if (user_len >= user_msg->len) {
+		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
 			ret = -EINVAL;
 			break;
 		}
 		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
-		if (user_len + trans_hdr->len > user_msg->len) {
+		if (trans_hdr->len < sizeof(trans_hdr) ||
+		    size_add(user_len, trans_hdr->len) > user_msg->len) {
 			ret = -EINVAL;
 			break;
 		}
-- 
2.39.2

