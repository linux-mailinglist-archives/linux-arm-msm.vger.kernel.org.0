Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 943844830E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 14:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfFQMvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 08:51:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38010 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbfFQMvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 08:51:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id d18so9834987wrs.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2019 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2C6MxhIF9Gjdvx3J9DYd/48/Suqux1auzpg7O20+XA4=;
        b=MHuiL6Hd66D8KM0jn4ls2iBDOBivmXgGCkd0bRuw3BVISYThbeIBV65YPTVnC9S5pN
         8kwD7l1LeRLhShtYuu/Ido0JQEJeak94CdUos+d7lXijbpc7lq70fcnle30NFz0tcJIj
         fAbhj9eIhnoDKlZtfNVWfkzOAx8xp0EuIZ9g38860fnnolOIibyFhNmFCQEOV3JsQtou
         UjFRWCn0iZbk4TdcLNFh4kMAKOur21h0NofVuZCw5wYBD3SEo5yr15DOn4ZrA5obTtoT
         wSTQGINMn3kmRWVRTFv5WxMKEdA0kEwajLFNzSkDL3ycCAfLXhvSJF2ZlVcb1F43lutn
         H4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2C6MxhIF9Gjdvx3J9DYd/48/Suqux1auzpg7O20+XA4=;
        b=UJZpBS3r4sna+FwSh1nqA71YcDhEFIxJAM/Xsw/gMuytTYPxR3wfVHxLrTwPtWyb7h
         l3p3xkcBm3fyvr07BSE6qgS5ycL194a6U6F6OKDPDvO18ngw4me7YDAKbxMd9+bMYxyK
         CoTISVWOKkNrLeGmuBVz7OuSWeYhcPpIF8B9/55E6pE0DTtdtPEYvPXF9rVd5c/LlzAm
         9fnpm11qwI/llCHG6aQcD0h2BgVESPn4Vs5d/u5obYKj/OIq4zI+mvA6ka6zWi+m8kee
         SzZoXgrJxZE0dapD75vFg8ToXmFRDiCmJYh+Eh1Qcg+cWHTW8VJpWACva3zaBx3iJkM8
         I1Zw==
X-Gm-Message-State: APjAAAVZS1wAasvx8Xj0jFKeni61k0y+1rteDC4HJeliZ1BsKOfnvTKf
        NeEsonSUYGEzMrrjfVuJcEe/eQ==
X-Google-Smtp-Source: APXvYqwC65DYERLdER2UmlNerHOaEQY3c4hwpSMWsWud6VpPKrL6rBW7xSk8iiKL0ioPg8v7UxK/qQ==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr14844325wrn.222.1560775871713;
        Mon, 17 Jun 2019 05:51:11 -0700 (PDT)
Received: from dell.watershed.co.uk ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o11sm10477852wmh.37.2019.06.17.05.51.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:51:11 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 3/4] usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
Date:   Mon, 17 Jun 2019 13:51:04 +0100
Message-Id: <20190617125105.6186-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617125105.6186-1-lee.jones@linaro.org>
References: <20190617125105.6186-1-lee.jones@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 0cb63f6c92d9..2d050303d564 100644
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

