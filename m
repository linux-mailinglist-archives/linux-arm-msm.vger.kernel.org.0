Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C84F15741F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgBJMIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:08:37 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43524 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727658AbgBJMHb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so4102834wrq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=XTzUDkmnbPj0IoK9amAX6spUdlbSIt3KVYgLP+tAes9DHuSa0JhZVv7m5ADkp0OLol
         G1fkdH2iT6XiJss2LrU5a9RnJodoju4Y4LaroD95Hk4TuSoXNFiWbE+V/JmV4/vwasHa
         PXkZNN+LEHubDvlaVApQBDF2QsenojKtQ0EtzikbFcFU0zwEr2O54jPVtDCy9GUh9U7o
         yTP2lugfbrXUoZ8Z17rO7wDGbW3C90e0DV7JZb2glm3Erdve7fD1eG9SLeKtMJzx15Ec
         bb8uHJrjfAdE6mZlON/QhUwtIw/ZgEElUt14pZrddLqOmiZxhBSYqVK1DSXG6tA0DS3J
         nthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sAZggOAZ6xTvR/9Em9hZggbtITo/icBMwG27JPLcFiE=;
        b=NRyugxDwHVNw4x2sAoEO/5gQ54zbyEHYf31Kh5xGqcPMO6WpidHGJb60sMJ1su791S
         vqyrXi1ZFeuyEWUh1PZuzcrgOSMoa/nkSDZ//2DZ18UmW8LZ/8E437F8GhTYIlm6kNEP
         2Vzd38+eD2Uq2YKTmprWruQVwu/XM0kj4SUqgtcGzdoolJPy4m4+ktfOzJ6WPwtWdNml
         W7jCdOIddHGpRxurq4oVGOrR3EAYzlzOzOJTQ3RDEMYEsETsU84InYEdbqhWqRflz3zh
         TEI5WAvRa36bNimz5T8z0IrEo7Y0g+AfX5K0K9cZmpo01wMJ11FnD78y+YCNIHQJuzTm
         kRHA==
X-Gm-Message-State: APjAAAXzciF/LMoKhS98Tr1PNgwfsofHfqIc7Alwwsjhv/htI0YAZL6w
        5BuzcvFt32CxS74kFkUcqoEOWntbgaM=
X-Google-Smtp-Source: APXvYqycAs9QarMt0Y2CIE0MxQVa0WvHnitaTbz3sEDCZy+B3A49xgI2KKPFN6cjNH3Juhp05DS4HQ==
X-Received: by 2002:adf:e692:: with SMTP id r18mr1644895wrm.413.1581336450290;
        Mon, 10 Feb 2020 04:07:30 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:29 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 08/18] dt-bindings: usb: dwc3: Add a usb-role-switch to the example
Date:   Mon, 10 Feb 2020 12:07:13 +0000
Message-Id: <20200210120723.91794-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds usb-role-switch to the example dwc3 given in the file.

Documentation/devicetree/bindings/usb/generic.txt makes this a valid
declaration for dwc3 this patch gives an example of how to use it.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 4e1e4afccee6..8c6c7b355356 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,6 +121,7 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb-role-switch;
 
 	usb_con: connector {
 		compatible = "gpio-usb-b-connector";
-- 
2.25.0

