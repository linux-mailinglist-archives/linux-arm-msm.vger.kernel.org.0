Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E85127D520
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgI2Rxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727863AbgI2Rxq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:46 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714E4C0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:45 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q4so3062054pjh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1xlErZ6+GH/dFW2F7UNH0x194BKPh+D1csCpYINewdA=;
        b=DjFYWvjCzk4vJuMNUoELofbluXc+tJlTIqeWiZqFuG0qJzcghYmUALWB/W36svkgeD
         4m9SXbLYe+PaYYGLaFFzilIfBFnm07t8NrKVljtHm1nVa4kJrRJ6kyRJv63dmnmILr46
         arQVrozZdTkjgB3gm9Kuj1IviJ/LWhxRJuLSUj9X6gv/BeQhWd76qY2Yr0KS3/0ci+ub
         Sq05T9J9ed3ZA966OOMBqPMNmXhWn2kJecBaJetVlxhFoNh1EP6ijafBSL51iOyQDhsF
         6C95z28+5tg5H+X6hs2LD/GuUrieYh1ptqYpFg8cusW6KD1bmL9S3dINQ+h5m8A5Vqye
         SElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1xlErZ6+GH/dFW2F7UNH0x194BKPh+D1csCpYINewdA=;
        b=QXaV9O91GPHqlolKWgfN77mzdsWt3QGd/Wuf+yGmCy4Ob8pblcI8sCMhZy8TPmzpIW
         v1m0PCGEixpYzyPNe+Mn00AZnTM4+R+gVDkICUloYbcyKmS2dFyTUDXepvMXAdl+Io1n
         hbTizy6SVU+TcFVUqkKbveSMmDZogqI3mVD8bu/xfqjToEEGEntqyD3FbrWuwOtC5TcG
         02wzUEENLoIc64yBupmJiLcCIdL/OgWZ2aOTYMeprgGnFdxwXTrN5tjOod494x0x/dEK
         TKXsz0SVz1vFKJTFLhK2hIxA3Re/pxkIbjezQK0nhLvlPpqsZbO4z/5hGrqW+tPMiRbr
         2zIQ==
X-Gm-Message-State: AOAM530CeNS8U8Hp5xqouyjvNJoaVx8to6wmsZGfPh5nHsM+BCeQvYNv
        qGGnHYb/QfSWena7YLpvQPf/
X-Google-Smtp-Source: ABdhPJwzl16pEcfLQjEvjYvCWYK6RsX8cE9zdfcNLujwvGydbR8HnZEUQHwZArxxAIP2SiEqUttKGw==
X-Received: by 2002:a17:90a:1b62:: with SMTP id q89mr4995702pjq.74.1601402024910;
        Tue, 29 Sep 2020 10:53:44 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:44 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 18/19] bus: mhi: core: Fix the building of MHI module
Date:   Tue, 29 Sep 2020 23:22:17 +0530
Message-Id: <20200929175218.8178-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Kbuild rule to build MHI should use the append operator. This fixes
the below warning reported by Kbuild test bot.

WARNING: modpost: missing MODULE_LICENSE() in
drivers/bus/mhi/core/main.o
WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
WARNING: modpost: missing MODULE_LICENSE() in
drivers/bus/mhi/core/boot.o

Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 12c57ab3724c..c3feb4130aa3 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_MHI_BUS) := mhi.o
+obj-$(CONFIG_MHI_BUS) += mhi.o
 
 mhi-y := init.o main.o pm.o boot.o
 mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
-- 
2.17.1

