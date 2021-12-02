Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B380466D03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377270AbhLBWl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:41:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349648AbhLBWl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:41:28 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6690DC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:38:05 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id t11so1425336qtw.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4wEwRGAvWV62eq6qhVfiri6Nb4hpjnoIOmNcuvAebk=;
        b=nYuGcqSxfJvK26Nz8QP339CyA1GgMApRheufiGrJY8Ny/b2fQWFetRSyfl7N84wQk8
         z5G+uNMn2v2OtNR9buulqPicQJQ9bFYynk2DgpxVRNAeaqWCjMja9R0HknxUdV0Hckw0
         xGDx9wx0pMgFNpvEZ6ex1HikUZYalGkr8UjCMN4AIs7ilqOMQ42JYWRzKKXcU4nNtzBh
         hGrjgkxsXkYJFA6TU9nxgM1+tg6pXvn/zob6wwoqXLkpmyFBerDzB1Afwp3IyfCAa49T
         CxOKkmdcHHtM4z7/0/2VSoVnS/C0Klq+88hXHI+PXYZyRzW2DrPPeZwDyiHOMnv6obgE
         yyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4wEwRGAvWV62eq6qhVfiri6Nb4hpjnoIOmNcuvAebk=;
        b=csxCew6GJ4erg3GVY1dDH9ne7ojRvqC/D/IS1GG8Tcq+EfJXprCw+RN1qc2KgXt4F4
         hQK/6npYoLruwNbJU81dc6D+lPZKgQaUF4/6a8vKwdM+d40cDkNP66EFcbJb2eZUB5z1
         qkMo6DZUcMgNaa/FNbFn0VUNwHXLlHAueYEsTpREDPDAKX7AeRChX7LVC9UxduU2JHbK
         bRMUL616qTE317ok3MkFn9GYioOsFnWfLkevWZOEszKIfsNa1RxWcmWMmTxbtDwfPM68
         psMZBqT5XbhKMjRDYopsZdaPP8RUhLT7JlaVH7Z89o6jjqI8CH2pJ7SghnRsT3ya6GCr
         2UDA==
X-Gm-Message-State: AOAM531RmWDQkBfWCX1HRLQpdYjwLXLgdgGXMN80JH/I0+7I/lU829L/
        nlp2tc0LAZNfTN0d9jWmjziwyw==
X-Google-Smtp-Source: ABdhPJw+YHa9uiZBGEaEnWMn0nknXfpW0ZIHQPWb+uiSNgx8h/ZSuPB6/RYIxCt34bZaitZvQpkf2A==
X-Received: by 2002:ac8:7e90:: with SMTP id w16mr17002223qtj.257.1638484684609;
        Thu, 02 Dec 2021 14:38:04 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id h3sm961152qko.78.2021.12.02.14.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:38:04 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] thermal: qcom: lmh: Add support for sm8150
Date:   Thu,  2 Dec 2021 17:38:00 -0500
Message-Id: <20211202223802.382068-2-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202223802.382068-1-thara.gopinath@linaro.org>
References: <20211202223802.382068-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible to support LMh for sm8150 SoC.
sm8150 does not require explicit enabling for various LMh subsystems.
Move this piece of code under condition that it is executed only
for sdm845 SoC.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/thermal/qcom/lmh.c | 61 ++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index eafa7526eb8b..e390c3fd0272 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -138,35 +138,37 @@ static int lmh_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	if (!qcom_scm_lmh_dcvsh_available())
-		return -EINVAL;
-
-	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
-				 LMH_NODE_DCVS, node_id, 0);
-	if (ret)
-		dev_err(dev, "Error %d enabling current subfunction\n", ret);
-
-	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_REL, LMH_ALGO_MODE_ENABLE, 1,
-				 LMH_NODE_DCVS, node_id, 0);
-	if (ret)
-		dev_err(dev, "Error %d enabling reliability subfunction\n", ret);
-
-	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_BCL, LMH_ALGO_MODE_ENABLE, 1,
-				 LMH_NODE_DCVS, node_id, 0);
-	if (ret)
-		dev_err(dev, "Error %d enabling BCL subfunction\n", ret);
-
-	ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_THERMAL, LMH_ALGO_MODE_ENABLE, 1,
-				 LMH_NODE_DCVS, node_id, 0);
-	if (ret) {
-		dev_err(dev, "Error %d enabling thermal subfunction\n", ret);
-		return ret;
-	}
-
-	ret = qcom_scm_lmh_profile_change(0x1);
-	if (ret) {
-		dev_err(dev, "Error %d changing profile\n", ret);
-		return ret;
+	if (of_device_is_compatible(np, "qcom,sdm845-lmh")) {
+		if (!qcom_scm_lmh_dcvsh_available())
+			return -EINVAL;
+
+		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
+					 LMH_NODE_DCVS, node_id, 0);
+		if (ret)
+			dev_err(dev, "Error %d enabling current subfunction\n", ret);
+
+		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_REL, LMH_ALGO_MODE_ENABLE, 1,
+					 LMH_NODE_DCVS, node_id, 0);
+		if (ret)
+			dev_err(dev, "Error %d enabling reliability subfunction\n", ret);
+
+		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_BCL, LMH_ALGO_MODE_ENABLE, 1,
+					 LMH_NODE_DCVS, node_id, 0);
+		if (ret)
+			dev_err(dev, "Error %d enabling BCL subfunction\n", ret);
+
+		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_THERMAL, LMH_ALGO_MODE_ENABLE, 1,
+					 LMH_NODE_DCVS, node_id, 0);
+		if (ret) {
+			dev_err(dev, "Error %d enabling thermal subfunction\n", ret);
+			return ret;
+		}
+
+		ret = qcom_scm_lmh_profile_change(0x1);
+		if (ret) {
+			dev_err(dev, "Error %d changing profile\n", ret);
+			return ret;
+		}
 	}
 
 	/* Set default thermal trips */
@@ -214,6 +216,7 @@ static int lmh_probe(struct platform_device *pdev)
 
 static const struct of_device_id lmh_table[] = {
 	{ .compatible = "qcom,sdm845-lmh", },
+	{ .compatible = "qcom,sm8150-lmh", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);
-- 
2.25.1

