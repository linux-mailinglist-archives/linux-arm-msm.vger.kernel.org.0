Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68376361300
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 21:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbhDOTjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 15:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbhDOTjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 15:39:45 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E11C061574;
        Thu, 15 Apr 2021 12:39:22 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id h10so29456939edt.13;
        Thu, 15 Apr 2021 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+D/n+l0+FskD3wUHX3DO3Hv/ed1drB5Hu8PQhsSGBA=;
        b=hzy168UUqnYftNbG7NwmgUF3y4PEGRQ6dZAUhJMT1Ivux2b36OkDkf14y90KYZ7m73
         P3o0YVEOEwYrpLX/U4TxjMZpkb7vo6Vb33HJXIJlLakjvqCoSHUnY+ezxxPj7+7wUzgx
         0fR9Y6L3S1GHAzz+1+97vhmnfbdKsEyTSRmGWGK/WAzfHe2GQ6OHtk4hC3Xgmg78kgcv
         qJskU++cDXyqMlRjGN0+2si3GVUO2IEl4UU3oaapKj/a3zbbbxUdtlDgi4Bzc6OH/FKo
         C/CZblCpUvbYfKn7UbubmfItGr4Ts7wXQ6QzpgbkIWgGQOuLOqRHOowpux3qpnOWbtjP
         ZZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+D/n+l0+FskD3wUHX3DO3Hv/ed1drB5Hu8PQhsSGBA=;
        b=Qr+ZUB808VItuh0Qc+uVp2n1B5w175rqlStVTQWG/0x5NFOlQrrLg+RLbRrcr+3jpt
         Fp8K4GNazlnBKE/NtNGlN7yoggJ0SLVejRFW6V2dARQd+6AR7ytUvavRxba6prdR+mow
         EGm5tBVNQiTKDtILrB5as3Xy0qnQULpU75DRbwCv4y5lgKmLj+npw/aB49fOlU0rnrVy
         3espk4j0NhtUeYpqKySui3HmwhdvY0DsvKOlzvE/9r22JIwM6nssuX6/KTLRCwdrBSUa
         CWFvn5hd/Yfazh3eBfYgAmskM/lwHrZOhuXgZeII6nr/avjm4S7UKkw+rNhrfViwdb/S
         VNFA==
X-Gm-Message-State: AOAM532toyI193sZvY8o0ZwbRjBjgLq6MPlkVykrdOxthLz/A2vUK2me
        cAK5pwjkkmtjL66Vyw0t3nYe1KVNT3WOOg==
X-Google-Smtp-Source: ABdhPJz4ULr8ZOPK74PtzO73ocoIXMZI9gKd8YMmcbmwIa+C9nM3rH03Uv7X75IkcloV7GM9l+r6Ew==
X-Received: by 2002:a50:f29a:: with SMTP id f26mr6185661edm.13.1618515560993;
        Thu, 15 Apr 2021 12:39:20 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id q12sm2547455ejy.91.2021.04.15.12.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 12:39:20 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Fix gpio-reserved-ranges 85-88
Date:   Thu, 15 Apr 2021 21:39:13 +0200
Message-Id: <20210415193913.1836153-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reserve GPIO pins 85-88 as these aren't meant to be accessible from the
application CPUs (causes reboot). Yet another fix similar to
9134586715e3, 5f8d3ab136d0, which is needed to allow angler to boot after
3edfb7bd76bd ("gpiolib: Show correct direction from the beginning").

Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes v3->v4:
* Fix patch title

Sorry for so much noise with this simple patch.

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index baa55643b40f..ffe1a9bd8f70 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -32,3 +32,7 @@ serial@f991e000 {
 		};
 	};
 };
+
+&tlmm {
+	gpio-reserved-ranges = <85 4>;
+};
-- 
2.31.0

