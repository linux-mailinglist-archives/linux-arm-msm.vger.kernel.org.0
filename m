Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104C675AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 00:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfGYWUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 18:20:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39100 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfGYWTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 18:19:24 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so23964684pls.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=amjpNRleha+KN/EuHRyzTUgCt6MkSmYthRSSTGRJeLk=;
        b=cc4FhF/zO5NxWck5NRRbEzVCBekK3ZlKjGzUReO9izSEdqV9t/vA0x8UlJcDEYNz9S
         gFdGWsMoYXFnoOrsbhwgJFKIg+JQD9DdqJCL24K4mszOrf4QsAR4GscI5ZJoteuJfqLD
         plgixsXge/LHkeiMYc2lX34OH6pQbQ0gqridn1qii9eWgGbUAwRcw42Qe5nx0SNvfvei
         LVamvvA/gmzss9Agus4cbSGg4rUlZ19FgNss8J6wMkNVx1z8h1bnYBZOJ9To6cjRISVY
         e7IEw43MEAoTp11jeowtIAG5+DYli8+dhDKZ6GTwXWfJHk7L9rXDSLR6EIlzgtWjLk69
         d3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=amjpNRleha+KN/EuHRyzTUgCt6MkSmYthRSSTGRJeLk=;
        b=ELHcv+/2bEUNWT0IhSNtEB4yIvv609gfTRMPbmrf5AFi0ehz1otmNJD5RsmCwgdbKX
         A5UYVLvuNX1FaCibk4HDRqRbx1XBL7ct7VpBYNXYGB22rZ91xfgljbS9tIG5gWWLVa0P
         xpfg8eQe4Yu3nH6iwrMKVyP+ynk32pnt5E7gsmoFQl4JvDQ0jlHaQjDjHTAXzKWgSj/t
         188/zYrYDWUjW6VT2K99uN3aayKzb/G/6RyrQZt7PDlR+l8R0iKHtPMxQ4ODDljaDJ+T
         4ZaJ3mZEUcF5YzJuG0kdXVuqn8zH072szLhuKjg36lVTzfF/pn7oJcGvbUbZCMw7E3P+
         MiPw==
X-Gm-Message-State: APjAAAUyxe5AJhCKzXH1JPfCIlu94yHSrV5EyZMg9wSoeoJU5mCTsDda
        iFY/n0QHHX9Dkp9Ptl/8QnOigw==
X-Google-Smtp-Source: APXvYqzTJsiFKu9NIQp8XByePsHuTBie+TyiE7Ko6FeqH3s31ixG9OJlPkCgk8n/UIiQyF6EAKi5RA==
X-Received: by 2002:a17:902:106:: with SMTP id 6mr94863155plb.64.1564093163818;
        Thu, 25 Jul 2019 15:19:23 -0700 (PDT)
Received: from localhost ([49.248.170.216])
        by smtp.gmail.com with ESMTPSA id x26sm65297712pfq.69.2019.07.25.15.19.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 15:19:23 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
Date:   Fri, 26 Jul 2019 03:48:42 +0530
Message-Id: <72bce036fa8cba3db6e5ba82249837ee46e9c077.1564091601.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define two new required properties to define interrupts and
interrupt-names for tsens.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
index 673cc1831ee9..3d3dd5dc6d36 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
@@ -22,6 +22,8 @@ Required properties:
 
 - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
 - #qcom,sensors: Number of sensors in tsens block
+- interrupts: Interrupts generated from Always-On subsystem (AOSS)
+- interrupt-names: The name of the interrupt e.g. "tsens0", "tsens1"
 - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how to specify
 nvmem cells
 
@@ -40,6 +42,9 @@ tsens0: thermal-sensor@c263000 {
 		reg = <0xc263000 0x1ff>, /* TM */
 			<0xc222000 0x1ff>; /* SROT */
 		#qcom,sensors = <13>;
+		interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tsens0";
+
 		#thermal-sensor-cells = <1>;
 	};
 
-- 
2.17.1

