Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBD127A643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgI1ELq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgI1ELq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3313AC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:46 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o25so7176145pgm.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1xlErZ6+GH/dFW2F7UNH0x194BKPh+D1csCpYINewdA=;
        b=tn5Gy1gFVmYfYLIuDCmfddudD2JU00xcsk4peN4JygrM4xccWww+oN6ysrGdcUj7TF
         RpYOUWZuylGPv+kVXygncq0d8qwPYFK/3yePpzCR+/l6wOGx0rRhEuQVDw2NQjQpa0Gl
         QGMNyvd2Gd8KKChOyYkwsEqDG5A/E/otXZ/f6X+2beFCniZav+95yG4EPS+SRAYcpIpT
         7zMFzSXToVQzbr4JHUZivPfdDLzNoAtBZOilpXHj/e0AcHIVCTpmTBw/6J8QdfxgDhcT
         UnTs5nwbLC72Eq7qHRNvEGslHXbfJ0EC5TxdutACDPX8BmhPkecGQkwVnDYSU7c6AHLw
         7vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1xlErZ6+GH/dFW2F7UNH0x194BKPh+D1csCpYINewdA=;
        b=YFXIfI26g+FaOb+N0ElP4i39rly1H6KTZK4WnvB7vVJORSm/t384DJmhgM/4ecvMcj
         IDZ6HfIVI0L+mC48Ygk0KDgt2j2VvAFf7uBZU8UvI12rsg9dfpl/Pkj1Di7cCuhd10nN
         4V63pfuP/3Jy31HaUyOKvmz0Oz88jDEnV73b2EsiaNXq7T/kDxIMs8EZI9evdY1dYb0C
         TUVg9TkjbqOyBZybPNfQWTxlcS2QrS01LN22Hc19fkA8s9a6KJWG+N7NalY0qD3yRW5W
         RAFVP0SJqTs0bgcHh8VojcfFlIXBOvm0LGvT0rdXp/hV8vxmZCYRKnX8ab8A6eCikRML
         kL1g==
X-Gm-Message-State: AOAM530C2uKxcSumcVlv3xPuOHoHEdxvfbFyRj+hzcRIAmNjNnHsi0pF
        /31o621fQvhTMIksOCxN9k07
X-Google-Smtp-Source: ABdhPJyVKvIqmNXeugpSqcZtt5LQm4ML6GlhjBWgWsCFlxQIqQ4TrwXr3l2UkvB5ConCHYvcopnVdA==
X-Received: by 2002:a63:121d:: with SMTP id h29mr7390503pgl.285.1601266305646;
        Sun, 27 Sep 2020 21:11:45 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 18/21] bus: mhi: core: Fix the building of MHI module
Date:   Mon, 28 Sep 2020 09:39:48 +0530
Message-Id: <20200928040951.18207-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
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

