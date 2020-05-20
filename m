Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE3B1DADF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 10:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgETItU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 04:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgETItR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 04:49:17 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D35EC061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:17 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f6so1131343pgm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/GPOSvzOGmCtBHrtawLleBNjihEJLwhFje0r/gyBuU=;
        b=UgV20lxE+m+5SQqLGTghEUwbTUIM9gsx3aohb5041IPILli+i+DueRkw4rs3CjRGxL
         LZS5e2UCfwkwAMonLsL3niejayYElFI+pPozSt58oS1qocOOL7IlVKiYeT/toB8tkEjV
         wMz+aKUDq8VAhC0/BzUvqi272zqkPk5rMwZdJKtMR2GOI5HKU8bvFYTTAp/GDmaxI2YO
         BlQkxKE+5rSWht00tp+BRAjus+zrmgdOja0SNtIMKGtKvCDLJlZOGld8f9lntRvNW1RJ
         ya2kpYX94mnL0y2m1esWiPualqY7/k5Rqdyh8hlEUOET73J2UFTjSHqL6Yq1vd5DMDWx
         PtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/GPOSvzOGmCtBHrtawLleBNjihEJLwhFje0r/gyBuU=;
        b=FJ6d+w2GTTUS9CX1XpzXR1iOUxz9uFnT4l08bZBqWl4KEmNSfi9HfzedCjI80jK8tp
         xJcHduPbc8A+E5bmlHHKUw+Pevmszm+waZi5O6g6QPpR50qoRdW4RBJp02UupYVgJZcz
         dQF70BmvT8jYPiFYe0Auqj+Ec3GMu3uPZPMVNNmZ1j8z5ptxMq6xmyIUg3tn35IZy3zQ
         GIWiEaXLMFSvqqsv4nNtc4eJaL7kFXCFkxJ4x0+QYOtVmSvGPXzQ6AeFFSEQQM8LeGcl
         cLJRVLzbgndMRvQUftIfcm67mjyT1ak2PeljTGASUJjDx/LdbU2rlIJukBwaQ+EzgKGc
         ZzoQ==
X-Gm-Message-State: AOAM532LOHNR2FYoZmOgUSojM++u08XH1xeFZN5IN2xKMIkTzsVo51IA
        Xo28dLBk68RT3IDZbZrRFAyZ
X-Google-Smtp-Source: ABdhPJzj9bk9hZCRxZo8oW53zgCLOrVhCvadLVA3ohiWT2uJcdRzK8qBIb25Ia1yGDIjiBKPe55flw==
X-Received: by 2002:a63:4b0c:: with SMTP id y12mr3054903pga.56.1589964556662;
        Wed, 20 May 2020 01:49:16 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:91e:dd0a:7c30:1f7e:ebdb:aa2a])
        by smtp.gmail.com with ESMTPSA id a5sm1629332pfk.210.2020.05.20.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 01:49:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Qualcomm IPCC driver
Date:   Wed, 20 May 2020 14:18:54 +0530
Message-Id: <20200520084854.19729-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
References: <20200520084854.19729-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for Qualcomm IPCC driver and its binding.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..cc2fb991cc0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14013,6 +14013,14 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	drivers/iommu/qcom_iommu.c
 
+QUALCOMM IPCC MAILBOX DRIVER
+M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+F:	drivers/mailbox/qcom-ipcc.c
+F:	include/dt-bindings/mailbox/qcom-ipcc.h
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.26.GIT

