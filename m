Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A773C76C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 20:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234172AbhGMTAg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 15:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMTAg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 15:00:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9939FC0613DD;
        Tue, 13 Jul 2021 11:57:45 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id l7so30922034wrv.7;
        Tue, 13 Jul 2021 11:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vDGcLU8JQtXVLyCWhqcL93Aad2ZhW0HDazLbIHG7q7I=;
        b=p6ADqFBUEa2tXEvHgQ/nNUMGcrl5L7art+u0rJg41LsoNafS5Qs1ckN/UlUNhauApE
         RvTby2yBuPv8esDA01BHt1qa86sN3lfX5YHkv0wPf5xPVVrSM9URO0Xs8aR7RgHcTSvQ
         5f3nzVoc4YppvLppuZjLnxv8x1LhnsIfTfhUWZYeR2xvJzZJHrxqs7B2CBCyUuU2fX4/
         9CDhLWnAj7UPCNO4+vEFNUtFhJCwsHLg0eus9S4rtNJx21rdGLJQnamNXWb28lBR7aa3
         NQ4U/H2sBbzMZh3SHQZlnV0XMJFEcHKBy7DAmbJiEqE3MQcnX7CeG1cgQcOBdpOd9Fiu
         Yaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vDGcLU8JQtXVLyCWhqcL93Aad2ZhW0HDazLbIHG7q7I=;
        b=hzSSQyDcUKi1OUAbwfVsXyDbsb6dmWZ0ZmRjqDSZ9usE9ONwnhH+Gl/0jIXWdrt0sP
         xgCi/aWqJdFfQMivncw/zmCwtPqEoTDQv3sQbLFord5G0wERT9/S93zKPBWiZBbnxFDy
         kI0VzOHQHZ7Yi2u4Fzelj9lGRTmjOJ/POCjdd/krXtybchdTkPMgXTlfSeSh/bfdqHx3
         r7j6eD5VkgYocmlrN7NmVEC70tqhplm6F+4gnXdSWWbTo7z2vP+93tdMWZ24P4LVvj0K
         qM1yWrXszHYeT9uB6gIeLkKtOTpwAfr3wFehOI99YwBsClfCzdvzlWZW2qgr0G3EgW0e
         Z0JQ==
X-Gm-Message-State: AOAM532Hma5kbm5o81vvUMzwnBgeRFtWY3ODmBkk18eygbpThkVTtRXO
        ZanU37actnSOfIUb9PYJrts9WHAJuyDPHw==
X-Google-Smtp-Source: ABdhPJz/OndDY90RseIiR6irji+2MpFIOtcSi1zRrP7mdpi0h0w1Hl9mMyJ+4YRSFtX+qSdWiVBmrw==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr7524263wrw.208.1626202664073;
        Tue, 13 Jul 2021 11:57:44 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id l24sm3077971wmi.30.2021.07.13.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 11:57:43 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: msm8992-bullhead: Remove PSCI
Date:   Tue, 13 Jul 2021 20:57:33 +0200
Message-Id: <20210713185734.380-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713185734.380-1-petr.vorel@gmail.com>
References: <20210713185734.380-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bullhead firmware obviously doesn't support PSCI as it fails to boot
with this definition.

Fixes: 329e16d5f8fc ("arm64: dts: qcom: msm8992: Add PSCI support.")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
index 23cdcc9f7c72..5c6e17f11ee9 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -17,6 +18,9 @@ / {
 	qcom,board-id = <0xb64 0>;
 	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 
+	/* Bullhead firmware doesn't support PSCI */
+	/delete-node/ psci;
+
 	aliases {
 		serial0 = &blsp1_uart2;
 	};
-- 
2.32.0

