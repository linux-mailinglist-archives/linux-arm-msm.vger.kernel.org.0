Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7552727EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 16:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgIUOk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 10:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbgIUOkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 10:40:25 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC42C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:40:25 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id f2so9222092pgd.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=jN92Mz9LhRgMy6R9r5bCTsDXQ/6vWkXL7O/cDsot2BM=;
        b=zsL9JirMq5HpALimvd09iibQnWaz8tHvctE5DJPUqGY1Bwj9g7lv4HpCPEkrQr9x1D
         cpTvDW2kqI+apf8ijcXSda4vBc8ThF18xsliUg37T67kR2P0z6GTDBOgF6jXdrgqh2Mg
         Eoi6xq3GWQa4Nn1WZnpMZhl7RXyaqqo0UWZArO54H7BdBnZnlC5c0koY/nZx7PVkWXD8
         eUcVLJ9PEJcGe+A1IqCTVNHYA+zZxkNyY+o8wPyGapJKWEuU80LWGurNuSjmfInZJjs3
         BZgyddmubK/p2R0nUUao9TYW0hlnJj2sa0rcRJgfa5GCas8zN1/kB4ctlwZDjmc4eodn
         H/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jN92Mz9LhRgMy6R9r5bCTsDXQ/6vWkXL7O/cDsot2BM=;
        b=MBJubJBCl8sFbmAjJVQ6wqmYkBndIVjCil63XawaDYhXNv4oDQrSLm7ZfZmJkbXywx
         aYfvcM+fq63/kcSq/hvWw6FRRWWXfQtvQYum9fh0gVTeWrQaRNGMe47xsSF/Q1ac0VBz
         a3t1ncp8qYobEWPdivsEFrJWK8t++2rOgjbPDgFxKGAC/j3aOH/MVs7mpXCK1hmz2quP
         gLTsAaezqqn8gCvDG3VP4XCFuCIERf2/UHlhqevrixxsYX18qcEc0SaOh97GB9PYiUHq
         CYPBLbXxT4RLSjgJIGM2u2XZ+NZtEP2vWHBOBcmGKKJSJndTZXWc33ExR8viP11lXbtM
         sQuA==
X-Gm-Message-State: AOAM530pWtU92gEC9ETClHekvXOSxFWJwHRwlrySG17dQA0fkXk68KH1
        fFsDFIjb+wrPkVjCpaGakw4BNKZT9DAi
X-Google-Smtp-Source: ABdhPJyohwO/EI2eSCs0mN25XzumXwMZMcxYuYeuVEzHBXk0/POa0bAgm6mlE0cA5pI1tGm+UvhWEg==
X-Received: by 2002:aa7:8c09:0:b029:142:2501:3983 with SMTP id c9-20020aa78c090000b029014225013983mr229338pfd.72.1600699224149;
        Mon, 21 Sep 2020 07:40:24 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id m24sm12085108pgn.44.2020.09.21.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:40:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: core: Fix the building of MHI module
Date:   Mon, 21 Sep 2020 20:10:16 +0530
Message-Id: <20200921144016.10519-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
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

