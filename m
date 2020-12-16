Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17162DC924
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 23:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgLPWnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 17:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbgLPWnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 17:43:47 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6607EC0611C5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:34 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id x126so8746304pfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPvTnVUDt2kn6sTakfYBUjy6fTGY3iiChEwJjn5yMPk=;
        b=V+YrL3eDlSpR/G8VTdjzDPz7lurDAsZSM0NDpZYHuVvnphbh3bFnSTxBQ9c6xB2gxh
         FtwwDesa/1bcdbOeQj4rmElZrpngBmuZxonqT4DwtIJrPM9duEcqkYu0uOL5C5nwC7A2
         mOR69YPhn0IgdtAbVmdcEQ0zXSGlGcQ/tsc/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPvTnVUDt2kn6sTakfYBUjy6fTGY3iiChEwJjn5yMPk=;
        b=EzykXzegOr4Ac3Yaf/2mD6a9LcM9iY/uOgg7tT2qJL4leq2+8VwDuzHqOECDqJJfJE
         4ljnv0OOHgsbBRoH4ufxiVvcyr+XYS/1EM8/pt2G37eSIpoB0L8qz5KMMtxQTCBCYeND
         hmrU8wBduNNvQyexZQmHS7iNnuu2l/ZSUBCCndQzYPHfgUvqRmP9doS0vBWk1BTqSyVY
         iJPSzq4U9UyNo8YcejekeBif1Wyr/2b3AypVkZGxiqd2uiimJY8U2TZlZ/1inuN4op1p
         QYXZuCsYcqq5eaqtBJseQU1Iy2gk3QLGx8Tbkpk0DUgF1oG4bI9ODfMAAxWvv4bkQj+f
         gcog==
X-Gm-Message-State: AOAM532B0bUFJKHLWOP/0wdfXpWiOxJduXDx/P7M5vI52rIqckDxV/kJ
        psn0QmMvXITLaaVa0djQGKudLw==
X-Google-Smtp-Source: ABdhPJyi1bO7O6ZJ4EpD/6vHUZ3IyPkOVyCFy1MkYjNh/qLB5Yw7tgN4Y6XDMBR75a27T1ZhkuYPng==
X-Received: by 2002:a63:5542:: with SMTP id f2mr4769924pgm.279.1608158553952;
        Wed, 16 Dec 2020 14:42:33 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm3561703pfl.219.2020.12.16.14.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:42:33 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     msavaliy@qti.qualcomm.com, akashast@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v2 3/4] spi: spi-geni-qcom: Don't try to set CS if an xfer is pending
Date:   Wed, 16 Dec 2020 14:41:51 -0800
Message-Id: <20201216144114.v2.3.I07afdedcc49655c5d26880f8df9170aac5792378@changeid>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
References: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we get a timeout sending then this happens:
* spi_transfer_wait() will get a timeout.
* We'll set the chip select
* We'll call handle_err() => handle_fifo_timeout().

Unfortunately that won't work so well on geni.  If we got a timeout
transferring then it's likely that our interrupt handler is blocked,
but we need that same interrupt handler to adjust the chip select.
Trying to set the chip select doesn't crash us but ends up confusing
our state machine and leads to messages like:
  Premature done. rx_rem = 32 bpw8

Let's just drop the chip select request in this case.  Sure, we might
leave the chip select in the wrong state but it's likely it was going
to fail anyway and this avoids getting the driver even more confused
about what it's doing.

The SPI core in general assumes that setting chip select is a simple
operation that doesn't fail.  Yet another reason to just reconfigure
the chip select line as GPIOs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("spi: spi-geni-qcom: Don't try to set CS if an xfer is pending") new for v2.

 drivers/spi/spi-geni-qcom.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d988463e606f..0e4fa52ac017 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -204,9 +204,14 @@ static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
 		goto exit;
 	}
 
-	mas->cs_flag = set_flag;
-
 	spin_lock_irq(&mas->lock);
+	if (mas->cur_xfer) {
+		dev_err(mas->dev, "Can't set CS when prev xfter running\n");
+		spin_unlock_irq(&mas->lock);
+		goto exit;
+	}
+
+	mas->cs_flag = set_flag;
 	reinit_completion(&mas->cs_done);
 	if (set_flag)
 		geni_se_setup_m_cmd(se, SPI_CS_ASSERT, 0);
-- 
2.29.2.684.gfbc64c5ab5-goog

