Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FADA47CA61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239830AbhLVAgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239866AbhLVAgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9617C06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:36:00 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a9so1301106wrr.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y2ECIv5rz0LlBtesPY2mGVUaYSCB2Z9s9Xx1bQRqPLs=;
        b=u4XgYVsk3yXqRlWXb5uTiqzblDxSscAlO4071k5vE9+r7OHnaWVKeNKyNnGlqopiEf
         0Cfj51SrI41cRgvtZRTqIB17CIQiRT/9D5pbVaxwiAiMTHYjO8jr9z6XtIIBlT/Q1Y9n
         GsKE78b29yiWPIHo7WOZT76qlybCCy2X77VDyIiabPIf4vK1reB6Sesh92CeWY25rmKx
         CaDcK6quJ+xxIntTORiXWooqwiYlMCkm/vySMR0fbw9rHTGHHKO1j0odw5GmVcWrgiOw
         lmggHLD6v3MvdRWdQ/lAQxYWxC3tbsEPzP27MJoSSRSjpcLrtkXU1swkbdDTekc8afIP
         PBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y2ECIv5rz0LlBtesPY2mGVUaYSCB2Z9s9Xx1bQRqPLs=;
        b=1861vFrws7RDX4hwzA0iUQWe3Z23lQjCCFXIQ6G+gY4nszp9kGz0vxukdUlnZFBqss
         FBQ/phA7u5/rzLYg3hQYsowo+SuSsHfG9CeTmFsHcGbgqSMon19hYcqSipnShEGX8pYM
         7bQi2DOrfHFkFM52eX/QdEERH/TX7ihXxv5TBeFQmlri44hyKI1lh9i4ZWLionwF87GY
         Fq6tV2fOFS49Q0kL70vIPoX/KB4rzdQHrgHyWleZp6w9Y1qMu8Cm/AiXB0INm3lZ28Ee
         nkspwPuZOr4lrGJnPqHY+Saq7deYA9ohkePWbbdmKtnRaGDmyDuzDVhJsdFXP76CT2LQ
         dh/g==
X-Gm-Message-State: AOAM530HiIShCJQcX47DrNBW8U1EZ2jfSbwgWiMVwkbyFKXS87/upt/C
        W46fC9kAjAIjyIzZt91jWXRxwOl6tI7o5Q==
X-Google-Smtp-Source: ABdhPJzNS+l2xwjIvbbXru+KF8u4HLy2DHQBPTSwduRJVkTWc2MkjRPwsvzmyhUSOsMgpjkoSU8Bzw==
X-Received: by 2002:a05:6000:1449:: with SMTP id v9mr392997wrx.280.1640133359039;
        Tue, 21 Dec 2021 16:35:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 12/19] media: camss: fix VFE irq name
Date:   Wed, 22 Dec 2021 00:37:44 +0000
Message-Id: <20211222003751.2461466-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
index 71f78b40e7f55..165b404761db5 100644
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

