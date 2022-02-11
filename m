Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7E3C4B2F30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 22:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353571AbiBKVU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 16:20:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353560AbiBKVU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 16:20:26 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5B2C60
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:23 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id q7so17162494wrc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 13:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zozG4Oy5Pt0vWjsRDZ91928+qvWs4STBKU9M4pGg1h4=;
        b=d+jD/MHdZDxOlsL8uLV6eFTKijMgaKicB+fHD4iLd1CEtdmyittSjOeANSrRIKDyA5
         W0jUYrGQfs1VW1sw2SFfH8FTjuWBafz7i1QpFtXUYtX5Sn/c/sbFW1kjzvwd1CroIPPQ
         qQNhG4umHu1c2BJOO1Nr2JHLLBF7YEVoriWEgQYRmuHR51f1IeeC+WKFdYzlVXNtcCLU
         bEbu89TFKTyo9qTDb+1yvzGY5HUYpeR9scXfOF8VbQI1eons4faNqnSyQDoDzDMo/oMs
         Y9L6Td0b4B2XPZji+l6CHvB6BgfISzvzk1XtM6KNiaVq6qXgt7wGHbV5rhe+h4VSiPCM
         kuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zozG4Oy5Pt0vWjsRDZ91928+qvWs4STBKU9M4pGg1h4=;
        b=2otDMKPIY6kE7SQbgrR4w+4l7SdnqZ4ZhbT9zjIb73ix4XaQFZuQbqg+eY+j5kX75X
         ycmBrHf8jFdFG2bFgRVpUNTF9GAaj9dwadZbuIJ16DjyDQVnYajGuW5FC744UQEurq03
         J1iUFsZgbPrOU/7WTkPNQaVsGtm10kgWvMgFkuz6cmr9wShz86dWZCarRN9a4HljmFlc
         EMueSkGS0ohhei/kAEexSJs3an0Pn9VP+kXDyqJAG1mG77Om4w6/Gz+Z7T26ksfD0J9P
         AgfUv3uGTVaP+uR+myMoUow2rs77a5jov+pjto2MCjdygpurh/3ALQKEtV/w7gRZbv22
         Jk4A==
X-Gm-Message-State: AOAM532b7XGo7LoV3h1trwb0i8gqs+vh8Fw66xKWJ6JyBv29LV2hVUJ8
        qlTnNXfLxu6Gm4J6thWDzPCsGw==
X-Google-Smtp-Source: ABdhPJxmUcA5JF7JIzt9jDwsRhOzAA4/EwmGebvjlGnJ3NZKMpMMMjbUU4A2tc0B6P9GRVjjLQKYRw==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr2585521wrl.628.1644614422042;
        Fri, 11 Feb 2022 13:20:22 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id x5sm14276017wrv.63.2022.02.11.13.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 13:20:21 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v4 5/8] arm64: dts: qcom: pmi8998: add rradc node
Date:   Fri, 11 Feb 2022 21:19:56 +0000
Message-Id: <20220211211959.502514-6-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211211959.502514-1-caleb.connolly@linaro.org>
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a DT node for the Round Robin ADC found in the PMI8998 PMIC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index 0fef5f113f05..da10668c361d 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -18,6 +18,14 @@ pmi8998_gpio: gpios@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmi8998_rradc: rradc@4500 {
+			compatible = "qcom,pmi8998-rradc";
+			reg = <0x4500>;
+			#io-channel-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 
 	pmi8998_lsid1: pmic@3 {
-- 
2.35.1

