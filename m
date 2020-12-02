Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F412CC928
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 22:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgLBVuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 16:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgLBVuR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 16:50:17 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8BEAC061A4A
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 13:49:37 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id l23so1713965pjg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 13:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ka6Z/ZcsAkJmAuTwn/KM+k744pqQbZeoUCVLzEch46Q=;
        b=LUrztAYpFrGpLXuuYeTwq4AHlrAqLvdqXN5M+I/DSiGZQdEvyqyBcGGJvTdYKGs7Bw
         6pKhk2/PgqdLHDyY3pCumHAGJtohG8vaFV4zvd70F1Kulw3D4ZSzWEu5Hpj9zYG+GkKJ
         HxHILlU+2mBzOkFgzbmtwwhL90bQbzt85nSPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ka6Z/ZcsAkJmAuTwn/KM+k744pqQbZeoUCVLzEch46Q=;
        b=BnNh1u0J41atNWGBdKHRxMdFKNrZhko52t8ZdEtAZprHXaxBACNhw9ldm05RkfdawM
         dfvEuiQrGFyX0qCkv2LiWSd3bqfCRCIsHf38IotesKdTNaT7nN6Qk9AKaTvYgN9u0VS6
         outVVClPliiEy555roKV8NDpswsDtZb1tTiEsxDyqaDEaq8x+XbMDIXRrhraZtrrML3t
         bJilu9pnJP2xsnmRwTOkWHiKMKG226Bex0/Q06bt4o7nbm+U8Su52S3nmdflxlLAyKRQ
         fCc5rJcndim19lUBf/phzNW+D5FlnhZBDZ3p0w4A7rlBXE6v8ipazekWaBPQ/re+aRk+
         BYHw==
X-Gm-Message-State: AOAM532KsioOF596OlMeFLqFO/AxQ8Mcz5N8h2ysj7JNPNYFZn1MuvL2
        cV3zqrh1NsRElpILzld1FQTX1YODnKe2iQ==
X-Google-Smtp-Source: ABdhPJw7S7EAt3ICR9MGBNyO9g8s8Th1B2Y7e+RpQELxDFNRwEefTjFRoNfHUTulqwODlvC+nntrOA==
X-Received: by 2002:a17:902:a503:b029:d8:e685:3e58 with SMTP id s3-20020a170902a503b02900d8e6853e58mr91635plq.68.1606945777199;
        Wed, 02 Dec 2020 13:49:37 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a5sm55371pfg.140.2020.12.02.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 13:49:36 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Subject: [PATCH] spi: spi-geni-qcom: Use the new method of gpio CS control
Date:   Wed,  2 Dec 2020 13:49:35 -0800
Message-Id: <20201202214935.1114381-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's set the 'use_gpio_descriptors' field so that we use the new way of
requesting the CS GPIOs in the core. This allows us to avoid having to
configure the CS pins in "output" mode with an 'output-enable' pinctrl
setting.

Cc: Akash Asthana <akashast@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Alexandru M Stan <amstan@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/spi/spi-geni-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 25810a7eef10..c4c88984abc9 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -636,6 +636,7 @@ static int spi_geni_probe(struct platform_device *pdev)
 	spi->auto_runtime_pm = true;
 	spi->handle_err = handle_fifo_timeout;
 	spi->set_cs = spi_geni_set_cs;
+	spi->use_gpio_descriptors = true;
 
 	init_completion(&mas->cs_done);
 	init_completion(&mas->cancel_done);

base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
-- 
https://chromeos.dev

