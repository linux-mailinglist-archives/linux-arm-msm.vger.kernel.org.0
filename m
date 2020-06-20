Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB11C202468
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgFTOs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgFTOsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:20 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB92C06174E;
        Sat, 20 Jun 2020 07:48:19 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f185so11596445wmf.3;
        Sat, 20 Jun 2020 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PSLEOK9fPCw4hWzP+JVNPy4yvTUndH25kPo0XCKTFOs=;
        b=L2MDQZW+LoBYVV+Jw08MZmX0aVHmdOCK6+wvfPeW+mfKVs1Fa4J59aLNI8nl4x9ZeU
         RDd+6J40MwgbvaaD3Op/Yb1VnTTHt814DHZbB4u07+KR+Co7S6f9ivm6cisy5qK+W/c3
         OTuOZGfRB5qSfSRHk4gjvCWPDhlN7mBeYUc/kwYKXF3JmabOfAXnRr1R5i7Ji+dzlz4Q
         PT8U5LRDclMrpOjqoIsRndHk+RaC+2MAxA2NH9TDAL5bk+tgaNej5H4DKlk0wz/WbQfK
         j6F+/fzpcLGik2U7z53r8qbFbqm1Wyqo2I5hXPjJja4/x5wGGjNacBLF5Fjb5nbYnC9O
         TKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PSLEOK9fPCw4hWzP+JVNPy4yvTUndH25kPo0XCKTFOs=;
        b=Tlt8w3pEchmKGt6D5zA9y1yGt241NEBy+gJ8eTOn9TlD5SJKXlLp5eIPlFA9ZTYnNP
         1QARpCkc72JaxhuI9hUin3MzGtL6o9bNcoN3WBaxR+iL0pHH32ZE7caFmgFwMd3HEGlf
         lP93rGjGBMxFY95groRYubf00/YgRa+68W8CStrD8XYmhlboq2VYP0J5cgRePTqOnwMY
         BOxfP1+TKS3UEcm4GA20N6rgKgUb4HfvjP1NSfUvsOPxhMbrTPizEcba+AjhK7VeWkeQ
         LrpXsCrbSQRq47eMEOYBo17BGUvAjGSaWSzABMFnK7CoXqarwtDM7OiRKgoaZhkhPzRu
         abcA==
X-Gm-Message-State: AOAM530ENBi5J/aL0c69Q4DFfaveBYcYJ5r3l7lhRHJZE5FOfNoIIVY3
        PwVtGH9pJ0sWQvp8l1s7eWY=
X-Google-Smtp-Source: ABdhPJw0cCQKipE56GoSUjaEegp9czLgVsWprul1TCDgo9Xlzobxs+x+JKzDuSfVTnjh8Fuqno/MQQ==
X-Received: by 2002:a05:600c:210:: with SMTP id 16mr9626715wmi.185.1592664498431;
        Sat, 20 Jun 2020 07:48:18 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:18 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/21] arm64: dts: qcom: msm8994: Add pmu node
Date:   Sat, 20 Jun 2020 16:46:24 +0200
Message-Id: <20200620144639.335093-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CPU PMU to get perf support for hardware events.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 8853559f755d..adb1ebd15667 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -282,6 +282,11 @@ memory {
 		reg = <0 0 0 0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
 	clocks {
 		xo_board: xo_board {
 			compatible = "fixed-clock";
-- 
2.27.0

