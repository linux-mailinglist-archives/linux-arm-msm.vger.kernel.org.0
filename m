Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E0545CB99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 18:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350023AbhKXSAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 13:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350038AbhKXSAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:43 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9C0C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:33 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 137so3253204wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 09:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4rv/fyUIkZmcgUL4jWnd5ZJeQoQ3nVOUW2jLjnzBt8o=;
        b=s4+I8HVXZGQiqglJnOhLHo6JFVTJ4g/H/xR90/FUpk7M4YE2IHk/gnY+ERYCet/yT/
         JXX4hLVKsICcusOiiZO82uH9QErJOGr/382dLCZlQhnouNmZvpMCY3MaZ0EEPw9t5wU2
         QEbopP1nlfY+7Ey8KACBL122noONawWcGVbicEoQ3NhHbIlBL0VXPP8eo4mp8BdcH8sj
         wnSQFUpxbq/Zve8CwETrf5HxemhKIcmLKDORMtGYtoCSeCwev6q8g2ZPqlYx1/m6qqPG
         TM/TzkC9XXDjhHdiu8eN1v90y2o06s5q5HjQ67BLtO2eI/BrXVT6vKNtS2XBLv3Sqc+Q
         AO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4rv/fyUIkZmcgUL4jWnd5ZJeQoQ3nVOUW2jLjnzBt8o=;
        b=wggitCLciFOazGXAFFIrIhuqxcrCUC30L7bLsrYzFkjo20+bpRzAz6rAWpDACGo+Oj
         F59eWjm+L3m7/N9VGeYqFYffEbaZd7nVVWgqThPnddplFXU4umxmhERRj8GT0DoJVcg5
         PPU/vXqvBT76mI3EF/QSGSP3AcCZ+LSm0fbww3dHqkfAr9+X5yI2lV1dx7RJelrWTrBy
         fqNd2Ep+HXfBre5mMW1G+QiRmhBw8HFLaPq1c2F7qfK/34wsBWq3u9X1qS8fCF4xBUbX
         Nf9xPRBHf5bhRxdzqnXQhbknbCeSncsA0KBCa+yfux39L+lYMItxXXHz7xj6kR2It7S8
         /bEw==
X-Gm-Message-State: AOAM530974dphNHtjX1wg3a8Q3hlgyoQqtPlMe65oj00fbUst2VkCOcb
        JtHkawrXr5zMMv8f6op9R6yNW9QF/swLky0S
X-Google-Smtp-Source: ABdhPJzKY1dcwx6eDhAF9ZbmC4uDp/WLwEZT9uTXnU77dZCZpQOWHnQnl/ch/Cr3+RbkCumLSvSaYg==
X-Received: by 2002:a05:600c:1ca0:: with SMTP id k32mr18016184wms.74.1637776651605;
        Wed, 24 Nov 2021 09:57:31 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:31 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 12/19] media: camss: fix VFE irq name
Date:   Wed, 24 Nov 2021 17:59:14 +0000
Message-Id: <20211124175921.1048375-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

vfe->id isn't set yet, so use "id" instead here.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 71f78b40e7f5..165b404761db 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1293,7 +1293,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_660:
 		vfe->ops = &vfe_ops_4_8;
 		break;
-
 	case CAMSS_845:
 		vfe->ops = &vfe_ops_170;
 		break;
@@ -1321,7 +1320,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	vfe->irq = r->start;
 	snprintf(vfe->irq_name, sizeof(vfe->irq_name), "%s_%s%d",
-		 dev_name(dev), MSM_VFE_NAME, vfe->id);
+		 dev_name(dev), MSM_VFE_NAME, id);
 	ret = devm_request_irq(dev, vfe->irq, vfe->ops->isr,
 			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
 	if (ret < 0) {
-- 
2.33.0

