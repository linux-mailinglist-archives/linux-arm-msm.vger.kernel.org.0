Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4320C1D0406
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 02:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732110AbgEMAzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 20:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732119AbgEMAzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 20:55:37 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1174C05BD09
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 17:55:35 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v63so7225041pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 17:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8wwa3jMzBsVMJhoFoeC5HT1Ng/t6lRTgcx0Z6MLydpE=;
        b=LJOeK6k167T0qHY/gHMk23W6JRgArf4RIgYDYeFgTsfbhyZqu+osvBhNLNcuVPjbKy
         PG/guFzPEwywB449YFQpC9DO6jCJtzM0O7yOGK/mIVmS4ECi4TtLmxARO6QqV3fnEM//
         Jel0ZKNx+9d6UXfedIsiPRzPC9phkUE+gKTkBAO++xhgPvoBwVSljFo/pYjYqRdJPSFB
         jj8H+/dCw5hsa8VYYbe/fiGFxSjwh82/FyOh+nhoezLFEdezhwbpQ7z107Bjc4EAdfjQ
         7l6TTbXKLuAKvoj6j3d9vpQ1z4qM7Jf08DmfIaCwEY8uyE3GxHBTKO+mBCQY9MeZcTTm
         WodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8wwa3jMzBsVMJhoFoeC5HT1Ng/t6lRTgcx0Z6MLydpE=;
        b=SDgoXZGgPRuefowP5VV+sx20o+I0cVAIVH1VECjMdtNk4uKshTrp3NTc/WrlTMTthn
         pENOy/hXUZ1ZhK71V7ryDpCblpNudlrBUaUSurwnIYSb8nUWMHrAMW2IQQV40XeW78H3
         CBGHAwsyDtDxZ4TElBfGAPzP37NaLCpbdgOlQ0OGJy6RX7RtU/wPjarONKNN42d/Jg58
         p5hcoLQoEuLnskaRFoKMMKPlzrj03HuWODluIQIwQbGAWNclYT0lI9PGaZbr/OrnR0wE
         RiJB3tqrSARyNKwHmmmt+sbRAjdqHYf+5s7XDgWcIKvzRKlxLZd5xPA4xCIIJR9ExyT5
         ts6w==
X-Gm-Message-State: AGi0PubpedDQOYYc821W1LhIMn9VCeaOWleQJWAebHNe7unKyIUEa33M
        BnEyy8noq3dnes2Hty4gotxTRg==
X-Google-Smtp-Source: APiQypK8A9XkNcELLFq9SHtAPbnP58OXlvL1We6HYrbyzS93bOuj6d8WCwO3j1pBijtX2cVIhuXkqA==
X-Received: by 2002:a62:c1c4:: with SMTP id i187mr24691197pfg.319.1589331335353;
        Tue, 12 May 2020 17:55:35 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:34 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon
Date:   Tue, 12 May 2020 17:54:41 -0700
Message-Id: <20200513005441.1102586-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we don't need the intermediate syscon to represent the TCSR
mutexes, update the dts to describe the TCSR mutex directly.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index ecbcf725fba2..6e28754705b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -146,12 +146,6 @@ scm: scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -569,9 +563,10 @@ rpmhpd_opp_turbo_l1: opp10 {
 			};
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
 		};
 
 		slpi: remoteproc@5c00000 {
-- 
2.26.2

