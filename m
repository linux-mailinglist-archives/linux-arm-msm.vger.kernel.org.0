Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA61821CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731194AbgCKTOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:14:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33455 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731182AbgCKTOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id a25so4146708wrd.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2FvaQYbh+DmrT5z3VnA+Z2hjXjMayiHnru+yMFyYikU=;
        b=DPWQJm2K/cI6KBQ4ezXYmGMA25WEQ0ytHwNBg4ktboMQIFi6QjJRR73DRuP1QwgyDj
         9X/j+a7cxRkLSovdPvsZ6F+0BjpNKW2Ob+l7HXzXVa7f1URSmV0BcI6ZrXJ2CqdHlkqc
         I6RATi2h+yO31tVEmcny45DoKPlOOUarpT5g2EgiRsLErYeac3mbQrpp4R86wTJAUyFr
         bVfLxzd043elz0qc/kicrIzJ0X1JDNIMOxB6j+Ce+O+ai8hH4jyIw9YWKhY1nacgvaQx
         jxBi0J52wjhqqkgYogryjDJ4l3pMQ7xVmpvkiXPv/oT6eLeiyg/EZQaxzLjN/r5BKZV+
         eLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2FvaQYbh+DmrT5z3VnA+Z2hjXjMayiHnru+yMFyYikU=;
        b=KilqbXQkHjIM4vHF657xqrUVkePZM1Z1atj+AyvJqodB+7QiUMluP5IQOBKyNDW9+M
         63Ocy/uRfVAj2U5eWzUKBH8mibRGmanhFBf1s0Rnjc0N9WurGeTd9W3dHfvybADFlE3+
         cB1i/enR5OVFaBJQq0sLOqunyy6iDfVkdAQcu2KD9d/8xfQ7DKF9NKgYF8AnTMHNiLxG
         5rNzpi3zU55aCek6/Yts3Ut/SKmZCP+nNuVRJOCJ46xtYxWt1EFItmhOxiy2OkM+H4GR
         bNLWpA2Sj3XnU3jmaCdr4STthPiwoICFfyMYkePswPEbnlVrHbLdpssMZeUEWWgJvaJd
         s/hw==
X-Gm-Message-State: ANhLgQ3FXSR5fqPFrjXWLo6AU3ynYv1uEcdTUImvqieZL8MNZyfDV7Aq
        jKP4FnR4ZilvS2jxLMpuNPzQSw==
X-Google-Smtp-Source: ADFU+vtpowS0bzwahGC7y224TiYbPRgsAKOlwjrIN096zE6Y/8gR2auOuAGzRIpzTboXSxLs3FbKtA==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr5912716wrx.70.1583954093196;
        Wed, 11 Mar 2020 12:14:53 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 4/7] usb: dwc3: qcom: Add support for usb-conn-gpio connectors
Date:   Wed, 11 Mar 2020 19:14:58 +0000
Message-Id: <20200311191501.8165-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a routine to find a usb-conn-gpio in the main DWC3 code.
This will be useful in a subsequent patch where we will reuse the current
extcon VBUS notifier with usb-conn-gpio.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b..6f4b2b3cffce 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -550,6 +550,21 @@ static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
 	.ss_phy_irq_index = 2
 };
 
+static bool dwc3_qcom_find_gpio_usb_connector(struct platform_device *pdev)
+{
+	struct device_node	*np;
+	bool			retval = false;
+
+	np = of_get_child_by_name(pdev->dev.of_node, "connector");
+	if (np) {
+		if (of_device_is_compatible(np, "gpio-usb-b-connector"))
+			retval = true;
+	}
+	of_node_put(np);
+
+	return retval;
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
-- 
2.25.1

