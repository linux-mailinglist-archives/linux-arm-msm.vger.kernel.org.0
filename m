Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E566D5F11E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbiI3Sws (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbiI3Swp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBFE16513A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u18so8191580lfo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wvJVKvoCQ5qJ2DTHRpXFu1GqEVfliXf7Bt/kHVPCjd0=;
        b=bOUGyRgNMqL0CtSWlaWpnL0DQi6CMUTSd6bah+13k3HnZ40vmKnpzdafU1r8OHN0Qf
         naNZBLV1k7Udlv6A15AUrtVOKUpgwHu5QLVexnaqFdVr8t5G2X2JFO53fao/nKa+kz8g
         RkZy8HKgfzKnbrPBgUbxmhwqCPhc/iEcgrjOyY8RpGDyB7l6qbcRXVqoztjf2x04yPFn
         FDYfWzQ0ixKUZFVW32Lri1+3jLAkHce3UU3WdKS4vpBG9VAKj39OKdQ9lm8vxbZYdiH3
         LA+SNg7OIfHjQPsw3ZLQMxer7qZNPt9T52eO8y0KekSge3vNq2Iuz/20ikR+xWnSf1sl
         KO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wvJVKvoCQ5qJ2DTHRpXFu1GqEVfliXf7Bt/kHVPCjd0=;
        b=QPZesCEPj0+dJghrCiKsAc0wrnULlX5eCWW9XRtT6QKi+xMkFjBCTCBc+yu9B3Kf0i
         vikR1c8NOpl60/iHB/ONDgjMgMYBaoGmoSZN2Q4J4+oUTBRqSiI5kWMRphcNtNFbnsm2
         smP1c+wIjZUJeJFGqVgR6zb02g3YuqQum7VhbIui1CR2ZaC1sAz03CltqB64KFP/cd/h
         7eJojgTKQAnFi30+kWSNaI2UiMtMi/AYrwlluuaqchUPnTA8C81JOjqF3zMKqTm/Ds+f
         I/bfVzRTkXmYLOy5IJESL6L4gzRWWFhJogCWACiYoxL1+4A9Mwujf2LNn9/O+NInaKWo
         gJ9g==
X-Gm-Message-State: ACrzQf2NlwmhivvbC8O6KJyumxK5xNiISwTeb8PAkea/mjaRDy4cVmTA
        YSo4QSkbD9D5XiBX5fesLJANDQ==
X-Google-Smtp-Source: AMsMyM68BwB4fbzR6/36TqR2nqsRbvZdQSOz3Ld1H07PbhEHOo/PKZe612129NSgVSHX7aRJVJPvpg==
X-Received: by 2002:a05:6512:ac1:b0:491:571c:3ef7 with SMTP id n1-20020a0565120ac100b00491571c3ef7mr3675646lfu.176.1664563962743;
        Fri, 30 Sep 2022 11:52:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 07/23] ARM: dts: qcom: apq8064-nexus7-flo: fix node name for ext 3p3v regulator
Date:   Fri, 30 Sep 2022 21:52:20 +0300
Message-Id: <20220930185236.867655-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

Rename ext 3p3v regulator node, fixing the 'node has a unit name, but no
reg or ranges property' warning.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index 2c661bc51488..9c02dad9efc9 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -30,7 +30,7 @@ ramoops@88d00000{
 		};
 	};
 
-	ext_3p3v: regulator-fixed@1 {
+	ext_3p3v: regulator-ext-3p3v {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-- 
2.35.1

