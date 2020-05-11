Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5BF1CE063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 18:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbgEKQ1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 12:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728556AbgEKQ1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 12:27:32 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE9FC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 09:27:32 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z72so10442427wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BF3bA9JhF97PrSfdTNbNu1Y3C/CiYWUHU/YeauczSs=;
        b=Gn3qk7+c30POnWys+xu4b7lJbwXKvzQ4APIk9vYPoDXKggFWD+ZARV9RSzDQ71uqar
         NLAW3k3ZjaSh7Dt+0mZPau7Sg6Ohjv82qo3tx4dj+5w2xNd7tC+TI3JRwJr3l0o+ArOB
         o1k3Xo+BF9iRTr1Ml4eSDENeyneK+X7FqfTT+FDayEK56vgvjqQqcKvYHIBar3Z4cL4z
         DxYsEoZuoZtFTvtCDZvY55uSMFa8ZguYk9ipnJ+aq2y+LE0i8wC6p6p4k/iFpOz9l/b0
         kqFSz2ckjxoIxTTzUcj4K9NUjVXBev5Tj+XMO9Tm+p6mOOaBindxz3GX9IQS9tNXqpUa
         rtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0BF3bA9JhF97PrSfdTNbNu1Y3C/CiYWUHU/YeauczSs=;
        b=SybF/Y4CUUerzgedxulI3Yjzdwc9W1yf8B19gyW/L5pRVp3Io6u1cnv3sGY/exx0X4
         gd+xBJFQCm5E2bXm7lBr4iPL3GcnHG00d6jEI4XmP9Sg4Pl8gUEzyMjevVsHTVXrPi6X
         /u+O/VjBebA7VH7ZsvLpybTKuVdfpdh/XeoVGQqbuofp23yFU8edZ7MIoxM06tRdOTp7
         WjXgsb/uOkmo9mEDczDEdNjsCpe3k/Jg/C2cur/k61QvORhUaSoRFgwVZ3WhBEBzGGRZ
         uCrpAD2GBrUeh7l4NTb9hOgwr7nkM/bYr7f/kmBJf6eQk49oZindMpVeK77e/lSa4sia
         0oRQ==
X-Gm-Message-State: AGi0PuazE/gHerO+CoE+OuMhEC9jEwXjuHw3IiRFM8PJDrXrkWnrP78d
        08YeuN2bxRwyROF3yew1K8/kaA==
X-Google-Smtp-Source: APiQypIQRwpNO19dwzGtXD6zLZNcH01Mm6QekWBnZp4+F46EceTgShV9JecQ2vLkWoPBjgM2/Xe1sQ==
X-Received: by 2002:a1c:818e:: with SMTP id c136mr14989555wmd.157.1589214450863;
        Mon, 11 May 2020 09:27:30 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id k17sm26876602wmi.10.2020.05.11.09.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 09:27:30 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] misc: fastrpc: Fix an incomplete memory release in fastrpc_rpmsg_probe()
Date:   Mon, 11 May 2020 17:27:22 +0100
Message-Id: <20200511162722.2552-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fastrpc_channel_ctx is not freed if misc_register() fails, this would
lead to a memory leak. Fix this leak by adding kfree in misc_register()
error path.

Fixes: 278d56f970ae ("misc: fastrpc: Reference count channel context")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- Update subject as suggested
	- added fixes tag

 drivers/misc/fastrpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c562e285e0f4..07065728e39f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1615,8 +1615,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 					    domains[domain_id]);
 	data->miscdev.fops = &fastrpc_fops;
 	err = misc_register(&data->miscdev);
-	if (err)
+	if (err) {
+		kfree(data);
 		return err;
+	}
 
 	kref_init(&data->refcount);
 
-- 
2.21.0

