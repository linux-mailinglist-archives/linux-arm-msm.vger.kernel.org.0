Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7D1ED118D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 16:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731586AbfJIOlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 10:41:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36335 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731568AbfJIOlg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 10:41:36 -0400
Received: by mail-wm1-f67.google.com with SMTP id m18so2917286wmc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6OiJB7EuLtp7p4md9nfqD7cxFgmkO+0cPK10Zj1xY4=;
        b=S37KM856wHDnECg/1FKkIy1yjXEgnkQZyXIgt16MoukNlQDooW2oElREMEGO9tw42c
         AN0H2HND1RtIjiWZr5Fo+xtOP9xOk176a+hD22LrL5O9GSyT4botIELjYdWGET/4hcDF
         MSnQufVUYttCnPzEAqqOarb+lb97gnpLlsqgoN9KOEiH629AypzkAIhnbqv3tknO6SkK
         FRN+R9m1a/e1/sTZ2XFgbsuZdeP8lIROsVWrKCc9X5BLqc22aK4ZCiTbb0gi/H/ZCFF8
         iUyxB5Om0WyMwD3xAeu98dsJPGZ06bln/EFt4pVLcPpPvIdRTLhK3woc13l4ShOYOBVW
         1Klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6OiJB7EuLtp7p4md9nfqD7cxFgmkO+0cPK10Zj1xY4=;
        b=FcTgRI+C3DLUTRmS25MNYGDDY9j8Phpkab7hULNR134eUrKjMwBp99zIE+4RKfPw+d
         eJoR2FGTPg4NeCQLVijmkjnuNRlsYekiXYhgJVriSd1kQuAGEKw7ohYHjg9O+ntiqBDa
         5XVtp3EHMQTP7KSeIUZeHqaat5re/+tpj8+ey6DM5NftBN0LN4Woz4D9TaV3Th5iHqfa
         4HQR7Lg7jc2b5lTPZ4Msl+2b8XUPrBX+7Iy3TWpa/07lm0iJiaBZGNYgOIAVNW0+5+Fq
         o+ZBTRAG+VHZjK3iSsFmwE+uezCKV6Ivq7OmJshIjPNA7g6LwQtUkC8+Lptgb3f6GhgA
         ejWQ==
X-Gm-Message-State: APjAAAULjtdRNCeZHkPmFtDSydqFz9oCib9zwx0BaoBuUsP9VihwCQ9P
        vHZPiUWcPwcsnmBEqypq3yMW0g==
X-Google-Smtp-Source: APXvYqzdoajYxUt+SlTTO0rYrQtFoWl/VHou2VgKvHy8Q2cy4h9n2LvSPVFWSoFcClx2YWzAtQ95gQ==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr2928113wmj.2.1570632095145;
        Wed, 09 Oct 2019 07:41:35 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b7sm3031770wrx.56.2019.10.09.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 07:41:33 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 4/5] misc: fastrpc: handle interrupted contexts
Date:   Wed,  9 Oct 2019 15:41:22 +0100
Message-Id: <20191009144123.24583-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
References: <20191009144123.24583-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Buffers owned by a context that has been interrupted either by a
signal or a timeout might still be being accessed by the DSP.

delegate returning the associated memory to a later time when the
device is released.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 666c431380ce..eef2cdc00672 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -984,12 +984,13 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	}
 
 bail:
-	/* We are done with this compute context, remove it from pending list */
-	spin_lock(&fl->lock);
-	list_del(&ctx->node);
-	spin_unlock(&fl->lock);
-	fastrpc_context_put(ctx);
-
+	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
+		/* We are done with this compute context */
+		spin_lock(&fl->lock);
+		list_del(&ctx->node);
+		spin_unlock(&fl->lock);
+		fastrpc_context_put(ctx);
+	}
 	if (err)
 		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
 
-- 
2.21.0

