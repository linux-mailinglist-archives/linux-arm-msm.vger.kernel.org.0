Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2347836D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 02:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbjHVAOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 20:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbjHVAOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2F87CFB
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ffa248263cso5989864e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663256; x=1693268056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWfY9zdr2u9HZt1Cmwck0vMVGT5Qjr9K9nzsv2p9EMg=;
        b=PcL5CRXbB0L0vqUFu9meteGK5bOyqORAHZ+e6PolSc2c0MDYTN3U6oUYlQmQOjH2Tr
         eZ3tBnNL0CYDzdQj8pLHMepEwbRX+3Y5CG4yAH+196+iwsIdYJY2Xz6X5S5YslFuGOpS
         ko6c1TdNxEIks1+8CdE8c/hLjTg5/+1hKrZTb3ANB8wZqpNRyoXfp9DKGlSIiq3ioWcC
         Qeujpe0OjnYe54Z8F6sLoSjBoLM2cfE0htj1Bli2YIqQFwdPViOoT7sV7Pn1jPnbkiBM
         rJk3U9lI/0tGZqQYjBKKGQWR0ay+Ox8wmgqgTSc+Va3YtFhRquAculNgj/f8xrctGgjR
         n6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663256; x=1693268056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWfY9zdr2u9HZt1Cmwck0vMVGT5Qjr9K9nzsv2p9EMg=;
        b=PDnXMfV2Pyc6ERSSaL0c0OoG9w3HRmqMS1NaZkjSQHF0whA52KYeAEQ62l6Q0Hril8
         Nol7NmTPNOhxz090jQOli3i9Q+lfpFQFcvvH9wUZm4zWTnV8IWJVfDi5OMb4/ekcmjpe
         1oYrr8wgNSOyKb+xwRxWqhu8mx317YJPZ5R43kAUJpbUAxnJE0a+D1bnuI9yHSPaxuFv
         7JRqFniVvU3Si0sBAEPehjvWqQPwg2fPO0jtBmWoF0ep1z7wxetIlapZh4p2BsTgJtHf
         L6A8Tw08603DUnnezuHxVGLadvj2njwZWaswKoWHTb1YWa97dLER/9ky0OybJ5EuKMFn
         pwHQ==
X-Gm-Message-State: AOJu0YyPxP2s4jvsCA0y+xlnl5Kg3p4dVH05++jIPYKRM9SFGwbt81nO
        inbLxGUiT+AhUza0qVeWP1gaYg==
X-Google-Smtp-Source: AGHT+IFw3xdbhY12xmiy4R8GUuqBCgpEe4BjzRA92rpV7DnzrCiKPL2pN80UT2XW25fmgdTlsz1+Tw==
X-Received: by 2002:a05:6512:10d5:b0:4fe:7df0:41ab with SMTP id k21-20020a05651210d500b004fe7df041abmr5668669lfg.17.1692663255856;
        Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 31/32] ARM: dts: qcom: pm8921: Disable keypad by default
Date:   Tue, 22 Aug 2023 03:13:48 +0300
Message-Id: <20230822001349.899298-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
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

Since keypad is used only by some devices, disable it by default and enable explicitly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi          | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 360a179670c5..058962af3005 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -43,6 +43,7 @@ pm8921_keypad: keypad@148 {
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
+			status = "disabled";
 		};
 
 		pm8921_gpio: gpio@150 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 414881d34c60..9175f29e7ae3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -98,6 +98,8 @@ MATRIX_KEY(0, 3, KEY_CAMERA)
 		>;
 	keypad,num-rows = <1>;
 	keypad,num-columns = <5>;
+
+	status = "okay";
 };
 
 &rpm {
-- 
2.39.2

