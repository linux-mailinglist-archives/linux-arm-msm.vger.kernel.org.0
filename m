Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF581CF316
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 13:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgELLJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 07:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727859AbgELLJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 07:09:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5E1C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 04:09:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y16so7662579wrs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 04:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fy9idyc70uTPGwi0hCQ/5KZlcCaul8nvoI4462n1ra0=;
        b=TrJcA4tPEnCNvX8Phd6XQGZTaAfine3hkq2zVl2YASihCxPBXeHCUnPXknnvHDvWgr
         zqRfRBSOt37rqcRpea512qmzc08KSj6GB7IMY0e8CsunyWipd3A0eEQmpst4cAWQxDbF
         XjX2NtvD+MwuPzvfCGgOAqHuMmQNuOCZrAU1kThegGr2e8MlAKRSTpHtmRbQtMM4fLrJ
         ODTS58zc2qPkUEmsfSu9jsFIwvfAiic+Y1A9gXY90n2f/bClee5XwC6p6+fZox3i2MV2
         OI2PGNbGvkM03iMr/r1S3Emh9f4Xo1ARpmzykoditG+RRgGvd00kUk0U5oXTwlTdMGuT
         d/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fy9idyc70uTPGwi0hCQ/5KZlcCaul8nvoI4462n1ra0=;
        b=NWaeMq54KIQVWibZLsIeFVvoq2KWTZNcv+7l3VQYJ4cmDLONTuCxxAIobGQy4s4o14
         RNgTsVxqFKagsP0B08j7C3VBJfqqG7PlmJXFPYfhoy064o2OcjQj+wiuRm1dq060eaRj
         txIKfKflrclSzPaZDINerVqkAgRF/DiddaTc69pfm0jgF7+MZ3BCMipwtmOCEb5kgjLU
         cE9GaPRGjkYEGwy9/ZDOlKkZk7y+NaAmM73gkeFq+daT/SFEVOAR6CTII9LZK80pdZBF
         xVxt4s7GGd0qhH94xO3Dxj8dK99FOla2tKL1eLeMFxuqqfoxzq/qLbKGJ1zsE39stHvZ
         pfqw==
X-Gm-Message-State: AGi0PubljpxW45EBaLP1xc1+SI2Mk5Wkp0Rs9tN6k0HpukqfI2NYykrQ
        ykO+Uw6cLyEiyOdTKoFCJt17hQ5olWI=
X-Google-Smtp-Source: APiQypLmZnsKD+pIFGZAkIgCy7Zi2dVoDHMzZ+3vM0tJ7NUpMcHLS7DhnvRyPAU+zC4fxbOQxS/Qxw==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr24313702wru.91.1589281773106;
        Tue, 12 May 2020 04:09:33 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id t2sm32089222wmt.15.2020.05.12.04.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 04:09:32 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v2] misc: fastrpc: fix potential fastrpc_invoke_ctx leak
Date:   Tue, 12 May 2020 12:09:30 +0100
Message-Id: <20200512110930.2550-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fastrpc_invoke_ctx can have refcount of 2 in error path where
rpmsg_send() fails to send invoke message. decrement the refcount
properly in the error path to fix this leak.

This also fixes below static checker warning:

drivers/misc/fastrpc.c:990 fastrpc_internal_invoke()
warn: 'ctx->refcount.refcount.ref.counter' not decremented on lines: 990.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	moved fastrpc_context_put to fastrpc_invoke_send()

 drivers/misc/fastrpc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 9065d3e71ff7..7939c55daceb 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -904,6 +904,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_user *fl = ctx->fl;
 	struct fastrpc_msg *msg = &ctx->msg;
+	int ret;
 
 	cctx = fl->cctx;
 	msg->pid = fl->tgid;
@@ -919,7 +920,13 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
 	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
 	fastrpc_context_get(ctx);
 
-	return rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
+	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
+
+	if (ret)
+		fastrpc_context_put(ctx);
+
+	return ret;
+
 }
 
 static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
-- 
2.21.0

