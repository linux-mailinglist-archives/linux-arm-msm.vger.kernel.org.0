Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBFE177CF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbgCCRME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:04 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37343 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730652AbgCCRME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:04 -0500
Received: by mail-wm1-f67.google.com with SMTP id a141so3659521wme.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oTtnFV6YHXHl0gESv53msmY1Agb4GevPkfe3E3DRMq8=;
        b=GhpdZ4ChmbGciaXDNIOlKv03kA2DO+0TgAr5iEkB/E1LhpdSpeqBBTZHP2Tr56KZKe
         It/ohTRS5OHcQ0f2KPVtzeuG8we4NKvJ9/ec/FQ6fEqymGBWHuWE37TECa93QHhhXwvu
         nGV4pk23dMtS8IRtK25SXJki4Pw3TANHTykzYBgcL0KYimeY1+42pfCl9M+E6zI7ogWI
         uh7Owa/EA3S164JmDu1zf02B4wjXhLlcQyOzTWiGcK6WNVLGTjuxOh59MQdnXm7LXjV3
         fhw2UWp9mvAa1TPZY39ywhZasJ8RnP4TelDj0KLS0kmsGCDln98uURdi0E09z0ynz34s
         W29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oTtnFV6YHXHl0gESv53msmY1Agb4GevPkfe3E3DRMq8=;
        b=KvFJ1EQfhL4SEpT5sRLQCRoqNPxFSV0kqg2W5sZIIpW0SYRjNwONQwXKd7i7cUp91Q
         CHLGale4zX4VinHYdJtPK7xbQ9MxzUpl3F7S5wNgy5dP5BhuuPBzZNG4+AWoA4ztDLRN
         gIvJPSA8S1dN/gyztsOpfzdGe1mdL/9ohlxHBEhzV1i13yLnawPWoEmwiUPekErdC2za
         dohVEkPlmKihNUshE4HiLNR+eqxDr5Qnxr4sgePMTmUKAORg94qm7zd9bjZIOwuNnBwa
         iPxvDJFY2FdU5ypjbPzwrO6Tfgkg/5tyGN5OVc5mu0URkNm5wVg9z0znLLpbUi1MX/tY
         vpVw==
X-Gm-Message-State: ANhLgQ2Unjtoed8iq8DWGqfcY2FNqWEfvPvxkkw//uBMFD8znsORHxH1
        OZs7dE581rwc1FRmc9SryjYzM6tlxno=
X-Google-Smtp-Source: ADFU+vudG2UE5W+dBkeI9eeXdE2Mjhx4lCDZ7NWmQzFs7VGf+ZNZu57PTNYFViIgDQ4n4SJmv7CQaA==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr5351449wmd.91.1583255522016;
        Tue, 03 Mar 2020 09:12:02 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v7 08/18] dt-bindings: usb: dwc3: Add a usb-role-switch to the example
Date:   Tue,  3 Mar 2020 17:11:49 +0000
Message-Id: <20200303171159.246992-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds usb-role-switch to the example dwc3 given in the file.

Documentation/devicetree/bindings/usb/generic.txt makes this a valid
declaration for dwc3 this patch gives an example of how to use it.

Reviewed-by: Rob Herring <robh@kernel.org>
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
2.25.1

