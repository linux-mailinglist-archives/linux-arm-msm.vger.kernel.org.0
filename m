Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B181177D1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgCCRMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:46 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33289 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730684AbgCCRMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:08 -0500
Received: by mail-wm1-f66.google.com with SMTP id a25so2826203wmm.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OjQamL43DyX5ZKZxf76rV+ncjDjjqwHBvZnOMO71+5w=;
        b=qrCUZFKTC26uiV3nWZX+HnZvyKjvdogewT44WMI46nlrCqDj0HF5Z1tU/RBRyGnv6e
         XuHz34+k9XTdGzKbGVuyvu1Gv0gj5TXl1pdX7vkHVn2a+Ra2tqf4QIOl+0iOrkZrBRHG
         acyQFA1tjPXzY+rts+qubM6YHC+Ox8un4bDXVkM+8nV/DBKTGTyjqf/iSDJcTrj5kxTk
         wRUs7dCyko+YZnC6K6/DMoXHNSnCmF/YC/k2dn9NydXeOJZwvIGr0SRVhM75Rvccdswr
         sD7oagf/vnF5lB/VcbZ5i5gttuR8v4Q55greTjSJeZobtzEuHFbrDEO39crTqIZkz7ax
         x8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OjQamL43DyX5ZKZxf76rV+ncjDjjqwHBvZnOMO71+5w=;
        b=EbJ602N/zeSDmgN9C3tXovmiw4c6tLja8nG+xzzbYDkeZFae+oSlGHhyGO/c0Xb2WF
         QyCKl5j0rG0+wm51JyX4H97xppjQYeIOzAtcojD4gpSsX4LQN2LxX1Vkaf6vKF+LbKa/
         W5TU6BsImJegxLD/OGNl5VyYiF4VlG0uF/P9lyCrdqWHQKpuoIPgU1UbBaWRFGQf7GAi
         Y9b0IVs+hmPEon2hBVo1e+s35GhywGRviNmeZIc21BPaLQSpzQzaJX6The79JmiXa3hv
         ao17Nb/5UjipTZgyhgjQ+CfOlbmsdZEAPwEjVFl4DgzognqRAHuxsqIzfhVAVNUqc1cd
         CevA==
X-Gm-Message-State: ANhLgQ31M7dHQ3Uni99Nuct6YDsxP/eMiCREex0zeCXf07wfqmlqJ7c9
        Aq1mTRo/H1C7vx3HOPsFotmlKumYWIM=
X-Google-Smtp-Source: ADFU+vsjOLSBRTWQQ5+w29BeK4bsLgwDfVpvP7UETnHiuzQw5xkU3zKeMsfaQUmL8yjS8uItlXC1uw==
X-Received: by 2002:a7b:c109:: with SMTP id w9mr5208820wmi.54.1583255527125;
        Tue, 03 Mar 2020 09:12:07 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:06 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 12/18] usb: dwc3: qcom: Enable gpio-usb-conn based role-switching
Date:   Tue,  3 Mar 2020 17:11:53 +0000
Message-Id: <20200303171159.246992-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the ability to receive a notification from the DRD code for
role-switch events and in doing so it introduces a disjunction between
gpio-usb-conn or extcon mode.

This is what we want to do, since the two methods are mutually exclusive.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 6f4b2b3cffce..f6a7ede5953e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -571,6 +571,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
 	struct resource		*res, *parent_res = NULL;
+	struct dwc3		*dwc;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 
@@ -669,8 +670,16 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
 		dwc3_qcom_vbus_overrride_enable(qcom, true);
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
+	if (dwc3_qcom_find_gpio_usb_connector(qcom->dwc3)) {
+		/* Using gpio-usb-conn register a notifier for VBUS */
+		dwc = platform_get_drvdata(qcom->dwc3);
+		qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
+		ret = dwc3_role_switch_notifier_register(dwc, &qcom->vbus_nb);
+	} else {
+		/* register extcon to override sw_vbus on Vbus change later */
+		ret = dwc3_qcom_register_extcon(qcom);
+	}
+
 	if (ret)
 		goto depopulate;
 
@@ -702,8 +711,11 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 	int i;
 
+	dwc3_role_switch_notifier_unregister(dwc, &qcom->vbus_nb);
+
 	of_platform_depopulate(dev);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-- 
2.25.1

