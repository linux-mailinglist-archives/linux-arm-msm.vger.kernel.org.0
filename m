Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBFBE10F704
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 06:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfLCFXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 00:23:52 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37595 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbfLCFXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 00:23:52 -0500
Received: by mail-pg1-f195.google.com with SMTP id q127so1122343pga.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2019 21:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=dPgz2TLGaXm8AZ5IU/e4WWLoSFiMiQO40kFKZ/olifE=;
        b=RlW/Wke8DNfq5+TindW3a7DNLR09DVaesqF1xwIrlU7rF0EUhASXBKcdEv9gChCMzZ
         XYOazRvnQp5BEKikwNaDgdpOXqIZGn3q6lanaKG0VVk49ZOEbdZeDfoipfCq5ELIMQj1
         l+zmNmnCi30CeiFDdCpZFNLjVkhEZwrSF5TTeCJsP86nGSsRgQFi17NQBUwsLWN3lPG4
         XYVktpX4JahsUhum0NFi75QXwlGDhJzOsawFqpujLOvLJB5PyoyN6ODaS4V7T8uSFZTh
         //laIC4A0qj7KfbwbD+XBv++Ues5+BnYRmsODvf/kbCaKBOLc+fIzic6drSvmxvM7SDf
         z2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=dPgz2TLGaXm8AZ5IU/e4WWLoSFiMiQO40kFKZ/olifE=;
        b=jgefkFCWxYkNosD3JCnaECeXuKbG2epkG80gEZXjj6D/ycoY5FfmRawXcqxZbUo+P1
         PYFZIcS9/p6K3bxlf5PwNh4mLq4rjyLlocsjhiq+qaxnWFLPOrL76f+UqAavpxXDGPK/
         D9lpMuxatbJNd0/AGbXVGEUF6Vp0QXq/xktUDZ1JFDW9iBV8ExTuGyxHJjiY6IsSrxHg
         Xy6h7a89PMSMvUDqTAwRn0LV6XIwHi/T9VVKdX1Q0Eo1Uv2QvGMIbcqg4zq5CGCcucDK
         PNzYs41Eqi+6rR+Ara5ukfCPcxEBwc7/HPChIBHivu4zn6M7bgbZdsTp9aFB7gKlkNfD
         2/8A==
X-Gm-Message-State: APjAAAXA0G3/N+29gGC7QWupRa4vYxRrs62epxpBDhOZVnfP3z+e8uB5
        MmrNQSkyDDSqX+HfD7ch6MuNCm7LtQM3fg==
X-Google-Smtp-Source: APXvYqylmspoWJ46AcNlcJaiTcm8u1XOhBNgM1Yg5iDosjeRJVqyvHVAbi4h9+HiQGANGd2ojEB1+A==
X-Received: by 2002:a63:f006:: with SMTP id k6mr3420716pgh.380.1575350631471;
        Mon, 02 Dec 2019 21:23:51 -0800 (PST)
Received: from localhost ([14.96.109.134])
        by smtp.gmail.com with ESMTPSA id f10sm1388888pfd.28.2019.12.02.21.23.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 21:23:51 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, swboyd@chromium.org,
        sivaa@codeaurora.org, Andy Gross <agross@kernel.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 4/9] drivers: thermal: tsens: Release device in success path
Date:   Tue,  3 Dec 2019 10:53:25 +0530
Message-Id: <b8a2349eb80a4992d386b05fcde9a7a32bf9850b.1575349416.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1575349416.git.amit.kucheria@linaro.org>
References: <cover.1575349416.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't currently call put_device in case of successfully initialising
the device.

Allow control to fall thru so we can use same code to put_device and
return error.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/qcom/tsens-common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index 1cbc5a6e5b4fd..e84e94a6f1a73 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -687,8 +687,6 @@ int __init init_common(struct tsens_priv *priv)
 	tsens_enable_irq(priv);
 	tsens_debug_init(op);
 
-	return 0;
-
 err_put_device:
 	put_device(&op->dev);
 	return ret;
-- 
2.17.1

