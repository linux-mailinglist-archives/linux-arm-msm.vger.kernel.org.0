Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 765CA51AFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 22:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245148AbiEDU4H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 16:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbiEDU4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 16:56:07 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2642651319
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 13:52:29 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id r1so2423287oie.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 13:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=64pNyWcA3OZD47OFBCx63tFfb3O6MICh1sM7rQq4QOY=;
        b=T2za65o+UNyKokMAhXWl6vJhPzWM97thHDyc4ha0YV5i42ZT0x/HEoeXGYuH7sc4uu
         o42fItSQwmrK0rTJja66L7VB55fsFKcxQ3JEPtw/uEoKcuZrjsoMinMJ/gGHLv6aUZIi
         Cm8R0AVZeKteMuvn3gnvzzej5mjtWZmGHm+ae/pXEC8Xhe1/SJZ3Gqu/I05uJk13q1Of
         mppc9b9JWl8fiAKHkMV69T0NRBxw6RUh7tgF0n0gtf58i2HH2W92sRG79vWwqSyrw9X1
         QeKAn8wo54z3hbDZyvGxVcipTKeRHFMUSgZw+w/ug2mpVMI8mZ9ftq4NU+JJxYsXRTZJ
         co+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=64pNyWcA3OZD47OFBCx63tFfb3O6MICh1sM7rQq4QOY=;
        b=0f2ShkSgPlw9uo6gvyBy7fTztvRYLEWqwzXeqQhvsNkR1X0gLoBSlodD4RiKWXBg/x
         qECR+MaO88tXtPqnMMkxgcLW9a/hMicF2BkPW/dsSHZt+1PVDg3//zknYRio7HDPlU8P
         eKsIJg2YebO2OYYzCQ4utElq8kZtO0cLbFkxcr2r3wLViaNIyIw3pmkrRN/HRisdYhYX
         zLkE/jJd5A3TqcUVIGw/GlynAd97gdgQwI2e7XCwqnsmraGqFZMx9BwjKevfmP2cJV05
         D5WMwaOf5Ql7Nyp7MO9e7weg8O63k7wrhMzpoF/fV+5EpPOEzmxcTD1CohxzBxKk2n87
         uymw==
X-Gm-Message-State: AOAM530Nr1BJNRddWB8Z3PbnPhKjcysoCJEKCSIpAPD1ShxyrjzHrZek
        olqLQrcLIFYtZeyX0Od0ZTDDLw==
X-Google-Smtp-Source: ABdhPJwCw+i8KO3RG8kYBjNvvrAgZMnF5jigYFLSSnuBg6j7wt7vPBghhcJRxFtChGr9PhJ177SYDQ==
X-Received: by 2002:a05:6808:2105:b0:326:3589:f7d0 with SMTP id r5-20020a056808210500b003263589f7d0mr693134oiw.45.1651697548458;
        Wed, 04 May 2022 13:52:28 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q23-20020a05683031b700b0060603221234sm5520468ots.4.2022.05.04.13.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 13:52:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH 1/2] ARM: dts: qcom: Add LPG node to pm8941
Date:   Wed,  4 May 2022 13:54:10 -0700
Message-Id: <20220504205411.1510667-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8941 contains 8 LPG channels, as well as TRILED and LUT blocks.
Add a node for these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index cdd2bdb77b32..7881a071b372 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -144,6 +144,15 @@ pm8941_1: pm8941@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8941_lpg: lpg {
+			compatible = "qcom,pm8941-lpg";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		pm8941_wled: wled@d800 {
 			compatible = "qcom,pm8941-wled";
 			reg = <0xd800>;
-- 
2.35.1

