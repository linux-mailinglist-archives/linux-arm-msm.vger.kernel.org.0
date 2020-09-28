Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFC627A63A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgI1EL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgI1ELU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3DFCC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g29so7172585pgl.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3OCoOb+JFwXi2wMv6xbpF4vbDUAK9pGDZl8s+55Ok38=;
        b=z24vRPeoJKagqb/kdX+yCqnuSqIOxDDAS7o4YTJpieZQwOGxPov04sY6Kn9yJvo4yf
         Sgrsd2EugHoNLyaPk1EbmCpqRrr0ahacAraeQbkX2TQQuAwv+LoQd1k7s4ZcEnWmov5a
         71cDsQCoeHFlPfO7TjxYaZPMSc++WjIIPcC2y4Qr8xLlTJI24C8NosyLBdVBf8RjUFIh
         RHqfghkXwwW450d7y9eE4MasGZbPYaQiYjicQD5+PDR5XLaVfKEd/snYE59Z7P1JCvkd
         K5XImZIrCN+CGrd7ZjP7qK3EUOzlna8Z2R0uHImoZLVc5+4D+6ogo/n7p+UsBaQYlp5T
         pMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3OCoOb+JFwXi2wMv6xbpF4vbDUAK9pGDZl8s+55Ok38=;
        b=LrpTNj07mfy/PKfMyxKUitRu/yajYAqVp5SYKQ3M+xWCvHGTbagyMpW6jPteCwuFm5
         goh0D44GtZ4+pBzKxZtEr6SM0kVGtsEM6oE5b/k0AJfXuE1da6CadqSe7GxAjiJPjBoD
         CPr8ljxOVDjvCzOO0/tlhXizFPWvMN4gK19kgPMEuH5tKkBFFfO/V4Y2a/jK7IiqD8Rp
         5eIJ9BC2aQ6WDwoYMDGTjrLf90reaMRGBjbiDFZFCDymRV7uPlnrjaYgKr+a8cGBsAPT
         oexxIu95GzY0JMHA9CUTvqYhZ0GQWd+L1EWl7/IDtPox79roK/tu+cX/RJ2tmXUxFduo
         J6/g==
X-Gm-Message-State: AOAM531PrmuJCO6che5zBbgLpKQrzBwnHUyV6L2q//uQ87WJ/aR7pFxZ
        hOAWvIl/Jbf2dbh1x4QpwFyJ
X-Google-Smtp-Source: ABdhPJw36czW94voSqKYm/WVdQlEmcDvKGs5RwDrCGhnli9+XXi1q/qHVYkZsB89q8v/X+zW0o6rTg==
X-Received: by 2002:a63:eb09:: with SMTP id t9mr7461458pgh.182.1601266280320;
        Sun, 27 Sep 2020 21:11:20 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:19 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, Clark Williams <williams@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 12/21] bus: mhi: Remove include of rwlock_types.h
Date:   Mon, 28 Sep 2020 09:39:42 +0530
Message-Id: <20200928040951.18207-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Clark Williams <williams@redhat.com>

rwlock.h should not be included directly. Instead linux/splinlock.h
should be included. Including it directly will break the RT build.

Also there is no point in including _types.h headers directly. There is
no benefit in including the type without the accessor.

Fixes: 0cbf260820fa7 ("bus: mhi: core: Add support for registering MHI controllers")
Signed-off-by: Clark Williams <williams@redhat.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b2c0214bfbd6..008b8f6fa9ff 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -9,10 +9,9 @@
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/mutex.h>
-#include <linux/rwlock_types.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
-#include <linux/spinlock_types.h>
+#include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
-- 
2.17.1

