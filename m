Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1BCD19CD92
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 01:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390172AbgDBXpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 19:45:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37452 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390265AbgDBXpB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 19:45:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id x1so1974958plm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 16:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IcUXuPRxJQI5RCQqnjKMDNcCLnTPm1SBa74gYbeIkBY=;
        b=DyUHLDg4Q8iCWGfd69LaO0+mou9XnqdjVX5kvqZ+DYN6xTB6D3cvDXDdEyv7NcNvcG
         M20M6jgMNJjsJKyg+H6A4ScEe7xWy0TUeLrSG8I9625ok+MFgJVNywJjVWjC5qRbOJuF
         eycoES/pIhuiBrj4P8Oi7FpcX26pUDyrJdEJiyYhjLuvSIa+uUzEPVWu6Wo1rAawj274
         xG0tZ8fO/7Ptz/3CvYUM5+8DsSXrmYMvcAwkIuLT3k+2F5QvO0fxuWNBMMNKEqlCeyQG
         lQdqM8ursthvgV2j4yHmWXOJqyXqJ7PXtg+HcTw5ustbHUbdUs3Zc677t5PAk1CPJzZO
         +gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IcUXuPRxJQI5RCQqnjKMDNcCLnTPm1SBa74gYbeIkBY=;
        b=ebs6OBzWES3i8gdI0AJ49DQQ3M3fKPS4VVUierr4eG3a0nmGRWDk6HZK+lIEkem408
         7E7/GDBrdbvv5jJhhyGM8pFc5rVBPeDODcOtAEr6+lZAyutjc4cyWnYP3k7iswpqGGJS
         X4vP6Ycxmcj4DM7RsUFhZH93WOiRiRt84lPS3hOEsvGo5dVF5ZWgeeDx6wAEHdq+K1bh
         aJUlRKg4nQNCL3lNpTyfJLYxRtm9LMPkYYDe404IhZ4kjqZs5/hJ83nhy3/bL8dhtPPg
         n0MF3J1zPo6TrjDRCtyjl24CDKgqkQs4ydb80RVKzVi46oQzCtIt0GIg/komC8qLCzy2
         6aAQ==
X-Gm-Message-State: AGi0PuacUvyBNdrfx0+/eYQgY6oKxnfl08FOIdDCSP9AYYtReCcAbPOQ
        yUdcxT4bisSHKYFTY67nwXUDdQ==
X-Google-Smtp-Source: APiQypLLA09iAbXGXVuJYxW6lprsIUBovTbEFKjLafv05TQE436Pp93UgzeyhGoErgG1V6cnI5yeTQ==
X-Received: by 2002:a17:90a:da06:: with SMTP id e6mr6592136pjv.14.1585871098591;
        Thu, 02 Apr 2020 16:44:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id q71sm4481727pjb.5.2020.04.02.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 16:44:57 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
Date:   Thu,  2 Apr 2020 23:44:55 +0000
Message-Id: <20200402234455.75061-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402223723.7150-1-john.stultz@linaro.org>
References: <20200402223723.7150-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
PHY support"), the change was made to add "qcom,qusb2-v2-phy"
as a generic compat string. However the change also removed
the "qcom,sdm845-qusb2-phy" compat string, which is documented
in the binding and already in use.

This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
which allows the driver to continue to work with existing dts
entries such as found on the db845c.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
Reported-by: YongQin Liu <yongqin.liu@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Add deprecation note on "qcom,sdm845-qusb2-phy" string
    as suggested by Doug.
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 3708d43b7508..393011a05b48 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -815,6 +815,13 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,msm8998-qusb2-phy",
 		.data		= &msm8998_phy_cfg,
+	}, {
+		/*
+		 * Deprecated. Only here to support legacy device
+		 * trees that didn't include "qcom,qusb2-v2-phy"
+		 */
+		.compatible	= "qcom,sdm845-qusb2-phy",
+		.data		= &qusb2_v2_phy_cfg,
 	}, {
 		.compatible	= "qcom,qusb2-v2-phy",
 		.data		= &qusb2_v2_phy_cfg,
-- 
2.17.1

