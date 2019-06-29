Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DA05AB2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfF2NB6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:01:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43742 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:01:57 -0400
Received: by mail-lf1-f65.google.com with SMTP id j29so5732554lfk.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2019 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AJIo1pqQ+aFujHuHdql1oLAKsZ6dcOAKCD+S+KrStQg=;
        b=zQR54iAbGadX7yH6kb/W+A9Ev+FFwoc/g484x0VCE13ChTt4OVnLxuK03gAMFIhnUl
         a2s9RA8N93ziUXqxC4ZQbtiqRFq5+YrhUohrwTtL4UjNSSpUwjpJVTsnP5ztF+7mGcoD
         MaLZSwY/+wrc+Mrx1HIJcScmiCGvWqe6rIh6byJLfnq4HXzuuJHQwbH2tIrOgDiQcz99
         WHgvK5QzlgPMcFkkbQyB3iRjkDA2stc0/LSp4lugHsNtNHuQ4txm7SxP3GBg7pAGpzfw
         p4YL7ENLxHbwJB3rq3EQNAMUYHxs7zQQYNqFGvNcxySTPkzYoXSaECdplNiqhLg377rK
         dzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AJIo1pqQ+aFujHuHdql1oLAKsZ6dcOAKCD+S+KrStQg=;
        b=aFRn795NZ6rDzAcmM1tWQ/BXllw1diAHBwypJanLMuEfQy7p0CnyE7JmnjC5LXSO0k
         aLn8k5rS3SHJIG8uVY29dKqDbgJbWwmcU50icM9TEHJO6GQq883iHVTuJWWQojMGZrXc
         KTfIVBK9AXF5MDaabBVANbtlfxryIrdfeugHdJRL3+3bKzUUrLS8S9VBZGKNG0zLW0AH
         VA+iAqhgSE+wlxxq656SfM8eS0kQYuJIVR7NcACMijiopuhylwM+IY9NtD7RdVfSlEW0
         G5/KdwjSVyAnoLtNqkNx4BIUj905G71qHZ/02qngPumHMA/airF1RKtkxL0NBwo+mvR2
         ji3A==
X-Gm-Message-State: APjAAAVucdZuVNnBmRBW3BbTJ6LXmnoFBoqLUIFV5t4wsz1FPgEiVPhz
        uxOvLLRA5qYIEzYacbDA+57RLDiIiM7wiA==
X-Google-Smtp-Source: APXvYqxvXt6L2Ml1QCW1/zH7Sv4F1tQcoxTHgqupuETmPxNbTlWyt0OHygO+Xy9Hh1ch7/orM4lZPw==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr7457510lfq.100.1561813316205;
        Sat, 29 Jun 2019 06:01:56 -0700 (PDT)
Received: from localhost.localdomain (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 06:01:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/7] drm/msm/dsi: Drop unused GPIO includes
Date:   Sat, 29 Jun 2019 14:59:28 +0200
Message-Id: <20190629125933.679-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This DSI driver uses the new descriptor API so these old
GPIO API includes are surplus.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 610183db1daf..d44bad13cbaf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -14,11 +14,9 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/of_graph.h>
-- 
2.20.1

