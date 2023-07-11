Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFA7E74E6EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 08:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjGKGMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 02:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjGKGMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 02:12:39 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AEE10C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:12:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3143798f542so5788891f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 23:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055950; x=1691647950;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fquwLHvnamolS/A4KcwEUnoJp9w0O66643f28CD8jzM=;
        b=sMpy+qNXUFtfigmL9AzcaoyDWkla9E9TgYPBF1HcFX0x6kRxImxDj48GyEGBUGJeKf
         Mk2FccxLKV8ZK3Cou/q6smdzJ354cf1gdgkvHy+ZxENrO47PcU1oRIpIFI/E4ohMewL6
         LEMRLQhoXjb+xKpqfXdYjdGEh5ydqWkFXkz+tYkaKyGNUAVFFe4wQO9vK4ZCtjp89ARq
         uJGXURkZojKww1IA/M7nRbGkQENGCMBMYcqbVBJOgVujSq7MUCMyUrnzty8Tc2nWiDlP
         Zm2uvntQG9rDx4AB18kknvyDM3hJiETyqw3MjQHO/BkrwQs7r8rDMCgnRC0ECChFMFpY
         y4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055950; x=1691647950;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fquwLHvnamolS/A4KcwEUnoJp9w0O66643f28CD8jzM=;
        b=j0FWTOwh/rny7WCKzgNPiuaSeocNmgtKy/tsVGaMmQRpY8XlBbCtm1ZlSajh08sO+w
         xUotYRVX5zrlp//e5CgWVSy5yRaa1EtRUOnWMfCSuLwvLfFOoqDG+IVKJX0PHTHXZ3cy
         kFxWnXSUMrfocrRM98K2TvUBW5+ryaXbAmkUgqysIpRaY8mqGLfcFehPTsOAdNdr6JRd
         lOlvHVOLvVkkktSPEnFOV5Dvu9HHgK8qby9CQVNlPrbLYgTihZEZThd1+fxH0qISiPlX
         z+52/m2fYaYMwYfPa+iWey4DSIx/SQehnthgR8L0R56yOHIeHC9YuptSudtbopIHguRd
         FTLQ==
X-Gm-Message-State: ABy/qLa/WHHmp1XKOhSR65ubFpqSFI8voPWA64ZkcQ1VtfJvphc/z+mg
        ITscRNVWaVQDK8NRNQFMLV5lqw==
X-Google-Smtp-Source: APBJJlFt8xMwwWVS69uneKXK4DbRZLW2rpSt/tuLs183DCd2Z2Grn9+FDVz/F64jGW2g8uWnPvPYAQ==
X-Received: by 2002:a5d:6451:0:b0:315:9047:a482 with SMTP id d17-20020a5d6451000000b003159047a482mr8454354wrw.48.1689055950161;
        Mon, 10 Jul 2023 23:12:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d508f000000b0031437299fafsm1292822wrt.34.2023.07.10.23.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:12:29 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:12:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/5 v3] accel/qaic: tighten bounds checking in
 decode_message()
Message-ID: <7b5d7d2e-a1da-410e-bb23-b17831f48cea@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzx5nA6Z/0yhBJj@moroto>
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Copy the bounds checking from encode_message() to decode_message().

This patch addresses the following concerns.  Ensure that there is
enough space for at least one header so that we don't have a negative
size later.

	if (msg_hdr_len < sizeof(*trans_hdr))

Ensure that we have enough space to read the next header from the
msg->data.

	if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
		return -EINVAL;

Check that the trans_hdr->len is not below the minimum size:

	if (hdr_len < sizeof(*trans_hdr))

This minimum check ensures that we don't corrupt memory in
decode_passthrough() when we do.

	memcpy(out_trans->data, in_trans->data, len - sizeof(in_trans->hdr));

And finally, use size_add() to prevent an integer overflow:

	if (size_add(msg_len, hdr_len) > msg_hdr_len)

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Fix the >= vs > bug in "if (msg_len > msg_hdr_len - sizeof(*trans_hdr))"
---
 drivers/accel/qaic/qaic_control.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 2fdd5959c52f..752b67aff777 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -956,15 +956,23 @@ static int decode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
 	int ret;
 	int i;
 
-	if (msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (msg_hdr_len < sizeof(*trans_hdr) ||
+	    msg_hdr_len > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -EINVAL;
 
 	user_msg->len = 0;
 	user_msg->count = le32_to_cpu(msg->hdr.count);
 
 	for (i = 0; i < user_msg->count; ++i) {
+		u32 hdr_len;
+
+		if (msg_len > msg_hdr_len - sizeof(*trans_hdr))
+			return -EINVAL;
+
 		trans_hdr = (struct wire_trans_hdr *)(msg->data + msg_len);
-		if (msg_len + le32_to_cpu(trans_hdr->len) > msg_hdr_len)
+		hdr_len = le32_to_cpu(trans_hdr->len);
+		if (hdr_len < sizeof(*trans_hdr) ||
+		    size_add(msg_len, hdr_len) > msg_hdr_len)
 			return -EINVAL;
 
 		switch (le32_to_cpu(trans_hdr->type)) {
-- 
2.39.2

