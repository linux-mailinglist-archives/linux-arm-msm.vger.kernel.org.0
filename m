Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B101E12FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391233AbgEYQsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389087AbgEYQsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:48:22 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5C0C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:22 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z6so21367802ljm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLLac1fRuRW93cBHaKE0yJPxIw5p9I3En46VkMcc2XY=;
        b=vkWuIn0zGI0GsGTu8GD+A30tBGc9GakWacPqWoPMXYMbqMx1/wvSjxaULu207Z6Rg4
         g2FQDU1uyFBksSoK9gF+6Qt3/RNkGp9RGJWm4mmJu7/XWA2hTYHtmaPX1xnQb/2M+GGr
         dJxg1ojN6CyvHUDAYpV41QFxzyfkLW/aX+c+GuosLe1rvtpm8kyffGPnf6pFAX9VUqXV
         IZAo1EF9AYBKrOv+e2d5oxLJdZaW6cklQoMymW2no3XypppgTVRbd4poYHviuTDecnfC
         P8D79U6q/vwRJ4yn9GRKZ0IifnmLDXyPdg3OFLAwH6X9PsRHC0Nwmux8dhutxBvZ0PyY
         crzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLLac1fRuRW93cBHaKE0yJPxIw5p9I3En46VkMcc2XY=;
        b=RXtb3OO2Q8CmbLYgetm/uS5YCgI4HtTAwXbSeuzVdRrtM1iEhSN7jZA9LZIAcZPDKR
         bEiTqPpWIpsF1c0P99Q2LaqWjiHpY6QgcUg250xXTJb7BzRhiVC78T8YZDlzSgfraMXV
         mAA4zm4NZUVy5/yMadp5hJ1y3NI+b3ogTuB50j3+xq4oScuQbT1FtDAsSwaWaF/MR+uT
         7FuQF7ajlmY8nXRALVBgE+9HoadZAcSh0AkONd0KLamnfDhFnHKIPzQ/dA2oWVj9hbDC
         o4PFL7aUQgqxdUaPiQVFbgaEl8Z3DTvAlM9CkDMETWzNJEE4s7uRAnNT2s6U/FWiHgND
         D9+A==
X-Gm-Message-State: AOAM532n+9qabi/WDBQ5ptFxDUAQ0/eS/zvgCynlQZBXa4Xemp0PaG/B
        D4qz9sL6LM2FQu0IyHid0+v9u259gFc=
X-Google-Smtp-Source: ABdhPJyX3HhRY0EYbLe4KxnpTY7caK05udU0l6Usk0hAMdvcyCn2ESccsrAMR3FbZDxf93aUgNd1Kg==
X-Received: by 2002:a2e:890e:: with SMTP id d14mr14198060lji.216.1590425300344;
        Mon, 25 May 2020 09:48:20 -0700 (PDT)
Received: from lothlann.lan ([188.162.64.24])
        by smtp.gmail.com with ESMTPSA id y21sm2914337ljg.48.2020.05.25.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 09:48:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 2/4] soc: qcom: socinfo: fix printing of pmic_model
Date:   Mon, 25 May 2020 19:48:15 +0300
Message-Id: <20200525164817.2938638-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
References: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print sensible string instead of just "(null)" for unknown PMIC models.
Also as we are at it, do not let debugfs handler access past pmic_models
array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 0e6adf1161c0..41f48c3447cc 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -269,7 +269,10 @@ static int qcom_show_pmic_model(struct seq_file *seq, void *p)
 	if (model < 0)
 		return -EINVAL;
 
-	seq_printf(seq, "%s\n", pmic_models[model]);
+	if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+		seq_printf(seq, "%s\n", pmic_models[model]);
+	else
+		seq_printf(seq, "unknown (%d)\n", model);
 
 	return 0;
 }
-- 
2.26.2

