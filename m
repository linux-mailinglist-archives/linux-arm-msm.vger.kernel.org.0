Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A887211758
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 02:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgGBApg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 20:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgGBApf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 20:45:35 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396FFC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 17:45:35 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f16so1353517pjt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 17:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qKjLnIEQ5s8BQOFR0Dm9JoOFH5y6dFVrqIR/bR40PHg=;
        b=OgTYIQGoqbGGi3TqnnISr32Pc9Qf/cJx2SkEpLvV3ryeXnjuKg5CKulguIVQYnpVM8
         97+zU4abqfcA3ysytFl0KTHUVA4yjlxTnti3dbuIa8oxpVK/ci36uTT5yxsxbcINAhtx
         ucYdEsaWG/rhk5E1IbgAIk51mo9Mc7+IBPJLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qKjLnIEQ5s8BQOFR0Dm9JoOFH5y6dFVrqIR/bR40PHg=;
        b=R5QYZcNk1MRL3m7Hc8PG9CDk/nnaJV18GQLByisNORueJwcDA7obuynFtBUYJinDur
         BFYFv5rCFqFtGBJDEItHRI8BO8HqA/1nAQGZlypiQVeAt1f2ZVB6ybmQLabQMaTqd2JE
         RHH7CpERtwtt+sDOaEjtWZQPSo9H1VkIPBayegz1JWbnXJ4/eJGMkFviXl7iNjR6cjM3
         bXxgntxqsjAmSdjdoLXzTICECAs5BMftHdSXtR0CWpAo7IeWy7wfH6FZ4I61iyMM+Pd6
         qerHnnzY4SR1bJcKW2zKNMp+7X43tOZQEH/Ks0QLyhmhUDfHIvI1ktj+a1x1b0+ulFLd
         uJJQ==
X-Gm-Message-State: AOAM530SeEO2Pg9kL9AdpMxIvj6Q/VTafLyCI2KyNo6rHf/RN7zzYCyL
        M28DtMCGDrOsDob4+AZ1BmWQrQ==
X-Google-Smtp-Source: ABdhPJwpOlo75/PNS/C5MOdlszShYU92XZBrkp+HcSUZD+vA7JbAvH5XAw3YsxEce5XF/aiIC7cU7Q==
X-Received: by 2002:a17:902:ff10:: with SMTP id f16mr24605718plj.277.1593650734789;
        Wed, 01 Jul 2020 17:45:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id w4sm6966212pfd.39.2020.07.01.17.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 17:45:34 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     akashast@codeaurora.org, linux-arm-msm@vger.kernel.org,
        mkshah@codeaurora.org, swboyd@chromium.org,
        georgi.djakov@linaro.org, ctheegal@codeaurora.org,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 2/3] spi: spi-geni-qcom: Set an autosuspend delay of 250 ms
Date:   Wed,  1 Jul 2020 17:45:08 -0700
Message-Id: <20200701174506.2.I9b8f6bb1e7e6d8847e2ed2cf854ec55678db427f@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200702004509.2333554-1-dianders@chromium.org>
References: <20200702004509.2333554-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 0e3b8a81f5df ("spi: spi-geni-qcom: Add interconnect
support") the spi_geni_runtime_suspend() and spi_geni_runtime_resume()
became a bit slower.  Measuring on my hardware I see numbers in the
hundreds of microseconds now.

Let's use autosuspend to help avoid some of the overhead.  Now if
we're doing a bunch of transfers we won't need to be constantly
chruning.

The number 250 ms for the autosuspend delay was picked a bit
arbitrarily, so if someone has measurements showing a better value we
could easily change this.

Fixes: 0e3b8a81f5df ("spi: spi-geni-qcom: Add interconnect support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/spi/spi-geni-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index bb4cdda2dec8..f51279608fc7 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -595,6 +595,8 @@ static int spi_geni_probe(struct platform_device *pdev)
 
 	init_completion(&mas->xfer_done);
 	spin_lock_init(&mas->lock);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
 	pm_runtime_enable(dev);
 
 	ret = geni_icc_get(&mas->se, NULL);
-- 
2.27.0.383.g050319c2ae-goog

