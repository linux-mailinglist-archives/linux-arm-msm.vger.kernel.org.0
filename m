Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30BDC48E0FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238242AbiAMXeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:34:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238239AbiAMXeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:34:15 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F099C061574;
        Thu, 13 Jan 2022 15:34:15 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so2503324wmj.2;
        Thu, 13 Jan 2022 15:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cNUE6qjIIhx2cVTvoziZad/IzGyEzqBP8MCZHTLV9kI=;
        b=o/UF83v9qhHgfvpUSzK0F7nGg8/qwQMjPWozRw4029neSWKcZos7aosM4PEM99KqBW
         DbRbSYk/ZgjeaA8Zm7K2nEgnRGgUhgKoQ3pyKi2p2h/2CtAexC57UVsX+MBZME3ALcZM
         +xTi7kOaXCB+06VhK1OVjaU/Bm52s5nXS9AvvfQ4WfwBy7wPmwz11jJQwR0tLAXoSxs7
         2lu7nP3w7NrJbe/TaWO0mJpgoSpfRXZd2Ux9tEo17U2OfWbyVNKcniK35ZraRanYUz1f
         NvOqIqc7wIYDooShbqOj+q3QzDUb8bzL/EBOKX6iAGT9G/3QNX9hIOqbaRCmbXFi0WK5
         +ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cNUE6qjIIhx2cVTvoziZad/IzGyEzqBP8MCZHTLV9kI=;
        b=IR5zrzA3qMHt51g+JGKgcOvp9bNryxc9hsurvSgvncLE9KyIvLzoWlSAPFwejq+H3M
         S6Wjd+/3RG72eEFdOGQPH1FQrqWSdVSf/yCqxNxGE9XOFZ5yxqcQXhba/ob78y5uCAI5
         0mF1+zboZ7cG3qeRBTU8RBEHZLYkd9tVxK6fz6rSyOCvfRRiQQ23oWp2pzpOrb3J/tTT
         sQh9E1k7qW/tLktpjkDcfxYoAT2JXPseVgMMu2w7nkwh2sUdJ6dJFaF2P//wxoMcvdcQ
         2dz1MX/Ij4P2IVxyDOPicMd2rRJ3GfK3bS29VU7macC2hMYNzPDub20csjXNFRgFOoCr
         0RpQ==
X-Gm-Message-State: AOAM533SRyA4OaUteeAQLxZEqetVeKPDv6OpCk3xO6OYZ7EgdwEtgFk8
        ucgcmI+B4hJFgEEZCCTShDxnhO/vjFvvbg==
X-Google-Smtp-Source: ABdhPJxtjorXzNucDlCyuZ4QUtE34u3poMHzXBINIbNRI+wmHP0SeAGQWoArGGfhWvzmiT3jEBW1ag==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr12800108wmj.168.1642116853908;
        Thu, 13 Jan 2022 15:34:13 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u17sm3724748wrt.37.2022.01.13.15.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 15:34:13 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Jean Thomas <virgule@jeanthomas.me>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>, linux-mmc@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: qcom: msm8994-huawei-angler: Add sdhc{1,2} definitions
Date:   Fri, 14 Jan 2022 00:33:57 +0100
Message-Id: <20220113233358.17972-6-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
References: <20220113233358.17972-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Although downstream supports HS400, there are overclocking warnings when
using mmc-hs400-1_8v:

mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
mmc0: Card appears overclocked; req 400000000 Hz, actual 768000000 Hz
mmc0: new HS400 MMC card at address 0001

Using HS200 (i.e. mmc-hs200-1_8v or mmc-ddr-1_8v) would reduce them:

mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: Card appears overclocked; req 200000000 Hz, actual 384000000 Hz
mmc0: new HS200 MMC card at address 0001

But as the problem is probably elsewhere (bullhead behaves the same),
keep mmc-hs400-1_8v.

Angler does not have SD card, thus explicitly disable sdhc2.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 0e3dd48f0dbf..5ce3dc169bb4 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "msm8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 /* Angler's firmware does not report where the memory is allocated */
 /delete-node/ &cont_splash_mem;
@@ -41,3 +42,18 @@ serial@f991e000 {
 &tlmm {
 	gpio-reserved-ranges = <85 4>;
 };
+
+/*
+ * Although downstream supports also HS400 there are fewer overclocking
+ * warnings when used DDR, also LK bootloader reports DDR mode.
+ */
+&sdhc1 {
+	status = "okay";
+
+	mmc-hs400-1_8v;
+};
+
+/* Angler does not have SD card */
+&sdhc2 {
+	status = "disabled";
+};
-- 
2.34.1

