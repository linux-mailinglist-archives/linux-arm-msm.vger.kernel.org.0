Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A8B64F65C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiLQAd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLQAd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:33:57 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768D51C12F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:56 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id cf42so5966525lfb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlEb3rnjlIc3/L0hMJvUYLbQ0T3U0ArAVHahPBSCRDQ=;
        b=gviDX9kv0+ulmaenYYIK/6ZTv0TNi39uaIxkdLRyODMtvlQMk0W2lW7cawT34vdANG
         koXn6sOjpgmKlT/TrKxMNq4UTlK6vMqcnFySF+VEwtviHqCJ2GUzmaMSOnVCXPFyg5oI
         I/q+wQQCGTGy518Nu5TzCZ7U4CIkeuGMFU78Av7icx/hA4vWPDzzDfKGbwLIPEAOlxtM
         Cfu6qbhQh8gRTOAdxvH7LA9Or3akl20gMTvcg1TcYhWvcZdB8VrwgVZw39Io6vlmfUxL
         7yvFkNwaLdxud84I5CzOY7Cz8Wy77J/4bBjiwKhuZj/9qalIT/e3U8wvXoQxdRkLkWaI
         E8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlEb3rnjlIc3/L0hMJvUYLbQ0T3U0ArAVHahPBSCRDQ=;
        b=Mxb5ydfD75n8vo1Ab+VCYqZnHCS1fIyMFUrBlmxlUFtE+SzmEo8kbv9iiDcbwhnmTm
         JDMVGfnGDQIJEf6Qtr63v5CxeJ8vjY+mIY+kvNEh+ylSeI1tLn+LcC17xlSYyrR+k2E2
         5lIABT0bLrPFLdduUfWIkqeE5lv+RSnmXqjG6TbRvz6KZanHAa9gbZ8zqJs4HwV+3w3/
         1UGymVmYzqhvm15jzA2YOPYrbpJeI4wikL11UrxxKLWMrU6BnuaqCZtgKAYCg9PLLyNL
         nb8/C9S3OQDdYsG0KCYS+WJTReRM4juVxpzBxGdEysNpt2JfgA3bKi8QbEegTKTSXnBP
         h8OQ==
X-Gm-Message-State: ANoB5plGpbnbAAu4hgMwQ5/Rjywap9uAMpF/dYl/u8bvMDauq10/N4dG
        loZrDsaZsgEnHfUZp85j5YSHQw==
X-Google-Smtp-Source: AA0mqf6cUqr+Ml5qg7Wl22A4ePtb4x4X9DpqoFB/VUAvlHzoK9kbNmDV75X6rSnRBiB493G2c9dnhQ==
X-Received: by 2002:a05:6512:3c82:b0:4b5:5bc1:16da with SMTP id h2-20020a0565123c8200b004b55bc116damr12278506lfv.39.1671237234873;
        Fri, 16 Dec 2022 16:33:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b00497b198987bsm351458lfo.26.2022.12.16.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:33:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: sm8450-hdk: add missing PMIC includes
Date:   Sat, 17 Dec 2022 02:33:49 +0200
Message-Id: <20221217003349.546852-6-dmitry.baryshkov@linaro.org>
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
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index c951d7a6d6df..5cf436090b5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -10,6 +10,10 @@
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

