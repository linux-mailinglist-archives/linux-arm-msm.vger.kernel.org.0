Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA30E27A637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:11:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgI1ELZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgI1ELY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:11:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2CDC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:24 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u24so7164943pgi.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+YUGt6aV7OP8RvUr5xgq7JykMZCPIUZje2/XDNY6QSI=;
        b=AOeLHt/KDm80VKiduR8Ny1aiS600MblMO8wr+UFAVtGy8ynNYhB6EqPpBWGvv2lg6r
         5zPnMMi59qGXKVdR/N7PTEtgjwAzGEUEASaaMi/EjIjxcFNlaYH0K7UeKhN4wPeZQJrI
         ASKRXDJmUKlje8EiKsArwTef6qEqjbXvUXmfOFaFAa1kkluqew9WwfMJgq1rFXUPRsjI
         0d//gNgWYfGFyTUNEN6OxG6I56N2CzLpi4u3aQyqcdmAammzoOWIvBO6QGTsMAtN8v3W
         mA1dmqf4p/ohWieRbTOaSIIgQ5D5QgBYJLqz45XovJCprwQFnPOfBml9VQTCV++B901O
         tAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+YUGt6aV7OP8RvUr5xgq7JykMZCPIUZje2/XDNY6QSI=;
        b=eo28TMWhfIHu8PkIiy7IfTT2WlRRi5WHxo14WGhaYe9DmZMF1TQ91nyAuiSClJsp9D
         ZrgAOI0JWpzP1MXl7hg0jimATtPf8Y5SAwCsT+92/rITo0YRqOqHDzI47zKOZRpR9e0D
         cszu5G9+s4ed5izyKzey8qHhI2yCzamWJ2Qm8LTe0nqV1VOWnaSLj+A+r9+QehrHTMr7
         lXhJ9wyx3+n8jMzgKKbdbISwSXWYOe/2NpaGD63KfrKEyZqhSKxCARANPmfMIYZdGM4d
         JEpepzvmKm67nGO4mECn5pZBS+ffeMA4JYEQ8wXZ6VCLMgU3589hm30ziTWXpYu9hIBw
         BUSw==
X-Gm-Message-State: AOAM531mKxJMcpcFGA7ViCN43DqKwGtxStT3qlwcla8Z4nADi0C07FgA
        YvtK7yFXZXT/7paB8/9jT/Re
X-Google-Smtp-Source: ABdhPJy5NlcTy2vGgfZAtEyXp28882bTlk7+SZpb1IT19eAjj79KZzuV1VUbXyFmEt/KxYkYDEY5qw==
X-Received: by 2002:a17:902:8493:b029:d2:42a6:238 with SMTP id c19-20020a1709028493b02900d242a60238mr9474319plo.4.1601266284258;
        Sun, 27 Sep 2020 21:11:24 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:11:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 13/21] bus: mhi: Fix entries based on Kconfig coding style
Date:   Mon, 28 Sep 2020 09:39:43 +0530
Message-Id: <20200928040951.18207-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
References: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Kconfig coding style mandates use of tabs for the configuration
definition and an additional two spaces for the help text. Make the
required changes to the MHI Kconfig adhering to those guidelines.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index a8bd9bd7db7c..6677cccd61f3 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -6,9 +6,9 @@
 #
 
 config MHI_BUS
-       tristate "Modem Host Interface (MHI) bus"
-       help
-	 Bus driver for MHI protocol. Modem Host Interface (MHI) is a
-	 communication protocol used by the host processors to control
-	 and communicate with modem devices over a high speed peripheral
-	 bus or shared memory.
+	tristate "Modem Host Interface (MHI) bus"
+	help
+	  Bus driver for MHI protocol. Modem Host Interface (MHI) is a
+	  communication protocol used by the host processors to control
+	  and communicate with modem devices over a high speed peripheral
+	  bus or shared memory.
-- 
2.17.1

