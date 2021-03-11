Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47D42336E64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 10:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhCKJA7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 04:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhCKJA6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 04:00:58 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B297C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 01:00:58 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so9020946pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=qIBHCWzKJJjDmvyCh1b8W/iF9n5EqxTW50Y/4eXZCoU=;
        b=ZbSVbPeuLFBwUZfqSzmF/03QD0/d22RJ+yYj/brm3j/kFFHLkZ/CCnzc3MC6WYq1f/
         NYkwbhTvfoObhSyni78APKvrvJYlARDRHcyW3KwDjUeo/ud3T3RbDIME6TkR87+PBT3i
         dgqf8wB989iQvcfMNwSdH1ALt3Ep884jB7xRdgiY5UTMSbg591D7mxlk+JkS9kJ9HZ+y
         d7betEZWOvj9xTlugdCULz2b5OGVtA6PDYppAiVNGDlvS1SOPYk4CIpzeB/oe57fiffG
         5cP/bvt7V9Pu9E6KFOqmroGv431xh1FPFQWKlLg3Hee/Ckxe9hOe+vBAxs2EmCZ0r1P9
         inug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qIBHCWzKJJjDmvyCh1b8W/iF9n5EqxTW50Y/4eXZCoU=;
        b=IDcREB4ntN7TqavV3Buf4ZMYvt0ZbhICC3gJWR7/dLN2BQ2xmreew3i0Vl8Bixdrr0
         ca6sSdBCBhd8eDTf0G0lBGOOp+ZXw9egVg4kRBvY8tE3AAP4jVn9Uq2Mv5q5ma0RuRCQ
         +cA/y45x2goYtJoQ7fkn7+3QHZpR6wCc5ljSePjpVNiSQlzYnJyOIRnsVT2k9TOs0ibh
         0nU10mUSx5ixZyOG9kFED5u6Npje3YLSciLicuG39u1r6cBME3u7zNRil7zT8j46MOGL
         n8yilgeWRMhvJA0/ywfItKVGVU1Gl9IiPJpUnEAFkvSqrR1H3sKRhOOhAyzNJXDHtryO
         liqA==
X-Gm-Message-State: AOAM532gn56E6Ct+Y69Kg/ZXL6K7LBe+6BcpAlxV71gikazced7GqqPC
        pVllGSfzTPtfKW9zt5pI5C3lNZu/zp7naQ==
X-Google-Smtp-Source: ABdhPJwVcuSAElH3xX3/YOVVOtJfoHDn0KgCadcj09La+NBQVEUFmks+K7WDT164limyQ4L87ied5g==
X-Received: by 2002:a17:90b:116:: with SMTP id p22mr7771781pjz.161.1615453257771;
        Thu, 11 Mar 2021 01:00:57 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k27sm1873201pfg.95.2021.03.11.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 01:00:57 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] Revert "usb: dwc3: qcom: Constify the software node"
Date:   Thu, 11 Mar 2021 17:00:49 +0800
Message-Id: <20210311090049.7354-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 8dc6e6dd1bee39cd65a232a17d51240fc65a0f4a.

The commit causes an regression for ACPI probe on Lenovo Yoga C630
laptop.  platform_device_add_properties() will fail with -EEXIST for the
second USB instance, because of the software_node_to_swnode() check in
function software_node_register().

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0c11e45bccaf..7dc74885a635 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -570,10 +570,6 @@ static const struct property_entry dwc3_qcom_acpi_properties[] = {
 	{}
 };
 
-static const struct software_node dwc3_qcom_swnode = {
-	.properties = dwc3_qcom_acpi_properties,
-};
-
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
@@ -620,17 +616,16 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 		goto out;
 	}
 
-	ret = device_add_software_node(&qcom->dwc3->dev, &dwc3_qcom_swnode);
+	ret = platform_device_add_properties(qcom->dwc3,
+					     dwc3_qcom_acpi_properties);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to add properties\n");
 		goto out;
 	}
 
 	ret = platform_device_add(qcom->dwc3);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "failed to add device\n");
-		device_remove_software_node(&qcom->dwc3->dev);
-	}
 
 out:
 	kfree(child_res);
@@ -845,7 +840,6 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
-	device_remove_software_node(&qcom->dwc3->dev);
 	of_platform_depopulate(dev);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-- 
2.17.1

