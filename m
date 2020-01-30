Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F23614DBB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 14:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbgA3N1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 08:27:43 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37759 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgA3N1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 08:27:43 -0500
Received: by mail-pg1-f194.google.com with SMTP id q127so1658743pga.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 05:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BdqL+x3UnmB9p8cvhtPjpe4pu+I9XE06RhosU/aRLBE=;
        b=HYp7PeVAZksaW1u+cvxO61DyoWNCC8cM05jGQztTJWPBrPgZhbYY+vtSf/heqTV4pQ
         xpXDWt9jcY8YxTt7iesR+dTkiat5PVN24d2264YAInQ8f+BzMttqB9adIDAf2xVtauvb
         tFEk5ALuumssLlS0ETq9FXAhVWWqT7nCts2fK8+7Zxav7HznrkoSZSujfyscpOkMqrqK
         jztv9N4l+77Bk4qnuGpQU/ta68yBF7a4lUDSK7u6h8ImJVs5jBEyqkYfK76GI0byWM4s
         Bw7SEq5qQloamU/RTopzSEBTkTCecktw5WLWsUG7hRkzMgqmRBbZXBUccMAmz/xiMQjG
         LPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BdqL+x3UnmB9p8cvhtPjpe4pu+I9XE06RhosU/aRLBE=;
        b=jRABbUOZh3xwo6RGCT7OZZww32mC79qFhgbpiO0h2s8YNh1pLHgz0af3wrQixFvjSl
         mfHtKqJL4zAbVOI2SiTZkhE97RL2fDbUa7T50SnwiX0Co8W0RvshFTKDEOad4F/KhuHt
         rhqiCjF9MddX5KjwibkEhZ6aFdOcSKLz+Dv8NtjA8DL51wKvB8byKpIdpUMma9VOiSrT
         GW56kM4hGo5EeY1dmDJTx/WMQ3Rv7p6M7mShnciMwQDpcM8G6g8HiTjhkpLQ7l+R5oay
         jg9f4kWfwKIqahm2ry9JpkaEH5wS6wea08HiNnv6I4dIZueiInQxY9/kv5mMzaP3lr0+
         9Snw==
X-Gm-Message-State: APjAAAX/3y0fMItUwT5gXmuPP5AamI5pYuMZ9rPE2W3TdpfM7nGSku4T
        M6qn3nRc/uFX7u7N8jEmUk7WsA==
X-Google-Smtp-Source: APXvYqwB7UPg0gz3fV4XjUVNVNhXYeDqUrc2+r90qXlJVZZVahoX7LFYttoPXw62+c1Kwls7LPcvMw==
X-Received: by 2002:a63:1c1d:: with SMTP id c29mr4805414pgc.14.1580390861276;
        Thu, 30 Jan 2020 05:27:41 -0800 (PST)
Received: from localhost ([45.127.45.97])
        by smtp.gmail.com with ESMTPSA id r145sm6884089pfr.5.2020.01.30.05.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 05:27:40 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v4 6/7] drivers: thermal: tsens: kernel-doc fixup
Date:   Thu, 30 Jan 2020 18:57:09 +0530
Message-Id: <1fccb71bd5d54842d2c54d175c080d0edeabca26.1580390127.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1580390127.git.amit.kucheria@linaro.org>
References: <cover.1580390127.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document ul_lock, threshold and control structure members and make
the following kernel-doc invocation happy:

$ scripts/kernel-doc -v -none drivers/thermal/qcom/*

drivers/thermal/qcom/qcom-spmi-temp-alarm.c:105: info: Scanning doc for qpnp_tm_get_temp_stage
drivers/thermal/qcom/tsens-common.c:18: info: Scanning doc for struct tsens_irq_data
drivers/thermal/qcom/tsens-common.c:130: info: Scanning doc for tsens_hw_to_mC
drivers/thermal/qcom/tsens-common.c:163: info: Scanning doc for tsens_mC_to_hw
drivers/thermal/qcom/tsens-common.c:245: info: Scanning doc for tsens_set_interrupt
drivers/thermal/qcom/tsens-common.c:268: info: Scanning doc for tsens_threshold_violated
drivers/thermal/qcom/tsens-common.c:362: info: Scanning doc for tsens_critical_irq_thread
drivers/thermal/qcom/tsens-common.c:438: info: Scanning doc for tsens_irq_thread
drivers/thermal/qcom/tsens.h:41: info: Scanning doc for struct tsens_sensor
drivers/thermal/qcom/tsens.h:59: info: Scanning doc for struct tsens_ops
drivers/thermal/qcom/tsens.h:494: info: Scanning doc for struct tsens_features
drivers/thermal/qcom/tsens.h:513: info: Scanning doc for struct tsens_plat_data
drivers/thermal/qcom/tsens.h:529: info: Scanning doc for struct tsens_context

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/qcom/tsens.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index cf0511a947d4..dd163b27add4 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -526,6 +526,8 @@ struct tsens_plat_data {
 
 /**
  * struct tsens_context - Registers to be saved/restored across a context loss
+ * @threshold: Threshold register value
+ * @control: Control register value
  */
 struct tsens_context {
 	int	threshold;
@@ -540,6 +542,7 @@ struct tsens_context {
  * @srot_map: pointer to SROT register address space
  * @tm_offset: deal with old device trees that don't address TM and SROT
  *             address space separately
+ * @ul_lock: lock while processing upper/lower threshold interrupts
  * @crit_lock: lock while processing critical threshold interrupts
  * @rf: array of regmap_fields used to store value of the field
  * @ctx: registers to be saved and restored during suspend/resume
-- 
2.20.1

