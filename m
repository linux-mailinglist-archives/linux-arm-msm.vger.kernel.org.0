Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8B3244C4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 17:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgHNPrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 11:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgHNPry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 11:47:54 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73319C061384;
        Fri, 14 Aug 2020 08:47:54 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id c16so10381599ejx.12;
        Fri, 14 Aug 2020 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tSUWel2LD1uzLrzrGMirAq4Y0+/ttrm/EqnWacwxu/Q=;
        b=L2JVY4wn3bmai0Fo5r88GmoNsAL9Gv9NjZPPMwuOvHmR+/Mz+jIiEumfYPWTuQSpWV
         jGEc1zOxWbax8tKIXwOIb5sAO8URKnBKAgFTg4aOrF1t3aLHu88VMfQ9Ixkhu1SBpIai
         NZ0hB2d/9fitUUiMP8N5hvSecTj7o4JKaq0J7YBtBcn+0Tw1xb4pJKAc/3fHih9K8inJ
         9cPtdC70+Sxrvo8gmlCQ+6/v0z/KVd/dhh82jYLsEqIqeCzah3iuRSMt1JXl3F+qXeX3
         av3S9nrOHluDOQcJz0KE32pvSvkilq/sjUV0Lr6cBfHbVyeFnxsHONG5ncP07TODFPe2
         h7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tSUWel2LD1uzLrzrGMirAq4Y0+/ttrm/EqnWacwxu/Q=;
        b=PwtFh9UzJntwDDrf2B39C7gCcBnGGOsC4mw9oEkifGqP//r876d+XKGTlqanQoqrsl
         b6mTbG9s12Oo2w9IzEzdcVZ/nIFQOmKvi2+SzhmVdO6lvv2uGgA6pdWnb6J5V5VMzIei
         jYjLY28UazH1kcbfFqvnVXCeLhrMm87qKy7MSGsXKygEpnh4DUvRRCX5vo5ooZyxfQ7f
         kCiWcOhMc14IEojM4rA3dOldkzwRNwYnq7b97IBVM7XQDhoh340Znht/aOu1jrPM8j7W
         txtZWR7TNtNGsH7/mSsz33YJoSwcQminb690+c6uvjFZ63Cngroe1k7K6ZU7E9okcm6p
         1kGA==
X-Gm-Message-State: AOAM533ChTMjVs2a0oUJ/NEr8+5iDN3mhH1dGMHi15jcctmLVjNBhdMG
        fEWnHS+GmmjWTHh2PCJe7rI=
X-Google-Smtp-Source: ABdhPJzXH4+elQwzA7ASy8tfMldGnQqYaAIS+EFDQon3MKoIMj9ZM/a7kqtFnkn7XBY7aRsAcwcM2Q==
X-Received: by 2002:a17:907:7287:: with SMTP id dt7mr2913733ejc.224.1597420073067;
        Fri, 14 Aug 2020 08:47:53 -0700 (PDT)
Received: from localhost.localdomain (abag79.neoplus.adsl.tpnet.pl. [83.6.170.79])
        by smtp.googlemail.com with ESMTPSA id lc10sm6998252ejb.22.2020.08.14.08.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 08:47:52 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: kitakami: Temporarily disable SDHCI1
Date:   Fri, 14 Aug 2020 17:47:49 +0200
Message-Id: <20200814154749.257837-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is an issue with Kitakami eMMCs dying when a quirk
isn't addressed. Until that happens, disable it.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
This supersides my previous "mmc: host: msm: Add optional full power cycle property."
series in which I incorrectly addressed the issue NOT solving the cause.

 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 30cb3aa7d734..5496590dee33 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -428,7 +428,12 @@ pmi8994_bby: boost-bypass {
 };
 
 &sdhc1 {
-	status = "okay";
+	/* There is an issue with the eMMC causing permanent
+	 * damage to the card if a quirk isn't addressed.
+	 * Until it's fixed, disable the MMC so as not to brick
+	 * devices.
+	 */
+	status = "disabled";
 
 	/* Downstream pushes 2.95V to the sdhci device,
 	 * but upstream driver REALLY wants to make vmmc 1.8v
-- 
2.28.0

