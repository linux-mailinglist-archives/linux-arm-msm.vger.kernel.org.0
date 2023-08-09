Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D64107769DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 22:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbjHIUX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 16:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234304AbjHIUX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 16:23:58 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185C1211B
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 13:23:57 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe12820bffso1309735e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691612635; x=1692217435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji2TAs4h2AQJPAHYaEnDbkiwKSG4NYhBKLiywXvqyCg=;
        b=ZkFNndjgShMJ+95nsV+qJ73ey11QPtbqtiikehNw5J+nt9G7k7yb2hCNLVC6PlCrUh
         PzsRvgFLqEidStYW/gUG3oEGci4a8JdSDVyDkk4HYseK5RBX02ECFk7ZyPg1pz2UpJde
         mhW8bY1NXmZO7/KHGOuDoh93R+6zMUsnI4CglRmZY6dmpQMgvIsj9lnSKxFoPFgcctkF
         Wuf6VBSHKsscIUPFRO4eKjQqBW7niFYuvV3gi9yUA7a/F8QQ8LHznMYEKwAcjvK4vdCV
         sNYL5WWjnJEYU+zplGiVyxLZAYueFrwgbdkGQU+mTJnMhioOqoQ23p+RQV9/Dr+HWKaF
         +Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691612635; x=1692217435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji2TAs4h2AQJPAHYaEnDbkiwKSG4NYhBKLiywXvqyCg=;
        b=CFfozoeWiKgqNmO9q5gbNBKDpQ7F/urJ6AWdRsOZ2x3GP+FrQqtakLw5ldn9U8BgeN
         cht8jxZiuCgnvBWt16Vn3NijW0Ji5CZNUKsGmGWTPeBXoCqgzlrcvBaUVFx7cnsrEsBB
         SX5R/cT7JVblkphGTHvvBptrv6WwJMvffhgxid4yuba85jYQsHocnIahFmnbhKpzx0Q+
         nDorZeFy3Ytfo/I3xZpzTgvM4NhJbc+9g8ndca+XMpCi/kRIza7e/AmBz+At4JylKjH4
         u09gbeKv2d9T12e8mdmxSXEGlEuaSqoefkH5v3Z0o7yCjXzzkcbSnf4MRocNXsOSMqPL
         Z/sg==
X-Gm-Message-State: AOJu0Yy1Fg2MZ2sqv1An6gQCqrrGKwYxxoGQe2fASN3k4oejf2lS8Dw/
        Np9z7GXmBX26pZ91k3VHfz4IiQ==
X-Google-Smtp-Source: AGHT+IGt/Up8EqnAmJ9S6TVrVH6ObWtvMWJkO6tE+jUlXWtHFD1vmuX4/n7OPK9cgAslCd5HJqD1EA==
X-Received: by 2002:a05:600c:296:b0:3fb:ef86:e30 with SMTP id 22-20020a05600c029600b003fbef860e30mr149581wmk.10.1691612635573;
        Wed, 09 Aug 2023 13:23:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c22ce00b003fba2734f1esm2927509wmg.1.2023.08.09.13.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:23:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 3/6] arm64: dts: qcom: apq8016-sbc: Set ov5640 assigned-clock
Date:   Wed,  9 Aug 2023 21:23:40 +0100
Message-Id: <20230809202343.1098425-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
References: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
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

The driver for the ov5640 doesn't do a set-rate, instead it expects the
clock to already be set at an appropriate rate.

Similarly the yaml for ov5640 doesn't understand clock-frequency. Convert
from clock-rate to assigned-clock and assigned-clock-rate to remediate.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 0481a4a82090a..ada0777567623 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -280,7 +280,8 @@ camera_rear@3b {
 
 		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
 		clock-names = "xclk";
-		clock-frequency = <23880000>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates = <23880000>;
 
 		DOVDD-supply = <&camera_vdddo_1v8>;
 		AVDD-supply = <&camera_vdda_2v8>;
-- 
2.39.2

