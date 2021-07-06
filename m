Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1AB3BC7E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 10:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbhGFIiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 04:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbhGFIiH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 04:38:07 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9F3C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 01:35:29 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id i2-20020a05600c3542b02902058529ea07so1643096wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U29Y6gKeEJ/TOx94H/sMKCVR9hUDyqP/L3iEJdAYqrs=;
        b=CVRjvDnphK8OIOr+WSbxlBLysMoOQmGuvVzSNiA5YpA8aulbXuqSVbxSkKbGIRpzsp
         CNToQ+8lo0wfmYDz/amG0/MENZU/jjJW3QOst3+6s3Etu/A/KXLCFAiQ0P9SPLb/Wo2I
         pGxpEIiujVVLF5WlxRza3BVPsy0NOewsratezVzPprOGTHmazPp4CP25ACyduwsRgYEn
         ikrn7oU7VeLTBD/xgQrcxzUdjyQJ0oTdyqoCBG14AZ6xPUjx0te0Za5dxUdUNJd1bizu
         GrNa3kwits5aTEgz1jTl5haUGWKuIiOVkOZvfhDENXLK7mhIxFGZ5EgqYMo6htRbQ4as
         fouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U29Y6gKeEJ/TOx94H/sMKCVR9hUDyqP/L3iEJdAYqrs=;
        b=Ygak+bFtaEDs/fDW55+GcQSabcG38cRR3avbyEsy5R1SGI1Z/7Ef2BtbIScfnJ9g7j
         cB50Y9mPN1mL3+Qmi1AkHqYmxDx7dmKgSg3EQx30XiZqlKbX7a12I8Qlme/JWhFc+oXK
         wtDNBbf1Mte3xppRr/N8r3H+PWvYusUeHDgzOLovzLggD6NfxYzdfpOFiSykceFwe/et
         hU3J+0HnzstKecbeX7XPQj3LNHXeJfS9Ht6s7TJ82NLngbmzCyBoGokiObvSh6Ylg2Lw
         /37AQEW9FO4/du9FSkhj9h/YRHiVsEJ4k98V1D1TjML0C6Z919Mw66c5UVQnPfMS33an
         uG7g==
X-Gm-Message-State: AOAM530/tmod1mRzoK3+Jrav/GIfHbzerb5CvTc/iOfk+GwGybBZsFVN
        yLyzSREDk/ad9eqg51BCwgL1VA==
X-Google-Smtp-Source: ABdhPJxEEOBF97iGp273zrFwZLYeKJjeHZ05+Y4nRIhToCETllcGM0uusreYOQChi7yXJghwHWM+EQ==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr19925721wmj.119.1625560527911;
        Tue, 06 Jul 2021 01:35:27 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id r13sm5451111wrt.38.2021.07.06.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 01:35:27 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x
Date:   Tue,  6 Jul 2021 09:35:23 +0100
Message-Id: <20210706083523.10601-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

WSA881x powerdown pin is connected to GPIO1, GPIO2 not GPIO2 and GPIO3,
so correct this. This was working so far due to a shift bug in gpio driver,
however once that is fixed this will stop working, so fix this!

For some reason we forgot to add this dts change in last merge cycle so
currently audio is broken in 5.13 as the gpio driver fix already landed
in 5.13.

Reported-by: Shawn Guo <shawnguo@kernel.org>
Fixes: 45021d35fcb2 ("arm64: dts: qcom: c630: Enable audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 140db2d5ba31..cf01d3f2ed8a 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -698,7 +698,7 @@
 		left_spkr: wsa8810-left{
 			compatible = "sdw10217211000";
 			reg = <0 3>;
-			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_HIGH>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrLeft";
 			#sound-dai-cells = <0>;
@@ -706,7 +706,7 @@
 
 		right_spkr: wsa8810-right{
 			compatible = "sdw10217211000";
-			powerdown-gpios = <&wcdgpio 3 GPIO_ACTIVE_HIGH>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
 			reg = <0 4>;
 			#thermal-sensor-cells = <0>;
 			sound-name-prefix = "SpkrRight";
-- 
2.21.0

