Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F05BF5EDFFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbiI1PUj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234627AbiI1PUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:20:37 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C035726E
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id j16so20913028lfg.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=N5iR35AZK7Pq7du6XK86lz6F1DzAFtqNxi6z9fgTPVE=;
        b=pPXCdKtPXCy691JtUyWZcgY9kFLzjkUwm9LKRUJsPt2sL6Us5s97bXSoIPR/pYB2Kd
         3WKqp2DsGQOnj3bEA4bWysKYMSU85xCMNpQk94tQuc1pmK3bO9JZWHqgqtKw4B1nxx98
         4afALGP4IvVFrlfn0zCMm8dDUSwYwRoiFkkKnJVxK0bAgd0A0c2odF6d9yvcQeciZ2yZ
         3L5nEiMx6Ljn9CywCKnheC5KYsY9VeW5mwo8cw6oPI5nrgKxzFPFuJ7Hne5dijXG0fXP
         UDhOYBcTo41pjYar/TbxNtapkFtg//OivNe8/H/Q9QfhmwGC2MS9swr89XJb3wpqDwEb
         OhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=N5iR35AZK7Pq7du6XK86lz6F1DzAFtqNxi6z9fgTPVE=;
        b=Hu2VrmVjU5xT4+qM1RjY3AnoahU4+cxNTYFbnqHey29idym3OQHkUq2weCKwGeGVkz
         70LTuQkwTNcp7TaXt+S98mDl1X5PzW79+RkXePpPJM2N/XHuTG1oqnoQBNZFZQfbZImI
         G6qtHNS1TkSyL8JbxbJZm+tlUWnEjyIH2TER4dDBWJDSjX7csljg3ekduJfQNgpLypjz
         LFDi1vD8aVdZu1erSatx2/ALFz4iLEA5WumLp0XZTV1EZawzSw6GedgMVQ9lJCgwjBAw
         luP+jK0WOm8RCHL430T1T3L9OAumh3sPycfdP8v9xkDPilMGsPVKY1w2/l/nT9YwHXoQ
         jl5A==
X-Gm-Message-State: ACrzQf0oKAExxjgEvtiADO+WkwXjwoWCCx/7la7P6xJk7HOX33siVqB5
        mqDVMH6jP5k2nWsUrr++xOJ/LphDi3pdMQ==
X-Google-Smtp-Source: AMsMyM53pVtExjzequhQZRO9qgs2HsHlqeUIc+D3ThXfCoNdLy4ZlOddGRgUIahVHdpixQ76jJlYXg==
X-Received: by 2002:a05:6512:3b20:b0:498:d7bc:28af with SMTP id f32-20020a0565123b2000b00498d7bc28afmr13083842lfv.65.1664378434177;
        Wed, 28 Sep 2022 08:20:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:20:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/11] arm64: dts: qcom: msm8996: drop unused slimbus reg-mames
Date:   Wed, 28 Sep 2022 17:20:18 +0200
Message-Id: <20220928152027.489543-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

Drop undocumented reg-names from slimbus node - there is only one
address range and Linux implementation does not use it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ae31393081dd..903c443a867f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3312,7 +3312,6 @@ slimbam: dma-controller@9184000 {
 		slim_msm: slim@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
-			reg-names = "ctrl";
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&slimbam 3>, <&slimbam 4>,
 				<&slimbam 5>, <&slimbam 6>;
-- 
2.34.1

