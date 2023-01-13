Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D87C3669E08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjAMQ2n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjAMQ2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:28:20 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334AA80AD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:55 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id v6so10470849ejg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cev8JO9ebZ2kVXUbo0qBI6WwFSA0zPQINpp7WLll2TE=;
        b=d1ouY6kngEaBGFpL0iWS/Ewsf2jsb7pP+uNUKCjyV3W6jir3XuXdUeHhpMEuMgpcqx
         R1hlUiDY9UhAN95pXqEkXjWLYXi99snlIjrzrWtAL39OoNPkiXYBc2pWKPlpX24Fjhpi
         LLZ1pHVqeOH5BygtDSFgFGTmEopaKp1yAEnHcqnqa8P2k2bljlkD2xJAR3l9VBiugors
         CDezwcsX2kiBPE7jdS0pVQSCqa1y/Sj7/5tuWS+3H9TPPpmhfhazm6mEmuNyY8Sihxqm
         zLa5tuYlWTb2YyOjTNJgw8mfSe8I9f4kQPvKT49C49s3mXpwv9HdKwL7d55L9rk7U+oz
         RbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cev8JO9ebZ2kVXUbo0qBI6WwFSA0zPQINpp7WLll2TE=;
        b=Sgv1eUiD91cgp4iQnPywx3YgDH1m2gdW/jcNAIk9NsXHxGlwUuEiY/JbzdTnJ+VVgJ
         FZpMV9owKGtr0xbB1Qwor6aEfBZJO6SBorFLv1MYAr10zES8M4Li8Jsmuvt6xsiQYgys
         nlaRf+deEPvYxaur6kRfGa26Lx46wnCUkJ/TY7YZ5KOhPwo5tZWOZ9TkG6cymjQxvkoG
         BgfFXPAa4HiGM8AWfWw8RtbJ5ThBTlPIn1chkJ6aHH3KgNsCUMGlUnpHoqSZcPuHKp3n
         RrkSzxxR5IhFpTDDwZNvuhgFQMXgxZQw48OhkYyNdV3akaXzPwNI/KgBpj2iV6LwDqR7
         WjxQ==
X-Gm-Message-State: AFqh2kpSFdBGg+gQWDlTE8F3VLUIQAXHy9LKTwmwW8BIjojnxsNNyLN1
        Tz3TGBJnX5VhnTA5ix1CJv6Aww==
X-Google-Smtp-Source: AMrXdXvD0427AIkKnKyrNqlMjI//jwh3+f4Or15WhEa7aizTrtyBt1SVdRPieqp7yOyb4oe3IkIufg==
X-Received: by 2002:a17:906:7682:b0:84c:e9c4:5751 with SMTP id o2-20020a170906768200b0084ce9c45751mr3538812ejm.74.1673626974830;
        Fri, 13 Jan 2023 08:22:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090676c100b007c0d4d3a0c1sm8739479ejn.32.2023.01.13.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 08:22:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/6] arm64: dts: qcom: sc8280xp: drop bogus clock-controller property
Date:   Fri, 13 Jan 2023 17:22:44 +0100
Message-Id: <20230113162245.117324-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
References: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
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

There is no "clock-controller" property:

  sa8295p-adp.dtb: service@2: clock-controller: 'clock-controller' does not match any of the regexes: 'pinctrl-[0-9]+'
    From schema: Documentation/devicetree/bindings/sound/qcom,q6prm.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index b22e4bc45ae8..5f2bb35a39bf 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1715,7 +1715,6 @@ q6prm: service@2 {
 									 "msm/adsp/audio_pd";
 						q6prmcc: clock-controller {
 							compatible = "qcom,q6prm-lpass-clocks";
-							clock-controller;
 							#clock-cells = <2>;
 						};
 					};
-- 
2.34.1

