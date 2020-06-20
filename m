Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7F020244A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgFTOsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbgFTOsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:06 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EB5C06174E;
        Sat, 20 Jun 2020 07:48:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l17so10931262wmj.0;
        Sat, 20 Jun 2020 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RMSbSuPDYle0hPO5pRObuFd24351jq5UK1wb/kNZFCU=;
        b=kxaFFEHAQaCLAj1xX31Vmd+QAbwNCKDkb02CcTLIvDFm5xzCs3y6z1sVEc+NcbJ1C1
         AM7dnQ7pVmwXOGcHdbcgjypeN+B/QMFAhWOAPtu0iKDsVNxfZLaFISLvcVLPwiBShk8D
         d3mscXj4/NDEAaqi4nJvnGRF/iL1MUiReeHI6oY7zwwWItTJYpdLfsENM8pob4DPoQ6m
         9jzLWehD/sIwib0qHOgWE+yePHch+9uCGK5avUF+e8UAWKP9uhmeYkW3j5tI5g5C1Pvz
         ZyZLkT6eTvZO9ComQUVH4Bj/ODqag7ngug9Ytu4AI84GcfU6Sr2FoCDWsiA4NSBvmh75
         kTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RMSbSuPDYle0hPO5pRObuFd24351jq5UK1wb/kNZFCU=;
        b=LZBngsZ9pFNjeIiYPBJTaDWXj5EgEQjaGDif2EeEtPtRqtbWZdlwqoo+kJ8THIfN72
         gQLQZk7KQjyiiEWZ6mC9sainWBW1Wcx8pWDCNfFGRmXta15DwmXLYSMeXdaVzA8KXF9g
         Aj+O9JRfOqI06VX2Hn3b2u++LQrxmbk1Wm0l1mAiw0e+yVzSB9QJFTMmbcIYkYPZ/+e6
         4s4H3NvMUTwnodeOuP5wjXnVK8UH/eVmFGRXgx+ufHWQi98aadUcEIxtCFE3NkjEzock
         a3vSQ2JKmfO7RW0E4Oa26tuoOVxknO45hQdXLkLILTagTeUaxjCV+Geu3E3q6sDJNCor
         mn0w==
X-Gm-Message-State: AOAM530kNf5rOAAfyVAswwhZDEqKpC6hcrDrzx5QYdC6qg9tOOChHOVd
        U+TSL9jfrxw2iNwsNgYChGk=
X-Google-Smtp-Source: ABdhPJxGBwbjboJ2zmhN5MWlTuZ6BkqZ4Ej8Mb9widNoYKH4A6k910g1I8GYH3m205cfhg4j3IkPrA==
X-Received: by 2002:a1c:ab04:: with SMTP id u4mr9581221wme.52.1592664484879;
        Sat, 20 Jun 2020 07:48:04 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:04 -0700 (PDT)
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
Subject: [PATCH 04/21] arm64: dts: qcom: msm8994: Wrap clock nodes into clocks {}
Date:   Sat, 20 Jun 2020 16:46:20 +0200
Message-Id: <20200620144639.335093-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Wrap xo_board and sleep_clk into clocks {} to follow the
style used in other device trees.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index ebb6a0630604..0e8cf7e3dd85 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -277,16 +277,18 @@ memory {
 		reg = <0 0 0 0>;
 	};
 
-	xo_board: xo_board {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <19200000>;
-	};
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
 
-	sleep_clk: sleep_clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
 
 	reserved-memory {
-- 
2.27.0

