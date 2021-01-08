Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE02EF1D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbhAHMGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbhAHMGL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:06:11 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B14EC0612FF
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:04:55 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id g24so10908682edw.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0nmEps7stH02LZSzkbxEBVuWrWdk4dTY6ln7ELvlhw=;
        b=XhbqqfVTDtvKfDOMmFn7/MJK26eyLzSb2on5Ps9Cdi5ISmzfENR/7I89q4DvlK6g/5
         qvX+2h4aIBae+rjMqBIP55W07wrSXM7pKPnNXnB+oqEihhYK+jEBk1ZdRJSN/FyDRcLy
         vVFztZx/oXCEk/k7xIA5YDtfm54sdLv670mFsZvFxZiq0yu2fZ6hRY2AnYwqYs52Zx3N
         dmIZdVdZIPlWWSpufESCIGZivRNpWE/S1lleavZyiGvgARfLJKB3k8qlOtLG2S+LfXv/
         /vBezF/u9cIGyKzUUqTW+Y2cdXuBe8b1AyN6TBeaZha3+xuSIaxWWlw3Gf+0LZXjtUi9
         yH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0nmEps7stH02LZSzkbxEBVuWrWdk4dTY6ln7ELvlhw=;
        b=LpSRGK0YEFpbOJGIwvhWhwONRvppHKyVF1gSgnupDH1Kc1czlnxKBoNGZyEAGJfcOf
         PXBZHhG9SytesM7nkQ36xnzlwJqPRDsKO9h1ION2HzWQDvSDF2EIZ8kG7/wWR4DeXTLo
         kniE+HS5+MFfB8PSmpesZQ9X2hegrkMYnWHbQGXzDfVjnlCtVlVFnz2iuYj1LDgCnur6
         qppGuKOhduhJObMaMPY6WUZ++v0rl6y/gh6UqNkGkn1yBMe564MrndybOTwy7pluQCox
         LctnwehcLY/UrdyqzSBOv/dJA4/mF3kllLOZnk/C5h+CRgyH40dI2cg4Bc0vzhknkLXA
         mL/g==
X-Gm-Message-State: AOAM530H4JHAsLyS2IDnOWRJwAfzuREe1uCPpcwfnpaqKmHx2ZqGp3kE
        jboD3Vzq+qDc+hg0B3uGGNX6VA==
X-Google-Smtp-Source: ABdhPJzK3apmH6ZZeSMFHJ57nV71d8va21QysY6SSDlu6soq0DNDX9Dk50WTKlP3oIO1rOClc5PCzg==
X-Received: by 2002:aa7:da01:: with SMTP id r1mr5173040eds.45.1610107494024;
        Fri, 08 Jan 2021 04:04:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:04:53 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 02/17] media: camss: Fix vfe_isr comment typo
Date:   Fri,  8 Jan 2021 13:04:14 +0100
Message-Id: <20210108120429.895046-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Comment refers to ISPIF, but this is incorrect. Only
the VFE interrupts are handled by this function.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 174a36be6f5d..a1b56b89130d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -922,7 +922,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b5704a2f119b..84c33b8f9fe3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1055,7 +1055,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 }
 
 /*
- * vfe_isr - ISPIF module interrupt handler
+ * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
  * @dev: VFE device
  *
-- 
2.27.0

