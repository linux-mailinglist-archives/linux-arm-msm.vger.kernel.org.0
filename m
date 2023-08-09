Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDAE775E5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 14:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjHIMEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 08:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjHIMEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 08:04:39 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BA61982
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 05:04:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so56612285e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691582677; x=1692187477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ii80EE7pa0mhgMQ0s5xe4195LlHu5IHrEtcB3OBraLk=;
        b=BiQRm6QArOt0reA0XzmNOrqDq54h8G/aseka0XWXgzwpSmPA1oUSMjgN0/uGnKnO4E
         j1ssv6TlN4OmhP0QJ2FhraFta2kpehRPgbQRq1VdA/J5seN8HiZ2ea5BpDEX6SN427nC
         72+g2J43mYKQNotZuShuG8x/LmtW+o91kYHr4+2/AOKh1fnel/5SECLq9r64TaQuxmoU
         iKNknvjqa769930fTyXb9UMAVEm/QyWsTT08Hdo/kFMB5oMArfXBktNIHnZhhuuGyzlQ
         n+tjDafiW7p85wN8yYlyYh1fe8mu5Qcbxsc5NT/3r+wE3peyAkNO5DAPrZG3k321QZ1I
         ruow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582677; x=1692187477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii80EE7pa0mhgMQ0s5xe4195LlHu5IHrEtcB3OBraLk=;
        b=IdM6tPxl6KkmCjouuQ4B6uSkvZAJGVnXfyD/ItC6bKqpICiWXMzxZ9MAUpl+HQzIyL
         GQUjOmGbmn/OsC3nruol6snRgKTWgWpY9Fvg4IDjeF8x9cYDaIoTB/L0h7tSg/VqGMfl
         Yk5O+w+Y53lQyCHEh2DzETE0D6k2xHt6xXX6tDAqO/bn7MQ4D0s6urPte2JWKD4gMTgh
         Kgzr1lcwObS2eCwHNQvfhGvmvFDf2+C66j1tV/UISOa+5EM69cSnW9HeE+GvFCjFeIWq
         REHYb4lNFGfd9Y9sntThNH5nCAhZ3XKT2KPOoaT2YNqw3XqXXF5DdFYkjWRk778maaDm
         /YDA==
X-Gm-Message-State: AOJu0Yy0d1YMFpt2DuCK76o+HdMlvsKTmEaYt6sT3n4C1hSDBPKy4X6b
        0mc6dosnmaNCxSF5gqCJ1cgTRon/WA2U2ggJSFc=
X-Google-Smtp-Source: AGHT+IETu73lrm/5LQfyHK8qjp9vNvK9TX06/BiTcJ2LLYm+UUDVhJQnkevBzFGzrc8K8etxRZyRjg==
X-Received: by 2002:a05:600c:234a:b0:3f5:878:c0c2 with SMTP id 10-20020a05600c234a00b003f50878c0c2mr2047031wmq.3.1691582677091;
        Wed, 09 Aug 2023 05:04:37 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b003fe1a96845bsm1808573wmi.2.2023.08.09.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:04:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 1/7] arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator supply names
Date:   Wed,  9 Aug 2023 13:04:26 +0100
Message-Id: <20230809120432.1036405-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
References: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ov5640 driver expects DOVDD, AVDD and DVDD as regulator supply names.

The ov5640 has depended on these names since the driver was committed
upstream in 2017. Similarly apq8016-sbc.dtsi has had completely different
regulator names since its own initial commit in 2020.

Perhaps the regulators were left on in previous 410c bootloaders. In any
case today on 6.5 we won't switch on the ov5640 without correctly naming
the regulators.

Fixes: 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index f6eeb25988465..75b4e5ff7c95c 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -282,9 +282,9 @@ camera_rear@3b {
 		clock-names = "xclk";
 		clock-frequency = <23880000>;
 
-		vdddo-supply = <&camera_vdddo_1v8>;
-		vdda-supply = <&camera_vdda_2v8>;
-		vddd-supply = <&camera_vddd_1v5>;
+		DOVDD-supply = <&camera_vdddo_1v8>;
+		AVDD-supply = <&camera_vdda_2v8>;
+		DVDD-supply = <&camera_vddd_1v5>;
 
 		/* No camera mezzanine by default */
 		status = "disabled";
-- 
2.39.2

