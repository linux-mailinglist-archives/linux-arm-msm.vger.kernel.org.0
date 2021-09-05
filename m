Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DAE4010FD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Sep 2021 19:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhIERMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Sep 2021 13:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230471AbhIERMk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Sep 2021 13:12:40 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1135CC061575;
        Sun,  5 Sep 2021 10:11:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z19so6005802edi.9;
        Sun, 05 Sep 2021 10:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7BrFPAxyoxqn8PlBFpAcZl2upr4e2z/222uQTSSME0=;
        b=hbAo8L9RYxT6HG0wJS1cDu2Vi3FmMYYYTp6Q4smXbSzeT2+bTiOIIFboBUoqn3kzPb
         jIZa267yB4aGZGJVLsU68HlCj/mSXxLirtRb0gezGw7pMRL4INNVCRElaHB4Kkw4m1Mt
         99+jxu2UVI6kyI1W1JuvP2Uf58ssOb3uhjE6fnmncpL6wcx2apngXZsH0ucSw7LsywWR
         EOf8qpVVyKig/uISQ7hPyhMRT3+WdLyCbbFdyHrdd6hm9jvdyjTYk39rFlamzCnYUnoj
         iKKUJlLqfn/vthILBvST2rZN8F9+hmoCvQk8J9F/DgrFPCv8QvcELr9TbAwav/CyVrvD
         xqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t7BrFPAxyoxqn8PlBFpAcZl2upr4e2z/222uQTSSME0=;
        b=Gh9lAGIaupTSIOVsCXWWJA3kxehddHfRa879SJNIbW4TNBRFdbOUJTIsY+b9t4VwDB
         o0+F4BNZzFBMliSg8Cqz6baftKGky8mF3DFxlkItMPnLZPg5ZPV+tvAa65EJsRlUcFXj
         VNgFnfoQHKBNDqkttUW0DH8Le08OR/XY9tUnj68tN2lLd+9tpYWQ53r6X6gQrHI8NRs0
         5sXWrR+UGKJfY/ngqpbgNFt3dm17hGbojve9mY8ZZvI+fnPqv4SqmRpM3e2ibs+6st1e
         PkVKh8rdwsDE3hNF9E95S97NMfAdi4gbpA1QyDdScTcmwtVuGHh5zMDfBX1XQPD1Hjfy
         6Fmg==
X-Gm-Message-State: AOAM533LjrI3pdbNo8dUhtgIEqllfAkkmX1vcaciVADOUHBQD3Shuy9S
        6mppJwd5+8nbN2khuaQ0OJM=
X-Google-Smtp-Source: ABdhPJypg+OgEmS9Jn6thY1a2U7Cz2QgaGBNEcQ8iKgAnfhCsMo1D3qj6AjK4IKsyne+8HkSQljZbA==
X-Received: by 2002:a05:6402:318c:: with SMTP id di12mr9529195edb.55.1630861895627;
        Sun, 05 Sep 2021 10:11:35 -0700 (PDT)
Received: from fedora.. (dh207-97-6.xnet.hr. [88.207.97.6])
        by smtp.googlemail.com with ESMTPSA id q11sm3117926edv.73.2021.09.05.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 10:11:35 -0700 (PDT)
From:   Robert Marko <robimarko@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Robert Marko <robimarko@gmail.com>
Subject: [PATCH] soc: qcom: socinfo: Add IPQ8074 family ID-s
Date:   Sun,  5 Sep 2021 19:11:31 +0200
Message-Id: <20210905171131.660885-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ8074 family SoC ID-s are missing, so lets add them based on
the downstream driver.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 9faf48302f4b..288897868435 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -281,19 +281,31 @@ static const struct soc_id soc_id[] = {
 	{ 319, "APQ8098" },
 	{ 321, "SDM845" },
 	{ 322, "MDM9206" },
+	{ 323, "IPQ8074" },
 	{ 324, "SDA660" },
 	{ 325, "SDM658" },
 	{ 326, "SDA658" },
 	{ 327, "SDA630" },
 	{ 338, "SDM450" },
 	{ 341, "SDA845" },
+	{ 342, "IPQ8072" },
+	{ 343, "IPQ8076" },
+	{ 344, "IPQ8078" },
 	{ 345, "SDM636" },
 	{ 346, "SDA636" },
 	{ 349, "SDM632" },
 	{ 350, "SDA632" },
 	{ 351, "SDA450" },
 	{ 356, "SM8250" },
+	{ 375, "IPQ8070" },
+	{ 376, "IPQ8071" },
+	{ 389, "IPQ8072A" },
+	{ 390, "IPQ8074A" },
+	{ 391, "IPQ8076A" },
+	{ 392, "IPQ8078A" },
 	{ 394, "SM6125" },
+	{ 395, "IPQ8070A" },
+	{ 396, "IPQ8071A" },
 	{ 402, "IPQ6018" },
 	{ 403, "IPQ6028" },
 	{ 421, "IPQ6000" },
-- 
2.31.1

