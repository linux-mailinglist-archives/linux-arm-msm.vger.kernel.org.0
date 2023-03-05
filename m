Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7EB26AAFB6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Mar 2023 14:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjCENAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Mar 2023 08:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjCENAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Mar 2023 08:00:01 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021B812BF5
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 04:59:59 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id a25so28235219edb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 04:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678021197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPnKiFwJo24AlZFkRpb1qIo2px1Ym2pVCnkq5ykK/M4=;
        b=cOIqF2sQAmzQi+Wk/tDSYps0o6IGo9YNmzfdMEd5BgkseAaxgg1CpK1CqeilcARyOd
         AB5BZKN5Mw5ZKNK8bb0w7MnvTFUbhHnoxhEDDn2uQvcW1XJHBtYZUE3grV6FVSCojhWK
         UqZMlTJgpE5GaUlUONrIWI9bywm5kpzv5fJva1DHzAw0GqL5a8mlkAQ4ITh8AMcK80gP
         swmRgUYEtsb7TYYXNdc26jXQi5Li1Rcz08kFAxrhzSj7XcuY55f259UJ2QFdhPtYcp/z
         9u8ZfqvHYeaz/74Pv/AdyXHXl2z7m5QIHaMkGAbyFNlQQACOonTpeZ/eLSBH6Op9YJ9G
         bLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678021197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPnKiFwJo24AlZFkRpb1qIo2px1Ym2pVCnkq5ykK/M4=;
        b=mzDfy4SK1oLl1B4B+pcCupUoSYgwUTTvBMjsAJrvg7fprS1ND2QOd5UbY4Tby9A7o8
         YjkJtZjaDnhovhUSXOs93sg9H/ofgd+dSJYyCoPisQelwc8lJ4tk8l2QZJM4iQXNIDXs
         Ezi7fELrgGOtD29c6TwqTIDbZY55Cq8hRJxJ7epfk6lFGBrD5kuOq/8CDFK9kw3KxBLp
         P12dtebU9JWWvz9rskb35JqfS4khDtLEuHBdo7r7XpHqQfd5g3zFQq0jzhe2lEYxCDsT
         LDorwSUMiun8Ghp2e/bB6M4OQp28MK3IDR/rsbP+lRgaBbsLC6IMnAutcF0EzQJ+qBnh
         nf3w==
X-Gm-Message-State: AO0yUKVKBiGPvaUMIBQR9VuB6RKNxtM0/q6vKyUPebBFmWo9/oj0PTuU
        zNWO8zl9nEDaVOmiLX5qQgThrw==
X-Google-Smtp-Source: AK7set9bA5pQCrvs/z5SXArhEpVto4YPudHzdfUQrDooTg3wN1zWLXYSTvGXu/hRIrEwmeEeFSeyvw==
X-Received: by 2002:aa7:c2da:0:b0:4bf:33e8:21ff with SMTP id m26-20020aa7c2da000000b004bf33e821ffmr6184976edp.30.1678021197624;
        Sun, 05 Mar 2023 04:59:57 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906078f00b008ea8effe947sm3193158ejc.225.2023.03.05.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 04:59:57 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/11] arm64: dts: qcom: sm8250: drop incorrect Coresight funnel properties
Date:   Sun,  5 Mar 2023 13:59:45 +0100
Message-Id: <20230305125954.209559-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
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

There is only one output port, thus out-ports should not have
'address/sice-cells' and unit addresses.  'reg-names' are also not
allowed by bindings.

  qrb5165-rb5.dtb: funnel@6042000: out-ports: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
  qrb5165-rb5.dtb: funnel@6b04000: Unevaluated properties are not allowed ('reg-names' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 2f0e460acccd..88870d9e3348 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2799,11 +2799,7 @@ funnel@6042000 {
 			clock-names = "apb_pclk";
 
 			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
+				port {
 					funnel_in1_out_funnel_merg: endpoint {
 						remote-endpoint = <&funnel_merg_in_funnel_in1>;
 					};
@@ -2904,7 +2900,6 @@ funnel@6b04000 {
 			arm,primecell-periphid = <0x000bb908>;
 
 			reg = <0 0x06b04000 0 0x1000>;
-			reg-names = "funnel-base";
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
@@ -3220,9 +3215,6 @@ funnel@7810000 {
 			clock-names = "apb_pclk";
 
 			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				port {
 					funnel_apss_merg_out_funnel_in1: endpoint {
 					remote-endpoint = <&funnel_in1_in_funnel_apss_merg>;
-- 
2.34.1

