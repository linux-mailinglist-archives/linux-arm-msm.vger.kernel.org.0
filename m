Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB1A20BC5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2020 00:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgFZWUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 18:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgFZWUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 18:20:22 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CED7C03E97A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 15:20:22 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id t11so363565pfq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVcpaUniYerIlCyx1vTQeFNCOepnPAPlvIx24HtK4yw=;
        b=Y3vJvMHtv5KZ2rxBZK3vacMhwJm2BUw4M6OpjYw7DFuo+buW2y6YZOxS9VLsWsK3Br
         spHitLO/QOTPyHk30J3sevum2LgoiFO60eyouWi/LhOQ7fVk+Fmdte6Us2I3UjXnXnic
         I2tKu6dMKjjZYxO2a9POgMdGv+hK+y3glrgMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yVcpaUniYerIlCyx1vTQeFNCOepnPAPlvIx24HtK4yw=;
        b=O5jFthkB8mRVRqpBIT/X6ZxU4LQScuGAMwMJHNoef/qJMpeDg/SP7+julCOTAa6I1O
         Fzj6cR6BeVSu1gsBBI6pmVn5gS7qEAHDkz60wt+1iEgQQ2BuWe/1Kkdqxh8SCQgsUx0c
         bzeugNSC9U0700l4M5PamsMvTIiipLru/vW/qk38pr7fVNoDbrcNnc5b5zGe4CNTMdCT
         7nbK+Dh6jonq+eE0WgsTtFTLE+/UyFPPRwYzWUuaQ5Z1L7X1WT9hQzc1BChXDW6Rq31P
         0Hi7kXiCm/aJaFREpbO429IKNZZvAOc8WpjP9MN0nTKmmMpeD5FCYBxcpT3gARIwLuYk
         fxfA==
X-Gm-Message-State: AOAM53373JL9SuIy3yzDUHaqgXambgVIqBxNlVJs/hT6VADSYDT6lzWc
        sfbEC2+vPyR4S7+s3PHwSToleQ==
X-Google-Smtp-Source: ABdhPJwJjzabhmueOPoNL5/wqZZOUQ+pyL+hA+NLvUlCg08OPdl1PBt92nCnlkxyWWtqpBO1KOiGhA==
X-Received: by 2002:a63:778c:: with SMTP id s134mr767729pgc.273.1593210021506;
        Fri, 26 Jun 2020 15:20:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id h9sm9001635pfk.155.2020.06.26.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:20:21 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Dilip Kota <dkota@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH] spi: spi-geni-qcom: Don't set the cs if it was already right
Date:   Fri, 26 Jun 2020 15:19:50 -0700
Message-Id: <20200626151946.1.I06134fd669bf91fd387dc6ecfe21d44c202bd412@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Setting the chip select on the Qualcomm geni SPI controller isn't
exactly cheap.  Let's cache the current setting and avoid setting the
chip select if it's already right.

Using "flashrom" to read or write the EC firmware on a Chromebook
shows roughly a 25% reduction in interrupts and a 15% speedup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/spi/spi-geni-qcom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 5b1dca1fff79..e99a9d57449f 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -79,6 +79,7 @@ struct spi_geni_master {
 	unsigned int oversampling;
 	spinlock_t lock;
 	int irq;
+	bool cs_flag;
 };
 
 static int get_spi_clk_cfg(unsigned int speed_hz,
@@ -146,10 +147,15 @@ static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
 	struct geni_se *se = &mas->se;
 	unsigned long time_left;
 
-	pm_runtime_get_sync(mas->dev);
 	if (!(slv->mode & SPI_CS_HIGH))
 		set_flag = !set_flag;
 
+	if (set_flag == mas->cs_flag)
+		return;
+
+	mas->cs_flag = set_flag;
+
+	pm_runtime_get_sync(mas->dev);
 	spin_lock_irq(&mas->lock);
 	reinit_completion(&mas->cs_done);
 	if (set_flag)
-- 
2.27.0.212.ge8ba1cc988-goog

