Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612CD32701D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 03:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhB1Cxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Feb 2021 21:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhB1Cxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Feb 2021 21:53:36 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D723C061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Feb 2021 18:52:56 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id e9so7468388plh.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Feb 2021 18:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vpdHEyJD7sn/0eeQxVrrnQwX5J7unyGFY9KXLtypecU=;
        b=egll23z+9j/zwj+FnnZEYgh9EoAkYvB3s/oloXSjkGOy9G/Ho2O2KtcALQ1aziXUHC
         PlCQE7JC4+PgnFu8tqTIgyxISn+IwXg6i94bNWWQTq1KfbXDME3cw6GA21juzkk5fWEg
         fniZFmCir4lgV1BsWZF2pHFuaZt17Ay45Dqb6Ue7PgoaCJsG5zC52UOjj/dgxHnN8glu
         1H1HloI6R6a9q+B9RaHMbirIY8+W2J2fCrfoDI9dk94VB7zoHZt0Fg+rMx56Bbpy2RT6
         2GORwpvwSNjmCe7Lghv4GUOHBuqMfYVyHTmAnDSm1Q5aC7vlOkcKEhFgCWvmQyiCfW31
         hHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vpdHEyJD7sn/0eeQxVrrnQwX5J7unyGFY9KXLtypecU=;
        b=aKN1TCTev/vxxmcUiEcFuD7IqSa7axm3l1rx1mHI6zYQ8nhSxdh6kl68Jp7dNNqhl0
         4b069V7On/ERMUNwEmTPlbtvztGE2OxKbAcjPSA6yjjBjacbzfzP1K7Qr/32ZFG1S3Xk
         K5VqgFiY2H+gzwYvKPAinRvN3Iq2sognOwLXDl/dMr9Y+vbQ+GXMuGU/tXchjsLg2OY5
         hH1IYviuzE2Xi9TYvwcNL3EseKluuLS8oK8JBAYd5mIFrRrHFzrDBZk10P4EAq899sH5
         EMA4f+U2VQdRq8CoQLUfJ4pHwcUM8o3Ixo3Bm7fMxvnuWCZ0VmxsfT/rYC8mC8LP9eWk
         DnEA==
X-Gm-Message-State: AOAM532stnJ4XiqVlKEYgJGZB0ErPCTXTzMKfFirR+cy6Dg+FYy6Q21Z
        hkb+F0WBh0WaTjqS45d/MIXk7cEXMAVq8A==
X-Google-Smtp-Source: ABdhPJxFfmHYbTNUaIm1IEocF7TulwE2CGRD1aqjvgfJssSGShoGeSpf8A09vbZEvdH2Y8t6eifC3Q==
X-Received: by 2002:a17:902:fe96:b029:e4:2f39:9083 with SMTP id x22-20020a170902fe96b02900e42f399083mr9684729plm.47.1614480775497;
        Sat, 27 Feb 2021 18:52:55 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id s4sm7329527pji.2.2021.02.27.18.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 18:52:55 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] pinctrl: qcom: support gpio_chip .set_config call
Date:   Sun, 28 Feb 2021 10:52:49 +0800
Message-Id: <20210228025249.19684-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
configs from ACPI table, and call into gpio_chip's .set_config hook for
setting them up.  It enables such support on qcom platform by using
generic config function, which in turn calls into .pin_config_set of
pinconf for setting up hardware.  For qcom platform, it's possible to
reuse pin group config functions for pin config hooks, because every pin
is maintained as a single group.

This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
pin is not set up by kernel driver.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a591be9f380a..2526f299bdce 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -493,6 +493,8 @@ static const struct pinconf_ops msm_pinconf_ops = {
 	.is_generic		= true,
 	.pin_config_group_get	= msm_config_group_get,
 	.pin_config_group_set	= msm_config_group_set,
+	.pin_config_get		= msm_config_group_get,
+	.pin_config_set		= msm_config_group_set,
 };
 
 static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
@@ -717,6 +719,7 @@ static const struct gpio_chip msm_gpio_template = {
 	.get_direction    = msm_gpio_get_direction,
 	.get              = msm_gpio_get,
 	.set              = msm_gpio_set,
+	.set_config       = gpiochip_generic_config,
 	.request          = gpiochip_generic_request,
 	.free             = gpiochip_generic_free,
 	.dbg_show         = msm_gpio_dbg_show,
-- 
2.17.1

