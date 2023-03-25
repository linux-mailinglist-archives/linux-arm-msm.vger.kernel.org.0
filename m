Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958616C8F9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 17:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjCYQxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjCYQw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 12:52:57 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B674910AA5
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:46 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso7890000pjf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679763166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0Jfg9Xt54OpeHJ7N15bUvQwllIzSnAkOp6zbirDfCc=;
        b=Wy4KVfskmDweHEeSxHqMIAqjqkJDsLVpKPaF5J2w5fLKPq05IkuLyHtnoa0xsoPjZj
         nlFQm46Fhcbf6Nl8+s4oLIPEUXkveb3UY/NxbBrJAWppDnyYelrGo94tKZRi9LLoiwXv
         n4beCChcsgXqcWSMQv533qmrF0PJq3cWK8hoytkTk/ZsBm3k/Nt90Sjx0qPIgR97L+Yj
         lZ/fxDLXYlaUzs2o8xIYykFi7ZHbCs6NbJC3BsStM8NNEdPZw5qZJjMLRTmEO/33FJ+4
         V6ICONVXkAffpYAV18W2T+yrsyea9k7/MryaJjCRGM61lCBg3391/AvRX9oB3cph8aro
         ViZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679763166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0Jfg9Xt54OpeHJ7N15bUvQwllIzSnAkOp6zbirDfCc=;
        b=EJ/ahHK+P/mDUs69OqXXRXR1Ilt5szAppSHikRKf0MjXZzn9cAud1e3cnvtV4k/0pC
         9rAjnfuziZ2/sL5OAf1o1mCvAUKxMARCVVb7TT1ZFBs6ABz1eDBmRWYtPAD3ll7xPG08
         xbO8nFAT7TPSiPehgZ8zas771YtlVyxUiXHheOKAmW6kWKGSAQtYzv7vaT2T1PMyNyqu
         ZlL0lRJXr/s8cUuiEFCIxnjgn/Q1/imGHZJEBgACzkMAztTwndAhJMRWK2iYTI8JlhO5
         pxMZUwJvOYr6nxpifEZMD78zxwCgzqFmoYTyLbGiK8W3NhZ881ljmFYy1hLZY/9PNJf/
         DW3w==
X-Gm-Message-State: AAQBX9eZcXybaFtEZfkntNeYc3mdDoY6uxphGivs/LQreEeNcuye/ljL
        LRgtLtk2H9GTKzKOgLGfv8IS
X-Google-Smtp-Source: AKy350YtixAMQG5ovmraKSS6V849Dt9LkQNOadvtu9G5IR+MjwuPm2TvqrlOyj8zCTDlk4AzO5Tzeg==
X-Received: by 2002:a17:90b:1e08:b0:23d:3383:1d68 with SMTP id pg8-20020a17090b1e0800b0023d33831d68mr6869456pjb.35.1679763165724;
        Sat, 25 Mar 2023 09:52:45 -0700 (PDT)
Received: from localhost.localdomain ([117.217.184.99])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709026b8500b001a1aeb3a7a9sm14889787plk.137.2023.03.25.09.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 09:52:45 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 4/5] usb: dwc3: qcom: Clear pending interrupt before enabling wake interrupt
Date:   Sat, 25 Mar 2023 22:22:16 +0530
Message-Id: <20230325165217.31069-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible that there may be a pending interrupt logged into the dwc IP
while the interrupts were disabled in the driver. And when the wakeup
interrupt is enabled, the pending interrupt might fire which is not
required to be serviced by the driver.

So always clear the pending interrupt before enabling wake interrupt.

Cc: stable@vger.kernel.org # 5.20
Fixes: 360e8230516d ("usb: dwc3: qcom: Add helper functions to enable,disable wake irqs")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index bbf67f705d0d..f1059dfcb0e8 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -346,6 +346,8 @@ static void dwc3_qcom_enable_wakeup_irq(int irq, unsigned int polarity)
 	if (!irq)
 		return;
 
+	irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING, 0);
+
 	if (polarity)
 		irq_set_irq_type(irq, polarity);
 
-- 
2.25.1

