Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFF84A52A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 23:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbiAaWw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 17:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiAaWw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 17:52:58 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C8DC061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:52:58 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id c24so30298721edy.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+H23eTl8AfXHGYu7GZCf8LybluVZBsCgbnGvamRPJMk=;
        b=ZuZ9YzoX2j4NzgLa6tPM1rtJA7uMwS5Z31lzDKeNxHPeBklvIHOktcd7s470AP6gSa
         03r30ovTMbyr3RWx797VCbOqGN2ApwQJRlZhi2t+Z6BIQOYzrFnTdsk1H+sLFJSszcpK
         hgxu1Es99ZwijPVO3ptCEGI2JvCGs+hhs5Ph2MMffOsF7i70z1FTvPSDuLo9d9Njj09I
         0fbeZueAxKZ/GaeT3ODEIoizxaNpu3zkZsvhyCEO81VykPDQryc9EiJjlVD7IidN+8vN
         /XXSBqT23yQwTO3fFGxaoDOgWlolIwkiw38NaTS9t6sCBW9flNli4H/BwVHFSA/wfbr6
         L8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+H23eTl8AfXHGYu7GZCf8LybluVZBsCgbnGvamRPJMk=;
        b=vr8yGU9652gAFtVu3lCm/R9jwj0Wm3YAbxuFPIwuQkwwMAuV4uJa6hcSz+gxWxu/0/
         kEQWPM6IQezhuYVKmE3tQ2zxfQw8uyyrWP083iZ+tLm2tJncvaGPs1RW8eCnttBGfU9t
         48JwZFcJbaVPbbW8u1twfEUYFQxam10NjUP258coMzb5feuvo/YZhASauMO7eAKkxThP
         kzm2mkBtwVxI+G2fqqRjuEXr3cXZge3Tq3Eob+9aJ2ErKTW807miYT6MpDcrqcGAUHFJ
         MZ9wwvN0WnlxuFWFBLXSVyLqoqueBkZ1FXcLhcFGU3BiiqKmmkBziTkDN5/jSA7yLGbg
         zVFA==
X-Gm-Message-State: AOAM530sTn2a2anv3QelRm9/jrVEqHeF0AYeeQKjJwq11FYb/pvMbRlv
        6rrQDb4y6ULoJD2/JAgLeknuWMk1Px2KjwtG
X-Google-Smtp-Source: ABdhPJwFeYueWqc+5tRblHW6EPgSdRavQ+L1/fiMlsWQKUtQs0F2/JfIRYbcjwzgtEz4Xy0UzzlwpQ==
X-Received: by 2002:aa7:c40a:: with SMTP id j10mr22383270edq.232.1643669576615;
        Mon, 31 Jan 2022 14:52:56 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id c5sm18419458edk.43.2022.01.31.14.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:52:56 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8994-huawei-angler: Add sdhc{1,2} definitions
Date:   Mon, 31 Jan 2022 23:52:42 +0100
Message-Id: <20220131225242.121704-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Angler does not have SD card, thus sdhc2 kept disabled.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* remove sdhc2 explicit disablement (Bjorn)

NOTE: I also set state "rejected" for similar patch for bullhead
https://patchwork.kernel.org/project/linux-arm-msm/patch/20220113233358.17972-7-petr.vorel@gmail.com/

Kind regards,
Petr

 .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 0e3dd48f0dbf..a0930902494b 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "msm8994.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 /* Angler's firmware does not report where the memory is allocated */
 /delete-node/ &cont_splash_mem;
@@ -41,3 +42,13 @@ serial@f991e000 {
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
-- 
2.34.1

