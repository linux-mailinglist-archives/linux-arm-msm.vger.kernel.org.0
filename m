Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64401B2349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 17:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391446AbfIMPZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 11:25:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36325 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391347AbfIMPZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 11:25:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so32515692wrd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2019 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V4nZUxO6Mm4xe18R5imoxVeMnq5wn7Jg/kL+/NyaL6M=;
        b=xEXgWcAmcjCbnlv2PZIcl4tioAQPW+pRHXZ+DDwIDcwrrtMgr3qzqom11PVXxCxWLM
         rpnWqp2cCPzw2MsLejDa1mjJrJeVnJoa2V29h4sJ1or6BjmehFfFbLaIIBzr63oTwD/U
         cWLVUpgY77Pykty1tSlJIZvHnZCrr95m6o6xxcyVVZkj9+8Kg+iKiOuzEkXkSDldyaqN
         jeSmbyKztRbCEANeQIPtJtx+a58FqrFnDfGaj3aEmWGVGO508KlSm1Vu01TC58fMZbiQ
         8BlWyVnqIWBWynUp7gEFp0VVLUIdjzAzTLL4V57uqnQNh5NcAWTIEPEmufn8WsImKum3
         V2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V4nZUxO6Mm4xe18R5imoxVeMnq5wn7Jg/kL+/NyaL6M=;
        b=F6p7jKYQWbLrnTUYglAvIaQxAWfrvC8XmqcYXWRgtY5jwF2ctV/Bq7MXaGUlr1cXYc
         FWbdr2kQ/REhMOpa1Pl5IqE4pWrYVX/KOBWB57yOd610EtIhikAYS8uIRQeYbHrxKosX
         Y5mkbF+fmaav05IEVYuFDNl4JnfsecVyDa68dZzx7s5bD8Q3sZb95y4xth5Da5it124M
         kJWco8YbnmpY1ISEuCGRBi/LwZ5yj4JtvWsJr4aDDvLTKdRCSClzLzRZQ14ZkAEWTHFt
         XJY3oq3ZekvBh5PeymgnTXL1CEHn7JeL1AOEvgGSwiUJ/PwtdQuprg9TCE+sxDzoHoKi
         UI0w==
X-Gm-Message-State: APjAAAV1G72AQ4axeRoM4jidykUe8x1G3eGFFOTYUbKZoHZkG+F/XgXM
        8bHPyWinRSr6+ebZx+62kY/5Mw==
X-Google-Smtp-Source: APXvYqwA3VTpB0q2QY8NDVr2s8pDU+/EkIkLndJoIsfZjwVdEU3xg3y4NwKkcBGnZl5SVniCYfTI5g==
X-Received: by 2002:a5d:4a05:: with SMTP id m5mr11622678wrq.265.1568388339932;
        Fri, 13 Sep 2019 08:25:39 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id d9sm48717728wrc.44.2019.09.13.08.25.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Sep 2019 08:25:39 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] misc: fastrpc: do not interrupt kernel calls
Date:   Fri, 13 Sep 2019 17:25:30 +0200
Message-Id: <20190913152532.24484-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
References: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

the DSP firmware requires some calls to be held until processing has
completed: this is to guarantee that memory continues to be
accessible.

Nevertheless, the fastrpc driver chooses not support the case were
requests need to be held for unbounded amounts of time. If such a
use-case becomes necessary, this timeout will need to be revisited.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index bc03500bfe60..d2b639dfc461 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -927,8 +927,13 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
 	if (err)
 		goto bail;
 
-	/* Wait for remote dsp to respond or time out */
-	err = wait_for_completion_interruptible(&ctx->work);
+	if (kernel) {
+		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
+			err = -ETIMEDOUT;
+	} else {
+		err = wait_for_completion_interruptible(&ctx->work);
+	}
+
 	if (err)
 		goto bail;
 
-- 
2.23.0

