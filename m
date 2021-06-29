Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFBC3B6BCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 02:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhF2Amd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 20:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhF2Amc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 20:42:32 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083B4C061766
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 17:40:05 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so12951182otq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 17:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6u2RG+sSlQSg+vc0Yj3ZZoGIOveJe7hDDIdJuTdPGM=;
        b=V7kB/DTMK3LIspUUD1BmuRSiNMAFWbl/cBxbK8vYtvWpknYr2jZxiezDpkU72ZqF5k
         O1Ecv5duSmcx8T4oheVkiSi8ooNi05+LnksmjSpCHyeIto8ZLMa9DMdGce/6/FuVU8y7
         mEJIHhOLgSpkJWf8M6qgELcafcQUnrPK/nzSLlq4LN5D/Sb9ivmP6B8+ZKrXqJ01QP12
         4ZLPo+Xbbw/bdcd99VLGQuWL/PpHXc8aMa7Jg4gqB+FP9YfT8kquduBkSsFGnTuNwC8z
         erocY2F9DV9i3QnpXfCC5aCtVc3ZdhlLw8xCCUxahG4grVseNIjApmrsnWysZzUNJaEL
         C7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6u2RG+sSlQSg+vc0Yj3ZZoGIOveJe7hDDIdJuTdPGM=;
        b=hfjLxVOMRlFfDrWgFXF7qsuJL0mbOebQAMZ96FmfyK1nJ5xjjSiVagH+o0BVbQGwgd
         G5UT35S4YvimCyze2OXJgaGcor2CEqKXuPiS6PDq6CkXp0Wy4Eh8arqaqcN96t9iAS9v
         IfzCcYg3Wov6lZnNHR6e3BwYh2e6ZmS65U21g1JziM95LhNyInk9sQIrcIwEufr6Ga1L
         R+k3bkszQWla3vXhiz0rMRwY6xDwJqJTAXuuuWSLS25YxX5kkS7ow9a4s/U5s1zQwPyJ
         0vUAFMwPWfHlUu9v+99wBFnDqJ7Jb9Fu6zOM5xH/w62bHmuBRUOpctzW1ZUmqyBcakCT
         jqGQ==
X-Gm-Message-State: AOAM533NOhQoura//9jfQ/kJojL7YNTqoL+mTgARJ84j3riz7bwlWY6G
        Ftbcq+xbZft20spIxGd7Lra0Fw==
X-Google-Smtp-Source: ABdhPJxspl+N2dD5PBNJ3IIY9QGvG1iX57PP0YC/Ke4tIoOF5jmqOC0AlSIrVBSZ5i/lB7SrqYu6uw==
X-Received: by 2002:a9d:68d1:: with SMTP id i17mr1990775oto.227.1624927204360;
        Mon, 28 Jun 2021 17:40:04 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a7sm1860832oia.42.2021.06.28.17.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 17:40:04 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: spmi-gpio: Add pmc8180 & pmc8180c
Date:   Mon, 28 Jun 2021 17:38:51 -0700
Message-Id: <20210629003851.1787673-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC8180x platform comes with PMC8180 and PMC8180c, add support for
the GPIO controller in these PMICs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 161216daf463..412613c80e9e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -30,6 +30,8 @@ PMIC's from Qualcomm.
 		    "qcom,pm8350-gpio"
 		    "qcom,pm8350b-gpio"
 		    "qcom,pm8350c-gpio"
+		    "qcom,pmc8180-gpio"
+		    "qcom,pmc8180c-gpio"
 		    "qcom,pmk8350-gpio"
 		    "qcom,pm7325-gpio"
 		    "qcom,pmr735a-gpio"
@@ -120,6 +122,8 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio10 for pm8350
 		    gpio1-gpio8 for pm8350b
 		    gpio1-gpio9 for pm8350c
+		    gpio1-gpio10 for pmc8180
+		    gpio1-gpio12 for pmc8180c
 		    gpio1-gpio4 for pmk8350
 		    gpio1-gpio10 for pm7325
 		    gpio1-gpio4 for pmr735a
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index a89d24a040af..9251fb5153e7 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1123,10 +1123,12 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pmc8180-gpio", .data = (void *) 10 },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pmc8180c-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-- 
2.29.2

