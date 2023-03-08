Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7946B018A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjCHIdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjCHIdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:33:33 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AF71F48B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:33:00 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so672106wmb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEYgWwd5LnYdEY07sfIkwmR+iqIyuF3pIvbNU+g6904=;
        b=pxYu3YiTcCQc/OvW1v/Vuko+gLQ055vVjL9GibywEdMBZwaHTC5XAABSSVFggRQTAl
         Lz5AdZHZBHrQnqYW9Wi+VvOxjhILeYtDvf0R212bgb2/2g5rPuB45k3fD9hprQlwhT3O
         hmk5RfZLZxXxuZ3zzK2vLNbBMeHreY0zw9h/YaoDo/D9xf5wCPwryNThh07S8fDcowmj
         tU+T+GYJNWulaRqWX4MXqGyl2E/4csMz6P75URv7xDATQA6sz3l6CPuyxqKAsIq+4ckS
         AD4L6UKW7HJoC8IFqgIxuXLcyynTvF6UvKtlis/j1gICHHn2QLpgEbly+Re9fmCSWzx5
         yeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEYgWwd5LnYdEY07sfIkwmR+iqIyuF3pIvbNU+g6904=;
        b=UlS8ewfJiPLPy12ptdaFV9t0nG/2ClmOU9CdK0dnMsTTnltWywOIqgk2LiK6GE3ICo
         ZEP5P63h3NDDGNCSb1+sEApn04Yb+NZ3JYazq9VFw/JXOUK6XoX6tqJRGLpQXlfLX2GZ
         /uIjv9ti0mb28otiu0yvXX4VQEt0FmpQt2p2uhZrRFp1m/Ls35fsbD6/j/J4HfTzNVUw
         QZwDiM+Gdo4qrjXWcXxKE/7MxzBp5LTaT5HcrqkQzKvE1vbmKQ/dz+Tp054zy45sEJwN
         vmEMKdJx0qYlW090oG3nOkpH6JDDPui93PjfKFjd7j3ElSY/OVqsZ6R3y8eGaUoKgJUn
         Ytww==
X-Gm-Message-State: AO0yUKX1bE+EqAHrW2Prgg69DnXFNMa5gF44+Dg+iou0vMPrX9qk2wL/
        FgwOXWSs6nt/xKF9FSR8Yx42rQ==
X-Google-Smtp-Source: AK7set/atw0zF8Ds6d5mUuYNLYEnldx5CzVb6d72M7Ppv+eD2EDtU5TvE4rf67zIrkcSVmtENXeu+w==
X-Received: by 2002:a05:600c:1990:b0:3e2:20c7:6553 with SMTP id t16-20020a05600c199000b003e220c76553mr15749876wmq.13.1678264378791;
        Wed, 08 Mar 2023 00:32:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n1-20020adffe01000000b002c4084d3472sm14797907wrr.58.2023.03.08.00.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:32:57 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 08 Mar 2023 09:32:53 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sm8550: fix qup_spi0_cs node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-topic-sm8550-upstream-dt-fixups-v1-2-595b02067672@linaro.org>
References: <20230308-topic-sm8550-upstream-dt-fixups-v1-0-595b02067672@linaro.org>
In-Reply-To: <20230308-topic-sm8550-upstream-dt-fixups-v1-0-595b02067672@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The node is incomplete and doesn't need a subnode, add the missing
properties and move everything to the root of qup-spi0-cs-state node.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index fe8b92954550..c25c68257412 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2807,10 +2807,10 @@ qup_i2c15_data_clk: qup-i2c15-data-clk-state {
 			};
 
 			qup_spi0_cs: qup-spi0-cs-state {
-				cs-pins {
-					pins = "gpio31";
-					function = "qup1_se0";
-				};
+				pins = "gpio31";
+				function = "qup1_se0";
+				drive-strength = <6>;
+				bias-disable;
 			};
 
 			qup_spi0_data_clk: qup-spi0-data-clk-state {

-- 
2.34.1

