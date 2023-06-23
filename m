Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C9273C34B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 23:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbjFWVuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 17:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbjFWVtr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 17:49:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD30B2709
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 14:49:46 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso1503583e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687556985; x=1690148985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DBVmcbPM6O4YzyX5TBk3hTNZ7EUrOs7o/4qOremoNA=;
        b=DLTVi3Ko6yVpZslF+BPqKOP0yiJUwxq4mfFrffeByYiurppR0iv8Pwj9rR+Es5MgkR
         44er5a2wZohpMA5HoiEVmEhLqWdlTC6wKk0YQPdzimLPeV2brVMgFqaa4zGJ167odeuk
         LCqrxyhKuHvZ0RyxLdqqJhJ7vTTloIe/lTJoXFGxYGAbE9QGBgJLquMbFpvmGJJIwi4F
         ZJjkmQyfH9LuBHRFr6XXwd9V6ryr57hVuFPku3arzNnkJXBKofaNdsrcyVVwnRp1QKT9
         v8qObWZs/Jk2iRhMEAYkagEpLKzTmL2zvS4WKenl0DO9/FbXHm/RQ4yM53u4/h4p2epQ
         QFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687556985; x=1690148985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DBVmcbPM6O4YzyX5TBk3hTNZ7EUrOs7o/4qOremoNA=;
        b=kaiUrc500oJX637RcQjxNpqXT3f+shtnGUfLYTtZScK4UqDH4hMPlMo1W07hM0+kgG
         zIuUthJhOVnYrQ+DicASGHTvYxL1Wqfi8yqqnLMUHzUuIU2QCgd3t4iVi8JK1aTGCNCv
         bv97A5sxXzJ0LId6FXe6FDt1ybjbhFUeCutEg0pCQl1QUYS8vl05/HNrC9EaXUfRFZH4
         v+eme0SfHWUs0o5bA7AWY5ezA/+3o72KbT1omwbmpIG6YgOkkUiU8OuDh7hfrmC0tXKk
         RNm5rnaarDnKGJ7lFZv8HLm+FYk9h8poBafllv3BHzMnxrKfX5D7EnVk81yrYbm1NUOE
         Mn7g==
X-Gm-Message-State: AC+VfDymNM9ukTLZmh2Ela2pxZUsoMiQ6IQz0pLDBxvkWAIOGR7eYAbN
        Ibzw9FPqyNOYbpD0iOPXpLjkHUs+Gd0C1aNFHf8=
X-Google-Smtp-Source: ACHHUZ7D7cOzbDYTujj5NSHsAVJZW3RnYMXWjzODK+/JexenXMCikUfaGFpHbg0lCpRpKgvfka7xVw==
X-Received: by 2002:a2e:900a:0:b0:2b4:6195:bb26 with SMTP id h10-20020a2e900a000000b002b46195bb26mr13985888ljg.25.1687556984775;
        Fri, 23 Jun 2023 14:49:44 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e9c94000000b002b48437dcaasm1840919lji.103.2023.06.23.14.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 14:49:44 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 23 Jun 2023 23:49:43 +0200
Subject: [PATCH 2/3] firmware: qcom_scm: Always return
 devm_clk_get_optional errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230623-topic-scm_cleanup-v1-2-383089eae98d@linaro.org>
References: <20230623-topic-scm_cleanup-v1-0-383089eae98d@linaro.org>
In-Reply-To: <20230623-topic-scm_cleanup-v1-0-383089eae98d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687556981; l=1572;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=pHysGjB4oZJ+5xN5W/FUx19qYCDxjkWrQHiYcbKX6uQ=;
 b=F9TfQwe9lA2sfHfajdi4PRDRwx/kETtoE4+UfIsGvDLi7W2Ey/0Aj1XfKriTsLSO9cvh0+L5l
 Aiesih+NUnqC8nf3K7HoDCSDZhyNQmUFCUg0jMBQKusn2IFa34idJ0v
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If devm_clk_get_optional throws an error, something is really wrong.
It may be a probe deferral, or it may be a problem with the clock
provider.

Regardless of what it may be, it should definitely not be ignored.
Stop doing that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/firmware/qcom_scm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index dfa298347041..d7fc972b20ab 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1422,22 +1422,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 				     "failed to acquire interconnect path\n");
 
 	scm->core_clk = devm_clk_get_optional(&pdev->dev, "core");
-	if (IS_ERR(scm->core_clk)) {
-		if (PTR_ERR(scm->core_clk) == -EPROBE_DEFER)
-			return PTR_ERR(scm->core_clk);
-	}
+	if (IS_ERR(scm->core_clk))
+		return PTR_ERR(scm->core_clk);
 
 	scm->iface_clk = devm_clk_get_optional(&pdev->dev, "iface");
-	if (IS_ERR(scm->iface_clk)) {
-		if (PTR_ERR(scm->iface_clk) == -EPROBE_DEFER)
-			return PTR_ERR(scm->iface_clk);
-	}
+	if (IS_ERR(scm->iface_clk))
+		return PTR_ERR(scm->iface_clk);
 
 	scm->bus_clk = devm_clk_get_optional(&pdev->dev, "bus");
-	if (IS_ERR(scm->bus_clk)) {
-		if (PTR_ERR(scm->bus_clk) == -EPROBE_DEFER)
-			return PTR_ERR(scm->bus_clk);
-	}
+	if (IS_ERR(scm->bus_clk))
+		return PTR_ERR(scm->bus_clk);
 
 	scm->reset.ops = &qcom_scm_pas_reset_ops;
 	scm->reset.nr_resets = 1;

-- 
2.41.0

