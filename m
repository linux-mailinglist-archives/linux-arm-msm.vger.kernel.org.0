Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC7D5BE9A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 17:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiITPFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 11:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbiITPEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 11:04:41 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF45B7DF
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:04:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f9so4290991lfr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uGVId7ajaDqTRILJwbUDyK1M1OoEGlOt7PBKotR6xVM=;
        b=rTCouT/5+rTbr/qoDH2r9+QQP1b0txBsTuK1g62F+FkXrWnr7by0oFOiC4rV+vZozh
         GjQGX0wVvO8kEVgop5xW2KblCelmgTncdFZ/EZH5dOl1S/w7H/hBDxkkBEQ+bKi3JUcp
         fd6HSpY6dg5GWbqVe5b2uELdK3zV+TR+Ex6vS4U2sdhAfJEtZR8+X8wAQpl41d5sFBBE
         qML3MdKvhxaH97IEh+C6oVDRNGbf2DZpr92JSAtM3w7mEQkLI8Edlc5oD3W+xUrlLlk4
         7lMrjDguImusQaJH+WaRXF6sVh2OfronV4ZIV/vs/jUv163QAIN4fpEg+i7hvAIESkrx
         OFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uGVId7ajaDqTRILJwbUDyK1M1OoEGlOt7PBKotR6xVM=;
        b=z9Ja8+PsKKrOJRppJTQKycb+3VvFq78UI4tuLphwroH2vSKm1dCyX34K0AND7Gk621
         lPShDMQdTzFLUWk43P8238aYxrYGIk1I4lPFHKYLm7QWi7aR5hr1Ax6kpTM+32TmubX8
         7NhcF711E7F6HsvjGqucr9DG6WG3ql4tT6gf1OOrio1epf5g7UgQU9AsqBS8ShtJ0xKF
         OYGPdSaDa2smZp5Wi8Hx6YkL6q1N8A4+l5VpN5pDxjPvLIksXZTboClNDAsHli0/dvd+
         d8AqZSJhbT6y2oCZaS/SAgQsyd9YfiyjK5vLNX9afgfaselEMOjVacfOp+3EGneTvWnV
         JgaA==
X-Gm-Message-State: ACrzQf2uQyL258eQYYHbsHN+OCdB2LUvwIaDWaiV0TXoD914e5QYfllP
        e7VZJevCpkB1v7QplvX7cdtGPg==
X-Google-Smtp-Source: AMsMyM4KZDnbUtIxrgZe74ARw4Teo3eNN5N0ZL8MWZrI3hDx/FYuj2pOhfDr9WHVD11ZLqbMRW07Ag==
X-Received: by 2002:a05:6512:36c1:b0:497:abef:cce5 with SMTP id e1-20020a05651236c100b00497abefcce5mr8578939lfs.472.1663686261140;
        Tue, 20 Sep 2022 08:04:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm8294lfo.58.2022.09.20.08.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:04:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/3] ARM: dts: qcom: msm8974: switch TCSR mutex to MMIO
Date:   Tue, 20 Sep 2022 17:04:14 +0200
Message-Id: <20220920150414.637634-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable, as
TCSR mutex is actually a dedicated IO address space, and it also fixes
DT schema checks:

  qcom-msm8974-sony-xperia-rhine-amami.dtb: tcsr-mutex: 'reg' is a required property
  qcom-msm8974-sony-xperia-rhine-amami.dtb: tcsr-mutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index a4e12daf3eeb..7bc19b5375f6 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1194,7 +1194,7 @@ remoteproc_mss: remoteproc@fc880000 {
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";
 
-			qcom,halt-regs = <&tcsr_mutex_block 0x1180 0x1200 0x1280>;
+			qcom,halt-regs = <&tcsr_mutex 0x1180 0x1200 0x1280>;
 
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
@@ -1233,9 +1233,10 @@ smd-edge {
 			};
 		};
 
-		tcsr_mutex_block: syscon@fd484000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,msm8974-tcsr-mutex", "qcom,tcsr-mutex", "syscon";
 			reg = <0xfd484000 0x2000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@fd4a0000 {
@@ -1719,13 +1720,6 @@ reboot-mode {
 		};
 	};
 
-	tcsr_mutex: tcsr-mutex {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_block 0 0x80>;
-
-		#hwlock-cells = <1>;
-	};
-
 	thermal-zones {
 		cpu0-thermal {
 			polling-delay-passive = <250>;
-- 
2.34.1

