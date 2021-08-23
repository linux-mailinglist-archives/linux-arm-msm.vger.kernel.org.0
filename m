Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2B03F5262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 22:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhHWUsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 16:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbhHWUsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 16:48:19 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B759C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:47:36 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e7so17749869pgk.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqqQYPFTiTWzXroeL8WpSJd5c5IZNIpSjhG2loOBzBw=;
        b=FG6c3nQvIps26rKSmTcaH6Az0LNIhW+K2OGBSOOwoN1HOn84v0raLBdU3r4vaCsd5+
         R0dDbGiK+J+AOGYsF6ksYuVvdt1QHYLF2JtLwaA4d6BgYQso+LraWV4hqL9nIA5LbIj7
         blzhix1FGgARpatD1x5G7VlNY0zTsSMpBAh7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iqqQYPFTiTWzXroeL8WpSJd5c5IZNIpSjhG2loOBzBw=;
        b=eDcH5SltjGzoKj99MvXynRHl6dgD/gwwva119Uxff1VqEc07nwED/Q+8EE/fiV24VV
         g326sRm1lPnaGIuyCXjMwLkXxlbug9UrQaPJfsaoweMmc5+ECMCuvL7qg0N/Ngy87WHO
         ofMn5sv39y/HAnoatrw8uoPyR13R6Pb/ExS9z/Sq41ZvJvWsQUn/Y7zTEDusFUmb62S+
         LqYs40sXwFvaeoVJbJqwwid4JtX04xBk9LzS6KhoRa2OfZgYHWzDv/cZBprW7KmO1HpD
         WnEYLRZFAW90dcOzmHUz3iRAjQalGQkweCNLK7748Fk4B9JQH5q7IsRULFEpBpvyifrQ
         yyVw==
X-Gm-Message-State: AOAM530QfV9QyabEpQaajIlNnEbQ0k1b5XAXN9wtl39ajGfES45bih4l
        pW7r9cGCFwVn+zLwA5TCLjJ8rQ==
X-Google-Smtp-Source: ABdhPJwNKgbJA9BPCMqJ6p3GWvSzeBWZnRMWepA/DybWLKOzEyeQZnfgepMqdlvjcJlE1x2oAVmz0g==
X-Received: by 2002:aa7:8387:0:b029:395:a683:a0e6 with SMTP id u7-20020aa783870000b0290395a683a0e6mr35515262pfm.12.1629751655690;
        Mon, 23 Aug 2021 13:47:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6b46:820f:610b:67c7])
        by smtp.gmail.com with UTF8SMTPSA id y25sm15472529pfm.80.2021.08.23.13.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 13:47:35 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] thermal: qcom: spmi-adc-tm5: Don't abort probing if a sensor is not used
Date:   Mon, 23 Aug 2021 13:47:30 -0700
Message-Id: <20210823134726.1.I1dd23ddf77e5b3568625d80d6827653af071ce19@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

adc_tm5_register_tzd() registers the thermal zone sensors for all
channels of the thermal monitor. If the registration of one channel
fails the function skips the processing of the remaining channels
and returns an error, which results in _probe() being aborted.

One of the reasons the registration could fail is that none of the
thermal zones is using the channel/sensor, which hardly is a critical
error (if it is an error at all). If this case is detected emit a
warning and continue with processing the remaining channels.

Fixes: ca66dca5eda6 ("thermal: qcom: add support for adc-tm5 PMIC thermal monitor")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 232fd0b33325..8494cc04aa21 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -359,6 +359,12 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 							   &adc_tm->channels[i],
 							   &adc_tm5_ops);
 		if (IS_ERR(tzd)) {
+			if (PTR_ERR(tzd) == -ENODEV) {
+				dev_warn(adc_tm->dev, "thermal sensor on channel %d is not used\n",
+					 adc_tm->channels[i].channel);
+				continue;
+			}
+
 			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
 				adc_tm->channels[i].channel, PTR_ERR(tzd));
 			return PTR_ERR(tzd);
-- 
2.33.0.rc2.250.ged5fa647cd-goog

