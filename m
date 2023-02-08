Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEF468EC84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 11:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjBHKQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 05:16:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbjBHKP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 05:15:56 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAC633456
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 02:15:55 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so1059638wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 02:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKDdeglkNeUYsDE7dNCq4DvipvOoaBQXMMUdKEcJp/s=;
        b=qTVFa5RgMhys3GGm+9g32DXDiQdSAtwy7Tat/X4xAnd7P8SEoasyyDRs1XC9nKwmeU
         0ZcERYTUzqS0h8Fifuvv030i2nnLbLTpe0Wa1Dx4VtAdieO6w3URXqUO79G/uP60dZUk
         fFDKxEbS3T2Stj+vlpB79Zjf2RDMMvWWf9JPpXoAnlpgfj/0clsFkoky6tUJfZD3r28T
         2wu4U556PcVC9fv3jXr53TRx0vLrRKig/P7QQzfaKosLHOQyTofjIX/ePz8m75QjTGfQ
         Rp6/2HcNJbA1vMk6dSo18wRNOe807ufBom05YO1/hhLrVU0yuTwtxC9b7ayiKt/rkoSd
         TtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKDdeglkNeUYsDE7dNCq4DvipvOoaBQXMMUdKEcJp/s=;
        b=TuPRs6loeiZ+Ug/zz/XlgpsHrvZJCku6cZZl1d65d78Oc16+87IxU0GXhqvNIj6tTr
         NW9ZFOyikjn8djEPtAIaBmthlC9pp98UWkLgT2fryRr7qOo7LsX35jP3WKtnqCeh8dU3
         qA7Wf1URq/QJKthqEAonaFkkVv9BKibFvkgx1hswtL9a4zEmDIVz6Y9r1XsexAnuGGo4
         IqnAg28IX4mXAFob1pWeJ4RhgdMZGilWGLoUlY+bY8Ar0uw5zfQ6UbXaKvI2Ko0LrRGP
         SmPuI77nI5vQW16R5gel924k6otwReU74moxyQByjM6b9taxFHQuIfi6aO2ENgziR+Yy
         ZaOw==
X-Gm-Message-State: AO0yUKVe0kJWWysmPApFU+2A7VTh3tc4okCZvq5arvmCZ58rSX+C5eVa
        IS85DWWFHh9RGs5G0oLzI0gAAQ==
X-Google-Smtp-Source: AK7set9I7FQyv5QlH9tUgviBZftDZjVnw+tfEbullhD6mNVpLl6bzzA6hwk4pWCze2U3YVWY1ZsX7Q==
X-Received: by 2002:a05:600c:331a:b0:3d2:392e:905f with SMTP id q26-20020a05600c331a00b003d2392e905fmr5835162wmp.24.1675851353876;
        Wed, 08 Feb 2023 02:15:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/7] arm64: dts: qcom: msm8996: align RPM G-Link clock-controller node with bindings
Date:   Wed,  8 Feb 2023 11:15:41 +0100
Message-Id: <20230208101545.45711-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
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

qcom,rpmcc bindings expect RPM clock controller to be named generic
"clock-controller":

  rpm-glink: rpm-requests: 'qcom,rpmcc' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 55180586f7b6..e0d46dbd498f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -483,7 +483,7 @@ rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-msm8996";
 			qcom,glink-channels = "rpm_requests";
 
-			rpmcc: qcom,rpmcc {
+			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-msm8996", "qcom,rpmcc";
 				#clock-cells = <1>;
 				clocks = <&xo_board>;
-- 
2.34.1

