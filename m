Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64EB3B2347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 17:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391428AbfIMPZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 11:25:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51900 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388354AbfIMPZk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 11:25:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so3220462wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/lU9jG5N7e3DGoVf3x6D+rPQKudYImqOCFLI9QDQ8k=;
        b=gqpn2OIiZdZR/ujxmZ4QKVcE0P5jWYnbShSyKwt+5OJvAk//DlifLDtqxfEpAUw/l6
         T/DR/0AYFynhblu0cN/SaXf0Xm/FdY9gTY17Cf+x5rj0ebfHya+BtDzrR2GF0JeAmAH7
         FBlDd/omPPc+NNNMxizNCrTMDPoo4YUiNtEBLP4tEJQh2+4lpgQjMCiHIXzAZMdIKtFd
         4nUHzhjGxdp75h5RzCVqrfg8ei+s69essebdX5VSw4Q8BunyAPSq7JDaG8vwaCBc0mE8
         EZE8mPG3Ez3C8SDVWhgaF0Blqb+gUejmRiFvL2MjAd6xJAoP0p4mIwrRifcogsqKZOKP
         datg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/lU9jG5N7e3DGoVf3x6D+rPQKudYImqOCFLI9QDQ8k=;
        b=ANx9gV98LvRBB/E9Ws7XADeOv2Isqy4kBuPPJKl2oxr3SHAF/iOW75U84rpyO/ZR+Y
         hvAwSPpRaU5pDqT5ojUbNeXyFBjXrroIrVwl32piTj/WJpnM4imR1fjkuLMyZdMsBkWO
         mibQX6nyHDFI/4Z1PvbnG9096KAzjachOLFS36bEruZkhegBKrfpnLSuGktlSx41ggG5
         AkFrVL7Q/LrFMIZxWkqPt478fS+OyDKEP8yWSFhmrT4ZhZzvsxTtxl8K3AlBYZ1smFNw
         fW0/6B3unP5ee0bGbQ7i5Y9r+VzvYZUkhK81sPm9rCIjqJ926EJyFC1Q7fxU63ZRIfzH
         PWrg==
X-Gm-Message-State: APjAAAWhPNFkO4+xTmC0AKZADzI/kX2Am6xk96EUh5axgh4lXV21sqad
        SZaat1vCAMX0Gm3o5tBK2DW3qQ==
X-Google-Smtp-Source: APXvYqxWQ91NXtafTPXEFw1LY9BKh7iuZDpGVjdrEaEUx1UWzcdcwz4E003A0N8qBlfiRLGXJ/9RgA==
X-Received: by 2002:a1c:f518:: with SMTP id t24mr3725176wmh.98.1568388338932;
        Fri, 13 Sep 2019 08:25:38 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm48717728wrc.44.2019.09.13.08.25.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:25:38 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] misc: fastrpc: fix memory leak from miscdev->name
Date:   Fri, 13 Sep 2019 17:25:29 +0200
Message-Id: <20190913152532.24484-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
References: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Fix a memory leak in miscdev->name by using devm_variant

Orignally reported by kmemleak:
    [<ffffff80088b74d8>] kmemleak_alloc+0x50/0x84
    [<ffffff80081e015c>] __kmalloc_track_caller+0xe8/0x168
    [<ffffff8008371ab0>] kvasprintf+0x78/0x100
    [<ffffff8008371c6c>] kasprintf+0x50/0x74
    [<ffffff8008507f2c>] fastrpc_rpmsg_probe+0xd8/0x20c
    [<ffffff80086b63b4>] rpmsg_dev_probe+0xa8/0x148
    [<ffffff80084de50c>] really_probe+0x208/0x248
    [<ffffff80084de2dc>] driver_probe_device+0x98/0xc0
    [<ffffff80084dec6c>] __device_attach_driver+0x9c/0xac
    [<ffffff80084dca8c>] bus_for_each_drv+0x60/0x8c
    [<ffffff80084de64c>] __device_attach+0x8c/0x100
    [<ffffff80084de6e0>] device_initial_probe+0x20/0x28
    [<ffffff80084dcbd0>] bus_probe_device+0x34/0x7c
    [<ffffff80084da32c>] device_add+0x420/0x498
    [<ffffff80084da680>] device_register+0x24/0x2c

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 8903388993d3..bc03500bfe60 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1599,8 +1599,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	}
 
 	data->miscdev.minor = MISC_DYNAMIC_MINOR;
-	data->miscdev.name = kasprintf(GFP_KERNEL, "fastrpc-%s",
-				domains[domain_id]);
+	data->miscdev.name = devm_kasprintf(rdev, GFP_KERNEL, "fastrpc-%s",
+					    domains[domain_id]);
 	data->miscdev.fops = &fastrpc_fops;
 	err = misc_register(&data->miscdev);
 	if (err)
-- 
2.23.0

