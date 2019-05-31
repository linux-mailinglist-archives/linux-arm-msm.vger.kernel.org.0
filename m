Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E37131864
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 01:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfEaXrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 19:47:43 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38004 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfEaXrn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 19:47:43 -0400
Received: by mail-pg1-f193.google.com with SMTP id v11so4865396pgl.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ssV0Kpewe7V3chVlIn07ylhgai93WBPa5K6GWFW9pK0=;
        b=KJ5xKl0XkK8xfSoBs9VmPUFTbT54EICRlFJivsuzwebkNtDKFLpUJ33geHMGddH7UH
         w3/MSstmwv9OMEBmDvvAlz1PjL2KsWSQJHNz4YGtCW2XkY4w1BKyppCHkuVQueq27kZC
         YBk1ZnXq3eQ0jMl/xfEzp9CmLylDUKjriMFmFqHmtnsfsd5HGaG+99WRKOzoRk26ELoa
         ldQGi8ZpGKWb/FOJC5WK8Acwf7ncsDk5BGS/15OlF53A5pKJbzfCSJvmCT93tEgh4JU/
         F63DyhyYh74DbsKVd6VMOO2ByF1G6bzz4HfyClQ4JMt2gyIEZLlz7ofSUKYACjEHk5He
         BvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ssV0Kpewe7V3chVlIn07ylhgai93WBPa5K6GWFW9pK0=;
        b=io2Bz7aPeb2BX14JVoiNrGAPd0JPdoheOVe2z70mba+Z+tgFded/SQs9FRAwzdynE8
         Z0/2E2QGxvVcbxe/ojXrKdWwxldggC4zDP6o/UNW51qmlzQB4KF3exUATWUR1LzRajj5
         RPcBTUobSzZMTRNh/e5YDdpRH+MQe3NeE6uCVoRCz07H0okcBax/OunHZwQSuulJw50p
         ZSJjyIm6P2E+Nuy9yA2VBjAg4840/J7US9FkAUQ/irYFUfg2/BFfDCRx6N1cLA0pEV76
         6V8gn5K6DfZ7CGWzjO91z1fd07p8+cm349Rv12tLg9IzrCllBZNM7YejsoHTKEj+04rB
         BFmw==
X-Gm-Message-State: APjAAAVmtKYjQpcq3is5Ka+pxjTqJUIk/cT+BcOk1441ogbG5csDbr3p
        qoxtbT/nkzsr2obcKg7USSvfEw==
X-Google-Smtp-Source: APXvYqwtjTiDatBn5Vb3SL+i2YrV0hy4eHkglHMR/DHW3QZBNEZU4xtufJ4SoM5+3ahLS9OihXpixg==
X-Received: by 2002:a62:e90b:: with SMTP id j11mr13195158pfh.88.1559346462171;
        Fri, 31 May 2019 16:47:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id y191sm7056843pfb.179.2019.05.31.16.47.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 16:47:41 -0700 (PDT)
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
Subject: [RFC][PATCH 1/2] dt-bindings: power: reset: qcom: Add qcom,pm8998-pon compatability line
Date:   Fri, 31 May 2019 23:47:33 +0000
Message-Id: <20190531234734.102842-1-john.stultz@linaro.org>
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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
index 5705f575862d..0c0dc3a1e693 100644
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

