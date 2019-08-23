Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 207B79A8F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 09:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389265AbfHWHfH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 03:35:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46469 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390510AbfHWHfH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 03:35:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id f9so7905441ljc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uviA742n/WPhqJ2p0ywgQN7PPZdj9n55wlPOzt1ahOA=;
        b=vGNGwRJ14+9wFedjL20SfmCe4wJvbQoWtTcO0L60xQzXzjgz6N/j8BHqmm7yFoiQbA
         h7Hk6VMXUYx+uzZzlu2ZJcg/0GLqKJ2V/hX9O5aazLv4Z6GJjhnBWTXscRFAnQwYmWfH
         DWQ0+vRsCvg9h+5GZ/a7tHNR4k/U1cRuG9aAGSHcsqdVD6T2o5JGrkQKgMLPT+Va8bl2
         /qEXDHuFBYDNizFUWJBo1tYImdjPurPttnpbGJGgSXUWMROn/mfZmYXhxRYE2Q2jg0rA
         OO1dsFj8upDGOig99MjUcfwhYvKn4DM26rRHM1tI7M5ZFUMaDNJb3bF3retesGRRtZGN
         fqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uviA742n/WPhqJ2p0ywgQN7PPZdj9n55wlPOzt1ahOA=;
        b=p1QO2+MDiWWfRfkhTxXFKO0ERFDolMSpwWxautQzfvAHvSVoGmFvuP58fqLznEcUhO
         JxylvQ3pDEjfg6LJwrQ49TNxf7EyHwGgOS3KEMwBEcewvWX/NZfXVc/gfqkS4rOp7XqP
         9HL5ArXOtDAsNMuSU3B90FZl1Pp3cg/TwsQIbfoTPvC9wcFJUMM+YtmGsuY1a4YloJrI
         oBDou4m72iQprBRvRsaZmiSTBe1jI3FueBV1NG5Twl1TknssZV2PEHejB4RNZqVScAYX
         ZS9dNz9iOldk8rf0PWKq26p3SUYvNje+D9SVZJKM8xdq1YvZDT6SbMu3ahILXMT251AD
         BPog==
X-Gm-Message-State: APjAAAUT/YF6bIk/vZohEVkPN0YLdM7QuFLAYqLrAl9YCjB2pqfL9XbR
        6aSrUS0pYmYdLWjzd6o7zynKmA==
X-Google-Smtp-Source: APXvYqzB/63/X4i6oDk8h67bDnxCyqyaudqGHwVSFHmXzxq7F/U465KbaeCyGoSfIkUdG0xDiSlAww==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr1988085ljg.93.1566545705417;
        Fri, 23 Aug 2019 00:35:05 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n7sm483780ljh.2.2019.08.23.00.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 00:35:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 6/6 v2] drm/msm/hdmi: Do not initialize HPD line value
Date:   Fri, 23 Aug 2019 09:34:48 +0200
Message-Id: <20190823073448.8385-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190823073448.8385-1-linus.walleij@linaro.org>
References: <20190823073448.8385-1-linus.walleij@linaro.org>
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
Reviewed-by: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebased on v5.3-rc1
- Collected review tag
---
 drivers/gpu/drm/msm/hdmi/hdmi_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
index f006682935e9..bb1c49e3c9dd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_connector.c
@@ -76,7 +76,7 @@ static int gpio_config(struct hdmi *hdmi, bool on)
 			struct hdmi_gpio_data gpio = config->gpios[i];
 
 			/* The value indicates the value for turning things on */
-			if (gpio.gpiod)
+			if (gpio.gpiod && gpio.output)
 				gpiod_set_value_cansleep(gpio.gpiod, gpio.value);
 		}
 
-- 
2.21.0

