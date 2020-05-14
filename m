Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB4C1D3B32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 21:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbgENS7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 14:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729565AbgENS7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 14:59:46 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC4DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 11:59:45 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k7so7964469pjs.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 11:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Udc+Jc9NUEP6E7cY+ReeRSJCDBsUse9YWoji+YKh8tc=;
        b=C5Py7dZrCpwP1j5EaOkkkAbsqKg3U/CQuIlFebASGJoVCo0ixxe5EdT8RS1Qi6b+nr
         MiU5CVV9F34Bc5Mpg8VmCiANAEggwr/L4RrlgKzVwBBzRCO57MF+8iZLLuMkTRheBp51
         SUCrAlebMCotD9JETyxuLzqzJ67xa89EuE0NZNBgbtu7veUzGxdHfLjNlfHsQliOuIxO
         375MPefTLjP+BPLhwrQfmmzx6tBaIPhZcMLz41Vg44bufVmJAKlAQaJnsOrbhyddVU0x
         oeNzIBBIlb1Kq8los1f2nw9yq/zREuc5LBXMlthaF8AvxOXs79NSCBJzLaGNRmWR57ZR
         FdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Udc+Jc9NUEP6E7cY+ReeRSJCDBsUse9YWoji+YKh8tc=;
        b=pKAdLHkqZRos0dVKt1bVzrKHHd8OEF4X7XSHBhQMiOcSQ7wUNyAnpMKFjCeNesaMUU
         8vsfypSkxS3iyxP80xc7+LJCWG2XLPU4Yap0ZtjMNQZW839sesVAyli3NFD4Q35xfWun
         0x2KumOp0aOEXEYyjuoxZkNmolJydSS3zqPqf8McQ0fJSNRZgvAsMkjAkXv6SphNJSb4
         Mhqu2ng9bcShVJR6gyC7fPeJODe6jnkv95BC43CuOY/G3Zl68P9XJ/gaOzS/a++sqFcW
         wVhfuD/BTG3CXFZqAFchqPJWXLIjem3WljmwffQXU+hRDucizyIiHaIkSjLm9k2Wiu9G
         SAig==
X-Gm-Message-State: AOAM530ZeMfpj0JnPnfCNEePN2XyXDqq7pKVEMqWxgfRjl9BrI3JnZY1
        OCh5xsS5oqs+Ha6lcBtS7wJCFA==
X-Google-Smtp-Source: ABdhPJyjEyU0z0Z1QDDvXc+BFps8nttKBctW7RJqvPKSuCP47oksGkwPHVQJ8xZUbhxSHY8OMtKj1w==
X-Received: by 2002:a17:902:6b01:: with SMTP id o1mr2199plk.64.1589482784953;
        Thu, 14 May 2020 11:59:44 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id fh18sm38563994pjb.0.2020.05.14.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 11:59:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild-all@lists.01.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] remoteproc: wcss: Fix arguments passed to qcom_add_glink_subdev()
Date:   Thu, 14 May 2020 11:58:56 -0700
Message-Id: <20200514185856.1598945-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <202005150242.0AdaUqnG%lkp@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Recently qcom_add_glink_subdev() was extended to also take the glink_ssr
identifier as an argument and I missed this while applying '8a226e2c71bb
("remoteproc: wcss: add support for rpmsg communication")'.

Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 48d16d81f94d..88c76b9417fa 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -560,7 +560,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
 	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
 
 	ret = rproc_add(rproc);
-- 
2.26.2

