Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF21B72E3D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 15:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239706AbjFMNM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 09:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239618AbjFMNM2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 09:12:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567661AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 06:12:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso6692852e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686661945; x=1689253945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k/N6ziEjETs/fA7A5T0shJEBkxu3UxAJaNYSJhcIRdk=;
        b=Rnr9xXP6tWFVZ13rAvJcc+XId0TzN8T3+DZv01LLIUh3OMYyYgTfJ7+Y6tm8MkBGYq
         mSBuAZeJSg9//qB0DR37PR+xPwiRwhzPDDa6JGdRNuwMf9ZDHEIhdRqlak+/hUE4oe9i
         kaSmbucaA/3CcHzC2IHnAckEuDQh945cWSwjo6R35MTOaxTqLcWAABNJb51XEpF3Wh+q
         LseH0C1eCY/Pc8z+fSq8epEp8WJQK2V7CLWMLccLch1l7HnGo11KhcpoNraIqy6VL2mH
         uSg3liLwPOYPz4HPObDROhqSkI5csW8/yD9wPcqeU7HFiLm04NlW7oXY/SV21EY4t1Ga
         aScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686661945; x=1689253945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/N6ziEjETs/fA7A5T0shJEBkxu3UxAJaNYSJhcIRdk=;
        b=IYLetDxitKObeMo55LilRBmckwP+FEnxLJSxVq2oJCSqZ9faVsQ+Djj/92cG4JlX4v
         0X+fQR0k9wJ8nJtKAXhfc1HRPFLjMXg3Tas7G8e5FYE1w8ZaDJcj86wAl+uznzWcA3xw
         pHug6i1ip2Hl8uaOfG2tUN5Mnd3hAPZeGzBGO6YUHn7C3fO04W6JQo6L2JzrwO27g5jG
         rP0oNsZ5RksfLGy6T59gMsBix3THW3ptBmrh2n/2EQnBbSIZUjRr7Z80TOtVvR/FV9L1
         2wcAsjYUDLisRM7O9oCY/LbArHiz2tctICZROBMvxVRj6OOzKMajbGOerQi+gLRbnvQj
         fcog==
X-Gm-Message-State: AC+VfDz5EhfM7k+8qCTwZuFsMhskPqRXwOXHjKohQSb/MAtBStdddntl
        s6NccWjaSmsPNSzuscjXlnctpQ==
X-Google-Smtp-Source: ACHHUZ5+v5EwRhrZ0XK/8Cw0plZo+xn7TooyTR5j71eo5SqtVKlLqb2v9snjgvKPicowoJfCNmPFHQ==
X-Received: by 2002:a19:8c14:0:b0:4f6:1e9c:cb1f with SMTP id o20-20020a198c14000000b004f61e9ccb1fmr5890581lfd.16.1686661945599;
        Tue, 13 Jun 2023 06:12:25 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id w15-20020a19c50f000000b004f62229b6c9sm1766166lfe.89.2023.06.13.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 06:12:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
Date:   Tue, 13 Jun 2023 16:12:24 +0300
Message-Id: <20230613131224.666668-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 3a786086c6f8 ("arm64: dts: qcom: Add missing "-thermal"
suffix for thermal zones") renamed the thermal zone in the pm8150l.dtsi
file to comply with the schema. However this resulted in a clash with
the RB5 board file, which already contained the pm8150l-thermal zone for
the on-board sensor. This resulted in the board file definition
overriding the thermal zone defined in the PMIC include file (and thus
the on-die PMIC temp alarm was not probing at all).

Rename the thermal zone in qcom/qrb5165-rb5.dts to remove this override.

Fixes: 3a786086c6f8 ("arm64: dts: qcom: Add missing "-thermal" suffix for thermal zones")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index dd924331b0ee..ec066a89436a 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -121,7 +121,7 @@ active-config0 {
 			};
 		};
 
-		pm8150l-thermal {
+		pm8150l-pcb-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&pm8150l_adc_tm 1>;
-- 
2.39.2

