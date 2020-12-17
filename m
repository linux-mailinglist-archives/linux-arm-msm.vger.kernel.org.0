Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78552DDB72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 23:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732156AbgLQWa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 17:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731867AbgLQWa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 17:30:58 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984F0C0611CC
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 14:29:40 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id e2so71515pgi.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sWkiWzk6Rso22yNG+cnGpuPXvotVryC+O2+4me1Qo6c=;
        b=ElbqSAKABhF+sBG9f/NXWoC5A3GLpmmFLgEKHC/ljsaQ0mqLK+bKaIZb5pKKbzznO+
         uNXIW5SRSl/YV2W0YOt8zDCqT8ZhE0Hy07HV/rWRf5vK68PN5W6jOIUVf4CGY3fSS4fs
         9qx4vynHQFlxaz1Ga7ugGbnHY7SrTvEOMwuRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWkiWzk6Rso22yNG+cnGpuPXvotVryC+O2+4me1Qo6c=;
        b=a01nL3qdagIN0aL8Dc27lRGmeEUIFtSMhJ00EJqVkgUpSOnntP/GJPUiZSnVuLVkm5
         Fz0TGXE8bC3NfVnPFNyP8+r9Yh8uxxOHIInqs5plHUOvQOI0o1JABPX6u7j1Qf/rNWlV
         iPRlk2dDqUJsg7D2vc68Ccc6HH6VSXQIntF3PpXPCOlwWRAjMfnjMzq3mzupODoI9wiI
         H0bhVl0vWiQ+ctFM2usFoDbaNkGIAxA54vVLd6DqZAOylm2Ys6b42YbQxM1i6zlc7Zn2
         RXO5nk5FwZcaLnpYxnig4NXLgnpXpeT/9rRv5uMjZ5f1WsqbWtiST6EzEFkL4w205YAg
         eV7A==
X-Gm-Message-State: AOAM532FSkWH8FRcninF8AU4VjsOGCfJzOiNId6pwg+z2wjmAcRtdTht
        fj1RF0CU9wPL7qzWGWel4p+bsw==
X-Google-Smtp-Source: ABdhPJy4bycT77LtZjm+hgxVOqL/vnjb7rOjBzQ6uEr8599KO9Wl4MBrwV7m7A8mi9p0ChEeI87r5g==
X-Received: by 2002:a62:32c3:0:b029:1a1:c2f2:d771 with SMTP id y186-20020a6232c30000b02901a1c2f2d771mr1364793pfy.29.1608244180129;
        Thu, 17 Dec 2020 14:29:40 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id gm18sm5805850pjb.55.2020.12.17.14.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 14:29:39 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     msavaliy@qti.qualcomm.com, Stephen Boyd <swboyd@chromium.org>,
        akashast@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v3 4/4] spi: spi-geni-qcom: Print an error when we timeout setting the CS
Date:   Thu, 17 Dec 2020 14:29:14 -0800
Message-Id: <20201217142842.v3.4.I666b37646de9652cef438ac7c2c6c2053367fc6b@changeid>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
References: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we're using geni to manage the chip select line (don't do it--use a
GPIO!) and we happen to get a timeout waiting for the chip select
command to be completed, no errors are printed even though things
might not be in the best shape.  Let's add a print.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- ("spi: spi-geni-qcom: Print an error when we timeout setting the CS") new for v2

 drivers/spi/spi-geni-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index b3ba092db489..5472d895a9e0 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -223,8 +223,10 @@ static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
 	spin_unlock_irq(&mas->lock);
 
 	time_left = wait_for_completion_timeout(&mas->cs_done, HZ);
-	if (!time_left)
+	if (!time_left) {
+		dev_warn(mas->dev, "Timeout setting chip select\n");
 		handle_fifo_timeout(spi, NULL);
+	}
 
 exit:
 	pm_runtime_put(mas->dev);
-- 
2.29.2.684.gfbc64c5ab5-goog

