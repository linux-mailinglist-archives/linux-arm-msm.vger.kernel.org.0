Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333A25AB1E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 15:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237993AbiIBNo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 09:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237835AbiIBNoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 09:44:32 -0400
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7524CC2EA1
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 06:20:49 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id d12-20020a05600c34cc00b003a83d20812fso1404618wmq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gH4aJXKyf/IuSJWto9jZ1pfTJBkJztgjhsXCgC7qiLI=;
        b=Q+vA5fPCWHKu3DKuK3bz894zgT6yIqsrEqxSqNB14ECQpbFUeAY4NTDdmq/qzhG0tJ
         VWX79CJXLuWh1ZycKJwQUkSGd1J1brLrfkBzaCbNnDJoDP5tn+DPAG1vdsZt9efJWm8+
         KtAQp1n+d2ak3zgQiT+eTP3oNsI63BCWbFDcH27KvbbjQOYsN+BXSSNf8p3ncB54kVdJ
         USoWJ1WcEbeoVPt3Q9jjNU7eg3T4naNRQV/Nl8RorerZPa8dJFiia8P51hZC6a4HqOU2
         iB5OqzZCXrjIB/7m74P6uPk0nXsMramogFLiNNptm8P5j27xlXnb4ozMnirqauDhMsAT
         7ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gH4aJXKyf/IuSJWto9jZ1pfTJBkJztgjhsXCgC7qiLI=;
        b=PUyJVrdcVIcjuCktoFHhhZug1ZVSL1PKqaD023GWBvknj6idnS8hKxRysa81+Jcwpq
         MaV2mdZeoeE2M+MzchoQQgmTKOH7340q4bRldlGTputvxXCVXZnYSOnNXcgeqO+Wuk6x
         coFvC8DWjwtoiK1j+aLvWnDKFvT8iSKToP0aePR68E3POnRb5+CxdXCJ9lVO/oP/dNOT
         5Otv7Ea0sZ+ZK+sfxb+8dhv5s6TIdMac5z0k0E0v7ZYqmBv3OGjtJglgNAPY86dI9Hwe
         O9lTP6w0eM7iKNrnTtpgbL/WMgSDwa5VcQ7H7WC6jKVVGgP8Anf7k8vD9xJ1unR2emZ0
         2yVA==
X-Gm-Message-State: ACgBeo2X0qCt8T829qFusENsDq/fl1N9ITgJCdvHe0FIfMQ6GJQYhQgK
        aKLQyHcIctf2oTeQUoTPZxfdQQ==
X-Google-Smtp-Source: AA6agR5kLf0MxnenKY4reZqxqyfBRUyTRkF57NiYDODgJUhx3rEKQe0Cy72kVEhRkl1C9FMVm2LOsQ==
X-Received: by 2002:a05:600c:4e4c:b0:3a5:eb9b:b489 with SMTP id e12-20020a05600c4e4c00b003a5eb9bb489mr2736891wmq.56.1662124473746;
        Fri, 02 Sep 2022 06:14:33 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020a5d43ce000000b002253fd19a6asm1766253wrr.18.2022.09.02.06.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 06:14:33 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorande@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 09/14] misc: fastrpc: Rework fastrpc_req_munmap
Date:   Fri,  2 Sep 2022 16:13:39 +0300
Message-Id: <20220902131344.3029826-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902131344.3029826-1-abel.vesa@linaro.org>
References: <20220902131344.3029826-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the lookup of the munmap request to the fastrpc_req_munmap and pass
on only the buf to the lower level fastrpc_req_munmap_impl. That way
we can use the lower level fastrpc_req_munmap_impl on error path in
fastrpc_req_mmap to free the buf without searching for the munmap
request it belongs to.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/misc/fastrpc.c | 47 +++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 5eececd9b6bd..7c364c58e379 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1630,30 +1630,14 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_req_munmap_impl(struct fastrpc_user *fl,
-				   struct fastrpc_req_munmap *req)
+static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_munmap_req_msg req_msg;
 	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
-	spin_lock(&fl->lock);
-	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
-		if ((iter->raddr == req->vaddrout) && (iter->size == req->size)) {
-			buf = iter;
-			break;
-		}
-	}
-	spin_unlock(&fl->lock);
-
-	if (!buf) {
-		dev_err(dev, "mmap not in list\n");
-		return -EINVAL;
-	}
-
 	req_msg.pgid = fl->tgid;
 	req_msg.size = buf->size;
 	req_msg.vaddr = buf->raddr;
@@ -1679,12 +1663,29 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl,
 
 static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
+	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
+	struct device *dev = fl->sctx->dev;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
-	return fastrpc_req_munmap_impl(fl, &req);
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
+		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+			buf = iter;
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+
+	if (!buf) {
+		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+			req.vaddrout, req.size);
+		return -EINVAL;
+	}
+
+	return fastrpc_req_munmap_impl(fl, buf);
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1693,7 +1694,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
-	struct fastrpc_req_munmap req_unmap;
 	struct fastrpc_phy_page pages;
 	struct fastrpc_req_mmap req;
 	struct device *dev = fl->sctx->dev;
@@ -1755,11 +1755,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	spin_unlock(&fl->lock);
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
-		/* unmap the memory and release the buffer */
-		req_unmap.vaddrout = buf->raddr;
-		req_unmap.size = buf->size;
-		fastrpc_req_munmap_impl(fl, &req_unmap);
-		return -EFAULT;
+		err = -EFAULT;
+		goto err_assign;
 	}
 
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
@@ -1767,6 +1764,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	return 0;
 
+err_assign:
+	fastrpc_req_munmap_impl(fl, buf);
 err_invoke:
 	fastrpc_buf_free(buf);
 
-- 
2.34.1

