Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05745526AD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 22:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384014AbiEMUF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 16:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384010AbiEMUFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 16:05:53 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8152E0A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:05:52 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id r1so11420783oie.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r9TTeTFNew8imXCR1/0M0CK8sBBUHJqceD87rs7Za0E=;
        b=UTBKSpIpuz7g8k9lVNCtJ6yp85ITbictkMH4LoeAJ8/sP3kse946f6IOJEe7SxJ7Dr
         OFdjERJvEDkWqCK9iaHbifhc/H6Lx5iFpnPwLvija5L6eqiIJdPRZ6kc2M/Y4+uPHK8Z
         WyxsGui5ziUWmSETwVaOkMef+EVyS0KmNPI7YHuvnmZ4Q9D5iAnRdnZA+mQ5OAGch/HM
         7K81Wfd6O4wrXBvReeOQOsr9o7mIKLZRRYiQo7zRHtca/kFMGBNr+GtvVcN6+IJhTMyl
         /eJCUPJNB+4/BhMNbeUh+uc0WTdEURQCEiHU0UC8LUBBrkH6ZEtpVwoQn1rUQUD7mB7f
         vdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9TTeTFNew8imXCR1/0M0CK8sBBUHJqceD87rs7Za0E=;
        b=RoqxbaVDxWxoKFc9AwhQl4qi/lo4/mkI9JseddE2SWiAxmsyzycDlnYXp3q8Q+1+pr
         bThssnOKaWNy4YoXNGAcikHbEWnl6N3l9jxGhJP3Nl6mHqu2hdPQGeTRo1DxcdLoJr4B
         MmBtfxZk7PvW7WhgzFubvfJG6clWpvz7/wJU5OTJpSqd1/61melwhwnwJWXlVxAOo3NV
         EIdUQVjVtFpyA+yyuaj6QGDro+I8xbpFcUNNYIWHCSoYwyb03Y7V6Pj9EJDespqVvfMX
         /5fkE/zy9t29e4mKSbAD06WYXei5dluOuk1xhfqIJjQMOO3vLMS8r0IkHJIpGjfH7Gab
         oHyw==
X-Gm-Message-State: AOAM533OI6mST4y7ZyszL7pEjVblAs7WXUMoE2kbfoLulNyCRPYdj/wl
        mCjqSp3DUBMUhMYun/SrjyC5yA==
X-Google-Smtp-Source: ABdhPJy9G5nUCcYdlUxgLVCGPQ6T2ZcuW1lBlDMWSwsAF7jB7iUxrWxlgJiucXgudX9P8/azvTmHBQ==
X-Received: by 2002:a05:6808:2181:b0:326:901e:f5e7 with SMTP id be1-20020a056808218100b00326901ef5e7mr3361785oib.7.1652472351870;
        Fri, 13 May 2022 13:05:51 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id a1-20020a9d5c81000000b0060603221240sm1456962oti.16.2022.05.13.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 13:05:51 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH v3 4/6] arm64: dts: qcom: sdm845-db845c: enable pmi8998 charger
Date:   Fri, 13 May 2022 21:05:10 +0100
Message-Id: <20220513200512.501156-5-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513200512.501156-1-caleb.connolly@linaro.org>
References: <20220513200512.501156-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the smb2 charger driver on the db845c and add a simple-battery
node to report the correct VBAT voltage.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 40a290b6d4f3..3b73b5305c51 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -240,6 +240,18 @@ vph_pwr: vph-pwr-regulator {
 
 		vin-supply = <&vbat_som>;
 	};
+
+	/*
+	 * The db845c doesn't actually have a battery, but the charger circuitry
+	 * is still wired up to support one, it needs to be programmed for nominal
+	 * vbat voltage. See the vbat-regulator above.
+	 */
+	battery: battery {
+		compatible = "simple-battery";
+
+		voltage-min-design-microvolt = <4200000>;
+		voltage-max-design-microvolt = <4200000>;
+	};
 };
 
 &adsp_pas {
@@ -603,6 +615,12 @@ &pmi8998_rradc {
 	status = "okay";
 };
 
+&pmi8998_charger {
+	status = "okay";
+
+	monitored-battery = <&battery>;
+};
+
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	qi2s@22 {
-- 
2.36.1

