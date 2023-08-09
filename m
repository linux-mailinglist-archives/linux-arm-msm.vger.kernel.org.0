Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0B4775E62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjHIMEs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 08:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjHIMEm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 08:04:42 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E8B10FE
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 05:04:41 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso33194375e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 05:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691582680; x=1692187480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji2TAs4h2AQJPAHYaEnDbkiwKSG4NYhBKLiywXvqyCg=;
        b=YZ4CjB494LU3Ifi3LjUMaer/gztQyCovML4j3ReYsyCH7ttR2ffzMWiaEJQkYRRl/w
         XkxhsmFEvRfkhUcnd/POOABrM6P7GZOEnPGSx2bir23lQbDuzQwAT76xgoXRsjwi6P2x
         yr5/K4yGkmzrRQqP8ie7R8/1IWfHLcrhKpgr211/wgle4D5FiiDBuSWltI3r2P1uT5fg
         gn915JwRGM3AH3jOjQPdu7AgdCx5tbttaRfnBlkb+Ug8wZSMA0RM/NDBHe8e6cEl/1K9
         OVdBKU+s6VOCtGSoFwLuePVpb0pZMniEdfnMlVujvKfHKqJX4EQNza805O+5M1bp1Zyn
         VjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582680; x=1692187480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji2TAs4h2AQJPAHYaEnDbkiwKSG4NYhBKLiywXvqyCg=;
        b=aiPp+HjJWgvRkggjomqZX+7C87ig1SMRB30zxaIfpr2nI5RA9zCuEr3fjrY4cdzBqQ
         LA3p0FFKg2dmLfopR3xTjRO4wWl+vhDj3W0id77XsAM6w/RAxJQrISFRdZj6nhpDQLXq
         B0/XFHA1QSVgtLHsY3IlQ7kbGNBeAUn2lokESE06CJupJvBPxrOzKJSVrbjN4+hLfMg0
         7Ahkbi/kByh3pBWsshJOZTaZ/qvU//bIoHtGiUmVyO3C1MWAwNnJczSAsI/HQR8xOSYK
         c2VaRb0nktWlQW4Wx6VDo0ZbGAUfGB7R52rR4T3X2i2rnOA5fUJsEEeF2gV+89Wd06Em
         FXZA==
X-Gm-Message-State: AOJu0YyILALUeiddSo6liYlCKhSU4uOBBqnzvk5hSIppN6H0AMykNzKA
        qOfs5sNWYD/m674+sXhBz/qa/A==
X-Google-Smtp-Source: AGHT+IFg/yp0enlmf5flLyYEhcTtmDh2uFTS6MRF9979NyFtdnZZWXzpduqFWVpyRffVGZ+rWWNs2w==
X-Received: by 2002:a7b:c449:0:b0:3fe:1923:2c3 with SMTP id l9-20020a7bc449000000b003fe192302c3mr1837756wmi.30.1691582679661;
        Wed, 09 Aug 2023 05:04:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600c11cd00b003fe1a96845bsm1808573wmi.2.2023.08.09.05.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 05:04:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 3/7] arm64: dts: qcom: apq8016-sbc: Set ov5640 assigned-clock
Date:   Wed,  9 Aug 2023 13:04:28 +0100
Message-Id: <20230809120432.1036405-4-bryan.odonoghue@linaro.org>
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

