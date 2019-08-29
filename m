Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24D86A14FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 11:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfH2J36 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 05:29:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40375 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfH2J3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 05:29:40 -0400
Received: by mail-wr1-f65.google.com with SMTP id c3so2670596wrd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7K2iZxOhWYqdpgu+ftGX/anH+28e+S9dJx0eG5WBrFs=;
        b=oiVT9zLmf1h4t60P+I9CdvSij40tIxqhF78DG2hIgxWZ5HKvR0HrJISlbt6lpEsCG5
         fC+esGCCHY34XbPFe1pyBtp+Tvn2h3uf4qdcm0cUCom7AxdwXYpYD/zDkq3x6lLo5YU5
         5YXxHItF+lOOR2mqLSIeA7402VJFl250EKAhM9Wo4iuNf5Z54WKxqAEbuyQzQjAdEOx3
         GEXbr6w6bfk6hOFmFZ9klwRBzqw9EIFHZyMVzW7O+COGimlsjq1L5u2mdXfkzu6/p85M
         nadOZG8Dvj7AwH+BDwuyFr9TdmBsDlnc7Ct4okKhHKUiW+c2L4sq7Ks+SkPhHPN7asUz
         fPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7K2iZxOhWYqdpgu+ftGX/anH+28e+S9dJx0eG5WBrFs=;
        b=p10hfDuUvPaz6y3e5nF8QcbX8Am9OifEOU5p2HjR23dVyvMfex4l6vfcv6Up9z80qd
         FybWOWyoym4mN95cjhNZjvoUMO69Ku4qeDhL0JDe3MUnhhcBi9xIg84UHxg7cXV7JjUC
         ELoR/OS4mZ9cCRX2tGXGVmqs5+8xF+lmxSHvcjLdjaWODvkwlMFI0K8Zh81q12nJrig0
         S/wjKIcu8sXpom0aJDaA7AEZEFB33LEDLafmwD//qv7FkTJ6XpX0BrT7cxJu1H6+SF+y
         bOUYpawtO9p8nA2SuhlnwX5MILhOzqGsDr+Bu+uz1xXJqVPXnSz/Jf5rC0WAF0cfv0zN
         3Nyw==
X-Gm-Message-State: APjAAAXKauw130BHXzu4kATIWUI1d7QjiQSTNR8b5raumPyJXZCb9YgI
        ughjSVHP1oEGkX7k5cT9Md6+8g==
X-Google-Smtp-Source: APXvYqznwpsrQltLkUtPFiJRDC7Xelm8Yr3Kqqj9ti4s9kus+fNVdkfvo7yIAh0QBXcij46RIIfw1A==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr10359603wro.302.1567070978988;
        Thu, 29 Aug 2019 02:29:38 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f197sm3609512wme.22.2019.08.29.02.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 02:29:38 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v2 4/5] misc: fastrpc: fix double refcounting on dmabuf
Date:   Thu, 29 Aug 2019 10:29:25 +0100
Message-Id: <20190829092926.12037-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
References: <20190829092926.12037-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dma buf refcount has to be done by the driver which is going to use the fd.
This driver already does refcount on the dmabuf fd if its actively using it
but also does an additional refcounting via extra ioctl.
This additional refcount can lead to memory leak in cases where the
applications fail to call the ioctl to decrement the refcount.

So remove this extra refcount in the ioctl

More info of dma buf usage at drivers/dma-buf/dma-buf.c

Reported-by: Mayank Chopra <mak.chopra@codeaurora.org>
Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Tested-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 38829fa74f28..eee2bb398947 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1198,26 +1198,6 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static int fastrpc_dmabuf_free(struct fastrpc_user *fl, char __user *argp)
-{
-	struct dma_buf *buf;
-	int info;
-
-	if (copy_from_user(&info, argp, sizeof(info)))
-		return -EFAULT;
-
-	buf = dma_buf_get(info);
-	if (IS_ERR_OR_NULL(buf))
-		return -EINVAL;
-	/*
-	 * one for the last get and other for the ALLOC_DMA_BUFF ioctl
-	 */
-	dma_buf_put(buf);
-	dma_buf_put(buf);
-
-	return 0;
-}
-
 static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_alloc_dma_buf bp;
@@ -1253,8 +1233,6 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 		return -EFAULT;
 	}
 
-	get_dma_buf(buf->dmabuf);
-
 	return 0;
 }
 
@@ -1322,9 +1300,6 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
 	case FASTRPC_IOCTL_INIT_CREATE:
 		err = fastrpc_init_create_process(fl, argp);
 		break;
-	case FASTRPC_IOCTL_FREE_DMA_BUFF:
-		err = fastrpc_dmabuf_free(fl, argp);
-		break;
 	case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
 		err = fastrpc_dmabuf_alloc(fl, argp);
 		break;
-- 
2.21.0

