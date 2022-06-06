Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F8F53F17F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 23:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbiFFVSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 17:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbiFFVSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 17:18:51 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EECBA99B
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 14:18:47 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id k11so21344640oia.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCcSuhuQ1vWwVJ0SW2RVYIVh/aSNB0orFLVM+U8ftCM=;
        b=aX4csWQi3E97IZVp7kfPFWT4t/uQQ91msNCIDdET7namQno4hrb4pgmbFaFuMwHnuv
         cXGC0QOHEtB0M57d4JOcViNU0H7E26JpSpsGUfaWgPOOG4ZdEzVhVrkzb7keqvhywz07
         sNcXZ7jGIGSgw0YBGR5yF33qWulsfzMkje4N/Dzc3GthV6QgHzW6dTLj1UvCKURBEuN1
         Ftl8yWjme7AaNT+w8CvIIna4/la7QBc1oZbqdgXn8RsUzfBTOtUSvlvBEAyQXL5kWxFL
         e6VCROspeDsXUiIYU56QKDUcYYE6x9kLNhFe/qybielxQS/UxXZIA+twBUSCirrNoiYh
         mMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCcSuhuQ1vWwVJ0SW2RVYIVh/aSNB0orFLVM+U8ftCM=;
        b=8Aj5+v2lzLacDxtvEG4XTdZIQEecTQaEqjK3REyidpF+ZQ3pkieHvFhwjfb9Lpl1Ex
         WyiW+I1SIIsJlauFKHQg9reUKkhfxPM/TvwyjQ1qv+MEdTWDQbaymBv7sioLo9VIFsSy
         J6tIL+JjE53wWcs3hvO8iY2+0Ta0Itzgm79awNHUSIw2CLvC0eJ8AY4uVPiqYTNM0nXB
         F6doWvx2OFk/IhbYY5SuH6RV9K9vBNv63dke6e0EEFVG8oYzXpzOj/0FSqdPIdvcvxai
         s4+puymvb0EPao8fHVha36xLGgu3Rm/FP3RKRQM19xyibGo1eZ+4kuffpuuxToUtkkc2
         U4bg==
X-Gm-Message-State: AOAM531xuByp+kYiGhByiz6ux93JsmjqDiK0PKsKhddmfr30E19lVR0K
        kFhkQd8Y5odH+PBrt9maUBo8fA==
X-Google-Smtp-Source: ABdhPJzO7TM8BK3G8gYvkXfPhVHXVafWnK1DvN0BUm2+eoHuppcoSnE9n+Wv7V4l1pdwHAEcaSAg9w==
X-Received: by 2002:aca:304f:0:b0:32e:8381:fa69 with SMTP id w76-20020aca304f000000b0032e8381fa69mr5698715oiw.289.1654550326658;
        Mon, 06 Jun 2022 14:18:46 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e28-20020a544f1c000000b0032c18f04800sm9126744oiy.1.2022.06.06.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 14:18:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gdsc: Bump parent usage count when GDSC is found enabled
Date:   Mon,  6 Jun 2022 14:21:12 -0700
Message-Id: <20220606212112.3617731-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a GDSC is found to be enabled at boot the pm_runtime state will
be unbalanced as the GDSC is later turned off. Fix this by increasing
the usage counter on the power-domain, in line with how we handled the
regulator state.

Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 44520efc6c72..a1fa7c4cff60 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -420,6 +420,9 @@ static int gdsc_init(struct gdsc *sc)
 				return ret;
 		}
 
+		/* ...and the power-domain */
+		gdsc_pm_runtime_get(sc);
+
 		/*
 		 * Votable GDSCs can be ON due to Vote from other masters.
 		 * If a Votable GDSC is ON, make sure we have a Vote.
-- 
2.35.1

