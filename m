Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DDE207654
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404096AbgFXPBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404074AbgFXPBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:32 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFBEC061573;
        Wed, 24 Jun 2020 08:01:31 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 22so2638008wmg.1;
        Wed, 24 Jun 2020 08:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HV/zrw1VIDqhLaj55kCUqB97nJTQbmO5R20u1p1Ftgc=;
        b=cpbMK7h1xPtR45xMiu4FUHsqLxgUajhKT9kCeXE8vMO5uoWF8CpOrsV8jzAEqA/UMo
         De7zcdl64hz6EPLvfqlsKhDnE4TddY9HAZCwuEiR9I0Xgkbj+cW4UttZYiuwFuBaC0XM
         KNJ1L1cuG2FH6WvQT+927bJey5KU8XVE27ZoefWSDKvGHB+d6JolCdWO9Tc+GWacCofA
         ZooZnQvlmEhOPMzI0kWQQGxyXh2qzlNx7JW5xPVQRebJdT5LmkzBsQg6heexcAt3sslQ
         0oNOpzIhWhnsKw0FNuy1wgh8VHXPrk1GeHsSMSOwwRr28POqNDNh0WtQk3b+Dkgx+Lz7
         oUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HV/zrw1VIDqhLaj55kCUqB97nJTQbmO5R20u1p1Ftgc=;
        b=RKyBf2v4WfjxhV0CxKt2n8RxIlqQ+wAm/Zzdmtwi/FZAtcgsmkFf68ONSqG2jM3gtn
         mbcY94N+UVR27aSQzk46Y4qjIOGCgmpElEEvbLRgA/nVBzLMZj/9z0vh1pLIiR34WbjK
         ufwn6Lc8lNmW5indDNLe1JOs9ISG433+o13gPa9wwcYBVrnnrB529ekkMsJfVcwQYrzh
         2mLFPjSi4Fo4qvIFasLjnLUObLgMQH+hdpTloFm9UkHwI2LgY/OuSqeelBb32dahs3J4
         qk2991WDn05uHq+Fbw1i4tZUhvv2tNH3dYDRyK5c0ICoRkItQRqcgjRU79xrkC70RlSv
         AahQ==
X-Gm-Message-State: AOAM532RxEQ6Mv1ghK/cWGL3NdFbGV9ZPSAAO8GZgvP1UbY6CgRbDVg6
        S+FrLEARVSNgd8aGEqd0PkA=
X-Google-Smtp-Source: ABdhPJwsCZyprGeHTg35mbi00uDojA8yyQSajXvRH+O/tzzkvSYSIZoXwYuRGnMHuY7/bT+ncI1ZLw==
X-Received: by 2002:a1c:2157:: with SMTP id h84mr28749399wmh.35.1593010890220;
        Wed, 24 Jun 2020 08:01:30 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:29 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] arm64: dts: qcom: msm8992: Remove regulators from SoC DTSI
Date:   Wed, 24 Jun 2020 17:01:02 +0200
Message-Id: <20200624150107.76234-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is now considered obsolete practice.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 46 ---------------------------
 1 file changed, 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 8e5a3ae79997..d41ba1ef687a 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -261,52 +261,6 @@ rpm {
 			rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8994";
 				qcom,smd-channels = "rpm_requests";
-
-				pm8994-regulators {
-					compatible = "qcom,rpm-pm8994-regulators";
-
-					pm8994_s1: s1 {};
-					pm8994_s2: s2 {};
-					pm8994_s3: s3 {};
-					pm8994_s4: s4 {};
-					pm8994_s5: s5 {};
-					pm8994_s6: s6 {};
-					pm8994_s7: s7 {};
-
-					pm8994_l1: l1 {};
-					pm8994_l2: l2 {};
-					pm8994_l3: l3 {};
-					pm8994_l4: l4 {};
-					pm8994_l6: l6 {};
-					pm8994_l8: l8 {};
-					pm8994_l9: l9 {};
-					pm8994_l10: l10 {};
-					pm8994_l11: l11 {};
-					pm8994_l12: l12 {};
-					pm8994_l13: l13 {};
-					pm8994_l14: l14 {};
-					pm8994_l15: l15 {};
-					pm8994_l16: l16 {};
-					pm8994_l17: l17 {};
-					pm8994_l18: l18 {};
-					pm8994_l19: l19 {};
-					pm8994_l20: l20 {};
-					pm8994_l21: l21 {};
-					pm8994_l22: l22 {};
-					pm8994_l23: l23 {};
-					pm8994_l24: l24 {};
-					pm8994_l25: l25 {};
-					pm8994_l26: l26 {};
-					pm8994_l27: l27 {};
-					pm8994_l28: l28 {};
-					pm8994_l29: l29 {};
-					pm8994_l30: l30 {};
-					pm8994_l31: l31 {};
-					pm8994_l32: l32 {};
-
-					pm8994_lvs1: lvs1 {};
-					pm8994_lvs2: lvs2 {};
-				};
 			};
 		};
 	};
-- 
2.27.0

