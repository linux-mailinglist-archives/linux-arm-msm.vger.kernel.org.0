Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2587B194F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjI1LEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjI1LDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:55 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA94CC8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so20483581e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899009; x=1696503809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=O83me/Rx/ptyJnmCGEsA+Ld0Bauv0t0I4f/Trak8oWl3XRAty3ooyopaEpyL9hXWue
         sM9OnUImb4lSSc6dtuwjpW7BG45moARyel7Nn39XvPg9+KqjD2Mq5PhPo8XIVMe3wTZr
         kGpHuwyGWCb0XKgzR/SRDX3Ygt7ikyhbBWFL0eRue8KZlbi+CG/BCjD62qOascxYarLC
         FrTtrNkQMUe0JY0FBROD1iSiWSlALEjIylkXa8dyyRwVIXycSH0YpUStUw2cZ6HtEIyB
         CjEbXitjx7Ohen1vqVwgkxOnAi84N4E8jdLSL4WaRokblmg4oeKgeyHo489Qy0pzURId
         gKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899009; x=1696503809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n4FHogtkUWW0lhbbvCjrAu0cEo2A7+C+ewNBfn30Hw=;
        b=AXWZXZdFcBXoysogxRv18QQxxeASk82d2OIMqpNez53HYzWNmlxX7jEkBp/6ImtLOo
         NAaZ4cel6pJcV088t5S9wQoVwM1mw2F1N6jpYvT4NsDWm/h7uO1z05aWA0DKX4bHuOTa
         FMwytsQXKmM0mu3741YgAASz7w+wsML5kjMq2k5Q5VR+oEHfRIAqo1FbDp5fjsvsW2bL
         ZrkffWPIhiNaQJrkRLBxUnSfdZEpEZB5QPRjpuZxZK5saBP9JYttw6OO0ai9lHo/v+cD
         li3XG7wXuPBQo9UNtCj646/IeocXDTfILd7ofov9azx7/Z1IUy7HNbJacx6OPMLjfaVQ
         Tusg==
X-Gm-Message-State: AOJu0YydkasYLZs3Rwp44YLSDtvt44xhChtI/mo2XrU1/CUBhfRFUEjO
        gLAjs+6J3DgnpXSaCXsBsQkJlg==
X-Google-Smtp-Source: AGHT+IGOAv4PSOr7sNgvwgm0egz8nrxlsNUAuQ3OUikUrKLJeaRXaJlydrIp+FFXyF1EA6FmDyC4rw==
X-Received: by 2002:a05:6512:1289:b0:502:acf2:88df with SMTP id u9-20020a056512128900b00502acf288dfmr1065993lfs.35.1695899009436;
        Thu, 28 Sep 2023 04:03:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 22/36] ARM: dts: qcom: pm8018: move reg property
Date:   Thu, 28 Sep 2023 14:02:55 +0300
Message-Id: <20230928110309.1212221-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8018.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index c602544900b2..85ab36b6d006 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -27,9 +27,9 @@ pwrkey@1c {
 
 		pm8018_mpps: mpps@50 {
 			compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x50>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&pm8018_mpps 0 0 6>;
@@ -37,9 +37,9 @@ pm8018_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8018>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

