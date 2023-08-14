Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A9177BB17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 16:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbjHNOKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 10:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjHNOKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 10:10:24 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485C81703
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 07:10:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe4ad22e36so40436215e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692022220; x=1692627020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W80DDZNGe/khXLl1P1oJD7Ws9Jxxl4GH65wXpEW+I0=;
        b=hENwvV609a0ekk68nFeJgCMLFglZamjuMITKMPh+IleT4oSy59pqLdXoXwilgJNP8I
         LbafQe1WNSjwEMF5jHGg5XmL5/Bq9b30ZcUNXKGg1rhqGatzedGkIqbuzDVM7aCHYLAd
         TB/L8fLr05QGnXKgS3k+NS5KbA3CsS3d5mK7vaRkSqHNqVPWLXB08l7mSD0GZ2102Oyt
         0+7Gzk9EXCh2m4cSn0jdoywxrjeXy5LHnuI0Yd0pAwciPQRK65DT9KXqU/J6KywoZgc9
         IVaqQ1wyzH0FMWd1DvawM443XHTcY37QTmYTqaoJAf4WcsNTBHvqfofSBZ2h18dfZf89
         7jKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692022220; x=1692627020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W80DDZNGe/khXLl1P1oJD7Ws9Jxxl4GH65wXpEW+I0=;
        b=l/L+EmBC1dLvXZq8vkbgjzEZ2qfEnYW0juVY84RKGFbwQGang0JyERax+1s/WiDbqg
         iqf6hZisSa0CdjQARdDS4xTpqQMFiJzXj0mjXgpdJyVeBxrrNME0NjeZ364ZpYXOyrUk
         lINBM8gJg5oQCJU6pXmWTOcqozQd8ymYOznuFUjcOet0EFQ4KfqFQJJUoRJMIK5YX15v
         sy9wdznWSLrmLO9DgcNMRAGgTAqXw/vus8kTBCesfwuCqpH8ssWJnzYrYadxZAQdBnvp
         KGnLql4rAVMvIkgzv6eGxww4x5MGhJQlDvaZ0o4k5XjNZB0e4OEPELD0yzs/y33Gdvfa
         ltNg==
X-Gm-Message-State: AOJu0YzttBHpkB+NbdrBwX6pi7cZ2EkY7Sytd4H59A1TPcjqp4ll2Mlb
        d9vzOjPa+njSroIpIkM+z8mGpw==
X-Google-Smtp-Source: AGHT+IGir1oUaOFJZxPJQLicxXjynJaUsyPPplEY5T4fp0/FHjCMq/Kud2R8C3lvDF5oU8vjzW59Mg==
X-Received: by 2002:a1c:7c05:0:b0:3fb:e58c:7758 with SMTP id x5-20020a1c7c05000000b003fbe58c7758mr7439167wmc.3.1692022219725;
        Mon, 14 Aug 2023 07:10:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b003fe1630a8f0sm17232749wmc.24.2023.08.14.07.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:10:19 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v0 6/9] media: qcom: camss: Fix missing vfe_lite clocks check
Date:   Mon, 14 Aug 2023 15:10:04 +0100
Message-ID: <20230814141007.3721197-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

check_clock doesn't account for vfe_lite which means that vfe_lite will
never get validated by this routine. Add the clock name to the expected set
to remediate.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 938f373bcd1fd..b021f81cef123 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -535,7 +535,8 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1")) {
+		    !strcmp(clock->name, "vfe1") ||
+		    !strcmp(clock->name, "vfe_lite")) {
 			u64 min_rate = 0;
 			unsigned long rate;
 
-- 
2.41.0

