Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E983B748D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 16:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbhF2Opc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 10:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbhF2Opb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 10:45:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B84C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 07:43:04 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v5so471993wrt.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UeZyBgOCC8jTdK5dxJUnoASqLw0aXvTqd4hglX6p1ZM=;
        b=hqfGLoH1PPX/dR2C4weT86PBNGIVvFbMbcxV6DStSFLOqLEP82uegommw7fNCCSXwo
         4V8dSDl2CT4jWyN1NK7u0i5AF0GSPh0R7dR5MMA9Pm/odaFmp09sdhcjWbPMrfEc0FFR
         v5QtiIJ09gRlxa7tUXyVo6IvlrzXAuKS/UDGeFCQSyqYcZZszCuhSbj1ufqC6NF8/UR8
         0f+WwWjTzyMn4XmmL5M/mnkvG534ie3VFA8jxvOzcq/IMTOGAkRZSp+Pnf5xTsIc+LjY
         3kMsZkTPmTCdMo2bE7zY0emqIWCZVNHoTeuZgf6Je9M+SNCZcWs0FMKfuGRgIy7heq1A
         kf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UeZyBgOCC8jTdK5dxJUnoASqLw0aXvTqd4hglX6p1ZM=;
        b=n2nMb0xH5bRrVHZ988tM9WbhLyTtiEMkNcir4wf/RnrvE9k4R1Wq3pM+FrIalZ5tNM
         VJnWd2OEDmdRyajVMer8EbLTiG/JeNuJWM8dIgY6C2OCNAO1HiauGhVAS6jfh2ST1/ge
         ROJlK4QVR6ZAojdR0VqeGBldH24honm7s2kRBU9PROEgt2SUgx0hnZycvkmv0HLDvHuz
         BfwDLpVelOlH9Ep86YQaNUiMyFGUVIiWx6lUpC5UTM0DlxpFWHuNwPuXSsbso/WJDHnT
         FMwH/TZxS8kICKZ/WEQ+y7/kelhfmnLs3SDF2UUKqJT9NLl1blAZ04P49B9PoEdAcur1
         0HBw==
X-Gm-Message-State: AOAM532++yb8se0+3hOmGmjLvrs0oLY0D+ppy+JOjVBe7MXcDbKAmUuh
        GVbmLBJIP4VGVX8h38KernTRWw==
X-Google-Smtp-Source: ABdhPJxI0QnzFoepzOQ/sHAUNG/T1RRNDfdJ8gYg2aMbVAwg6ijFzIhEFxpTBfJ2u7VSJPBhwQDaZQ==
X-Received: by 2002:adf:f40d:: with SMTP id g13mr34713211wro.413.1624977782975;
        Tue, 29 Jun 2021 07:43:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u15sm2832266wmq.1.2021.06.29.07.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 07:43:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 2/2] usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API
Date:   Tue, 29 Jun 2021 15:44:49 +0100
Message-Id: <20210629144449.2550737-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Wesley Cheng <wcheng@codeaurora.org>

There was an extra character in the dwc3_qcom_vbus_override_enable()
function.  Removed the extra character.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 4491704503ab..541e2626294a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -120,7 +120,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-static void dwc3_qcom_vbus_overrride_enable(struct dwc3_qcom *qcom, bool enable)
+static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
 		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_SS_PHY_CTRL,
@@ -141,7 +141,7 @@ static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
 	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
 
 	/* enable vbus override for device mode */
-	dwc3_qcom_vbus_overrride_enable(qcom, event);
+	dwc3_qcom_vbus_override_enable(qcom, event);
 	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
 
 	return NOTIFY_DONE;
@@ -153,7 +153,7 @@ static int dwc3_qcom_host_notifier(struct notifier_block *nb,
 	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
 
 	/* disable vbus override in host mode */
-	dwc3_qcom_vbus_overrride_enable(qcom, !event);
+	dwc3_qcom_vbus_override_enable(qcom, !event);
 	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
 
 	return NOTIFY_DONE;
@@ -329,7 +329,7 @@ static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
 
 	qcom->mode = (role == USB_ROLE_HOST) ? USB_DR_MODE_HOST :
 					       USB_DR_MODE_PERIPHERAL;
-	dwc3_qcom_vbus_overrride_enable(qcom, enable);
+	dwc3_qcom_vbus_override_enable(qcom, enable);
 	return 0;
 }
 
@@ -917,7 +917,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	/* enable vbus override for device mode */
 	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
-		dwc3_qcom_vbus_overrride_enable(qcom, true);
+		dwc3_qcom_vbus_override_enable(qcom, true);
 
 	if (dwc3_qcom_find_usb_connector(pdev)) {
 		ret = dwc3_qcom_setup_role_switch(qcom);
-- 
2.30.1

