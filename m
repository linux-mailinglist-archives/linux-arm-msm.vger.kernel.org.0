Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2A735B80
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 13:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfFELnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 07:43:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34676 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbfFELnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 07:43:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id e16so10867553wrn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 04:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D1YI3KbYi08Gt53137zQUvYaTjAlj5pAkcVwiE+DyoM=;
        b=VJ9UZTvA3X5aVsLc1syf0WgRbb9hveDRMQ0o4bi7e3TWI3hu59qIVIWzNCnCLFPvcV
         BkmcBpcged+/ot/AjzaUn3vAPGguN1YUdBFOzAr9oExAYw7Ep1MDcXzgyTSVLD+1X0rx
         dxbz6b7aPBKYIzI6Q1tMn3Dff1B4Exaufc7li5HGHTsp16jBRrpm1KtLBM7Ot+Khe9ek
         OmNNy9J2Aw++vb6P1uGKXA9fGZfpgpj3ZXvK+9jGl6YEkkQB52v5yTZQzOdLLxO7ZoSu
         0K8ZIZ5JaRhv8PVqmLoQ8VfacQZ9B5Xr/NDf4obTBbtgpXFwiD8d097j0nFr2ss+TE6B
         pv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D1YI3KbYi08Gt53137zQUvYaTjAlj5pAkcVwiE+DyoM=;
        b=MZmxIwfYHlmGNMQkstZ9ATgC3eY111lLusnoevzGOFOkBukcSXIz6DtYahycPacf7D
         PapDhIXGT2FUbMgPcXIshD1cxTPHWK2h8xF/wuHM9PRJ9oeec9dL8BZWQW48uaQSxZ6r
         gUUMMu/VFQANSXWs0bLkLmk/d/yncpdmsr2vDoeHLxjfvSDLhKNdEhQ7UrCAP1GSCAj6
         CR/NfvWkJwNTMmDe63G+ytnbJl+131w4BV4rdAz1LEyXErexq/HXVDFdbgiebh6W3Q6v
         uWn5GnFFF/XRDwI8gfAKsxS5F/tYXHCmb12c/iaa401fb3/u5fBOGSMlr7/8aPjDOAyi
         PHQg==
X-Gm-Message-State: APjAAAXHmu20p7OOm+/gbV//xgL9krLEVmMgEb0p3/YHHEiDnIcXOQPN
        t2n2z/NfErBeg7ge9El2Hx13kg==
X-Google-Smtp-Source: APXvYqyDNkp4LO8LlugyAFDuaUSw4Fq1u6qPmEeYYKPm5xZjcHbKt/hoS3r2pxN8/6BYd5JeN6NYtw==
X-Received: by 2002:a5d:684c:: with SMTP id o12mr11703656wrw.305.1559734993874;
        Wed, 05 Jun 2019 04:43:13 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:13 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Wed,  5 Jun 2019 12:43:01 +0100
Message-Id: <20190605114302.22509-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting with Device Tree, the current default boot configuration
table option, the request to boot via 'host mode' comes from the
'dr_mode' property.  A property of the same name can be used inside
ACPI tables too.  However it is missing from the SDM845's ACPI tables
so we have to supply this information using Platform Device Properties
instead.

This does not change the behaviour of any currently supported devices.
The property is only set on ACPI enabled platforms, thus for H/W
booting DT, unless a 'dr_mode' property is present, the default is
still OTG (On-The-Go) as per [0].  Any new ACPI devices added will
also be able to over-ride this implementation by providing a 'dr_mode'
property in their ACPI tables.  In cases where 'dr_mode' is omitted
from the tables AND 'host mode' should not be the default (very
unlikely), then we will have to add some way of choosing between them
at run time - most likely by ACPI HID.

[0] Documentation/devicetree/bindings/usb/generic.txt

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1e1f12b7991d..55ba04254e38 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -444,6 +444,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
+static const struct property_entry dwc3_qcom_acpi_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	{}
+};
+
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
@@ -488,6 +493,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 		goto out;
 	}
 
+	ret = platform_device_add_properties(qcom->dwc3,
+					     dwc3_qcom_acpi_properties);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to add properties\n");
+		goto out;
+	}
+
 	ret = platform_device_add(qcom->dwc3);
 	if (ret)
 		dev_err(&pdev->dev, "failed to add device\n");
-- 
2.17.1

