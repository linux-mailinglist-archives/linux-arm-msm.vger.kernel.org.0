Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51142648F6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 16:23:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiLJPXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 10:23:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiLJPXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 10:23:50 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEDC15FFE
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 07:23:49 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bp15so11498858lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 07:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exYMzaZr/kQLcbfHTOiS5XZ19wPMTGQEdFPGl9xrdn4=;
        b=IXuf0wukVUXjMtH7bbyeA7xFdEuqgfGgqdpeL5YbDYFg8H7iPhZjMMD9OrYDwfa2y4
         kfjYcBD07ByqpxqtC/aqe48rvyTS8tJbfFu5hnFOnDydTNU9I0wSD1Y3kkK726LN5lii
         pctk3FhC+XxJu4csK/wjkw3GcPzt/zCnyEbktfly88K/WYsXNPlxR3bDxwTd3lP+gHzy
         kqW3e6BMcF40H7H7pE17BAO0F97fOImvD+/RsA1mbwnDN/ZYLeRzODFiMqXH8zJjILlr
         TytdQDdqMfLwkvHlDZ5WzbRjOoKWhBaIfXeiOjV8Wafrxnyd5K1CKe4DBnaGi2Tuh+t2
         NB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exYMzaZr/kQLcbfHTOiS5XZ19wPMTGQEdFPGl9xrdn4=;
        b=ov4vywx4PZNjRrOcO2nAfandFEEDpBt/S/F7nSRSDoO/4bR2hTOnQDDiSL4JLOWMSQ
         Rw+1ELSDNpHzq+d63YCdx7Vei9YfpEWw+iGVT/jDXdJJzyuf1euIkvS6IShRfSMLiS4k
         hiuTQQHZYTRYwYwzGwKC5esUBgzitGEteAU4Hnug+PhXe0sOYLNoqw36NiDaJONDMg+h
         ug9Hpm/OvAHShCS6YsytnJC7RXnBUL7LUhP65XHEux3Own/qMD15k0s1vG+Ru97dCfC5
         Ycy1PlyMx+3U4gvTQOUbaR236PeGP6fZrh6jyTR3t2WmqSJsaFlFZN8oMA6oLx8mucUv
         JK/g==
X-Gm-Message-State: ANoB5pkLDaRJubih3UNwAoqdNY179iuxTcDBZXjERxvx0i8pfMwNaWkW
        1rqBdPjR4d4m/+0P9lFE6JHU38rUPVzGfcK8
X-Google-Smtp-Source: AA0mqf5tLFh6y+G+uNwBq/GjqU92UxZqJke7DbSrFkOYhRmMXFbGl+1oNT08LMkkm1UzNoa+P65xXg==
X-Received: by 2002:a19:7010:0:b0:4a8:7434:65e1 with SMTP id h16-20020a197010000000b004a8743465e1mr2495041lfc.12.1670682332163;
        Sat, 10 Dec 2022 06:25:32 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b004acb2adfa1fsm739912lfc.307.2022.12.10.06.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 06:25:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8150-kumano: Configure resin as volume up key
Date:   Sat, 10 Dec 2022 15:25:25 +0100
Message-Id: <20221210142525.16974-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210142525.16974-1-konrad.dybcio@linaro.org>
References: <20221210142525.16974-1-konrad.dybcio@linaro.org>
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

From: Marijn Suijten <marijn.suijten@somainline.org>

The volume-up button on both kumanos (Xperia 1 and Xperia 5) are mapped
to resin.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index 9d667bb6f25b..d64f2b04e267 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -486,6 +486,11 @@ &pon_pwrkey {
 	status = "okay";
 };
 
+&pon_resin {
+	linux,code = <KEY_VOLUMEUP>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.38.1

