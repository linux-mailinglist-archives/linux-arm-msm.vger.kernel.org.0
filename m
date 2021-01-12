Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864CB2F23E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 01:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403793AbhALA0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 19:26:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404241AbhALANo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 19:13:44 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC49C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 16:13:03 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id h10so277090pfo.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 16:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0LU5ZswwTCJKm0ifYQA74K9PKuPMTkTpEKcptV47c8=;
        b=fTRWWqx9e8Az3Is+SwJeweEueiHH1K6iIJWo+y6HcsWR7NYRY0e7X0OW88ialGbn6r
         SRw3Vokb/9Ic/nebzngGm0cOV9lR5mereHanT53ruvCPacYpLG67oRMsffthEXUQYuak
         bOoad+2qkXMXFNtiLJZg/D/dVy0X5tXAfvQfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O0LU5ZswwTCJKm0ifYQA74K9PKuPMTkTpEKcptV47c8=;
        b=tlIRuApbS+FpProcuuJGEdKOQ88ctX+dCkUvXnm3MUYmKFfJffrZvdzP46MKzPRBUG
         D4aPSJH+eteieoy4G/Wg0mygrkXB7m/R+VzYdD4J34VdhM0R2g8rnHxHaF5CYZLq0cOS
         GpFSi5NE5/6CQ/fVTCKgDJscl/Ak2XDaSqUKR8q/WsxBa+Te6H+LBglMBSEohf79MLxF
         RWrzV4vyrVCGHJFCxBtj7U0fcmSo35BAhDDbNHO15+m+BEyUKe0yKWQUThWab7lMeG/a
         rL5yGjgN/if65fYUe3Rh5/zAph9w6Y+chgqAX8h6RaSU9ZiR18ds3o0qD+5VxNAS4JHi
         itBA==
X-Gm-Message-State: AOAM532RAmCMAdR4GebdSsVE/FkObE1UBjRPUqqvp076+mS+V2c6iIm8
        RWO/mACxACZKKs2KUiOmJy31FQ==
X-Google-Smtp-Source: ABdhPJzl19kwY6GZo/KlpQ5s+4aLpeSkGxR+LgQ4X8j2U29ON0ID5doeXzjRwTwK6v8H4uBA9iAh4A==
X-Received: by 2002:aa7:8708:0:b029:19e:924:345a with SMTP id b8-20020aa787080000b029019e0924345amr1867834pfo.54.1610410383239;
        Mon, 11 Jan 2021 16:13:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a131sm820570pfd.171.2021.01.11.16.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 16:13:02 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH v2] spi: spi-qcom-qspi: Use irq trigger flags from firmware
Date:   Mon, 11 Jan 2021 16:13:01 -0800
Message-Id: <20210112001301.687628-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't need to force this to be trigger high here, as the firmware
properly configures the irq flags already. Drop it to save a line.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
Cc: Akash Asthana <akashast@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:
 * Rebased onto v5.11-rc1

 drivers/spi/spi-qcom-qspi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 8863be370884..1dbcc410cd35 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -511,8 +511,7 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		return ret;
-	ret = devm_request_irq(dev, ret, qcom_qspi_irq,
-			IRQF_TRIGGER_HIGH, dev_name(dev), ctrl);
+	ret = devm_request_irq(dev, ret, qcom_qspi_irq, 0, dev_name(dev), ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request irq %d\n", ret);
 		return ret;

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
https://chromeos.dev

