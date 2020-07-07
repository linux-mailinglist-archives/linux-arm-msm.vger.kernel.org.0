Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8BE21792D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 22:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgGGURL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 16:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgGGURH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 16:17:07 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D06EC08C5E1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 13:17:07 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id d4so20516282pgk.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZILeJ5BZkm/uJN5KrFNC9NBv85e8cyhdlG5Nb7NnKfw=;
        b=PEF9ZsRVchuRojCnoBR189XtTxSFN3+B4mXytX4tqxHyuQjt7rNIqVM/5BqhKAiMKh
         A2oE6hV+YU5K4Hk1Sem4UY+19X1f9l8eR7ZUDwqxDcGgGI1bWo0smuHyvggB7E52zjg8
         l17phmDc8cnnnKqPaM9NuguL7F1EBwKFpbxrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZILeJ5BZkm/uJN5KrFNC9NBv85e8cyhdlG5Nb7NnKfw=;
        b=CzhiQurSpTEYHVzDDh8vjOjMrTmlGIkvFOWlTQwUggymKLQbxDkbiNmxtAwd9H+okK
         29n/mG2LqfDQHZUp94nXPwGO5mco2g6OgjKZI2qViIFHEdMk3dAnLKvAMZvEK51cMdph
         Q3EndFIZ5yGpRiDmqBsVn3AUoaEpywc/XJXHJ1YC9x68W8GaKxugq634gDzfVZe46a86
         Nc1wSMi3iFsX6ftjifDHKiX3HtUHqkAgMfRhBAUGKk1zZbRJrAQmnHnaG6tl5gSi4ylA
         bsyLTsumP5b9gdk0z4NhLa+26Cz9rs2yBx+SkG8+RDmuxJHWvrXqVYxNmZMaSHtp+Xeg
         wK4Q==
X-Gm-Message-State: AOAM532EgrHzxzQjuEIUEe3aVm7DwRWzaoiKcUwJHictpPr9x62U5CC4
        xJ/cEAKjG9Z3bMWjM8T6/eQRCQ==
X-Google-Smtp-Source: ABdhPJyzC6YhrCBBgLE/o37IuvPm7JwXJTU/H5+6wIN27ryUkGCqJ6FXjj4v1rsz8wks0fFAxQXGRA==
X-Received: by 2002:aa7:9575:: with SMTP id x21mr49762878pfq.140.1594153027176;
        Tue, 07 Jul 2020 13:17:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i23sm7166097pfq.206.2020.07.07.13.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:17:06 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        ctheegal@codeaurora.org, mkshah@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 2/2] spi: spi-qcom-qspi: Set an autosuspend delay of 250 ms
Date:   Tue,  7 Jul 2020 13:16:41 -0700
Message-Id: <20200707131607.2.I3c56d655737c89bd9b766567a04b0854db1a4152@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200707201641.2030532-1-dianders@chromium.org>
References: <20200707201641.2030532-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit cff80645d6d3 ("spi: spi-qcom-qspi: Add interconnect support")
the spi_geni_runtime_suspend() and spi_geni_runtime_resume()
became a bit slower.  Measuring on my hardware I see numbers in the
hundreds of microseconds now.

Let's use autosuspend to help avoid some of the overhead.  Now if
we're doing a bunch of transfers we won't need to be constantly
chruning.

The number 250 ms for the autosuspend delay was picked a bit
arbitrarily, so if someone has measurements showing a better value we
could easily change this.

Fixes: cff80645d6d3 ("spi: spi-qcom-qspi: Add interconnect support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch could go through the SPI tree or land in the Qualcomm tree.
The patch it Fixes is currently in the Qualcomm tree so if it lands in
the main SPI tree there'd be a bit of a perf regression in the
Qualcomm tree until things merge together in mainline.

 drivers/spi/spi-qcom-qspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 322b88c22a86..6c39b23222b8 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -553,6 +553,8 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		goto exit_probe_master_put;
 	}
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 250);
 	pm_runtime_enable(dev);
 
 	ret = spi_register_master(master);
-- 
2.27.0.383.g050319c2ae-goog

