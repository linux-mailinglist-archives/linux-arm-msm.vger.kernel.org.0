Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D8132B2F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242643AbhCCBQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1576243AbhCBSjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 13:39:18 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AA0C061222
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 10:37:10 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id s7so5341974plg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SLYpybgciotBd/rxrs5DZC4pmWyMUXZad5zX4+hG7rw=;
        b=AI2f9OqqpwHzAd+D/JrSN7a3yT2V/0/qHwGH+OcLMZiuTZnoktTIFdhuwyFmqafCnR
         qLFaqRKwxO4ywNE3WNlXPHqzdlx59TwcCTPHa6nnpQzzjpaU5L2IrFtZ4E23IWzKovV4
         ppdTEj/vFHZWVv4YBNtLB5Vr7AU3gOJu3+Zk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SLYpybgciotBd/rxrs5DZC4pmWyMUXZad5zX4+hG7rw=;
        b=jk78TBMWOZ7772aAaew4DZISku3NMZXZtYkSTF8IU+39ZgUIACMjxk87BtU6sFKixI
         rkMydRNtbxJjHUEjqPh+NpdkJZ5bCfR/kLhYQmpMlg4cJ/kbdlRvpjQVFr7203taIcCB
         21+H5cefJ8HQHqfF7BUgFGLN0P8eMdKJj2+mzSvzg8t3xNNlAIcLWARjOoXg2k9rtrme
         xAnFvYPZ9VXHp0UgMRRo8M72c9rT2sBd2PApF8SxkCB3cZ1W3aFEvzruCiSIVZSq+BW8
         GJMrwmRWqeqxVL53d1u5LobSftIThoSMj7avhX5RtWSaMVecb3xX8RMJoBjdQKzxJOw/
         WHfQ==
X-Gm-Message-State: AOAM532PtiXH4y0o4dVMlGHF54RAOy3v7+zzSmvORQY/abCoARD+XJAj
        XYqyvO5eChvN3cYaAlVOEyODLQ==
X-Google-Smtp-Source: ABdhPJxn4JuGSU8VzVGgG99O6FPPLehFm24PHgGt/Ek4f9DIQAWp/lhXquLysjXs8E77cH5XmPXrYQ==
X-Received: by 2002:a17:902:7d83:b029:e4:45ca:5407 with SMTP id a3-20020a1709027d83b02900e445ca5407mr21149661plm.57.1614710229759;
        Tue, 02 Mar 2021 10:37:09 -0800 (PST)
Received: from localhost ([2620:15c:202:1:b443:d17d:fa1a:e2f1])
        by smtp.gmail.com with UTF8SMTPSA id a23sm21937578pfk.80.2021.03.02.10.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 10:37:08 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-usb@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] usb: dwc3: qcom: Honor wakeup enabled/disabled state
Date:   Tue,  2 Mar 2021 10:37:03 -0800
Message-Id: <20210302103659.v2.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dwc3-qcom currently enables wakeup interrupts unconditionally
when suspending, however this should not be done when wakeup is
disabled (e.g. through the sysfs attribute power/wakeup). Only
enable wakeup interrupts when device_may_wakeup() returns true.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v2:
- rebased on top of v5.12-rc1

 drivers/usb/dwc3/dwc3-qcom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 846a47be6df7..a8ae5cf46f1e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -358,8 +358,10 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
 	if (ret)
 		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
 
+	if (device_may_wakeup(qcom->dev))
+		dwc3_qcom_enable_interrupts(qcom);
+
 	qcom->is_suspended = true;
-	dwc3_qcom_enable_interrupts(qcom);
 
 	return 0;
 }
@@ -372,7 +374,8 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
 	if (!qcom->is_suspended)
 		return 0;
 
-	dwc3_qcom_disable_interrupts(qcom);
+	if (device_may_wakeup(qcom->dev))
+		dwc3_qcom_disable_interrupts(qcom);
 
 	for (i = 0; i < qcom->num_clocks; i++) {
 		ret = clk_prepare_enable(qcom->clks[i]);
-- 
2.30.1.766.gb4fecdf3b7-goog

