Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8ED56AB704
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 08:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjCFH0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 02:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjCFH0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 02:26:40 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B83061E9E1
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 23:26:39 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id ay14so30799088edb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 23:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678087598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qU/N2SZuHfp40jH83jpd6W5fBvF0TFtfLtqFPBncCHU=;
        b=IvRC69OqO80YWWxd+2ZG1Wl3b8cSTV2LvUQMot4vby8psEzDMuqCBUjC/4nmaYDz2F
         e7C3QCqB1b2hWolvI1LhEB76WgvLNsjIX91ngrA7fjD+QJjQbDVGoqBxrE+HbQu8PkaR
         hWfDpCe6SUoIxbNumtDKkzZZRh3ne/Ao5MhEOxm7n27laPduKZNvg9vg97INx9dxKC1o
         58xwi9jpij/bppIv/OTxpnNnOwlq0j0EETP5BfUCrnCgPJ2blK+XTB6+YnaEWgAFhqZV
         nUpqTYr9Wx0Cvu0X4EbYSyyUxd4kMzo/Yixn267cuRGsc1gOQUvhaw/JGLWGCYUM5+iG
         gCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678087598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU/N2SZuHfp40jH83jpd6W5fBvF0TFtfLtqFPBncCHU=;
        b=wRWS87XFsqlgVeA2k5qbcRVITxsQ6Mw7Bis10Mxy+ze2G5eYzpJfe8ubKSwXOWr5a8
         xcDGn1t7nmCVfkVp344OUyO6fd4y8Jqj8yksh0tY36m398He82UQX1OMDo4ARYWEwT84
         eSB48P0EyxwC6ri8O3xDKJ8zPIDDlDIOdIhzeBLSZOYmgtmUrk3+6xRYAgVnJYOcFhne
         tjn3AzLyh+l4NaGicGXLY9c7/akg963yrH+9iBUGAUAMWc68Vhn5ODo3dHp3ZS/Kmcln
         gVUJ8AfkYFaUiJ7Y8xWUtvTle6CZ7SNedeaoFfD4tI7CyHkmFKcNn6xn1DFYvwKkLGuw
         wqXQ==
X-Gm-Message-State: AO0yUKWifIZXn8j+EPsf2GY6dH/voG20T1f0qNGHwBld1PYQ0eu6Hd+O
        zpl9GuiVUYhrVIfEgVlO/E+0+g==
X-Google-Smtp-Source: AK7set9UWU34DneSo3jycrjlfyMHWDeqxBV0XlGd3ZRAVIFkeGm10o/WbZz70NiAEcMlulT3RS3Gsg==
X-Received: by 2002:a17:906:da82:b0:88f:9f5e:f40 with SMTP id xh2-20020a170906da8200b0088f9f5e0f40mr14276040ejb.68.1678087598216;
        Sun, 05 Mar 2023 23:26:38 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id t26-20020a50d71a000000b004be774e4587sm4652020edi.80.2023.03.05.23.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 23:26:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: qcom: sdx55: add dedicated SDX55 TCSR compatible
Date:   Mon,  6 Mar 2023 08:26:18 +0100
Message-Id: <20230306072618.10770-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306072618.10770-1-krzysztof.kozlowski@linaro.org>
References: <20230306072618.10770-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

syscon should not be used alone as compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index df7303c5c843..72de632b5265 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -385,7 +385,7 @@ tcsr_mutex: hwlock@1f40000 {
 		};
 
 		tcsr: syscon@1fcb000 {
-			compatible = "syscon";
+			compatible = "qcom,sdx55-tcsr", "syscon";
 			reg = <0x01fc0000 0x1000>;
 		};
 
-- 
2.34.1

