Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82B14775E60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 14:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjHIMEv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 08:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbjHIMEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 08:04:48 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881D6210C
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 05:04:45 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe4b45a336so40616245e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 05:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691582684; x=1692187484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0fuBqRsEBe6l7Deus3bSG6cmQ10e10yJMZB2h8X4jE=;
        b=k6UvkU64QtSCFUHzaY4bBmLxmglN7Y3H9ResDi3f6askrVwcPch3GFbvbrpWtqWVmp
         wYoH2TT8l50Et1+3xnQplOuILusJYHPw/7tCqmuoazf2tdqqpqFSIIlTtZJDThEMTS1s
         dyGZX7MqwpY+iS7gx7RC/7TZT7vPHHiJaPMJ1REdLWzdbHUBeeIa/B4aLmD8SrPKLhI2
         YsxJex1dO3xQhBtq1PZEA0N/uFUjONk0ewltsMh/ipUu4uS9d4AuGO/Kv9ySkkU5WV0H
         Tg3bYjLNA6pPYm1gZJpNHcTtes+qyQv49h+Ku/pXt4gTZnaX8j6GVs4AuvKlzGoKU5w1
         oUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582684; x=1692187484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0fuBqRsEBe6l7Deus3bSG6cmQ10e10yJMZB2h8X4jE=;
        b=OG5nUC9E8GB5rwBBBWwA0l661ykOZsKGyBGaaDxFhuxRN7QgqBUklv8Vlg2MM7N8WK
         XYhkX9XdfJUryCj8ES32EXVX6jpZu4GozoDDKMvapmbQZHvyMs0j2rYtiW2rkMvRX8c+
         0g1jcltZNxDLA/lm4GXdWKOc0N2/DoSpHF3OrkJ14g4AX5SlYNrLNfiO048qiQTWwGeo
         LFDnuTrAf1w2eolg4ST3UvSVrVrqbJ6xxpuCmzQzbchtQ1F0jCo42+8FDXWu3rDcY+N5
         irRy8Hn8WIHOpVwsVcfG6TWuPh8SqilnH4iSC3QgxP7xwwlxdjma55oQnGX8d6aR5dMn
         oHVA==
X-Gm-Message-State: AOJu0YzIdr0R9QsEc+2SiPs9ESLGEXfo6Lj41UWXjMTEyoN3SqFF4u//
        y+NmR+opYPAuEUyABdTSguEngvoqMd+l2CByWew=
X-Google-Smtp-Source: AGHT+IGswcDDwxEq0Zt2hXIoGD7OAzUDkLxXHAePXR3sFYyHwuNWe3LUWYCPBrbOFEN/ut6U7xCHOg==
X-Received: by 2002:a1c:7919:0:b0:3fc:9e:eead with SMTP id l25-20020a1c7919000000b003fc009eeeadmr1896152wme.20.1691582684097;
        Wed, 09 Aug 2023 05:04:44 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b003fe1a96845bsm1808573wmi.2.2023.08.09.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:04:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 6/7] arm64: dts: qcom: apq8016-sbc-d3-camera-mezzanine: Enable the sensor by default
Date:   Wed,  9 Aug 2023 13:04:31 +0100
Message-Id: <20230809120432.1036405-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
References: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With a standalone mezzanine the sensor ought to be enabled by default.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts
index 6155fa92c717f..ca1b584c0029f 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts
@@ -44,9 +44,6 @@ camera_rear@3b {
 		AVDD-supply = <&camera_vdda_2v8>;
 		DVDD-supply = <&camera_vddd_1v5>;
 
-		/* No camera mezzanine by default */
-		status = "disabled";
-
 		port {
 			ov5640_ep: endpoint {
 				data-lanes = <1 2>;
-- 
2.39.2

