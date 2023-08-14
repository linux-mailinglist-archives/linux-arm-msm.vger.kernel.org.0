Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F3577BCA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 17:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbjHNPNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 11:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbjHNPNC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 11:13:02 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360C1E77
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 08:13:01 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe8a1591c7so29650835e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692025980; x=1692630780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIpw90Bh2xViXJnbQ5nWex1TBW8RXK/K06cNQuH8aJM=;
        b=YV9zqATVNyHz5P3/exF7Cn0JX28gAlvMM72CuTfV8BHK0Ibtxw1jwknqUwc0iI/uCq
         3kq3JOSPO8+2vcN1xFrh36knksXI41b6IrPDtgtBa1mEO1EyQI2TKYcKx4zZaZbT2RYB
         zyudFat6tIz8AW0vfr2ezfY3iMyyNI4L12OYbpSt/KZ9tPb57cKzIldv/pDNp1QAY8Xi
         hcTOI7lRodeHG4p6YzHmjMIVpGVSJcbuKrcuVy5kDL1A8kuIo6IdRJJpKqq4eoDm3qIX
         lJ4fv7NmXrpGANBHNCO0RqwIPZUMMF4Rn822BeLCdcw2FrdzzhFz56CbaJimuSWYe+iS
         cRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025980; x=1692630780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIpw90Bh2xViXJnbQ5nWex1TBW8RXK/K06cNQuH8aJM=;
        b=fWhD40UdEiUfz9UU+lp+KuY+Cuh90FWc7wdfhGNJsfNRhC84WJVm/brqHLltjmlHkE
         hXJkAqz4cV+LZfY3SJZaj7PM53YJWCC6COVdjUzrp5lB19h1BUAnBodNJYDjmdv1zztW
         hrD5OluLpcrSdBa5+TTZikljKVrZqzaB3WDBtDfFUYevsNB5z5IERIT4gVUp7wWTYRPi
         9TOYZ6Xd2xJsdTb559WeXrHGGCt8EBbMUW/Zyyv4VWCPrLW+lYTmtD95G3Z1W8yqeSyA
         zqQ4qaHBIRvkMdZ+6n3IUKv2RAvUyHLnrnoTvN1+o/m1Gwmpx3eW7R/znUU+ISdSSUrk
         vh7w==
X-Gm-Message-State: AOJu0Yyn0KxaUHuO+Ofb+6ellb0xun3jUfVbTgI4uWGwQlsF4LwbH9Ov
        bzWdpmU1wFq0Tt6Ez86WYK71qg==
X-Google-Smtp-Source: AGHT+IHuaU0igsK2MLbRLzabxg5jQKok3Miba00QEZQulLpYfDF15sgVW/HE+BQdwBSSbP1SHyNRrw==
X-Received: by 2002:a7b:cd99:0:b0:3fe:63ca:ccf6 with SMTP id y25-20020a7bcd99000000b003fe63caccf6mr7885819wmj.16.1692025979724;
        Mon, 14 Aug 2023 08:12:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003fe1c332810sm17644572wmi.33.2023.08.14.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:12:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v0 10/13] media: qcom: camss: Improve error printout on icc_get fail
Date:   Mon, 14 Aug 2023 16:12:40 +0100
Message-ID: <20230814151243.3801456-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
References: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If icc_get() fails print the name of the failing path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6114ea15fd4a0..d0f149db908c1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1503,8 +1503,11 @@ static int camss_icc_get(struct camss *camss)
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		camss->icc_path[i] = devm_of_icc_get(camss->dev,
 						     icc_res[i].name);
-		if (IS_ERR(camss->icc_path[i]))
+		if (IS_ERR(camss->icc_path[i])) {
+			dev_err(camss->dev, "Unable to icc_get %s\n",
+				icc_res[i].name);
 			return PTR_ERR(camss->icc_path[i]);
+		}
 	}
 
 	return 0;
-- 
2.41.0

