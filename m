Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4707039B33
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 07:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730325AbfFHFFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jun 2019 01:05:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40219 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730533AbfFHFE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jun 2019 01:04:57 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so1581039pla.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 22:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7JHMxvIq1jsW2qWML7iET1ggCLWTMelSL100NyRTudI=;
        b=EDHJtD4g8m8NgywjVghSqy+PL2KBFW+vEhsLk+5399uhepYp6Kcj7W9M5c+hBaLixK
         h0g9ZHCNugDtJttP0mUwBtaOU55XtJ/Ep7K+YYQNJGk8HzR2PcXO5ASWe0RuewbKN0PE
         o2eE00inVhPttmqsymXxsGYTKBOuUjjPzRmp/sny5NEFNgUuSbufcRhMjtwTookZaOrn
         fi5AoxdioRxYHyt8m5XdjZ4N99zqXxCnXhWWrQOK7WxKDLAWZNdd5nuOVDCDFn8LHVEs
         GEQLMXROaepbpCAegsCIEv7p2BmrG3jKvhZjLPukkA9lamgDOYtf2C6vPYEJ3Tfd8i8n
         ZJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7JHMxvIq1jsW2qWML7iET1ggCLWTMelSL100NyRTudI=;
        b=t2VFOdSoZOIpAhhzUPUO7Ukxk4B9kEE/Y/d28pR+ovDeUqTBoXXYgXu6ezZ462RXAs
         Y4L0TnPchOe7WOYhF4QP27V2GsAIY45U+SDXL78WBG5A8xEs0fJSRsv1m5zmkXqvzM8U
         eZmfzgBpDdZORrYnqQLXuw0Bhwzmo01c6T4ZdgdJeLE/sB/vbBXCe0CDAVhPQxDfBkAZ
         WMWk5jNDT48IstPX+7Zuf2fzTZ2u3oTVmhHTZafYT05h7v+yFlz/vOJjJa9jK0AE1IKf
         w61qjyUI8EgrUXCR5oEXwqzmo9jmKcSJ327oSrYNEWicGBamTiq4HFVtrfAsEB+Aa1K5
         kjVw==
X-Gm-Message-State: APjAAAWdGzCU492IuFpdHE2aQXo1/utR+DYCxEwm8gpW5zyowPN5m0DJ
        DdwvFrRtaV0STsVDITzm2hVLlA==
X-Google-Smtp-Source: APXvYqyAHw1AV05o3p032VHhbyghs7+weXTqVDC+E/50Yqk2YdvccJr8yaM4fMNzlvhMVl17Ezvqqw==
X-Received: by 2002:a17:902:b611:: with SMTP id b17mr6065542pls.261.1559970296912;
        Fri, 07 Jun 2019 22:04:56 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b8sm4522482pff.20.2019.06.07.22.04.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 22:04:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-mtp: Specify UFS device-reset GPIO
Date:   Fri,  7 Jun 2019 22:04:50 -0700
Message-Id: <20190608050450.12056-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190608050450.12056-1-bjorn.andersson@linaro.org>
References: <20190608050450.12056-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the UFS device-reset gpio, so that the controller will issue a
reset of the UFS device.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 80189807b4e5..441045847e9f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -467,6 +467,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	device-reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <600000>;
 };
-- 
2.18.0

