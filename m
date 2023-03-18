Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89606BF9F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjCRMTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjCRMTE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:19:04 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809D1497E6
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:54 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so6508774wmb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgA98XC3+FaAuBf1Y62S9Q5BYrBoyKlV/w/a14kqW24=;
        b=egLfsGGvHt5vqbzk5EqmPySkNGvbU83a8IHyO/W+3xl00OXBpJKowkWsKjiEaq8ZJv
         C6nACGh+D07OFEyGFWtAHfh4G0iBonfrbn5SLjIqxqpdT/7SxNlmMHRA1zNpdxjEwUeb
         8uBk2zwGoHkleBQN7rIsiHW1WYFKZUoPg6DoRWp/blRxnWSlX6Tm0QvwZ2Z3sD570Yxn
         2iQkYZuQhCC0rPA4zx+3LRGe+J6nRG1WB8Hx0JKQ41F5YE6j9UiSmQWKmqjrN9ar3fjl
         ple6tonAzOnKAB8sTuRE5WGrWOABtsaCLWVkDuLa0E09A26V+oFWKmO39BrK7YYHCz10
         E+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgA98XC3+FaAuBf1Y62S9Q5BYrBoyKlV/w/a14kqW24=;
        b=1BlZ0X3F8XDt0phajMYTXj3erKufSwDOaqxIx99bzQXLoykKR/IBxV47M41oZi5Qv7
         +iQGPX9xSlwDT7pJcvK/J+X+eMAwrAohcA+zHSjoxvDQAyl+x5todgGWDveS9xMTe2wa
         pfD+f+5KwTZm11uGrLt2BsLp7yFwH2WcbFw6Grxlfplc9DMV2QodJwGeS3fItSC+7Fun
         4Y4LZTHNh+SE1ciBLhtoeYUQp2gO4HUlVEGauon46WMYc+XPXST8RRwDpXtZe4nrxOpY
         XPtR3ZkncPrpqdVhAtC+Ff6RdrcFr1iYN00FqEPji25M97mgVHmGvfIXiNzCfCjtTKd/
         yofQ==
X-Gm-Message-State: AO0yUKU+bC+5SEVsyKeeQWMLPgbv5wpJBNVzXianEweKC2NJZHGm0ZC9
        PqTNzYBC7vx/ZndCYw0/TCRs5g==
X-Google-Smtp-Source: AK7set/QhTme8pR70cdgmGWDy74Qh2DbF1/mYlGXy114yKruUyE20GEFz+ixmj02EVJSSXnakX3UjA==
X-Received: by 2002:a05:600c:3846:b0:3ea:f883:4ce with SMTP id s6-20020a05600c384600b003eaf88304cemr26206235wmr.20.1679141932658;
        Sat, 18 Mar 2023 05:18:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 17/18] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM usb-role-switching for usb_1
Date:   Sat, 18 Mar 2023 12:18:27 +0000
Message-Id: <20230318121828.739424-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch on usb-role-switching for usb_1 via TCPM. We need to declare
usb-role-switch in &usb_1 and associate with the remote-endpoint in TCPM
which provides the necessary signal.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 965742a5be7ae..43d549d6672e9 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1273,7 +1273,13 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+	port {
+		dwc3_drd_switch: endpoint {
+			remote-endpoint = <&usb3_role>;
+		};
+	};
 };
 
 &usb_1_hsphy {
@@ -1356,6 +1362,12 @@ &pm8150b_vbus {
 
 &tcpm {
 	status = "okay";
+	port {
+		usb3_role: endpoint {
+			remote-endpoint = <&dwc3_drd_switch>;
+		};
+	};
+
 	connector {
 		compatible = "usb-c-connector";
 
-- 
2.39.2

