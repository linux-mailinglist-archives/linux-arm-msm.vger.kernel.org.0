Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48D6B4666AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 16:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359066AbhLBPjP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 10:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359063AbhLBPjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 10:39:13 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5416CC061757
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 07:35:51 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l16so60448967wrp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 07:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=buYviz0EsUgobZTb1+UWjhyi7czeVNwVeTqZcQGLq9E=;
        b=WP/G16nYvYwVx321K3Tq1Wz0WLMeElSFSZTiVJdITyDfcTbKGA7hsob6eX5lVcJv77
         tDgVf9EwBV7Ubr30zhtUov3tISzskOpDBfqP01lh1tOfCr35Q4L9ZTD7+06tWk7H4KS3
         tI43FllkNu2bUIbvWRBwoeecu54adzW6bE9Jywo2aBkY+yLh27ckbXaxRw9iP5JqBaM3
         KOP1mgUu8O2XcH6z2Bo5T7DjgPyy07HlmT2LdJe+QAmqvT/9yzgT+vxm+fW3jCWjjDTh
         y5nhmJHngWWvat1x92q9OdvdBHDOT5urPnVBWcbuqS9JX3fmy6Qh2ptiCWeJ3GJtGvuD
         Bixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=buYviz0EsUgobZTb1+UWjhyi7czeVNwVeTqZcQGLq9E=;
        b=AIHdCKycIJHPDN3ft/87Llx1T7e7Mm5ruL9mwGL0CCZP//j7XtcF5NYpzbTSJIfSst
         tq8PORNPdhTPlrHxgjziokBryUPZSJD05rMvWYkBDQwt+I0vQqicv/NYc2vkBlf1SZm4
         F2JNKb1QX4LjX5gMP0t7gk+MTTDV3doTuMC/epSua7A1mJ2Rt53f5Scyy9xfBdRDRGcy
         GyhuUuKxVvMNz8ZRRAjLIG5EcdTy0NXiOBoBfqeJEK0BU4lePnlBOBx2rjAzNd5k5T7d
         Y39/k8PAXT29uzdQ+fbjuWaev05sZc29QleVcAqtqFz+gxWyh1FTYple7AhDNDb35cax
         615w==
X-Gm-Message-State: AOAM531Ha7oP4Lh32nBnWJeJa65+tOK0i1TQ3CeOkn1wPBeH9xmC2y1l
        bDpMr4TTpoGWE+VJNjEw4t4jKN47ayj4HirT
X-Google-Smtp-Source: ABdhPJx4LuPssUtAQzFBiTiKROrkJrvqat90+HTsE4jPjBB7T1vp6Et2t+6r2T9Yl+nKI72vZge2vw==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr15283010wrs.207.1638459349626;
        Thu, 02 Dec 2021 07:35:49 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bd18sm3662wmb.43.2021.12.02.07.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 07:35:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 08/19] media: camss: csid-170: support more than one lite vfe
Date:   Thu,  2 Dec 2021 15:37:18 +0000
Message-Id: <20211202153729.3362372-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
References: <20211202153729.3362372-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Change the IS_LITE condition so that it returns true for the second lite
vfe found on titan 480 hardware (8250), which will have id == 3.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index f0c6a72592f9..2c84d40fe3e0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -21,7 +21,7 @@
  * interface support. As a result of that it has an
  * alternate register layout.
  */
-#define IS_LITE		(csid->id == 2 ? 1 : 0)
+#define IS_LITE		(csid->id >= 2 ? 1 : 0)
 
 #define CSID_HW_VERSION		0x0
 #define		HW_VERSION_STEPPING	0
-- 
2.33.0

