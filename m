Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E155F11FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbiI3SxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232422AbiI3Swz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:55 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EBF166F03
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q17so5710984lji.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Vvs57g2TtEolpp4ZFlJoP4rbqbmfKcfrutgkyuc0y1w=;
        b=bbJ7/Q/eprS6JPVMxtnJngFwpxlxjdI8ovT+tZa/6LP7TVgA1/LU31+SNeKFzaLh+P
         SKkHy1DJog1Bscjj0yjJ693ZwYi3BNudGIJmbcpF7j5rZqruvmJs1MakesLdqhnMcEXk
         qDo46jzUxqHNOTpJEXzSbSb8hbtjfpDwPdUpU1Q2Rhq5+3M/PiX4JqR+7UtlUxyXUtQe
         712zmzLpEMKHGY3syeOUvgKcMe217Old+r1HCl8LXiaK8SRMsdSHHasOphJxUkdLEjuw
         34gGypSW8wNhvIM8iOPSF73bgoCxz9b1dHaDiF1ccd7I/lJ41RFbV2BRFqlXmHhdXf+k
         yz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Vvs57g2TtEolpp4ZFlJoP4rbqbmfKcfrutgkyuc0y1w=;
        b=Y20a7thoLq6XIYz5btf1OjgrYeohXRcVPj9wiiHj2gLBkfCfG2z1La3WusqnkMCYD0
         9DouH+EKhu6MBCZKPROWlLXwBtlx9pBIuuLJll1bnSgaLLMr0n0km/GLgJEydRA/BinX
         U99VZXTAY5YrA5nUytGM4xMYjLmVfETlv35zvK2ww0Pktc1pAuAhZs39Bhhgxi78A9x0
         0r6ZKFrJtssd4PXJtN1l1Nj/2pnYA/yoKg+oH3mO3Q3Aaet4wDwVo+1Ial27tGwH6vZh
         NmfJ0xpJFlghAy+XNb304oxXmmnNE8pF57Fed/kbDrztlnsRDrZhCAy8mn8bUU4AFu0W
         tDKQ==
X-Gm-Message-State: ACrzQf00zvauOrWNp5Z2IhYe9Hu6247JrpEocm8LTSqSkxz3WVunAeI3
        9W2ofZJo7AexHBPgRnMTguEZQQ==
X-Google-Smtp-Source: AMsMyM6l4LGqInQWwXGTqv6N6jiBWzyO7e7gUl8q7hnOe9evdtto8upqv2tpvVM0ag+6AUqRVedeKw==
X-Received: by 2002:a2e:a601:0:b0:26c:4149:251a with SMTP id v1-20020a2ea601000000b0026c4149251amr3169705ljp.348.1664563970607;
        Fri, 30 Sep 2022 11:52:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 18/23] ARM: dts: qcom: msm8960-cdp: drop unit ids from regulator node
Date:   Fri, 30 Sep 2022 21:52:31 +0300
Message-Id: <20220930185236.867655-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

Drop the unused unit id from the gpio-regulator node, there is no
addessing scheme in the /regulators node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8960-cdp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
index 9157e3c4f48f..cb0f612e6c90 100644
--- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
@@ -18,7 +18,7 @@ chosen {
 	regulators {
 		compatible = "simple-bus";
 
-		ext_l2: gpio-regulator@91 {
+		ext_l2: gpio-regulator {
 			compatible = "regulator-fixed";
 			regulator-name = "ext_l2";
 			gpio = <&msmgpio 91 0>;
-- 
2.35.1

