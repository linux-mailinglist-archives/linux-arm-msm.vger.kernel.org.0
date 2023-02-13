Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48635694691
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 14:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjBMNIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 08:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjBMNIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 08:08:12 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035BA199E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 05:08:11 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id a10so12760598edu.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q3sX6YTXGYHIP374Q+pFww/SYTQVJ2mqj5WKR3Qc1U=;
        b=VEMOJGZfRFhuyLg7lJH20ccxW+3/EDrb6KjPSTVbZxOKL1kd997eEqZB5NHItDQ2JR
         NN47Tkm3z2hNxasjOfQMk65BF0iizc98TKQyBmFp+qUwy/HiqXNnucaPV/AcdmEyGM38
         RnxAhSxpCGTz0tZvqez6uLz0fCRoqP0fgTTwshyV9zdlSDdjqA4Ohth5OcH+V2sN2/Z0
         PUuT21Dgl7lRwNvI7MAH5feEHcrK6YCJCmTBAY0uAlXV+jZdj+Mx4DsstF7oHibAi0gk
         63zQ/HcNkHFbDJLGpoI9xVLpU9ZEXhHs/qWCoFi5Sj5P53I6cYpG4JxAj3bhfnwkbRTB
         /1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q3sX6YTXGYHIP374Q+pFww/SYTQVJ2mqj5WKR3Qc1U=;
        b=lAk8hUGIY14dUxObLuPXqA4isaXHPbskpQ4ere0qNNgC9v5f6cNKyBpqOGHmoaqp2h
         4slnLDyID1jvZhBRNmiIpKCl4YfJL75mEIMilhm76JmDc3nt0GgBRNwu11A3U05lO6nO
         9VUAvpiBWmzPA+3uLd1/MauXeVzutmmyHmeQKHv5PhuV3y7JXpWb1QIpwZu3U01cSHX/
         GP0fkukdUK8YUt52R963MvH6O6pi11DYgopw8ihFZq3GA3yK7pVQ9k/gBfg3IiZPySX4
         HtzuQ/9DHkbICKJjZLgXmx1Yw9UtvelAqnrqSpN94P4vF/yndP3BD1VS+0Gh4GGurYss
         S+Jg==
X-Gm-Message-State: AO0yUKXFtW4qWCkwC34bN83oIlw0jmEBLQgtvimc2HdS8BH5uL/fNNFg
        f11qjf3/JBU7Z41XURYKNKDjeg==
X-Google-Smtp-Source: AK7set/xOReg3Jv9h+mSg2lzbM42BxhGyvLmh709X7k41xmwqbg4WQH+BhC2ybGthkhKvGgEut2gDA==
X-Received: by 2002:a50:a44d:0:b0:4aa:b7ac:e0d2 with SMTP id v13-20020a50a44d000000b004aab7ace0d2mr22992579edb.19.1676293689394;
        Mon, 13 Feb 2023 05:08:09 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id f22-20020a50a6d6000000b004acc6cbc451sm1616515edc.36.2023.02.13.05.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:08:09 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 13 Feb 2023 14:08:07 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm6350: add power domain to camcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v2-2-60a507bf3e68@z3ntu.xyz>
References: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CX power domain to the camcc node so the power domain gets
marked as in-use when camcc is used.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 1e1d366c92c1..62d6dcd8d1fe 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1507,6 +1507,8 @@ camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0 0x0ad00000 0 0x16000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			power-domains = <&rpmhpd SM6350_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.39.1

