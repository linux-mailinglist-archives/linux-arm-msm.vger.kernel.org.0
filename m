Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF6E4016C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Sep 2021 09:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239895AbhIFHM6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Sep 2021 03:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbhIFHM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Sep 2021 03:12:58 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AC3C061575;
        Mon,  6 Sep 2021 00:11:53 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id k24so5854384pgh.8;
        Mon, 06 Sep 2021 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsg4YiSotxSwnOwFccYZzE+S2ol0/INLDN11u4LFXzo=;
        b=AdKoz5/G7RmGrxhR+tjT418QLD/Xq4mtOAhi+KTkJS9voQnfrKrozfbfaOnCol4Kww
         CN3Ugl/0JsIMDTJVghukl86iF+yodaALLeL/UghGvd8r5nyiL22EvZ7BigRtEDse5wuW
         EkkHpB0aWlEzunQh3627lvJuYf6aa3PxcDcY539GjTdBeHNiOZSCbA/uvZcezzeu5tj7
         MDzNbzL/+Lx+Whpa44RheD5AAUUJ+EO8EUZkrphxOMnhW25y0g/9AfmzKDod5YwdGMay
         gQPi1pvRcc3FHhtJznNjnFJ3QqUd6lis29GCoKX7fs0mDhPS5kpaoxyeg1ehuOnIfTNr
         UsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsg4YiSotxSwnOwFccYZzE+S2ol0/INLDN11u4LFXzo=;
        b=orFw1HebGbpQbcxPDhiW9LC4ZyMC0vv8+ccDfBHxQ5c9+0EXPMkVAgHcLOK/WmMlRO
         xCBdpD+bQDk1XAhjvrGm9AfcW+q5BQUI0KD9IVfjv1LcQ9vHofmOA1+e105aJP5cyptD
         8xni5w5HSjieq7UdgF/x8+UIyqaYvzKa+cG0b17+PpHTVL4qNZJWhUQkeHO75mbAcXOt
         q2VTHhNZ+SFywngia6WqZ1axXdwKTClSDJG0zS9hsNhtkjVObu6dE8rr9L3R9zw5c8+B
         OpJ/FxjZfmpj0hZ2AZjYrmyiEKsFEbRaqxrLlOZqEQAu6PoQO38jU947gUduUyBceZ3N
         k44g==
X-Gm-Message-State: AOAM532lcOO3K+Lcej8Gvyk9yqBqqg8zlzxeCVgI0yPWNbxXY7RukUWl
        jUQXsTTAiAkLGUicW/Z/2SE=
X-Google-Smtp-Source: ABdhPJzNO3A1G/D7DYg4+w1B0Z3aDKOk0guF1R4BSr9HhpXDatP9gvYg756U0SkcLb8sA7YGNTE3MQ==
X-Received: by 2002:a63:af50:: with SMTP id s16mr10752362pgo.137.1630912313487;
        Mon, 06 Sep 2021 00:11:53 -0700 (PDT)
Received: from localhost.localdomain ([111.207.172.18])
        by smtp.gmail.com with ESMTPSA id 126sm8436347pgi.86.2021.09.06.00.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 00:11:53 -0700 (PDT)
From:   zhaoxiao <long870912@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhaoxiao <long870912@gmail.com>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Use devm_platform_ioremap_resource_byname() to simplify code
Date:   Mon,  6 Sep 2021 15:11:47 +0800
Message-Id: <20210906071147.9095-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In this function, devm_platform_ioremap_resource_byname() should be
suitable to simplify code.

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 423b31dfa574..38d57af3149d 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1480,16 +1480,13 @@ static void qcom_msa_handover(struct qcom_q6v5 *q6v5)
 static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 {
 	struct of_phandle_args args;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
-	qproc->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	qproc->reg_base = devm_platform_ioremap_resource_byname(pdev, "qdsp6");
 	if (IS_ERR(qproc->reg_base))
 		return PTR_ERR(qproc->reg_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
-	qproc->rmb_base = devm_ioremap_resource(&pdev->dev, res);
+	qproc->rmb_base = devm_platform_ioremap_resource_byname(pdev, "rmb");
 	if (IS_ERR(qproc->rmb_base))
 		return PTR_ERR(qproc->rmb_base);
 
-- 
2.20.1

