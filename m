Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B231920A4CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406098AbgFYSW3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403945AbgFYSVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:21:47 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52988C08C5C1;
        Thu, 25 Jun 2020 11:21:47 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i14so6873863ejr.9;
        Thu, 25 Jun 2020 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/mdCv9AcSwvn1xJCdZahbAIWOnw7ZszwaJLHBjtLMCw=;
        b=Af1xT4Qf6hLDQ2AgmF7osik0DEYmwWAom3u4Kbop7IBcRZ2bWKpdKnl9vxPIaTIA9A
         jAhgfL/iF4HjPa/4PrHq33hUSIj1462tPvQB2WQ3x2dv/0iwx38C+dgdHLTGf4AoDQ40
         G2/jZdPODI/+ZaKEhNURAq9Zbk+0uhyk+H9xxO5enxnaSi3xImerXv8TcJ+K9ifC9Lk5
         3QMP6D4WpXn/H9TMCp8tk6uxwxYoEDPYpxE1NxqFT6Mz4EyUC86mz0LqGaVVTFNk4tiL
         O5BC/XSHVcC1TzyaWqISdQ0ooNCdRxQUMzMoUhXm4zDlO3YIx0bGMwcBGIztch0mUwUZ
         69Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/mdCv9AcSwvn1xJCdZahbAIWOnw7ZszwaJLHBjtLMCw=;
        b=jYcUPfUXHdcdh1pTKlh54WHOSadePTJch9yLWQPaMRnOgk1Ag3pBgO3joZr9xPVQZH
         wfDfqfyD6/j7ICYYW3La5C+ne9+nYa7bWRRsY2DTBLN4xA7h0wWsA47N+ArFpmUw+wEQ
         s+kymbXWkkaG3zuHGEKh6V6BJXcn8acIZce9c5qstPGKpOnZFI4l1WrnPRDEq8eNoU8B
         rujGgWJmMstUdB7AaJiYSfD5GKkw+Kv/Cmt0GXsWRCWFxRWeafCLGnZ6auZ4yhdbieJu
         TDP2vRkdWbzV6Ia5qRis1Vv7nDvn1H8MU9i1SjuvTZgd0DQ+oBbfv6UPiMleOhR+o70n
         yjxg==
X-Gm-Message-State: AOAM5320Hfm0+LcmiIdWpOr4THXSXSO+5MA4a3bShDers0vlkAL8z7k0
        fbusbHiIsyGBtBgYvCM6Eno=
X-Google-Smtp-Source: ABdhPJy/BAxoS9EjNANTEX6luCA/gG/qgl1OOiKq0JaUAR0A8m5qcHrB6p+S+RbidIPgwyLIlGOKnA==
X-Received: by 2002:a17:906:eb93:: with SMTP id mh19mr7177128ejb.552.1593109306103;
        Thu, 25 Jun 2020 11:21:46 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id lm22sm1523448ejb.109.2020.06.25.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:21:45 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/13] arm64: dts: qcom: msm8992: Add PMU node
Date:   Thu, 25 Jun 2020 20:21:13 +0200
Message-Id: <20200625182118.131476-10-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625182118.131476-1-konradybcio@gmail.com>
References: <20200625182118.131476-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PMU so we can get proper perf event support on this SoC.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index e8b801813f14..c4c9a108ae1e 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -130,6 +130,11 @@ memory {
 		reg = <0 0 0 0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4)| IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.27.0

