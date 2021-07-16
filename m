Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939C93CB388
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 09:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhGPHws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 03:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236624AbhGPHwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 03:52:46 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B53FC06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 00:49:51 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id w15so9121867pgk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hbqcc05b9cC+3ePQ+rhBVXntvQzobwWv88CxyXirmFc=;
        b=coZyTMpZMmDFrPZ73mXbeS8jAaekB1mTswMIPGHWlDIIcjlB188tGixF9QBxy+FOuP
         o3Ts6ip+Y1Ore36Gc5r5xuBBGnkvJg/dqDxdyA4ZDhmgKIYwteem9+eGn5gTvoF2zv8o
         SrvuxLQjx1QuuptlDmOIA5Pmzl/VYAU3ID//dGnsLHgkxzuHdHZ8kPU7mgIEQJw0Sd7H
         bugqTuitPrb6UHhH3lqDmrhjieTWXFeyTI2ERv6GG/uvd8bOUUIrQzFl2pMIjGxlUWn5
         rZiQYZQ2GqeBAc0WKgI1bmpX970BXF21HJHUNRMtsga5NdSTiLopLdnEosn5LrrzrcYU
         ZRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hbqcc05b9cC+3ePQ+rhBVXntvQzobwWv88CxyXirmFc=;
        b=Xs1PXOw6qXPadaCLjbAKF2I7AsE6jpxbvFbNdKYK8YsLNhITKjzkMRCwK3V/Q++UU+
         L8xDh2tFEn6/SrrfAFdC4+gRgqS6YXhYI5A63T3OUINBRvukrSKhdo47VE+e3IaxBN3H
         L69DYf0a8VAtk2D8iKsAPTqiV9OJoD/+7dds2cUz9q8cRvh2rqSseJo78rAGb2oR6FSS
         uGB+xmHOLJPBuTLsCSElN8KEaqX4oSDMoDRGKZFDfiDBXi0tbTFXAY4RUjm435UEjk53
         PbT6IfKTH4tILuknySi8XFKgTE1IsqTruqN1Y6q0Wg48LrB1M24UT2VyI3RAaM4dxUra
         nzbw==
X-Gm-Message-State: AOAM530Tuq5a89QtjaWb1tAxJ+ZqkBWTcspe8rMCxeoWx0PklijmilgF
        ABCy26G2OojqMmxVnwAqrSTT9w==
X-Google-Smtp-Source: ABdhPJx0ctW8eRV1zQBaoaROp9dbg3PYMHa0BmNrRFlKMyzpEwj6da1eN8YGqaUzDcaCcZrHeTnh0Q==
X-Received: by 2002:a05:6a00:ccf:b029:329:308f:9ef6 with SMTP id b15-20020a056a000ccfb0290329308f9ef6mr8961329pfv.24.1626421791019;
        Fri, 16 Jul 2021 00:49:51 -0700 (PDT)
Received: from localhost.localdomain ([49.207.205.206])
        by smtp.gmail.com with ESMTPSA id 85sm9082706pfz.76.2021.07.16.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 00:49:50 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] mailbox: qcom-ipcc: Enable loading QCOM_IPCC as a module
Date:   Fri, 16 Jul 2021 13:19:46 +0530
Message-Id: <20210716074946.4093-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch enables the qcom_ipcc driver to be loaded as a
module. IPCC is fairly core to system, so as such it should
never be unloaded. It registers as a mailbox + irq controller
and the irq controller drivers in kernel are not supposed to
be unloaded as they don't have the visibility over the clients
consuming the irqs. Hence adding supress_bind_attrs to disable
bind/unbind via sysfs.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/mailbox/Kconfig     | 2 +-
 drivers/mailbox/qcom-ipcc.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index b4b780ea2ac8..c9fc06c7e685 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -264,7 +264,7 @@ config SPRD_MBOX
 	  you want to build the Spreatrum mailbox controller driver.
 
 config QCOM_IPCC
-	bool "Qualcomm Technologies, Inc. IPCC driver"
+	tristate "Qualcomm Technologies, Inc. IPCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Qualcomm Technologies, Inc. Inter-Processor Communication Controller
diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 584700cd1585..f1d4f4679b17 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -277,6 +277,7 @@ static struct platform_driver qcom_ipcc_driver = {
 	.driver = {
 		.name = "qcom-ipcc",
 		.of_match_table = qcom_ipcc_of_match,
+		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.25.1

