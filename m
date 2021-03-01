Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12B93278C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 08:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhCAH6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 02:58:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbhCAH6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 02:58:33 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D4BC06178A
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 23:57:52 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s16so9332017plr.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Feb 2021 23:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XoFpdh3Wn/xNSK+FjXiIjWLWmWk32HzAA/54xtXXwfE=;
        b=W/u4Tn4+Pdx23olu3YpUBlmVOQntURJcwwE5F/+AN7HbRuHcjorfiVZeEIk+QNetok
         jFY9c5VNOGdEzgczo4e9//TSrQ/gzWX6CzkiUDgLCskAr0nLxgh2/0m6qn6z+zsdvd0w
         jOXkSFhaPwDITpsqzXZu35vBEbUs+NGk99pEzI9nwGMklnb94/eSgviAXJOya3JCs22j
         enFovKK1lNajyqyiTMc6oZvHSLyHFH9bXk8lJ73rZ8eZLi7HOXFTTTEUk++FR2EfdQKJ
         aOpLgzemTOYhFLFPadBK24izio8dPmFK+/cg/29sfClpDnDf/wC9yWabd8YKXq+wF5TQ
         Hoaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XoFpdh3Wn/xNSK+FjXiIjWLWmWk32HzAA/54xtXXwfE=;
        b=VyLDBqf+7IZR16xIZbECcBSvCLVdkKySfxZPy5JaVa8FDU55tdcq4EVmEUg9UW6czq
         tTSNFaCrIaKD12nz7qZn6MjJCg9td3EKw7TZ03nJbpJdhDFrOU9Rw0+RvrUwKmGQugDI
         M8MmoBvzyoZCp/l609z0C6mR2H0+1mcddvQ/GRTECdpJwNFFqVKWLrKhWv3ZFI1jRqMj
         8SuNXAJKLLmm3qe5JaC1KNSwObf5iUrRSVVraDfl/C8Ld9Ahj3pXwJpwYZBmJs1sLkM+
         WYpUz492Lm9IDgk29ckSsMCFh48odW1blzs8eciA1dtvy7hppRWYoxX49QxcQrDbGVDZ
         Unlw==
X-Gm-Message-State: AOAM530j4FodzgfS59unZg7iS2UtMacgCMrb6hGO3RWhpnMFzz4sgrO/
        22BOsio/MUbSuHX4aGuEToLsGA==
X-Google-Smtp-Source: ABdhPJxKRw2YLIMoyY47FaoulH/nYW/Ac+00k9HVQGCY37Rk420KcEh+zgFGdf98tRc7dzqdARq5Aw==
X-Received: by 2002:a17:90b:1105:: with SMTP id gi5mr16131290pjb.26.1614585472383;
        Sun, 28 Feb 2021 23:57:52 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k8sm12350388pjj.31.2021.02.28.23.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 23:57:52 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] usb: dwc3: qcom: add ACPI device id for sc8180x
Date:   Mon,  1 Mar 2021 15:57:45 +0800
Message-Id: <20210301075745.20544-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It enables USB Host support for sc8180x ACPI boot, both the standalone
one and the one behind URS (USB Role Switch).  And they share the
the same dwc3_acpi_pdata with sdm845.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 846a47be6df7..d8850f9ccb62 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -938,6 +938,8 @@ static const struct dwc3_acpi_pdata sdm845_acpi_urs_pdata = {
 static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
 	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
 	{ "QCOM0304", (unsigned long)&sdm845_acpi_urs_pdata },
+	{ "QCOM0497", (unsigned long)&sdm845_acpi_urs_pdata },
+	{ "QCOM04A6", (unsigned long)&sdm845_acpi_pdata },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
-- 
2.17.1

