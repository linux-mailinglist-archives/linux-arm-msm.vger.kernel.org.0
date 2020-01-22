Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA9F8145C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 19:57:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgAVS5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 13:57:32 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52492 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgAVS4Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 13:56:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so198518wmc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 10:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sJ/NH1WxmyLs0OgxjuKXd3vxc/cRe0agzDtoq0wTKtI=;
        b=WuuvYkZepoSj1DAbQe7m4TsyNlVsFr+bx+qJnWfKQkJF7XGpfoJroUNQfXcYq21Uxq
         A7lkDuQA/vGg9TcflM62Rt9CzCZNnSDQR6iPVcv6wsBv8dUDaBqfxzpU8ZTdYZjNyClx
         n5GUlRzbmlvLvy+iKLcvI4PaAy6O1kd9eolHgiO8pqf1lJW+DWol/PL7edH45O9/G8+O
         QGbJrBjOcRMhzvOcOyfNuvn91gwt789hfaQ0bRKCJm6XzuAaijFhV4RrHr5F5pEAomj3
         1sHTCqj+Ou7j0FpYjmflYh60kyLG9L5wruGqiVGSYmqz4ymdC8RIflxeMi+0JOlxSr/4
         UI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sJ/NH1WxmyLs0OgxjuKXd3vxc/cRe0agzDtoq0wTKtI=;
        b=sGhzQnGga569hQsloh+1v0LtYqd0wlgbz0s2aoOkBcDoq/ea0dSlhP4loPq9IlgPxj
         f0gZPS3AFGM4uGRxlSxjfr2tXYwwsYzVKBZLIg+P14ht3rLzXBvjU/9a9B2z3pr3uPMB
         BHy3CYLXjjwRd96GOw47IlD6YqXJyE8XhYhbwajcN0zsHu6xA8Yt62ErC6qgt5wt3abX
         AAW8nfQ7ozwvgES0dMd92VlVszQREwrYNz/2Z297B+OoQTAgPQ72t0CAh5VXYkKmgEJZ
         JlM+V6r5+zZVh/aEVK6z4gb9wCdTz9N//ZqFYZYOKtB7fkWFWZgxeAuQuQCGjfn2X9ib
         SfLA==
X-Gm-Message-State: APjAAAXHQ8Rb6XEes88u1Y/afyYlISinAjJ9bVJWI2ksNYK/Opol7WU2
        qYHN34J+qyd3SuUcJvkAKhJn8xVGwkB1zw==
X-Google-Smtp-Source: APXvYqyK0D6ouCyxn6AqKCSBlXuZdgOeWCsIwjG7XDEmnmPtjdig8rPedOjaG+TeQqut2aI0pA+R0w==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr4193744wma.159.1579719383226;
        Wed, 22 Jan 2020 10:56:23 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:22 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 08/19] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Wed, 22 Jan 2020 18:55:59 +0000
Message-Id: <20200122185610.131930-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: John Stultz <john.stultz@linaro.org>

Add binding to configure the default role the controller
assumes is host mode when the usb role is USB_ROLE_NONE.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/generic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index cf5a1ad456e6..dd733fa81fad 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -34,6 +34,12 @@ Optional properties:
 			the USB data role (USB host or USB device) for a given
 			USB connector, such as Type-C, Type-B(micro).
 			see connector/usb-connector.txt.
+ - role-switch-default-mode: indicating if usb-role-switch is enabled, the
+			device default operation mode of controller while usb
+			role is USB_ROLE_NONE. Valid arguments are "host" and
+			"peripheral". Defaults to "peripheral" if not
+			specified.
+
 
 This is an attribute to a USB controller such as:
 
-- 
2.25.0

