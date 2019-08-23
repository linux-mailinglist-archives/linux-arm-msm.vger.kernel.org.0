Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5BC9AC7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 12:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391998AbfHWKHV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 06:07:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34059 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391961AbfHWKG7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 06:06:59 -0400
Received: by mail-wm1-f67.google.com with SMTP id e8so8966271wme.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaF1NgI3/tCvQBGNuV2Ozkr5swOUz9Q1YNoph3dPfCA=;
        b=G1xW6LLifBzrZM98pMoqJppw5kCp9ljlnOSzFRZtPclDF6fw8Cd2RUQbL0e+HEm3Vh
         XX47d4h6nOFaDu8xJVs81qT+pZ+mIy7lRkoybJ7YhLjSgksA+EHlJsTjucE5uYSVAZvo
         +maJ1dWGYioVbSCriunnxWS+VkjLwTXWXByvsLbX0bDs9OJaHQFzEhMuBh8ecp61O0fp
         jZVCvAk73YWOGRf70F/tbiI2HeEnsfYcO/0xZjti62IB6C9kIYLIC/r+QNPhKKbJ21zv
         TM0sAUn4q+jETQpBFdyuPj7eFjqls67JbdbpT3rW6taBVOyeCNlkgILM5x1fMUnJlyaO
         dEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaF1NgI3/tCvQBGNuV2Ozkr5swOUz9Q1YNoph3dPfCA=;
        b=ai+Aaz0AQQh6grXmh8R0c/rSbtK5kUImJoUZgvh50KsoBuFuhZQmOvQa6puxva3qUy
         boZklN9C9HpCMSr3BcEQmMEj84Ff359XQfghZLVmK14YLrvLKjfp78wvVE1SpUUfcLhq
         V+6Hlimh8NQAZx8Bq3Sfxqbn8H2AG/p9eJsf3NcfeDXNuwxQdz6FkD8SX9s+x6jE6f0w
         FSjJC5Iz1MqY8GzbsewHWg2cvlORgMxtNgE8C7llB6aDl0xyk8ltovhcho4Xntk6IRFT
         8Guj7tuWRxsOlrsBLCQxP41O73lAGPTlTDAA7x5f3iDMBN8uvqE/yIU0y3v0fkt4OTtO
         nOVw==
X-Gm-Message-State: APjAAAWw0j2g73w3o5W+tKrocq3JUEvQfb36DsbEAuuL5Qt9BTgmQiPF
        RAN3UxKG+jhE8VkodHvtWCcKZA==
X-Google-Smtp-Source: APXvYqxr6Ve5WHV7MVzIMJCJhqJK17mYKT2gjF4J7C7qQDdftl2ahoRPHgxRAJkI418O2EeBBSReLQ==
X-Received: by 2002:a1c:2015:: with SMTP id g21mr4100755wmg.33.1566554817994;
        Fri, 23 Aug 2019 03:06:57 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id q124sm2058048wma.33.2019.08.23.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 03:06:57 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     arnd@arndb.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>,
        Abhinav Asati <asatiabhi@codeaurora.org>,
        Vamsi Singamsetty <vamssi@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/5] misc: fastrpc: Don't reference rpmsg_device after remove
Date:   Fri, 23 Aug 2019 11:06:19 +0100
Message-Id: <20190823100622.3892-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

As fastrpc_rpmsg_remove() returns the rpdev of the channel context is no
longer a valid object, so ensure to update the channel context to no
longer reference the old object and guard in the invoke code path
against dereferencing it.

TEST=stop and start remote proc1 using sysfs

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mayank Chopra <mak.chopra@codeaurora.org>
Signed-off-by: Abhinav Asati <asatiabhi@codeaurora.org>
Signed-off-by: Vamsi Singamsetty <vamssi@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index c019e867e7fa..59ee6de26229 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -913,6 +913,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (!fl->sctx)
 		return -EINVAL;
 
+	if (!fl->cctx->rpdev)
+		return -EPIPE;
+
 	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
 	if (IS_ERR(ctx))
 		return PTR_ERR(ctx);
@@ -1495,6 +1498,7 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	misc_deregister(&cctx->miscdev);
 	of_platform_depopulate(&rpdev->dev);
 
+	cctx->rpdev = NULL;
 	fastrpc_channel_ctx_put(cctx);
 }
 
-- 
2.21.0

