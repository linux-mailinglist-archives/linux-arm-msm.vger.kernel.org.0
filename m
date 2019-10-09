Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC43AD1185
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbfJIOlj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:41:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54053 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731584AbfJIOlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:41:39 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so2926962wmd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kj8kcZrV2Ie6KvU8hO/1zbuJDnDpMortIjA2JmRJQi8=;
        b=ob7G1xVzMMoZbuszEsmDW7+f8TTVwcOkmedylA9Vwn+H+9MHBJX8omWH6PmCV5OMv+
         4gXH8xWhlBx4+hjOEkH/VERbpgqEWrbpmpjpaceLslclzFmNaSZSlRzr8stf5Mw9fcQR
         n6JVm0W5UDpiIpuMIO8MV2in1Dk5eAOY1i7+yukIWbyQWrCWeE9fwHo7za9vbWXCWJBp
         tjQi+IZgLN+DzJK9WFtg6Yj3xQH2Q9d9T4ICHjQxM/tAKSfax1iODY1gzqedo155bJLb
         SHdy1z/h7iT21ltciliox9lL8hTM779v+jbMobvwH1cCvFjZRvTN7lMgoaltO82Rf4jS
         ZyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kj8kcZrV2Ie6KvU8hO/1zbuJDnDpMortIjA2JmRJQi8=;
        b=YHqr1JN9KeTlviphFJ7Veo8v+3Der4gNFH5WbY1xdcoIDdnskSGjQL51eJFqdxWGQR
         Ixe2Mio5tcLH9br0AK/XQGP0eAEkYIGaUvRJuZqwjVrtVQ7cW6emXv8BxGSxs2Ia3NEG
         RCbvDekR3BD49kbin0+kUNXrqxG2uv/xMIX6GRiFrM3wrrshnuxWSnQ0yKOTPMlM124R
         iHIo2xgCaD8zMSymO7zEwktWU4bw6X2eRfyK4AaSWVHyoTjFXk3R7OiuHVBCbmZmkp0D
         u7IOu+y3A33+zBbvB5XAeZjQfFj8M+B+CMNdWaB70oDHSVIG8gfQvBlP9ZROVuE2NcUR
         SMrQ==
X-Gm-Message-State: APjAAAVTK7Y3cKlhIoHRFZ6TME+V5ODEFSYpeVOQRM13Wz+Ie9l5aO57
        wG0yfsiTvs9AyehNg3PAurNW3AUh7fc=
X-Google-Smtp-Source: APXvYqzD6hQg63tJmuj8nmWSze/iS9hgaRn3cdPRFnzr1Lb4XjJzHI7vsIdMl2lCy06c4oKevANYeQ==
X-Received: by 2002:a1c:1bd8:: with SMTP id b207mr2874814wmb.62.1570632092078;
        Wed, 09 Oct 2019 07:41:32 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b7sm3031770wrx.56.2019.10.09.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:41:31 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/5] misc: fastrpc: fix memory leak from miscdev->name
Date:   Wed,  9 Oct 2019 15:41:20 +0100
Message-Id: <20191009144123.24583-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
References: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/misc/fastrpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index aa1249bb581a..c0fe3419c685 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1610,8 +1610,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -ENOMEM;
 
 	data->miscdev.minor = MISC_DYNAMIC_MINOR;
-	data->miscdev.name = kasprintf(GFP_KERNEL, "fastrpc-%s",
-				domains[domain_id]);
+	data->miscdev.name = devm_kasprintf(rdev, GFP_KERNEL, "fastrpc-%s",
+					    domains[domain_id]);
 	data->miscdev.fops = &fastrpc_fops;
 	err = misc_register(&data->miscdev);
 	if (err)
-- 
2.21.0

