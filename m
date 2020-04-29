Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E191BE2BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 17:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbgD2Pac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 11:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgD2Pac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 11:30:32 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C10CC03C1AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 08:30:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so2493252wmc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N9yPL5U8quFESl4Stw3OsG4QqTTqIkWJu59ukHEiK9k=;
        b=whxuS1tBIOGCXGKR4D9txfj0YrmvLOppPzKf133Orw2xrDFaxNC2NVAj2Yxms3Btjw
         NHvTheC/ne7068Zqc8rsMg+2BAga/XkLIMao16bcGyxemQ9q9tPqOjHk0EluqowWkXKP
         rm2JZAmN0vdwbkYiYGVNeiyAnsrCfqjEdvzEutsmoYC9XAyQMi2c6PjQHLansB11bjyF
         bAUz0LQ+Eq99vqYrtX7aMn19G5+Vdwv7XDOACYvKaODSQs9rSt0XJ86Th9EXer1tOHDZ
         ZX6Bc45zaPh7n7Ra92xD31RtoqDp7AyFTEGH76JSzCHwW70/ZSoSvsFSSJUMHHiKJ0T5
         Qbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N9yPL5U8quFESl4Stw3OsG4QqTTqIkWJu59ukHEiK9k=;
        b=bGk8GJylfjIQPk5+ZBPS5ATr1EPDrUw+iUGLHGHskub88lo/OJjAk19PVoLoNP+phs
         3KkidU0vemPoyANsCso5Jyb+Q62ux6QJCsOsZ2rzaUEl6ds4J16yMgTjINfTTrz5D7Xu
         3Kjnu8gIQqn1T3lmkcjh5PxuIDVv7DnUBhcelQ9KqA9L/Pzg2yJTwOlvQ/87a2lSY9Zr
         +Qe0Ano3SzVvFxC/8X693BMzf1vl/QuWcdaVA/NUaR4yt94VeEjC/PzGfx1VvHv98oej
         fUiWLqExGeH7qfpa2xMRic81sc/s9cgQYxkIRj5HJyC8o23EoHIhhhmdYG1SOalK8ilP
         +xWw==
X-Gm-Message-State: AGi0PuZuqLYp43EjTiqHjQ/DWO2+I9QwayJKy91yyuo5tZ5oXuGcWLxR
        mbelyVFC2Wo22/eeSQzkZJstiQ==
X-Google-Smtp-Source: APiQypI9ooSvKXGzfgE7VydIt8jFs20yFTtVFE5oUkIKvGGCN0t6yST0jxtjPo1HsMTn0kxs9wv4CQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr4090739wmo.118.1588174200388;
        Wed, 29 Apr 2020 08:30:00 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id l5sm7923729wmi.22.2020.04.29.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 08:29:59 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] misc: fastrpc: fix memory leak
Date:   Wed, 29 Apr 2020 16:29:51 +0100
Message-Id: <20200429152951.18504-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

if misc_register() fails, previously allocated data is left without freeing,
this could result in memory leak.

So fix it!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/misc/fastrpc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index e3e085e33d46..9065d3e71ff7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1613,8 +1613,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

