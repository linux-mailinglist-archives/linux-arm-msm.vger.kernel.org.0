Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 984595A333A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Aug 2022 02:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbiH0AtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 20:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiH0AtF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 20:49:05 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA3CEA339
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 17:49:04 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id f4so2781866pgc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 17:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=97zZ08Utl6HARnTvGZcj5Kpy48/dl3mZFonKGspCb6I=;
        b=HA9yAAoleCjowV5YLuTXR7dgCp/RWxiop4nJUvuJ12gtW6IHgIsQp+4AZT9z96nG9+
         Ot4q/4vAg0a5FughnQQ/mnp/8ipCGNhv64yUejNAwG7JJl87b6Oz+PWF7UP1Pub8pva0
         23I/W26sQG4N9k+fiVmoV3Im8gX5638Gwi21s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=97zZ08Utl6HARnTvGZcj5Kpy48/dl3mZFonKGspCb6I=;
        b=c5f5AD/5vLyHj7qw6l31TCDWrh+zySbOAjx5ViZLafC0xthUdOfwi9oWxP41dLQCMp
         S4WrtO5vn4wsk1b/+fbdukV86Pu1iYhSJMpvbER7u33Be5toNR707PECsZY0tdoiaKNE
         owPEG52AHMzOH4sWf1GkdSWmCK/cGY/FNOsQ17FJKcbqa6X2FGW2ebGttetzNGKQVFQJ
         k46mRbgsQaOF5lbBhOKJwFrAAIKzeAZO3iiiKUq+1TIUekvNhcsirVbDz8zet4+n9Wg5
         UkhqgUx3SCzzHDzI5FcnncNy8jc1HLw2KvcLuv0PH/4LbLLxwP17vvDksiMQQTg4iWNJ
         Bw1g==
X-Gm-Message-State: ACgBeo0pttcDwKrPq9IDt7qFyv8Hfq20cnxKKOKezXvHs1wFYFh86AQK
        QOt8aYUhY8tXlVqVlMWG8CpqrQ==
X-Google-Smtp-Source: AA6agR49bSDIhKd84+MMDwGyg4jTeGcSAp1B7s/VdMYbgVRXKFMixBFV+Xhl1fa2VkE/f2ieM7yKng==
X-Received: by 2002:a05:6a00:22c8:b0:537:275e:e483 with SMTP id f8-20020a056a0022c800b00537275ee483mr6298686pfj.54.1661561343582;
        Fri, 26 Aug 2022 17:49:03 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:4e6f:7e52:9ad5:809f])
        by smtp.gmail.com with ESMTPSA id z10-20020a62d10a000000b00537d0ed05ecsm1842969pfg.216.2022.08.26.17.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 17:49:02 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Keep pm6150_adc enabled for TZ
Date:   Fri, 26 Aug 2022 17:49:00 -0700
Message-Id: <20220827004901.511543-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's still a thermal zone using pm6150_adc in the pm6150.dtsi file,
pm6150_thermal. It's not super obvious because it indirectly uses the
adc through an iio channel in pm6150_temp. Let's keep this enabled on
lazor and coachz so that reading the temperature of the pm6150_thermal
zone continues to work. Otherwise we get -EINVAL when reading the zone,
and I suspect the PMIC temperature trip doesn't work properly so we
don't shutdown when the PMIC overheats.

Cc: Matthias Kaehlcke <mka@chromium.org>
Fixes: b8d1e3d33487 ("arm64: dts: qcom: sc7180-trogdor: Delete ADC config for unused thermistors")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 2 --
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 8290d036044a..edfcd47e1a00 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -24,8 +24,6 @@ &charger_thermal {
 };
 
 &pm6150_adc {
-	status = "disabled";
-
 	/delete-node/ skin-temp-thermistor@4e;
 	/delete-node/ charger-thermistor@4f;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 2cf7d5212c61..002663d752da 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -55,8 +55,6 @@ &panel {
 };
 
 &pm6150_adc {
-	status = "disabled";
-
 	/delete-node/ charger-thermistor@4f;
 };
 

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
https://chromeos.dev

