Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461C221A24E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 16:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727901AbgGIOlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 10:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgGIOlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 10:41:11 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB82C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 07:41:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d4so1071104pgk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8RzlfTCja4h/a013n6RoUclRSB2CwQ+pZ4EWD7ck5E=;
        b=LEKP3/O57jFeDUPqAXE0gJKigfdznHmRdVNJrp0qV7k3f/45Q59oQxM6R3X6Iv+CjY
         pfYutbH9JUw/5GclUB1wLxWANHu3MPlJo5mGClpqogYr6GYTrP0gpKjPviBE/tr7yePK
         6w8a2sTh0yI2WCfrNyBgXyixKMMv7kngi7Kog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k8RzlfTCja4h/a013n6RoUclRSB2CwQ+pZ4EWD7ck5E=;
        b=EwTA+S24hd3wb5eF9f4bdygQtlhF1DNY1zfYMQCWAdTnt49t05Yrpg59CbegsIIZ/Z
         OT1aVOnWpAOZxoQ67HxUDHQXQVmvwyH7bJa/Uld4PTddoid07NoxS8XZrlhC78nTdP9F
         OmGdg9gwd/XFARE18D0V8HVa1ABbGJYjlJL1OHZtMiqbt8M/evyeJDqoK3si9LBeoITB
         MIomuy+qa80yyRumYVFhdfwm3nVjlIW6mTN2LxI/Lt+XzqCGXiDF6ZfzZJb5nle/WyLu
         XTiJD0j/AaXVy38GiHjSqX9sp0ys+25PLkH/smtA2zlofhyw0R8C+04qYsm0lFP0mt4s
         3hQw==
X-Gm-Message-State: AOAM533l6GQLcuM2c7UBkNONY/6n8YfUf7toiQyCnt8hui5TM5CAJI7z
        zPgOBfdXSIIpW9uCz48l4ifNBA==
X-Google-Smtp-Source: ABdhPJx7OjhT6rpGtDr81vmAzXRNHs+d6R9lyl8dtGIdqsLzjw07GYd/mwsesp6pTXfI5ocIHc5PUg==
X-Received: by 2002:a62:7847:: with SMTP id t68mr51401847pfc.112.1594305669025;
        Thu, 09 Jul 2020 07:41:09 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id kx3sm2849731pjb.32.2020.07.09.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:41:08 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, georgi.djakov@linaro.org,
        Akash Asthana <akashast@codeaurora.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, mka@chromium.org,
        ctheegal@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v2] spi: spi-geni-qcom: Set the clock properly at runtime resume
Date:   Thu,  9 Jul 2020 07:40:49 -0700
Message-Id: <20200709074037.v2.1.I0b701fc23eca911a5bde4ae4fa7f97543d7f960e@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the patch ("spi: spi-geni-qcom: Avoid clock setting if not needed")
we avoid a whole pile of clock code.  As part of that, we should have
restored the clock at runtime resume.  Do that.

It turns out that, at least with today's configurations, this doesn't
actually matter.  That's because none of the current device trees have
an OPP table for geni SPI yet.  That makes dev_pm_opp_set_rate(dev, 0)
a no-op.  This is why it wasn't noticed in the testing of the original
patch.  It's still a good idea to fix, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Mark Brown <broonie@kernel.org>
---
Sending this as a separate patch even though I think the patch it's
fixing [1] hasn't landed yet.  I'd be happy if this was squashed into
that patch when landing if that suits everyone, but it could land on
its own too.

Like the patch it's fixing, this needs to target the Qualcomm tree in
order to avoid merge conflicts.

[1] https://lore.kernel.org/r/20200701174506.1.Icfdcee14649fc0a6c38e87477b28523d4e60bab3@changeid

Changes in v2:
- Return error from runtime resume if dev_pm_opp_set_rate() fails.

 drivers/spi/spi-geni-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 97fac5ea6afd..0e11a90490ff 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -79,6 +79,7 @@ struct spi_geni_master {
 	u32 tx_wm;
 	u32 last_mode;
 	unsigned long cur_speed_hz;
+	unsigned long cur_sclk_hz;
 	unsigned int cur_bits_per_word;
 	unsigned int tx_rem_bytes;
 	unsigned int rx_rem_bytes;
@@ -116,6 +117,9 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
 	ret = dev_pm_opp_set_rate(mas->dev, sclk_freq);
 	if (ret)
 		dev_err(mas->dev, "dev_pm_opp_set_rate failed %d\n", ret);
+	else
+		mas->cur_sclk_hz = sclk_freq;
+
 	return ret;
 }
 
@@ -670,7 +674,11 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	return geni_se_resources_on(&mas->se);
+	ret = geni_se_resources_on(&mas->se);
+	if (ret)
+		return ret;
+
+	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)
-- 
2.27.0.383.g050319c2ae-goog

