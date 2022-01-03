Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B1A482D9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jan 2022 04:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiACDBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jan 2022 22:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiACDBL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jan 2022 22:01:11 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F663C061761
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jan 2022 19:01:11 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id n14-20020a7bcbce000000b00332f4abf43fso9768586wmi.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jan 2022 19:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lXNaCmB23l/v2SBkvx4jJIGXGemsehmfOVCATDay3ag=;
        b=Jc39l714mUnC6C71RckghH7B3nzIZLbhMQeM0gMoxDyYQi0Gj7qpZlTgLb6JzaYooK
         IPPHwZ0v14fTzwNAiUgPbXz4abv45FHv6KfKuWZXm2Z6lKklWCdXZ0AO72nyuXXlhbN5
         /4d5GD8SNFryQV2ToR6haL3qQH3k1pnjCqZ2sO9I7PzMGEPhYtFI6+yyS/KnlmcJvXCU
         Mtxmi9sTVzeo3ZLzcVIesoBITbk011rG5kh9CtZLlHQuEbGvlaI0U7EgbsnwH1Zwg9gl
         luUSSPqU/S1hyDxgqcWo9t2QemifPJrDVhyC9pGwsN1IaADq+/GmgdZ8rIPQcALqH5Wf
         sCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lXNaCmB23l/v2SBkvx4jJIGXGemsehmfOVCATDay3ag=;
        b=AKt8aHGxWHR6PV5db3hjK8r1oe8xrfvxU0kdYIiYZcIdLpIvZVPWwDdBMfgOA4/k8t
         9HMsGs9i4AYkxudTmiSB6AhBT3E5MuR/odXp9ebjo/qA/46CAdlr37hY2XP056ToKE6c
         1rnApLWdGJXeiEPGVIIKBWYiUDqgAOQWOFkcErrl02Ag1cqdI/G6y5LKj9bcOjksxSNd
         zibkcvzx5KFvKKMVgYb0je25//YEWPT1fQXgfjjMKT1yfWSSidlZOuHjpL1oA/lB3P5V
         eZ2w+0GvslJhSsPIzujuGA24Y4wyD728GJChSOGXEzwu1Ol0Y+CEAnBOdcFbvTUsEjOp
         mGAA==
X-Gm-Message-State: AOAM532lTMKWglKXCikF3ZhpBAIcZALocho6DqwWU/O/jbdB6e7A6VYv
        QSfjT1xYyQ8TyBilM7ymknAE35AAYHML7Q==
X-Google-Smtp-Source: ABdhPJzRE1vniyLVYKzNOXBAw0GWwbCneCIPO9y+HCoI9YIhgwyoj6Cn1+dmB8FYvzwRxjGMwLSgNA==
X-Received: by 2002:a05:600c:2103:: with SMTP id u3mr36391606wml.6.1641178869846;
        Sun, 02 Jan 2022 19:01:09 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p11sm38095667wru.99.2022.01.02.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 19:01:09 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org
Cc:     baruch@tkos.co.il, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] mtd: parsers: qcom: Don't print error message on -EPROBE_DEFER
Date:   Mon,  3 Jan 2022 03:03:16 +0000
Message-Id: <20220103030316.58301-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
References: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Its possible for the main smem driver to not be loaded by the time we come
along to parse the smem partition description but, this is a perfectly
normal thing.

No need to print out an error message in this case.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/mtd/parsers/qcomsmempart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 06a818cd2433f..b2a57fe8479fa 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -75,7 +75,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	pr_debug("Parsing partition table info from SMEM\n");
 	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
 	if (IS_ERR(ptable)) {
-		pr_err("Error reading partition table header\n");
+		if (PTR_ERR(ptable) != -EPROBE_DEFER)
+			pr_err("Error reading partition table header\n");
 		return PTR_ERR(ptable);
 	}
 
-- 
2.33.0

