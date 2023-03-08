Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED276B0792
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 13:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjCHM7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 07:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbjCHM7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 07:59:19 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD59F93E0D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 04:59:16 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id ec29so34510107edb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678280355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHOTqWkaXaI/OwgM88CXJchnUd27Py/bxwhOjZKQfh4=;
        b=KXb8Od+u7cXpL3e4HTs73MqGs4NX8/zj3kCxQ51DNA0GWw5rlhDZkC25k3FaIE8SxW
         fq+XqBD6fmH0BccY8vPxqSEqDEXVVVtmKX3OFo5irI2AS/EVRuJ5iP+5zzoyvCxXCyCd
         LM3AJsfpPyvmV7rAFeZ0SDeMNzqPAAecklz3nMsFRy5JBgL6KQdDzk7ATTkqY3zpvwjb
         SEiUq56DKlfOY1GOp/FzawIin1XPhHU/yATu+iP8Rhlt8BBxgtrtVZ3E+FvM0Xu4rRz3
         F38Vl/aijUNXj5WwA1gcD/EVizr6RE/94+ijUPB7TR6VGJqYijfUJ6o8gEpfdLFjg0SR
         Q/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHOTqWkaXaI/OwgM88CXJchnUd27Py/bxwhOjZKQfh4=;
        b=ph54qjzZhjEO8dElWXJ6IJP1CuZvgQ9JPHI1e/+R4KqwAg42/8yl371z/Sxxa4KTi+
         5/HD3lC+8b2oqWJ8D6Rfo/3l5ib3eQs0MPxM1/wWrU0CXKYaIW0HtPEotTQ91aYMqMAj
         TKwacOFruDPrVPWAC7WQ787bFlKOrO/2Iqj2YD5itsZBNCVWXTwkxtflLFKhanx/ah2U
         DimkELoeZg/eKLTVdgZ/8hkqVB6ESasHSudemKBsTYy2bM/y0+twFjTSDVcryJ36TL4O
         EEBHQPCCQLZ01/RGzcwJ+1A5A7Uw7B1+GaHZrHOHZEYvieZ/wxRgBFiTtbTs9F3mgfaV
         vkVQ==
X-Gm-Message-State: AO0yUKWdQGyMgxTKE5gSCgRFsHH1wYvHuMHKzqz0i/MvIbBjdsHpLZfX
        0i8+SfCcpjoAx/zg57i+o1rnjg==
X-Google-Smtp-Source: AK7set+UuUt8TRVCOIjayzne5hhLzw/wAAB1ckNowliQBxgpemJGTnUG7ndHOWUXBu7pI9qfC2kPfw==
X-Received: by 2002:a17:906:308e:b0:8b1:7aaa:4c25 with SMTP id 14-20020a170906308e00b008b17aaa4c25mr16888233ejv.29.1678280355482;
        Wed, 08 Mar 2023 04:59:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709063b5900b008d0dbf15b8bsm7464141ejf.212.2023.03.08.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 04:59:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/11] arm64: dts: qcom: msm8953: correct RPMCC node name
Date:   Wed,  8 Mar 2023 13:59:02 +0100
Message-Id: <20230308125906.236885-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308125906.236885-1-krzysztof.kozlowski@linaro.org>
References: <20230308125906.236885-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bindings expect RPM clock controller subnode to be named
'clock-controller':

  msm8953-motorola-potter.dtb: smd: rpm:rpm-requests: 'rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. None
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 610f3e3fc0c2..4e362b9012bd 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -269,7 +269,7 @@ rpm_requests: rpm-requests {
 				compatible = "qcom,rpm-msm8953";
 				qcom,smd-channels = "rpm_requests";
 
-				rpmcc: rpmcc {
+				rpmcc: clock-controller {
 					compatible = "qcom,rpmcc-msm8953", "qcom,rpmcc";
 					clocks = <&xo_board>;
 					clock-names = "xo";
-- 
2.34.1

