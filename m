Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78BF74E6C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjGKGGl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjGKGGk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:06:40 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96200E6E
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:06:29 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso54266865e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055588; x=1691647588;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
        b=UWvshBxL0dwNaKnStGzpGy5sP+MKrwDvUjH2ehZ5yOAS+R7ZjSaR4XHOiIF76htWy0
         ec3G9N50OM5WkOdlcn0+PcaqCsg07fSKuh0JNChD7wRbBRzfZTERKSlxa3NPgXU2Ceyx
         jrzK8IQDOBbkjehY9ZduyNRQueETUssIU7q8Emv7UxKwoYGf5OdfTdwv7nHPj2XjAktW
         niYQ3HsB7MGjEe5hNCJvUqo7h1++klO77ca3QH8ey2Gw0ukC4zLAeBw5V5w8P64Botl0
         Y2CIQIgRr+XxGxyJI3R5gN6tBOy5U+201JKWoT3c59jMNFUzfMvTgGVYWHIgsfXAV4Bl
         JiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055588; x=1691647588;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W89qn4/C8LoZMhk8A7/gIp60EbovNS/dN8Aiz2Yljxw=;
        b=jcownCqNa6/W/ccjt64qlpDZJ1N7cmXuGICE75Dm9j1Ns/grKAobCeA1c1m2h+8kLs
         TeKJXDRsvFqQn+8+93ctTBf4zOrIOfnNWzCq7xOIAQlDckO3nfCt4Fs3/RdeMe9dMRb/
         di2VikZXAyqJCkgaWOA6I5lFRudn+ncI728/tVlhdkMj30dUgE+9Wby/JA/dEAklalaf
         CJ7HYvGDokqOGputgTncueC0RldnTUZseYlEsmHz7MUfKnvXn4SkI0dCW0IBcRsEq+UP
         DQWOcHA9j7MuVnBKGr/E22CnayK2cvgkVZG4b5BdaxW8uvgAPkwq/s9YBBSlbJ8rwuWQ
         UoYw==
X-Gm-Message-State: ABy/qLYKY9Llj77jW1lm2HqvTz9KwYqZ+mZOCa4PPpMaPENKrTw31vxP
        FTpU07vQ16MEXzge0gS2e324u3wmlvPWSR8KiJA=
X-Google-Smtp-Source: APBJJlH6Uyh/1/5BFQjexIK2gp2w+2myZZC//JVH6HN9EUWM2BnLZS54hMfa9PyGbdR2jb1exDPmeA==
X-Received: by 2002:a7b:c356:0:b0:3fb:abd0:2b4b with SMTP id l22-20020a7bc356000000b003fbabd02b4bmr12143473wmj.26.1689055587959;
        Mon, 10 Jul 2023 23:06:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v24-20020a05600c215800b003fa95f328afsm11969157wml.29.2023.07.10.23.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:06:26 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:06:22 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 1/5] accel/qaic: tighten bounds checking in encode_message()
Message-ID: <ZKzxXhtwqYvoat8B@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzxP8iX8Op0lYvh@moroto>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

