Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB1964F658
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiLQAd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiLQAdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:33:55 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AADF1C40C
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:54 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y25so5907486lfa.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h8WL3c3+oZm7jp+9cKYfilCcHjJHqUsr5bBvQEAuzs=;
        b=NoHUI0vpLtHKRKazdHAZmjMpMCSs23cn2XgcsbLJarP1lRWrJrIFR0HcLebfmhu9lw
         ke9eCLclSWksy/D9Fyy9xbmsZ+mkbcNsztZZNSQR4SUXVXRUYUtDM9xwIcDkXc53ICWi
         m9YqxFF3EbbjYvAMU1KAMUcWjd606EP2+CZrZYp8pXsShshqzecton8m81QQ0li+TLDT
         5zGRhFe7E0RI2qtx7m2cOex5n3Glm2c1TZWM5T7FxZi2wUdZADgvoKJgoMplYvPdjon+
         y86K/uULK5q/rahqMnQ2EQYLk/d3f91fkgiQz4WwfMyjlHMrMeZDX6tjlrweU04GghRt
         kyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8h8WL3c3+oZm7jp+9cKYfilCcHjJHqUsr5bBvQEAuzs=;
        b=fOGXWJn1VbjqU7DnwXieRG+IVsXhublookykYADbmt09qFPKKJaWkzS5y5hCRIKjZ2
         g0yhTAd9Lu055CWvZnnQzzqn78lpt7fj1SP4kuqTMFLDwaNn96apll7/Kdx2nRj4Crsv
         qgcJ9GIyg5+AeyQhGzDAuHHiiD2Ev+YC4Nqk80SYL4AtX5yjJ8H6YPKPPTcfE/fcl4GU
         NyU2cLuypqnNonksGM2HL77b2L1v4iuYXYz6uSU9cF1s9at6V75fEoeJ69UT2gysYenw
         Vf+xNvrqXs+pXyx9tPl6KDfnKx2GyWKnXYt8nFX7a4fKceeuu35YiSU6Y6sn1N0juaGr
         5Z6w==
X-Gm-Message-State: ANoB5plZwEyH1WG12MBLFNcEQYd8HIH7L4x7TaYNmCOQ2mB9vxxbCJNM
        cwUIhYY8pMJtoxwTdvxAeXITJQ==
X-Google-Smtp-Source: AA0mqf7Qc0EAJ/ZsqyabATGLolV7JWaV9XrvKjLdhhcJfJIsmP1DOvXwSQExawqttR3YYXIZez2Icg==
X-Received: by 2002:a05:6512:b81:b0:4a4:68b9:66bf with SMTP id b1-20020a0565120b8100b004a468b966bfmr13384441lfv.10.1671237233006;
        Fri, 16 Dec 2022 16:33:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b00497b198987bsm351458lfo.26.2022.12.16.16.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:33:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: sm8450-qrd: add missing PMIC includes
Date:   Sat, 17 Dec 2022 02:33:47 +0200
Message-Id: <20221217003349.546852-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
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

Add includes for PMICs used on the SM8450-HDK. This makes GPIO blocks
and thermal sensors available to the user of the platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index e24bb77b2410..134ffdfc2c63 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -9,6 +9,10 @@
 #include "sm8450.dtsi"
 #include "pm8350.dtsi"
 #include "pm8350b.dtsi"
+#include "pm8350c.dtsi"
+#include "pm8450.dtsi"
+#include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
 #include "pmr735b.dtsi"
 
 / {
-- 
2.35.1

