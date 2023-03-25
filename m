Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5182E6C8F99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Mar 2023 17:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbjCYQwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Mar 2023 12:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbjCYQwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Mar 2023 12:52:47 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5D010A98
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:42 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id c18so4524864ple.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Mar 2023 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679763161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcX2JepRhMauvmr6OvXDCUj4iLMZOWFsRt6c9RIivk4=;
        b=fzj4/I9qLXRnvj7x/cSvkpKDbmzXx4iT+xGtrmzPKfNZ2lzDOyKQvi7nnKIoeMxU41
         OF0ifz+m6KCRX4sN20nbapx6RwsDDa2yK4g3rCiS9+HWDHNS8teclXPDxLBq6rm2G6p/
         cy02YcyeiFj/VtUf4XKFKIAFv+qAr7OD6LoXwQ1DFbM9IwS2VxcGA2WR/3YqmnFm/WWZ
         IBxJ8AfYmP2C1syUJRUl7q/3ZrmNVpJlN0EHW84cvKdwHV8euhVc8nDjQoZDDjgR96ak
         zCmwDsnstpG4d+Y7Fw1r7TJNxlQQxH3LakqYT4JdtqyCcXh000C6n4M8CkgprS99qCdk
         QXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679763161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcX2JepRhMauvmr6OvXDCUj4iLMZOWFsRt6c9RIivk4=;
        b=n4A7zdBcqUxVluLELWU1xjOXTXIVbdgEzFUEZOt6cyw3Jpiex6LKQDzIg8Pex5Phj+
         oo0Ohd89GyoD1PAqUMJl5Kqyo6n0J0fX1IYu9zg6X1VmHhX5UK7dHZ3jrG950CuChPwH
         8UO7yEbpNWAT4XnUh4K6xQYR6rJ9GAykLevzsPuVvU6s396ZrufQwlmzuvf+RYqk+HpR
         biQntd5hXvmXe8PD+7a9l8D3Ngb4H9IiLV9WR330QQ7dsxusTP9BW6rl2t0ltaU/lMqp
         vwyIA97DLus9rm0v2mjeGSey0As6k/ZR+TiXCZWaTCuDoRvfjinpKQbXZvJAnE0unVuj
         EA4w==
X-Gm-Message-State: AAQBX9dCff1jUwnwGnMDpi55suNEW/CSCo45W8uz8JTeBQpb/ZZa5w1X
        3ape2fNc5zyy4qizxiRnxRcE
X-Google-Smtp-Source: AKy350a6Ilq0dGzubTifmDh9N4IWV2U2DaDP7a83e4+5QLCiub4TcmUrNDEuwyhnzoG1rf5qNMR0jQ==
X-Received: by 2002:a17:903:2311:b0:1a0:7584:f468 with SMTP id d17-20020a170903231100b001a07584f468mr8014843plh.0.1679763161267;
        Sat, 25 Mar 2023 09:52:41 -0700 (PDT)
Received: from localhost.localdomain ([117.217.184.99])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709026b8500b001a1aeb3a7a9sm14889787plk.137.2023.03.25.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 09:52:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/5] usb: dwc3: qcom: Fix null ptr access during runtime_suspend()
Date:   Sat, 25 Mar 2023 22:22:15 +0530
Message-Id: <20230325165217.31069-4-manivannan.sadhasivam@linaro.org>
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

When runtime PM is enabled during probe, the PM core suspends this driver
before probing the dwc3 driver. Due to this, the dwc3_qcom_is_host()
function dereferences the driver data of the dwc platform device which
will only be set if the dwc driver has been probed. This causes null
pointer dereference during boot time.

So let's add a check for dwc drvdata in the callers of dwc3_qcom_is_host()
such as dwc3_qcom_suspend() and dwc3_qcom_resume() functions. There is no
need to add the same check in another caller dwc3_qcom_resume_irq() as the
wakeup IRQs will only be enabled at the end of dwc3_qcom_suspend().

Note that the check should not be added to dwc3_qcom_is_host() function
itself, as there is no provision to pass the context to callers.

Fixes: a872ab303d5d ("usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 959fc925ca7c..bbf67f705d0d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -411,10 +411,11 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 {
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 	u32 val;
 	int i, ret;
 
-	if (qcom->is_suspended)
+	if (qcom->is_suspended || !dwc)
 		return 0;
 
 	val = readl(qcom->qscratch_base + PWR_EVNT_IRQ_STAT_REG);
@@ -444,10 +445,11 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 
 static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 {
+	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 	int ret;
 	int i;
 
-	if (!qcom->is_suspended)
+	if (!qcom->is_suspended || !dwc)
 		return 0;
 
 	if (dwc3_qcom_is_host(qcom) && wakeup)
-- 
2.25.1

