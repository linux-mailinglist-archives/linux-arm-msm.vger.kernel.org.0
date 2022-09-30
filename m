Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ADD5F11F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbiI3Swz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbiI3Swu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDC81664A0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu25so8204970lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=t/NnnfqBHaJZLOludhzFIyW8QboELKFgUklC80p7EPk=;
        b=dYzBDQxdaCAT+R9ycLKedX5J/G2A/BzPwk2ZprZqUPu4rGj3hADS3MrdQUCwA3oAUY
         ZKaaIRuOOj049gUaz1e6cJ9Ge2NyDImoNnc+rHXgSLWd5MTkeoXorpY8tumsoloRwrnB
         P8FQSMFnruu3r7NU1tvf4H+1VWhi/ilTb69cIn7ZrS9LX4xX2qbKhnX0l7hkf66ix+mB
         MqADVGXuuQfA12vSDTBuoDOkNCxrN8sDaan8Mo9S4bSI/Np1HCjs8zvfj7td6i1isuIW
         BwOkQeae9kcHqhBimZfNEI2549t2IZf/cHAj9h5UKf0XVeEolsafzxUlhghgHTlw6Aqr
         s2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=t/NnnfqBHaJZLOludhzFIyW8QboELKFgUklC80p7EPk=;
        b=q/ClTssz2P8BHXOGcVxCvmLYUD4bJZELBHoDx/BwnT5nEfI/ycEeCgux+nyE9nHfx0
         mased6Kvm2KuLw2d8fKueOEgQ9LF1q2VEyqxkN65cHtNQko0NPD8Ca4IfYD9fkMSXnph
         lmpO4tdUFZw5Rd0iK8xobdAnqkJXxWQ695HFxOFQUKB1f2almLZxnwchJmR/r/1FLmGP
         ezE6rMX6i16q8/Z4oBmX5is+y6tnU8Rqz8wgxFK+HpSGHR5WAZFn+zTkOhXZzGuzhpYV
         DmAgMNFx5TVI008qnPOTseT49jkjZtFbcJEl89NsRyZW+OZ7eNjU3eE8wzolYqq9KYgK
         MS6Q==
X-Gm-Message-State: ACrzQf1/yhlQ0oLCRsEHU/kZvrAfqpPW+tycctv8aq/guo8XWTyo8q8K
        vYSKz8mH5UyzkiPd4QURCloeCA==
X-Google-Smtp-Source: AMsMyM7HzXRaxcV3OYOJijVRZAKV55q/1wTbXCC9Kg9Caq0Ysh9dqrXF80ZpKq+MQggzQVxisFmQsA==
X-Received: by 2002:a05:6512:1320:b0:488:8fcc:e196 with SMTP id x32-20020a056512132000b004888fcce196mr3662943lfu.602.1664563968588;
        Fri, 30 Sep 2022 11:52:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 15/23] ARM: dts: qcom: apq8064: fix the riva-pil node id
Date:   Fri, 30 Sep 2022 21:52:28 +0300
Message-Id: <20220930185236.867655-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the address of the riva-pil node. The first region address is
0x3200800, so the node should also be called riva-pil@3200800.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index be4c82945c53..66f1e504a08e 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1549,7 +1549,7 @@ mdp_dtv_out: endpoint {
 			};
 		};
 
-		riva: riva-pil@3204000 {
+		riva: riva-pil@3200800 {
 			compatible = "qcom,riva-pil";
 
 			reg = <0x03200800 0x1000>, <0x03202000 0x2000>, <0x03204000 0x100>;
-- 
2.35.1

