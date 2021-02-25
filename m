Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CD432559E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 19:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhBYSg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 13:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbhBYSea (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 13:34:30 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A53EC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:33:49 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id h4so4338782pgf.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 10:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hbzI6fdWGKlpcX3m5xnv8gjEnUTy4qQ9fPW3EbzDqxY=;
        b=SQLrxsFk9ckN3zW4wZSc08SFRP8cwgoLgjqjUAjNmoCehcPjUXM+N7VyVmkdCdwmX9
         +VjRViVLyyC662GjT+QQloPmUvqR5qYt9pDvjFdw2YB6teRjnhpfWn64lzjc2nBxPkj5
         22XSKvP/3X1oTEo9TzEnHULHDKNJBx17QTcso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hbzI6fdWGKlpcX3m5xnv8gjEnUTy4qQ9fPW3EbzDqxY=;
        b=D5NuMTh+If+4NvxQGJsbbKlvcAbczxdkRW95k+J65tVfHYyf7jpnCW5I1xrCXzgYp3
         afLWW4cx78f2PpS1oFhWWh2fAqOH230rUE3kk33CboQpWQvZnrD5CTRAhKvRljB1huRX
         ZUXA+0GIcFXQAxkbKg9aGr2Re8SFkOw6jJVwOTToG7aRSsQspg82uVHW1AxrMvss3Yn9
         71f7IXjUD1iDHz7QInpHsdbMgym0zs0evjKt2pVTVMrxX7GWlmrFzDJlEaaOXy/at2an
         oE9hyb1c1fyyjOcU+8HRfckxfya83AQhCD1HHGu6WyRh4FrcYsZ5noNTyEaRd1iY9d2s
         /Bkg==
X-Gm-Message-State: AOAM530U78Meg2Ay2zYHNtzLsrJHzslACyqt9y95Ezpg71rdsc0gpyRD
        cW3Om+0hC57wibZ1uxvmMF2GUA==
X-Google-Smtp-Source: ABdhPJwtVh136lgM0X9csLv5NUApWFhnsNXK8mNRlm8j5H8xDibaKO/deAYvHrFWFfTduSB63RTtJg==
X-Received: by 2002:a65:6208:: with SMTP id d8mr4122392pgv.365.1614278029238;
        Thu, 25 Feb 2021 10:33:49 -0800 (PST)
Received: from localhost ([2620:15c:202:1:1d8:8d0c:f75e:edd8])
        by smtp.gmail.com with UTF8SMTPSA id w202sm7243812pff.198.2021.02.25.10.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 10:33:48 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Antony Wang <antony_wang@compal.corp-partner.google.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc7180: trogdor: Fix trip point config of charger thermal zone
Date:   Thu, 25 Feb 2021 10:33:36 -0800
Message-Id: <20210225103330.v2.3.Ife7768b6b4765026c9d233ad4982da0e365ddbca@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The trip point configuration of the charger thermal zone for trogdor
is missing a node for the critical trip point. Add the missing node.

Fixes: bb06eb3607e9 ("arm64: qcom: sc7180: trogdor: Add ADC nodes and thermal zone for charger thermistor")
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- patch added to the series

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bda983da4eaf..ab4efaece5cb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -22,9 +22,11 @@ charger_thermal: charger-thermal {
 			thermal-sensors = <&pm6150_adc_tm 1>;
 
 			trips {
-				temperature = <125000>;
-				hysteresis = <1000>;
-				type = "critical";
+				charger-crit {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
 			};
 		};
 	};
-- 
2.30.0.617.g56c4b15f3c-goog

