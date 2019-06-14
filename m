Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46DB46CB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2019 01:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbfFNXO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 19:14:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45285 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFNXO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 19:14:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id s21so2320266pga.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=T+BKVZFs5J0hQKKy7Xl9NEhtep6L20aFI9X20tcJ4Dc=;
        b=RaSoogsiuoKzfF03OimSCwN5DLWvNVLjg/Cw1uhd4GZF8UIqdZH4VIBMJUq7KmdLXs
         FOeT6TW3S2sKkKi67shgM+JOX9TZQX/0ceG9ZRQSHwfKB+Sy406/zV838lyhVUO1jTjJ
         94Zq3aYgRTyzEnpXP+A/JLp+IATlZju64xtlm53d+Rq2QIdOVkCrEV2wjOYI7+WGAP2P
         EzdhDo1j4sZfVA7nP3gfKip5XLKobHGBQNiHBNB76m/ad0AFbQKgW9Ibn99+pgCGwzxY
         j7YxnlhO6Qa7zDcrGeFEicTeszzLxVB6L2NTqMG2rnG8SB0upFZZkbU+JWTfr6Cm5NQK
         AoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=T+BKVZFs5J0hQKKy7Xl9NEhtep6L20aFI9X20tcJ4Dc=;
        b=CE5vkEFbwiaXqL1j8VehWXcgvnfGczCOpYTyWY7ufr5uHUpU6arASc+3s+MsiP4oYH
         Tgolb4Z/BUz1oehj4co7hpc3kxzgVcnJ3FZpRp4SblE4FITUAypOs/VwQGjdsRjxMpcf
         5V/gqj0HuNdKLq1hhWGOW2jSyGNJB9N/+4dUAcj5hQsJrEFVgf17cPhDJNuFg9L6/50R
         4Osz62xcwkgcnwPlGwfk8rXITbuLl5Gruw2Ir66nwTHFlFIk5qIWmoOu9Pb/KpZPDGIe
         xvg+/u3cXBeNfBDao6TTLPgY3YjXi0NyN85OKwy1swlN7qHcZSZ8wD8aaizdXrhXFjoP
         xsRQ==
X-Gm-Message-State: APjAAAXKlWSGNsAz0t9s4u6gKotrBdGBcmqwIiJmo5Pmtau5UEWOWjN/
        WS8ceh50ZFvOygIOtUPUCBSEeg==
X-Google-Smtp-Source: APXvYqxO8GzkDnYm75Nso+MbL3XLjkJ512s1lRKWZAcBvGoZomz/WOCvvUcPjThL60n5kzlC5e9Eqw==
X-Received: by 2002:a63:da49:: with SMTP id l9mr38078876pgj.320.1560554096491;
        Fri, 14 Jun 2019 16:14:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id w187sm4486445pfb.4.2019.06.14.16.14.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 16:14:55 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: power: reset: qcom: Add qcom,pm8998-pon compatibility line
Date:   Fri, 14 Jun 2019 23:14:49 +0000
Message-Id: <20190614231451.45998-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update bindings to support for qcom,pm8998-pon which uses gen2 pon

Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v3: Typo fix in commit log suggeted by Marc Gonzalez
---
 Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
index 5705f575862df..0c0dc3a1e693e 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
@@ -9,6 +9,7 @@ Required Properties:
 -compatible: Must be one of:
 	"qcom,pm8916-pon"
 	"qcom,pms405-pon"
+	"qcom,pm8998-pon"
 
 -reg: Specifies the physical address of the pon register
 
-- 
2.17.1

