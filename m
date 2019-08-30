Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E033A2F55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 08:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfH3GC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 02:02:29 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41524 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfH3GC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 02:02:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id 196so3887557pfz.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 23:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVR5WK7jw8bBtk+96qcPeVzLLFLq4erxKa+SEg0zTgE=;
        b=ZDd2GrcbYhVH1waqmTlIUW+64lcxxjrJYr5RLlBqyCDbUzFHLa3ziiTmSoyUr2P4Jp
         SUyAEu56MzN3geRGuEAbrAqJbbpFqLQgwOYvAvZX3Y1Oue0U+lBnApEXEoeMmRMPK39f
         L8hDKYfGEd6SPKa4Ulf7yX6koEXwtJktVedMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVR5WK7jw8bBtk+96qcPeVzLLFLq4erxKa+SEg0zTgE=;
        b=GQQ751dl+P1kGbmAwAdm3xJdoCAc0cWfcWnW9a9OSDZtyYZRKMUkW4kqyxIOnZsr0Q
         kYdPJ79GS37p7Gygo4+la9zHdPl/5HBRGAZDVW6xcxOkcHNvkvcgRQUiDyVO5bfFvAUs
         CRJER/rF7fy15fZEa9DU4BzLQFWHTrmfKkYYIMnbSEBjV7CRKq/8/S4lHlQwafEwIIcw
         PfdrTa+TeePDVHNC8PwCLL68zH5ZAZAVjvtN7MwcfTEknhEnuVfGI+MiLuch0Qhgchsn
         QE27O+1rG1wFO4dksbGemegu1eJfiKllpAwFJ0jRbxU6qxn4q651NquArW8+r10IKZJ3
         P5YQ==
X-Gm-Message-State: APjAAAVcEloZsRz92u7ATGxY/G+CYiiPD/PMPzG3/igTwfrmO7H6Ps4C
        9LMMQmox8vpm+KmpAn1GXvCDng==
X-Google-Smtp-Source: APXvYqwJSUMil0yYhGisN0J5w16EOL8/CV6qq5568mVBJX4s6BMWhVxxdAzWH+XRG6JYrfPhcSV5oQ==
X-Received: by 2002:a63:1e06:: with SMTP id e6mr11408856pge.185.1567144948737;
        Thu, 29 Aug 2019 23:02:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x10sm3449865pjo.4.2019.08.29.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 23:02:28 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH] pinctrl: qcom: sdm845: Fix UFS_RESET pin
Date:   Thu, 29 Aug 2019 23:02:27 -0700
Message-Id: <20190830060227.12792-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS_RESET pin is the magical pin #150 now, not 153 per the
sdm845_groups array declared in this file. Fix the order of pins so that
UFS_RESET is 150 and the SDC pins follow after.

Fixes: 53a5372ce326 ("pinctrl: qcom: sdm845: Expose ufs_reset as gpio")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/pinctrl/qcom/pinctrl-sdm845.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index 39f498c09906..ce495970459d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -262,10 +262,10 @@ static const struct pinctrl_pin_desc sdm845_pins[] = {
 	PINCTRL_PIN(147, "GPIO_147"),
 	PINCTRL_PIN(148, "GPIO_148"),
 	PINCTRL_PIN(149, "GPIO_149"),
-	PINCTRL_PIN(150, "SDC2_CLK"),
-	PINCTRL_PIN(151, "SDC2_CMD"),
-	PINCTRL_PIN(152, "SDC2_DATA"),
-	PINCTRL_PIN(153, "UFS_RESET"),
+	PINCTRL_PIN(150, "UFS_RESET"),
+	PINCTRL_PIN(151, "SDC2_CLK"),
+	PINCTRL_PIN(152, "SDC2_CMD"),
+	PINCTRL_PIN(153, "SDC2_DATA"),
 };
 
 #define DECLARE_MSM_GPIO_PINS(pin) \
-- 
Sent by a computer through tubes

