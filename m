Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCEB34B55BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 17:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356158AbiBNQKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 11:10:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354679AbiBNQK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 11:10:29 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9425C60AA9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:20 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h6so27663938wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IUtpmLCf9yTc9kWokK2MlmVKVquFj/Legtc727MewIE=;
        b=btySNnlz0WTv3SxDvb6en4QwwHjfz27GoTaiu9YtS3uxm9ZHGIOM9AR+J8PnRBTTox
         0Qz5ldjUG7ILquLzkZJQAphl3v2jYP4R5Tnx4Bv3UWkMqnOgPJ/KXyGEmMXKADNA286G
         V0VYFnm3TM5Pz69zuVM443jJDh92pTsv1l35xhIf3ibXHmI8QtDcYkQwHRLcuw1x1XsI
         V484M0NSsH+wwYJo71DDd1KdEFG0JawGAINeYhgVtenlJTt+mHQDDgPz/wc9i3iZcVlz
         X9BZZzFvr0gx1pUAhMNXRlwLElg2OiC1Ocirge7zw0cVh1iouKR2naDEzIGNh1iCG05F
         mmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IUtpmLCf9yTc9kWokK2MlmVKVquFj/Legtc727MewIE=;
        b=DdvySpeEX9VtinokdfVI1viR8nQH6wWvYJky2bg3HTrWFcF1VVOShYcygAAyK3Ykm/
         ODblC2AnkpPgejhr+D6C/XiTpMCjRPF44LvwdU0+EJVKfS5zpRa7+LYxxmSeWah79xKr
         uuwUFYk31zbnFzdr32njRP9l2Uv7G6h23m6SVlJj/j7WRcvOUwKTAYsoWCcU+VMPJUyz
         8OWuVqrUasKxB1im3IHIqn+Q7kXKEUH/jOqk9CYnR+UKrrbqq3LqwrBCewOjQBAj5COW
         CF0H841lB5i8o3Atm4+Iq/KY5Wvi+INg3ZSvwWk0k4KBBGCBWBB/geHT2mEv2r6Y5xPp
         43lQ==
X-Gm-Message-State: AOAM532WIJ7UQrNZD4T4IIsOWwXo8eXfO57Q9HXtWrcm+j1mNK3d7ZMT
        VqNzoCkKXlS+PaQGNJsQzjqoVg==
X-Google-Smtp-Source: ABdhPJxD9AKOFD2a5c5WIs6al1TF5dEEfngUAFPQo51nQmlCFG0MXUIfA3JITED7CRvF8qx3PLNGhQ==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr297819wrf.64.1644855019003;
        Mon, 14 Feb 2022 08:10:19 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id k28sm13677022wms.23.2022.02.14.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:10:18 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 09/12] misc: fastrpc: Add helper function to get list and page
Date:   Mon, 14 Feb 2022 16:09:59 +0000
Message-Id: <20220214161002.6831-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
References: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>

Add helper functions to get invoke buffer and page start pointers.

Signed-off-by: Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index eb1e6d111c77..1cec85e8eaa1 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -833,6 +833,16 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
 	return 0;
 }
 
+static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
+{
+	return (struct fastrpc_invoke_buf *)(&pra[len]);
+}
+
+static struct fastrpc_phy_page *fastrpc_phy_page_start(struct fastrpc_invoke_buf *buf, int len)
+{
+	return (struct fastrpc_phy_page *)(&buf[len]);
+}
+
 static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 {
 	struct device *dev = ctx->fl->sctx->dev;
@@ -860,9 +870,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 		return err;
 
 	rpra = ctx->buf->virt;
-	list = ctx->buf->virt + ctx->nscalars * sizeof(*rpra);
-	pages = ctx->buf->virt + ctx->nscalars * (sizeof(*list) +
-		sizeof(*rpra));
+	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
+	pages = fastrpc_phy_page_start(list, ctx->nscalars);
 	args = (uintptr_t)ctx->buf->virt + metalen;
 	rlen = pkt_size - metalen;
 	ctx->rpra = rpra;
-- 
2.21.0

