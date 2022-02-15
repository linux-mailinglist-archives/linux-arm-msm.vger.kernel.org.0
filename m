Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E3B4B77C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 21:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242001AbiBOQzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 11:55:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbiBOQzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 11:55:36 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E895E119F4E
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 08:55:20 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so1380942wmb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 08:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zozG4Oy5Pt0vWjsRDZ91928+qvWs4STBKU9M4pGg1h4=;
        b=DTbc/KWdSYmJRgQH1cdxj4Xmo1DvtMBkm8G8c1SEpxpDy7qWbHcSyivC+F6qb5FxH0
         YwORou0fvZfN6qEhqr7r52JTR0ZAObSXW6XVS/2Hman6eIPsG2VhpVhWgY7o5zFXbIfl
         mYhUp04l1qAWGzdRlxEk4E7ZhfKun+/P9H4e8NQpvJ4bWQd21JyljGU4TO9o9y98WwE5
         tPYh3g2aFso/9k46G5raTdteX561/zsHC51lrIPSFJjVTAv2aXXhzeTnY50+ZPZnOUL1
         qEfqZ0Z9ACeYs7bWEb8R4kX0XdpQSKhXIdeHPF5SXeqYqaZxuDOtANWanOTZ+lYtXqvJ
         3wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zozG4Oy5Pt0vWjsRDZ91928+qvWs4STBKU9M4pGg1h4=;
        b=JjWSzPyK3+a1wDuyDkjZQ7wOejdBj4iEojnW0MRWPuIJeNdx/IyaYk7wnbBf5Msn2D
         CMFn3VKXLm4Bo8jPVl/Vg0P+nrqH5/ayiZzRqKdT9QPtso9DHTjZdRZWBs+hckLVKQ7h
         Td3GN/2VknUb+NEhMleTtK9l18MYZAcgs5WfverGiW5u7qUmmioT7rVHEvny/QL++1fH
         G1DqJ8qFK+7WoPdZF4hJh8v3QOfnjbSva1hhQUq8OegCw5cPPRjjzy583JKonSFrYdZn
         VsYZjHlcM4RZ4QADNtNe4mHqY8HPNEXzp5ePBEkVCb/eUiDTJcpQ4YmfER3hYOAnzQ86
         o/2w==
X-Gm-Message-State: AOAM5337WkgbadQLgN6VyWjYVqio66H2sV8xx+li77liE+k5ylwVI/Jf
        aZJtWWwf9NZyujI1XEu1DJh0dw==
X-Google-Smtp-Source: ABdhPJwxJrhSxzXDe8VGWSjLVBNaxYR/gaEB0iPR9SpUNYT4Cu45fq9LrmMHequSuySuFkBuST0UBg==
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr3872371wmj.91.1644944119561;
        Tue, 15 Feb 2022 08:55:19 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id f14sm15373652wmq.3.2022.02.15.08.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 08:55:19 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v5 6/9] arm64: dts: qcom: pmi8998: add rradc node
Date:   Tue, 15 Feb 2022 16:54:53 +0000
Message-Id: <20220215165456.1205583-7-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220215165456.1205583-1-caleb.connolly@linaro.org>
References: <20220215165456.1205583-1-caleb.connolly@linaro.org>
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

