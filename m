Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56535B234D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 17:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391476AbfIMPZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 11:25:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37693 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391455AbfIMPZo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 11:25:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so31928857wro.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bOYzS8r6FFCe1w6kMt/c64rHO9y9+Q16CQmrviT721s=;
        b=TFdL1AcNXLVgcVLdgEs8GmnKDUPQYd47eafZmqW1SB0DPG1x0WlYI6j0S78cMxlNuK
         L+0iYzlmdkBL/N6NfA65/iXx3ULpxhxvFF8rUMwsy//9R3VKaI9ZA+SbmBDXQm0bGZu8
         fyA2aXG4bs8iJdTIo6XBFuZwdUU6FGdO5TNEUtIEyeNknU1bNVX1VRGMZkHjjfP8ZOHl
         +eB//bCZ9KdSmLfLAVRDXX1WAh3shOORm5NdZM32zjIgk8uoc9Cj6TEqOw/anaUAFLfw
         CLqGQqSPimZAubkFQs9HnU57zZ2KHcB4E/VkR5VbbFY0RS/d56IBw7ZA9dfDlyRXpNXX
         08MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bOYzS8r6FFCe1w6kMt/c64rHO9y9+Q16CQmrviT721s=;
        b=L9+/fT1Aibo74/xEF6pMfxsS9gLpvnwvOub+58CstPW2p1SRHLhwQ3gecDAcWXksss
         o0Oqqw0b7p4WxDVgFLhA+SA0C2MZ3WGlDt8213HwYXJ9CukDGWQUOPsmXFb7hCvvP/Tb
         lrnJ5kPbdoswOt25NNjz40MGcO1QU5EiEDbIjyhE9G3EOb+dghIpVVHAPTzwwaFx7bH6
         WKqEw9yZksoi8/4KLySAg+RjfP5+HNasuiyN5OZ+i1tG31nOuUNxZDP/PV6AIDZQlPbu
         QPbdGge0uBiZf6Y01W3UZaWq5kfKThK+Jtot4Gy+Qf17LWf9G+p9nTKJqUzQjWRo8n1d
         P2pg==
X-Gm-Message-State: APjAAAVqn68vxgAJmENpsX41JXb32igXLZXfbjQjjos+kcZ/3usw2Eda
        jtvG5YJI6CglBBKGBYsiHmgE5w==
X-Google-Smtp-Source: APXvYqxQ2Xo0HNP7p67Q+VIHhFA/KOFNvS5Om/sK/H7Q7Uz4IRrqTLaBB3T7XPDGmeFkgGtoKLZGSQ==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr19578762wrv.55.1568388341124;
        Fri, 13 Sep 2019 08:25:41 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm48717728wrc.44.2019.09.13.08.25.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:25:40 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/5] misc: fastrpc: handle interrupted contexts
Date:   Fri, 13 Sep 2019 17:25:31 +0200
Message-Id: <20190913152532.24484-5-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
References: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Buffers owned by a context that has been interrupted either by a
signal or a timeout might still be being accessed by the DSP.

delegate returning the associated memory to a later time when the
device is released.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d2b639dfc461..40b48db032b5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -952,12 +952,13 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
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
2.23.0

