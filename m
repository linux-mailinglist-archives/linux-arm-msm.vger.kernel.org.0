Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1B64B613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 14:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbiLMNZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 08:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235586AbiLMNZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 08:25:26 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A6C20379
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:25:24 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p8so4838282lfu.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUxAZhR93P0jRFXyS5n17x4tHYYen+iMdLH9RRDlI4I=;
        b=OWPen/1WbdEXfF4UbgZgZVpVAV3LqXs4INh8HU2tlDI4qRxn94EIvaE6KRiTfkAQ5j
         QMa6GSRVjK53+F9t+7QLy/ZiRBYaoVfYBuv5tjw9HJUJmVR13qioeT9Udik+AczmNRj5
         5LqgkK1yHzkMBilsdsuhBDdlgoS+Gq/cYhz0mOIGaqmeEY8Nbhpy685YTKQq/fQ4AbBF
         IBqYuAfvONs1MIbXofCNUZ6fJ2U/HpBk0hhB2xTLRtcxrnQim+p4MrtqCfhju2JjYtie
         pXk5tSE7a7d/DYzsF3VwgxNZE6CMGDxXsubacGCmUyFTvatsV65AJieT2TLQnLobHQQh
         Lgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUxAZhR93P0jRFXyS5n17x4tHYYen+iMdLH9RRDlI4I=;
        b=U9xuO5nhBCcK6cjlRJLTAlP7BEJSoro9Xv9l4M/GhBWK8DWAc9OJJHfrD1YXuOYKHf
         RfUVa7zJ7c1GhEpz2ZiQ8uN56F5VOyek5KcN9fl0PeLtaUVOqlMkEUdcBFxlY/8YUpUm
         2Zs3C77TN/CVEzhpKpit8kzpe+7yiqjH6Tl6n0jDvY4a4c46tcYQXWqrWnHcC6s1ietj
         lCj76/g0qspTtxOGxwGd9lVJFQ7hG5+wAvkhbJ50pCgJmdIvgbLoLNm2hMPLpgL/U8tI
         uCsC2gi/LHT0awE8Pd7hndETMYyaJotJp4CSc42hRVp9NSl7S6Lswneoq3/suWKG/L7X
         EVHQ==
X-Gm-Message-State: ANoB5pn9w4Dnko8VafrPkvCzgiotAIolj10FarFNja5iFNCDSewuCBOB
        HinomjC1gIDEvutVuzA4vpELopMMJV2s0UU3
X-Google-Smtp-Source: AA0mqf60FH1tofrnU8P3ShRDM3PPXipwLoDUAQAWXJa4P/m1ihYXpXtJAHs4Az4u0Cl4bvuyhO4O3w==
X-Received: by 2002:a05:6512:b0e:b0:4a4:68b9:66cf with SMTP id w14-20020a0565120b0e00b004a468b966cfmr7101939lfu.26.1670937923154;
        Tue, 13 Dec 2022 05:25:23 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id k8-20020ac257c8000000b004b0a1e77cb2sm366564lfo.137.2022.12.13.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 05:25:22 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8450-nagara: Disable empty i2c bus
Date:   Tue, 13 Dec 2022 14:25:17 +0100
Message-Id: <20221213132517.203609-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213132517.203609-1-konrad.dybcio@linaro.org>
References: <20221213132517.203609-1-konrad.dybcio@linaro.org>
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

As much as it hurts me, there is no FM radio chips on these devices.
It seems to be present on Japanese models, but these are not available
globally and differ in a few more ways anyway (such as a super high-tech
NFC chip). Since it's the only subdevice of its I2C host bus, disable
said bus to save some power.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
index 6e100b97eaed..c7c20d374f77 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
@@ -604,13 +604,6 @@ &i2c9 {
 	/* NXP SN1X0 NFC @ 28 */
 };
 
-&i2c13 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	/* Richwave RTC6226 FM Radio Receiver @ 64 */
-};
-
 &i2c14 {
 	clock-frequency = <1000000>;
 	status = "okay";
-- 
2.39.0

