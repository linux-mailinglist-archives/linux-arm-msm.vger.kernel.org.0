Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51E475858D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jul 2022 08:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiG3G2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jul 2022 02:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiG3G2m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jul 2022 02:28:42 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7833AB0F
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 23:28:41 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id e132so5551385pgc.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Jul 2022 23:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBtAUHxEkbLQP6foKwTQY2d8N45LtYBpNH+jNTy2rT0=;
        b=ftDfOLtF5dYlXoV+nV3RwlWyLog+0N7Rnci7XB76q60CevBbllQFUwQagNrP/xnkHY
         3ShC913lwHgnvm+h/HcMe39Y1eHa3GH5A0v416auJczxoF88AmeMdKBYX/bDz6CC7Wgu
         IFJJ29sa02bEoYeVPAF77+WtL8wU6QijnIoIYEqIaq/XWer0KXcLv0dTFHzAyXc/AcxI
         7Xwh7QrSwPTtgXs0z3woVTxLIC2gbfsoVBFc9dnV1HsyInHv50K5ZGDfG859pgI5eEOv
         WfFbyLeTse+fSlBubjJtdWSwkJL5rnWs2OElLqg24KhKxDEILofbDZ9SmdK2SyVNZwEU
         DSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBtAUHxEkbLQP6foKwTQY2d8N45LtYBpNH+jNTy2rT0=;
        b=A7nHUzlQcwLFBm1/71Gd5aY4JtUQrs8aELKBzNLeqGiLGOWQN8sc5RsQAzmBCQWF/W
         bRACjYifv3rUajVxhO6AqqM6kPFncG5sOpDmWNnAgsnoQUeMUio+09oMHnm3SHfS3tY3
         O8dvYhlzBgWiJRoDm+CiF0kbK3mRAjObgXv0CWFsJYLg0YJ97w+W0uF52l64voaiPj08
         V9yohYSP19zkWHv8/Y9jsURv1e93KEVGwhC3vQZeGjukPTBRdsU9LiI3XOHfVCtbHPzN
         l5XSl3j+LhXJwowbXvpGYwc3gPDgB9CIsYVxr/VGXMq7BqN5k7Fy03BXEuws149TAzYd
         WYXw==
X-Gm-Message-State: AJIora/fZyEm4HAnnHmrrEONmjeYmo35D+rcyAEfCyBr6IIEswIxgBlB
        xseYMRv1pVt4H7gG847ekWoO
X-Google-Smtp-Source: AGRyM1vvhv50fwHTEcJcUvt5rOZDM4ZAjZeToLNo+fLNjKzzstnbl5thtYVIsCWmoML4Mw7fIeZYiQ==
X-Received: by 2002:a63:db09:0:b0:41b:6744:a255 with SMTP id e9-20020a63db09000000b0041b6744a255mr5569054pgg.556.1659162520557;
        Fri, 29 Jul 2022 23:28:40 -0700 (PDT)
Received: from localhost.localdomain ([220.158.158.170])
        by smtp.gmail.com with ESMTPSA id k15-20020aa7998f000000b0052592a8ef62sm3982554pfh.110.2022.07.29.23.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 23:28:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Do not fail if regulators are not found
Date:   Sat, 30 Jul 2022 11:58:34 +0530
Message-Id: <20220730062834.12780-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_regulator_get_optional() API will return -ENODEV if the regulator was
not found. For the optional supplies CX, PX we should not fail in that case
but rather continue. So let's catch that error and continue silently if
those regulators are not found.

The commit 3f52d118f992 ("remoteproc: qcom_q6v5_pas: Deal silently with
optional px and cx regulators") was supposed to do the same but it missed
the fact that devm_regulator_get_optional() API returns -ENODEV when the
regulator was not found.

Cc: Abel Vesa <abel.vesa@linaro.org>
Fixes: 3f52d118f992 ("remoteproc: qcom_q6v5_pas: Deal silently with optional px and cx regulators")
Reported-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 98f133f9bb60..5bf69ef53819 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -362,12 +362,24 @@ static int adsp_init_clock(struct qcom_adsp *adsp)
 static int adsp_init_regulator(struct qcom_adsp *adsp)
 {
 	adsp->cx_supply = devm_regulator_get_optional(adsp->dev, "cx");
-	if (IS_ERR(adsp->cx_supply))
-		return PTR_ERR(adsp->cx_supply);
+	if (IS_ERR(adsp->cx_supply)) {
+		/* Do not fail if the regulator is not found */
+		if (PTR_ERR(adsp->cx_supply) == -ENODEV)
+			adsp->cx_supply = NULL;
+		else
+			return PTR_ERR(adsp->cx_supply);
+	}
 
-	regulator_set_load(adsp->cx_supply, 100000);
+	if (adsp->cx_supply)
+		regulator_set_load(adsp->cx_supply, 100000);
 
 	adsp->px_supply = devm_regulator_get_optional(adsp->dev, "px");
+	if (IS_ERR(adsp->px_supply)) {
+		/* Do not fail if the regulator is not found */
+		if (PTR_ERR(adsp->px_supply) == -ENODEV)
+			adsp->px_supply = NULL;
+	}
+
 	return PTR_ERR_OR_ZERO(adsp->px_supply);
 }
 
-- 
2.25.1

