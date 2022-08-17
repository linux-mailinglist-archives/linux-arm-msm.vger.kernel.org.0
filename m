Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6D0596F1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239556AbiHQNFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239534AbiHQNEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C46B4198F
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id r17so18903453lfm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GGC6/FAtFLtsPec3v0Z//ulLsaLmio7LVXcsIKWCfDM=;
        b=Jh4Qy9iXI/c1oGXbZ0lnM/OpRok+s+cFSr4oZ/HZf/Wiu4RDv1f090LKWQXlfy2mQR
         8vfSRgiphbSgHJ3xzY7oaBL+nsNpYIbGQ5estuegJ9wB+r3EbUOVo/+Czc+LLXgO+TN3
         A5OGKUFN1Ii3mv8HYwxdWOvh9Pi1MazXBN/uX+YK3FyjmtPXKds1PIH9Q7C0fwpHn3mQ
         tkpzoIfkB5YwAnSZYf5f1q2kSp7fXo5kvFgG+EL0YiE+Tj1qFCwVvaZbFB/cFQpc3/mZ
         SATiRY3hkH2rApYsAKgOAmGLpPksC2V/uBntzjMrMT18SdNdzu1o/YTbeZhoFY/y/Y2g
         GFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GGC6/FAtFLtsPec3v0Z//ulLsaLmio7LVXcsIKWCfDM=;
        b=jwnwITGRM80n38dyHLO7r5Xs4C671m+9R1RwUDfG40685Jdxw82zV6tYEpkzYMJ4tT
         NCgPHdrRit5GjYdms1IRzqwOxhERG9VMyZTPSv0twiax0AtRzJKND1dw3dVLWubRKjoO
         rkwRjuSImw8RyQ66rd7NsH00DDSb4uR1EoejN3WUUoefSYIabFxoI3UMAePh7R1mQo+Q
         G46GIk1wixQt5ABw2d7uDSIgez2vnPZuzC4BRyvNr/v5518kLc4Ut3m4okf2wK/qlfvK
         dt3ABRIMhyUxrxQymIbfmfX/28bhGIvM57iFLmkR+uNY+htnNezv3caWyLLDNkSFNk1C
         tz1Q==
X-Gm-Message-State: ACgBeo1WYwzSSuz72BsSZuIKipcmHylnNQPRdRkR89qDUtooiAuVhZu7
        oyyGNxAlwgVjKfcsjA4hqRspPQ==
X-Google-Smtp-Source: AA6agR7FDblqVQT9gybR5hPpqOJr92pA+VUM4Qhig09FQMQsWhnjjQeFyrRKTjyc7K2GZP4L90Ut5Q==
X-Received: by 2002:a19:3856:0:b0:491:7b45:7617 with SMTP id d22-20020a193856000000b004917b457617mr5988001lfj.47.1660741449662;
        Wed, 17 Aug 2022 06:04:09 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:04:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 14/14] arm64: dts: qcom: sm8150: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:03:42 +0300
Message-Id: <20220817130342.568396-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/sm8150-mtp.dtb: hwlock: 'reg' is a required property
  qcom/sm8150-mtp.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 7d509ecd44da..dc6770391813 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -585,12 +585,6 @@ scm: scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -2054,9 +2048,10 @@ ipa_virt: interconnect@1e00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
-			reg = <0x0 0x01f40000 0x0 0x40000>;
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0 0x01f40000 0 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		remoteproc_slpi: remoteproc@2400000 {
-- 
2.34.1

