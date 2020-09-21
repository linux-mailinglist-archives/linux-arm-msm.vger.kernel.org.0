Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B81272B07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgIUQIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgIUQIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:08:36 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E4AC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:08:36 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d13so9442852pgl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jN92Mz9LhRgMy6R9r5bCTsDXQ/6vWkXL7O/cDsot2BM=;
        b=nzkIqWF021QexFC2ADImymMMKhSnBD6UrPypndZ4JO6pAohLzx/HXzA06fkddAhZqM
         Ttc3HOdSBY5VabxIL8rleQCZMwF/CprzIZ7pr972QeXoDRnVsazhHLEa1+sjm0MkiAfD
         NekPUQPwdQnQKcq2YN2A/Qg3mbylrtAlawQWcZJpso00sPsOC8TfiYuDgoD7Y/8vUVM+
         EIYYA4AwKy7VzwJ5FHpkFcnIZRfKlagxwd6HAcDjmbUydNgmkTaKN2szUfpDOka+xdc8
         7h25erIjCP6zGI8RMBe5SkIWGVY5SDyPjAlmYH9MTvszegFk5nW5gC40eyl1T2qODoMt
         NRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jN92Mz9LhRgMy6R9r5bCTsDXQ/6vWkXL7O/cDsot2BM=;
        b=KUdA9Hqth3eg4klU2EcW0fJsCaIBNLcMjY8ujClbJhnJ8irUlppsplV/ZF9GuyEMrl
         6y5OOE8bpY2KUsQma7rQZB2CBY+4QLF9etMTtAQHg1Hcn5no8+gHZZZwajcBmJbN/XkE
         eRjVCt61zeszZ5+3eVfQEO+IalEK/hzvnKpuXQHEjfy9J4fDk822GgnUXZGANs27ntgs
         SgA0gsKO70BXWLEWnVCzBS8Ham6HhacPcJz1JCPnt4zTDrDSPX7AWyuZL1113h7aBaRv
         yoZ79WpQkRaStrGJZ+BHajhNmJ3duU1hkNZx5uK7x/kD7ubhzg8TdTNUQvIQMOH2+Usa
         wxwQ==
X-Gm-Message-State: AOAM532tDuEvqgyKDH2Mb2WAiDsc24++NJB0VEprUocp3dO6vZMtmkgQ
        iqltImpeXKCH1T0YPi0G3IQm
X-Google-Smtp-Source: ABdhPJw61eL4e7rcQYmV3efe5y7vCQnM9r0hJnFkCrZni+iluWmfEafsPD4S+lJfrajbgvXa6DNHkg==
X-Received: by 2002:a63:4e52:: with SMTP id o18mr264680pgl.171.1600704514704;
        Mon, 21 Sep 2020 09:08:34 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:08:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: core: Fix the building of MHI module
Date:   Mon, 21 Sep 2020 21:37:57 +0530
Message-Id: <20200921160815.28071-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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

