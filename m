Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38801368EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 03:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfFFBC6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 21:02:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42477 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfFFBC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 21:02:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id go2so195510plb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2019 18:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JrcbvKOldgWkH50kiW0a4HfpMKXomzEmet187F9e9WI=;
        b=Qd9d1msbSQb53Iq2KqsHsAFxY5JW7/DojKA2+N32CgI93O94JHubPZWVlC4T3bAMJr
         ZrvFCj/RzF+FbICJpj5JCH4CSTEAarhBE+BW5cjaT/fhsuBRzHh4R4kg+eUsJkXcmelb
         aJRZaXGTdAXba/9Zyk31ploH6ku4OjM3HOI4G79WyWiadhcA/+hLyoyLuNP/7hmImK4s
         yj7Wm+GpGOxYDWvhRDlGg18PZFunPptfjzeUCnWdgmaLkwE47/RuxkhrxK4Na8bGlHe6
         qFcEbErPiIJsSTnCUmMVu7jomRuNUC1mBrKGUgXmeBtTMd8nZ9ibn65B24CxyjbksXiS
         yxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JrcbvKOldgWkH50kiW0a4HfpMKXomzEmet187F9e9WI=;
        b=JscuZNtGfpl5o11A1b6tzGcUdIWSI7yR2+GHPcHsi2Uk3RNcKBqQkD1/CI1viz+IMi
         ryWm/nv0KD2G62pnbGVZJW3cbLMiwFmLZV+HyGHNz72uLgkL/vX3kbDXUkKf0WfmrJYH
         rFjgiSBcmohxzjHeAbLFlrOLqPHnEg89Rsnxp7/+CMd+LHt/PJ1YXqVXCj0BYnC1tBeD
         aAwfn+KnhFnDOF2mig/nBZc/4oO3B2SMeEDyOCyMyHFilOhPXjxhqLBg1YaTPqPaDZl5
         6chm7Od2CnaPN4pe3JhgR60ez2h6sdfmivKTm8SGHA4yeiF+fNhZ0Z0q8No8tt9QaQ1r
         Q/ew==
X-Gm-Message-State: APjAAAVA/bWr6DZcbTLdd7QcZ6IImED/j2DKBe8zhTP322ooqwaVSwcV
        4IY9DNrF0br8jJ4Zmk15uYuoug==
X-Google-Smtp-Source: APXvYqzxPgy34UUwtKp+qsxEzAqNHyHrYFZnGo1PhXfMwMDzdB7H5vaW7x7ustTZPxvF+bd24ZmJYA==
X-Received: by 2002:a17:902:a716:: with SMTP id w22mr47239553plq.270.1559782976660;
        Wed, 05 Jun 2019 18:02:56 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 144sm170856pfy.54.2019.06.05.18.02.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 18:02:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Evan Green <evgreen@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO
Date:   Wed,  5 Jun 2019 18:02:49 -0700
Message-Id: <20190606010249.3538-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190606010249.3538-1-bjorn.andersson@linaro.org>
References: <20190606010249.3538-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the UFS device-reset gpio, so that the controller will issue a
reset of the UFS device.

Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 2e78638eb73b..d116a0956a9c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -388,6 +388,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	device-reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <600000>;
 };
-- 
2.18.0

