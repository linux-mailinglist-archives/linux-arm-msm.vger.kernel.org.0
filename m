Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A04737C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 09:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjFUHWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 03:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231279AbjFUHWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 03:22:11 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72C9186
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:22:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f9083d8849so50047005e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 00:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687332128; x=1689924128;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+b4GexZhYGtFJ8457FP9Uyc3mQnN692CXOs2Lb8cwgE=;
        b=aa4DKZw2bQK9zS+DjaaGo5gMxSO32Ta7cm5CQh2RCsjj7hGF1y1tbA/iJpqtbb9Boj
         0TPd6+O//mPvdUgmcs1euxuikN4j8opHMVLsK6l5PrqR8vjlb7bRpiyT7PvGB8wra0MI
         wcUSMrnbJdhqhXlhVvQKeJrKd9kYs4BJLJXzBB+0Q+QSsoS65z+Njd5teoo5vMmVQbKO
         0Kp6OLBrDJqeTk+j/QbIOIg+HFJA7ZrNzexR3mCJOdAbV8sAAbNVLSr4tzYUwcMSEnYA
         /pWDSiVN22JHOVnJkyIxKdqwLmeYLGCQhD3adetc18073RlU9i2w8FFwSJddurgqTZko
         6xQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332128; x=1689924128;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b4GexZhYGtFJ8457FP9Uyc3mQnN692CXOs2Lb8cwgE=;
        b=hKitmdlyFyWNafANh9RWyETVxVilZJwfR5507dMxzUnokk5Iz83LtrUXhP8QXaPpUf
         BWLVOfe1qd0l+QYBfkVASLhIf22OrpE3dipAh8Cd7dEeuHCvFcF1gPeAdQtsFKU2c9Xq
         SAElqeSxfBfaVcC5P5PfkNDTg8xTepF7RD3aXj/zDTCuCIzR3pim9OYa1+meP1cxlq4g
         L8p732UqfjIx2/CszXHaOIzq23a/xgZz2ArPINuTBb4CqVKSkCabc+iDOYQwYzhXxMIv
         tOragWpQQPRff6h8bUj2Jpwi+dcUjYY5uDvYYP4UnujbdnPln6eGo4ODDhb3oo7bVo9h
         kjJg==
X-Gm-Message-State: AC+VfDzsoSbqacs/EgWSctP9s5rEOeCk8hoKgwIRuxhHTCOMRgXLPiQB
        C5iNrCONlmddcySZ5FlScK/3uA==
X-Google-Smtp-Source: ACHHUZ53CCuxV6ZTQUPnw/p+BKD5sESTMplQpXucrjx+ujYgMjcEMKjr5ub7OUGfbA3GewP+jnCn6Q==
X-Received: by 2002:a1c:7906:0:b0:3f9:3853:9d6a with SMTP id l6-20020a1c7906000000b003f938539d6amr7616012wme.12.1687332128199;
        Wed, 21 Jun 2023 00:22:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b003f900678815sm4109190wmi.39.2023.06.21.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:22:06 -0700 (PDT)
Date:   Wed, 21 Jun 2023 10:22:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 3/5] accel/qaic: Add consistent integer overflow checks
Message-ID: <a914d7ed-f7ef-45b5-9bca-dcc014b700eb@moroto.mountain>
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

The encode_dma() function has integer overflow checks.  The
encode_passthrough(), encode_activate() and encode_status() functions
did not.  I added integer overflow checking everywhere.  I also
updated the integer overflow checking in encode_dma() to use size_add()
so everything is consistent.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/qaic/qaic_control.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 78f6c3d6380d..96a26539df18 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -366,7 +366,7 @@ static int encode_passthrough(struct qaic_device *qdev, void *trans, struct wrap
 	if (in_trans->hdr.len % 8 != 0)
 		return -EINVAL;
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_EXT_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers,
@@ -557,12 +557,10 @@ static int encode_dma(struct qaic_device *qdev, void *trans, struct wrapper_list
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
@@ -634,7 +632,7 @@ static int encode_activate(struct qaic_device *qdev, void *trans, struct wrapper
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, sizeof(*out_trans)) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	if (!in_trans->queue_size)
@@ -718,7 +716,7 @@ static int encode_status(struct qaic_device *qdev, void *trans, struct wrapper_l
 	msg = &wrapper->msg;
 	msg_hdr_len = le32_to_cpu(msg->hdr.len);
 
-	if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
+	if (size_add(msg_hdr_len, in_trans->hdr.len) > QAIC_MANAGE_MAX_MSG_LENGTH)
 		return -ENOSPC;
 
 	trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
-- 
2.39.2

