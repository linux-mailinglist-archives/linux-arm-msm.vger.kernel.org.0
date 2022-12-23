Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE0256552A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 17:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiLWQSv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 11:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbiLWQSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 11:18:47 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409441A214
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 08:18:46 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bp15so7587555lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2dybpJartoWoPXcU0Wb+VV41JBJbl5xyHqkJgWwAug=;
        b=jq/Fbk3Fh5QkfX73iAPuw7M33yxBkGSIycgvMjDtqmwLCqJZdEr9Zzb1L9q7aJOgBM
         9wm0et0Yjx/OcH4JzGuFB5F9lTb6um1kcnB4wVJZjYgopZLEpasKs2pebECvOY4reD5f
         HZm5gsooFlCds26tH/9Efo2R9KyIMHmcyGZ1fneZm7ReIsInx5Ivn3atTAo3RSC9XUXH
         89Hi6ftSCv2cxhKIVJEgb+dUGwJRWNjlDrLnP0CGOH4z1pgcHWvgN9MKoWj08/nKAF/e
         AoYNz4dX/6ttanwryZal/TD3l679tf1H61SL61Dh4IZ7iv2ilhF7J1PpbZmmptzzM9Vz
         UU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2dybpJartoWoPXcU0Wb+VV41JBJbl5xyHqkJgWwAug=;
        b=J83+G667nzHDmp4F05BHOWvpxFCewBtcY3KqzeCPoKbdlUL8wpHu2BvzXsRaEAbgrF
         dxZG/2at7i09EZsI9GcKBhwSKFvkXM/3o1FTiTyKiMNhDENiGBgQRqa7YqrJAOQSsD6F
         +vbD0BzDiwCSYn8wDzXPixNGN3xVVQ11eBoovR1nDYe0ko0VLWc2jZrLjLvNx0IvOuvg
         cidP40Ktt+lxdJgICYGXCvCFd9ugHrUaGWSGWekhgko1uNYIZmeigzKUdOnqTwhbXKhp
         SjdFqE6uiWH4OByTtL2l/aXf1/Avq3hRpGan5yYBf89uKhkT0MIYS/H8F3D2fjK4Dw/6
         yrWQ==
X-Gm-Message-State: AFqh2koGnMawcZjwBqTjCg1sCD+L3+9XP83BrmAHIgfrUjKcFkhscLC/
        3FWWcKHJoYHf7NvTRZCgHY35BQ==
X-Google-Smtp-Source: AMrXdXtHDJxI5zFf+FFwfsqeCuYnfESSR9XcvRGr/j1oz2zabffurZifOQB3vInoBJ9xLLgCLAVqBA==
X-Received: by 2002:a19:6508:0:b0:4bc:8c94:82f7 with SMTP id z8-20020a196508000000b004bc8c9482f7mr2621466lfb.13.1671812324547;
        Fri, 23 Dec 2022 08:18:44 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n18-20020a05651203f200b004b4f2a30e6csm581360lfq.0.2022.12.23.08.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 08:18:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: qcom: sm8350: align MMC node names with DT schema
Date:   Fri, 23 Dec 2022 17:18:35 +0100
Message-Id: <20221223161835.112079-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221223161835.112079-1-krzysztof.kozlowski@linaro.org>
References: <20221223161835.112079-1-krzysztof.kozlowski@linaro.org>
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

The bindings expect "mmc" for MMC/SDHCI nodes:

  sm8350-sony-xperia-sagami-pdx214.dtb: sdhci@8804000: $nodename:0: 'sdhci@8804000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 245dce24ec59..18aa4bd073f3 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2369,7 +2369,7 @@ compute-cb@8 {
 			};
 		};
 
-		sdhc_2: sdhci@8804000 {
+		sdhc_2: mmc@8804000 {
 			compatible = "qcom,sm8350-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0 0x08804000 0 0x1000>;
 
-- 
2.34.1

