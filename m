Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E126C37ADF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 20:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhEKSJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 14:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbhEKSJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 14:09:29 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77585C06134A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:21 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id q6so10668557qvb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 May 2021 11:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FD0gWPQzpyGXYTVYXXLZlZGqHRAYEmqEcialH8BA1kM=;
        b=ipY1sUpXHg/6ychnBzi8TsrIamFP0VKSDUPcYNfaIPaq5irONguSaL9QafuAkrT5Yv
         hctC3e89mMfK9styMgml8FF09t/pyf19r4IKGudA2i6fgFH8+B+s8BktU1zXgEzc6dcF
         rMRzxq73M7oO/4212S92D2XLNHwcYrXPzG/4cJvd7v2AfzmcTopy5yEI3AExpUJDjEcA
         jOO4gIjYprBKmtH6BJQ1WFiZNsRrdzv6WJmFNyMBe+7VlrH+UN0R0pSYd8qQ3KDL8lEE
         1syKJCm8XBlr6u64jNcyju5ZqFye1LqT18O90xRMQWpQxch8sdttLC0Rn/zfaGR3m9hv
         LceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FD0gWPQzpyGXYTVYXXLZlZGqHRAYEmqEcialH8BA1kM=;
        b=oMLNPmucBXtOXCGmStaAPmTNYUMhyUnBiXH8h+qwD9UP37+PecbbHJw8dYRrAp5ip8
         Bunezp6GBmJO3KhwnOlk2Lml9bBN37Ok5sOVvm0oxPoyGJtZg5Ux4/Dw7RsPgOY4PfPC
         V3pPYIQlp2gFYXkHtI5ukSHKq2nGdE5mGKQ1JUyPaZBmHw5GYcvSzlJUgMx4uB8bQj9c
         w6gnyq3oh6gj/k880ftPKYbSNU3lAs1I7edCg9NPqUrre7rBApb3Ho7Yr3A2UoaUEnrw
         a+8hob0SWg8RA8qTEv0lvVQFUqNgiBGKcA7GoJAGY1YY5W7QJ+c/nxFmABBajoCrpr7H
         vkcw==
X-Gm-Message-State: AOAM533Zc/ClgDO8RCvvTxoHzZFnD5y8nYinAQq5sDvYiPHkWF8Qij4M
        qpsPVUq/YRk6WcOnAEfqR2zWJ3fAsGpsSwr8
X-Google-Smtp-Source: ABdhPJzdYwdRh+8ZBp7ScB6or2LzcgmtjVEbMcPqPokjkXgb2+SlddqnAv8ph878cKbTweRMTNHULg==
X-Received: by 2002:ad4:4aa4:: with SMTP id i4mr30878220qvx.29.1620756500321;
        Tue, 11 May 2021 11:08:20 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g5sm17104476qtm.2.2021.05.11.11.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 11:08:20 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 11/17] media: camss: fix VFE irq name
Date:   Tue, 11 May 2021 14:07:18 -0400
Message-Id: <20210511180728.23781-12-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511180728.23781-1-jonathan@marek.ca>
References: <20210511180728.23781-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vfe->id isn't set yet, so use "id" instead here.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 15695fd466c4..dec89079c6ae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1290,7 +1290,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_660:
 		vfe->ops = &vfe_ops_4_8;
 		break;
-
 	case CAMSS_845:
 		vfe->ops = &vfe_ops_170;
 		break;
@@ -1319,7 +1318,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 
 	vfe->irq = r->start;
 	snprintf(vfe->irq_name, sizeof(vfe->irq_name), "%s_%s%d",
-		 dev_name(dev), MSM_VFE_NAME, vfe->id);
+		 dev_name(dev), MSM_VFE_NAME, id);
 	ret = devm_request_irq(dev, vfe->irq, vfe->ops->isr,
 			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
 	if (ret < 0) {
-- 
2.26.1

