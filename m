Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05CFD74E8E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 10:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjGKIVD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 04:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjGKIVC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 04:21:02 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EB9E6B
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:21:00 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so61506345e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689063658; x=1691655658;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fquwLHvnamolS/A4KcwEUnoJp9w0O66643f28CD8jzM=;
        b=mzv8741rgqYmjOsoiNDIW6+1xXPxKOF3DQEErDqsmEh0HZc8TRpBiT6mRk+EFiykz+
         m2YaIFcSQwkc/hQJzEcFYX3HKm0c+3WYFRjTRx9zmwlpLMT9Ouhab7DCbeY1xEXqttW4
         Rk5esQWuwVWH8MmsN9PwYR3zDbvzJQvrDFuPZO0JU+gsQD+0ZsCn4pjD7BZqwIlRhV0j
         Qnh+wZ/FPjKcdpSRBYHBShqJzZJd4PV4KGMMQ0vFzc3Ua/zC1KL2qD/O65VQSpOCRpgt
         hM2auTr4qr3lFt6jiupoGHy6HTUxXGi7hV+hdp9b9fCIK9Glj5HRyN6rGHoh3Lc3MXfR
         MNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689063658; x=1691655658;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fquwLHvnamolS/A4KcwEUnoJp9w0O66643f28CD8jzM=;
        b=BEi6tYxJ2sTX/1uUsVD28c+kgEBOwnendqR/E411EsUJlgOhA8Lhkmy2BzOmHbHSqI
         1fvcnmMZuPM1PA8W770IXhdSp0ZUolY8UA0t4C5zfLVlnm1KzQR1OV5tTme6E7G1Aoas
         DibVLuwolSAEnndqJZXregcrS5+H6aD63c0Bzk+xzM6Wb+s5Pndtmahd6hKdJABCRtuh
         IcCX/4dJIcgcBZRKWDD3fvDq2621EyIsn9Ji/7YtPo5+z7bl2vOo4xVF7hkfpLHVkiDV
         xsIVoXwmh65xgNgxkGkHmuSv1AoQ/dEQwENUfyiDA68WHymM9EvkB/mvNMHU15wedaih
         Zjdw==
X-Gm-Message-State: ABy/qLbwye52UPficr++ul1ATpIeI5B0UKbGgNjF2u4zjdo2EmwO5s51
        3t0iCI8E+csYFwFBOA2zv/7LhA==
X-Google-Smtp-Source: APBJJlGFbfN8PFu6vBwaUFRibZsOZ+dedhaxMwqSHVuvWYjJ3E+fa9D5Z0fCd2jvkBGnSvz80HAmdg==
X-Received: by 2002:a05:600c:21d0:b0:3f9:b17a:cb61 with SMTP id x16-20020a05600c21d000b003f9b17acb61mr12798362wmj.13.1689063658783;
        Tue, 11 Jul 2023 01:20:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bcbd6000000b003fbb618f7adsm1811798wmi.15.2023.07.11.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 01:20:57 -0700 (PDT)
Date:   Tue, 11 Jul 2023 11:20:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/5 v4] accel/qaic: tighten bounds checking in
 decode_message()
Message-ID: <ZK0Q5nbLyDO7kJa+@moroto>
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

