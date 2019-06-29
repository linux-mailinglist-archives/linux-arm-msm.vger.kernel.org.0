Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D555AB3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 15:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfF2NCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 09:02:10 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44820 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfF2NCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 09:02:10 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so5731068lfm.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2019 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gUhHBzqpeqf9laCyRDqe0YTreYPsBAWIdDU1MBCLr1k=;
        b=BYavBGMBtik6r+A9tFdwUyOfHqHK+Yl4c7/OJSbz75XF2NUDjc4Jw7+6wvc3ssAnDF
         9sq25tD60Ch3GCG0hM/5PRkqSgHcW/LYOm35ZiNdaPczwua7xlkaQTtJrqZOM9Tpv2HK
         ZvXChwFa1/VVDUg/f4Nyh3tUquPVnrg2zNpac70vRhAUi7CZ8hpGVSeRuy+q36Hhso+h
         Ks17fIaZ1Z+66/HbPp9dwbic5x4vw3gyVfV98DTntLs57UNkVYUKwuust+xKTjaLKoct
         7zQUCFkufCWR85bg3HzsRWlJ42Nostw2IEcGdvH3kk5vn0kj3ZdmlMrn0Ij8qrwefETN
         THcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gUhHBzqpeqf9laCyRDqe0YTreYPsBAWIdDU1MBCLr1k=;
        b=VV0oUPx/AZC26+xD4NYEu9FL2n2WmaWzXQF1LgeofbxRNYALPhHINNHoF4r7Lz4VWq
         FJ202iCN7cyUsQB6KiLtJY2vy4+1wQL42I3A4xeploC22fRSrAzRP4+Fwpum1vJAXuP5
         9rHC+RCqWxPo6aj98Pw6M1i/PIc1KYl/W336MnL+8X15uNheElQAo+OIi2PlCUyFRnYN
         brssdz3a7Hw7PwojJ16FG23aMQ9QX5sZ1fTQG0lwjWB7xAD5w+ZGnpjX2lddmH7Cyx1f
         RwXEt4eTNgt596ZWgCqpeMXXWA3HUQLIP5ayhK/qbZMNXrEyp451sT6ogZTR1KOSetku
         Xecg==
X-Gm-Message-State: APjAAAX4AGRLe7/xi6eU6Soxnixr2/niO5reTn6OhLAB3bojsDMsMuzb
        tGSgPcOUd/fV5aLBJOJTGsz7Yw==
X-Google-Smtp-Source: APXvYqwiKTo2KmlXB88B2iDxqXfGg+cPGIjxT3oac4t0Fb8IeqR1+G3z9dw+lnnW3Vr5Kl66Lss03g==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr7657045lfc.60.1561813328311;
        Sat, 29 Jun 2019 06:02:08 -0700 (PDT)
Received: from localhost.localdomain (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.02.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 29 Jun 2019 06:02:07 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 7/7] RFT: drm/msm/hdmi: Do not initialize HPD line value
Date:   Sat, 29 Jun 2019 14:59:33 +0200
Message-Id: <20190629125933.679-7-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After untangling the MSM HDMI GPIO code we see that the code
is deliberately setting the output value of the HPD (hot plug
detect) line to high, even though it is being used as input
which is of course the only viable use of a HPD pin.

This seems dubious: GPIO lines set up as input will have high
impedance (tristate) and the typical electronic construction
involves this line being used with a pull-down resistor around
10KOhm to keep it low (this is sometimes part of a levelshifter
component) and then an inserted connector will pull it up to
VDD and this asserts the HPD signal, as can be seen from the
code reading the HPD GPIO.

Stop try driving a value to the HPD input GPIO.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index 89c64cc85027..ecbcd8638b66 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -87,7 +87,7 @@ static int gpio_config(struct hdmi *hdmi, bool on)
 			struct hdmi_gpio_data gpio = config->gpios[i];
 
 			/* The value indicates the value for turning things on */
-			if (gpio.gpiod)
+			if (gpio.gpiod && gpio.output)
 				gpiod_set_value_cansleep(gpio.gpiod, gpio.value);
 		}
 
-- 
2.20.1

