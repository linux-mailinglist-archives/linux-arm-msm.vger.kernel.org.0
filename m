Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260082E6EFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgL2IhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgL2IhI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:08 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AABC061796
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:27 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id jx16so17186104ejb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=geSRvMF6kCfgAVrxKSiIze0q0V64uiyFq2IRTDk+dkk=;
        b=D6RIykqbbsTWhkZryFVxGocnOeZBVKPudNdGZj2vvHUJUpibdCgqocDJAFSK69Wn+P
         ymnqXLJWmCoJHZr1s5yODfIsbwEpwTdf35wOlRql8UUQ/EHkfge2GjSLXjgBLI4cAc/z
         w2w0N5ec5hqW3/YUt/ZIVYrPH+riYh9YtJWeh+f+uFlBG945PBhLiczUnLmEPKlulJJY
         lwj0R0V2ex90i06Jx7cOt3H3UF7oz5k2Dnxweced4IDyyrk9ebdnJSGyfrNF9UxskCxY
         NjDScanYjDP6sBg626FxAxriZaOxTqFeayKPdUECGYXEGon7UU4ZUlLe6Lg8sON6zDz1
         pI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=geSRvMF6kCfgAVrxKSiIze0q0V64uiyFq2IRTDk+dkk=;
        b=noxwhPtwfoPfXL2T/JTzidk1jso4VpqjtpWAlGFKU0sX0LbHO8V8t6ZZ6fPg2ROb3c
         MYgmrnXI+1+JyaRvcewkLlGmKV2yIP+HAD4Pu8p44Xvs9j2e2C9oCcTgY9ahoDK3UXG7
         aXXf4jZf9RcUq/aafLbRbuM3zgr/znEuX3VVysVOtYL+iLjLolzkAU+i7VspwPBB2vMo
         RDxiAB0mXz522XGL077eWmevqH+KNvf/PVZaZepeavlbUbfF3fkuOGtKn8iuXhWz/zEp
         g5Hxdp6R5XRwiCQdWOQY39ptloP9suGIN2purHdohOgLZo7qycnXKhY4vBu0LrTC4MmH
         TmMQ==
X-Gm-Message-State: AOAM530Xww7bKXQqTO6pSPvUXccHbXuiSlA//u3RXk1KLKFk1Q1uahwp
        AKPR9WZj8OjXvRbl7fGN5/41xA==
X-Google-Smtp-Source: ABdhPJz09APddcVkyClzTNxKzzGbJLX0udj+ibQ/vOXtaePzmFZUVQikyNH2ROdf7URkqngSb25PTw==
X-Received: by 2002:a17:906:a04e:: with SMTP id bg14mr3255978ejb.149.1609230986639;
        Tue, 29 Dec 2020 00:36:26 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:26 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 01/10] mhi: Add mhi_controller_initialize helper
Date:   Tue, 29 Dec 2020 09:43:42 +0100
Message-Id: <1609231431-10048-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function allows to initialize a mhi_controller structure.
Today, it only zeroing the structure.

Use this function from mhi_alloc_controller so that any further
initialization can be factorized in initalize function.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 6 ++++++
 include/linux/mhi.h         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 96cde9c..a75ab8c 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1021,6 +1021,12 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
+{
+	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
+}
+EXPORT_SYMBOL_GPL(mhi_initialize_controller);
+
 struct mhi_controller *mhi_alloc_controller(void)
 {
 	struct mhi_controller *mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 04cf7f3..2754742 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -537,6 +537,12 @@ struct mhi_driver {
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
+ * mhi_initialize_controller - Initialize MHI Controller structure
+ * @mhi_cntrl: MHI controller structure to initialize
+ */
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_alloc_controller - Allocate the MHI Controller structure
  * Allocate the mhi_controller structure using zero initialized memory
  */
-- 
2.7.4

