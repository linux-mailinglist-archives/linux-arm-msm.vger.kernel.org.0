Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DDD4666B5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359079AbhLBPjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359074AbhLBPjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:18 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A04C061758
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:55 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a9so60498817wrr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4rv/fyUIkZmcgUL4jWnd5ZJeQoQ3nVOUW2jLjnzBt8o=;
        b=qB4wRdgN1wDHIxQ4lxLDY6ooYNKGghkt7HHr71C2fFf5FOLr1P5OdYbMNw/eThwK92
         Bh+AYwksSq/5y76g9fuE69TIwYNV/7URXpwoRmmS792SlUve++AO42zD4zdA9Gbg8Pd8
         So5gIPJ9QS5q/MSdI3hRawZHt9rmLmqtrkk2VfWjwGk5SCX7xiPl1xCtDLKxr2o2EufJ
         ldxrGsuFe/udOxfy0hfaZB1zWCGQwTb1Fmzmp1vmCp4c3nN0oU0XGGb7a6/yh2biRFlI
         D9BzWQSJ+66gCbn/YhIZbw4Oa1eSoQPbge+TkG1GGu/3RFfCHEe9IyGYhAnjiJh0/aPd
         VQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4rv/fyUIkZmcgUL4jWnd5ZJeQoQ3nVOUW2jLjnzBt8o=;
        b=QjQ6M2o7/EwbPQYj+HSX0L3UbmR8m9kFk1kRxN1Pc7IaIyMGYrbzl0n9XzPPSU6fEG
         c5cgmXO3NKklzQBdPNcs5potMPwPY2FPrt3a3lEbvN+0y1VY2jeZpD4takceJ3aP7wKF
         TiuZN562l4qWBJSsCy1IGmzpYk4Ty8RDTrqpv55XBN7bQmETR3zeomr5c/ArSFcYqgfi
         KA2DNgTbDX9PhOgxPE58hispmkbO0d7iI7nThKoP3HMEYilt8foSEdQ7ALMl71UPbEeP
         8Hw+Utrz+AEHOXvATwYaIbM9WiS3g2mE4z0KYp81OtxfDzj4nXjqzhHTDmvrScpkg9sD
         663w==
X-Gm-Message-State: AOAM533LpTVkrpX8nk60v6Mni8uIjzng6XGnDonuYM5QnoDgqZfS89o7
        R/GSF3+eQ9JngxPIoEWEQ15MQH8vksA7gR6e
X-Google-Smtp-Source: ABdhPJwXyGW/c1ON9gIyLRYmizCqx9vd6q4BAOMeRIO5q9uB5fEPGgCDMbH/4CT+NX6UzQp2Ucxz8Q==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr15198316wrr.252.1638459353896;
        Thu, 02 Dec 2021 07:35:53 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 12/19] media: camss: fix VFE irq name
Date:   Thu,  2 Dec 2021 15:37:22 +0000
Message-Id: <20211202153729.3362372-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
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

