Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4FD4A8908
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 17:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352427AbiBCQrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 11:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239584AbiBCQrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 11:47:16 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC6CC06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 08:47:16 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b9so7229983lfq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rr7HzGbHwYsK7mCJe032Gz1nhZI4xO0z3CxPo8njYGo=;
        b=mPWt8OS5kkir1lqkTGi6VRk0bTG/zhJJYRuPsBsqk7Z1d0LXaZ/0w67JM3h/UgnRDR
         2t2K/4pKlfrv+mE/Bmf/4lEd/lhdur8i6ErjnoaVlbJSI02gAlFsz3oBdNjondLIJVmO
         Qedqiej2VkRXKrMHpt9va4D0vfyTom0iknQpC60ZkqG2gHt6vCVF1SF2vElx6LE4Y45P
         RIzrkft7ANY5/IxLFCk3excD3XfzYEnMr9CzhcVopD2VQIbt4s+um7ZqCDcvLqctsP56
         6oPDsBjUH0D1aS2jZOCOszo1APjyxxNfAbyPgS+Aoq9TR8R5C0GWgT91B4EcJcPBE4rH
         YxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rr7HzGbHwYsK7mCJe032Gz1nhZI4xO0z3CxPo8njYGo=;
        b=zZQ2fQW3/mkh4kSv5TA+YsShxdC2s3Qy/7En+gVb82G2Rn627jMMhNSxOBHSZJTUQR
         M6w1QlgTYtUcdTbBJRfZZZdRmNi2i54wPtLBWwK7MMzUYRYvavgGC902HyAoVHN2y0Ue
         6aWeE7wRYJntvgyjHxcAsOFB4MScf5TuHZ+dqjJMjbMEB6m2A1rQ1NaqMtHvduM0BB4o
         kVgbFKqxIpHGPOgRyMmMiuHBFBEzlCZdZp7f5b81+relGgx4UHu4x7KSdSYTnv+s10RV
         tkmhvJx0g883fknV5Jc9mnH04uYzrhpBJPrLwISRpxjQFO6xADSOM7BxNZIXdlriMfb/
         Qkcw==
X-Gm-Message-State: AOAM533tHQQfeNWuymSp6py91fKvTwglIUMc/biEvaqpx/WlG6+C8OsI
        6Z9r7pKGsTPtKEvPNwUYDjkU+Bz2eA6Y/xHU
X-Google-Smtp-Source: ABdhPJzLv3v+160PG42pegKfiCZr0PqsC6hWIE/uZgxt8u/3PELJ6uBFSD6FQKwUtZyVSqDjZIQ0zg==
X-Received: by 2002:a05:6512:10ce:: with SMTP id k14mr26190370lfg.210.1643906834991;
        Thu, 03 Feb 2022 08:47:14 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id f10sm4756433lfk.209.2022.02.03.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:14 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 9/9] i2c: qcom-cci: add sm8450 compatible
Date:   Thu,  3 Feb 2022 18:47:13 +0200
Message-Id: <20220203164713.1712111-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QCOM SM8450 specific compatible for CCI controller, which is
equal to CCI controllers found on QCOM SDM845 and QCOM SM8250 SoCs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 2fc7f1f2616f..e625857fde41 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
-// Copyright (c) 2017-20 Linaro Limited.
+// Copyright (c) 2017-2022 Linaro Limited.
 
 #include <linux/clk.h>
 #include <linux/completion.h>
@@ -822,6 +822,7 @@ static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
 	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
+	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, cci_dt_match);
-- 
2.33.0

