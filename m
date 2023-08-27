Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DE8789DA3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjH0LvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjH0LvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:51:02 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2323218F
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso3502014e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137053; x=1693741853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzx9Bm824S2wRWYFO7S2MdJvHvf/jzSVekqRFumNr7k=;
        b=VKlq61LG7eiUVDlCu1oOs0TkRJTbsYvQqWvjCRgyDh4261NSRyrk6YloVEyca0sTaF
         29YwGLcuj6pb1PlsAaw4qGzLFP67VXskypHQxXeV5Qoj1SFR7jCgT0H+msqeKhdMd9+M
         cDLwdt2Tdlf2U2bSFAIuRR1nqc/1EjZAQakEXu/Oh1IE526FkyhpBnL4ABWEgIlE3tEy
         juQNJrBC6Z3ON65rfiELxGYXrzkTeM4cmNs4EPGZF2ySaLVaHDq1d4DjwseGf6g5LVt7
         vDfduzDIUESXJZ0rz6Ly9LZtPTVI26zgg16V9AGPwTOn3T+ufczczVmkdEFTqBNf0OlG
         AkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137053; x=1693741853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rzx9Bm824S2wRWYFO7S2MdJvHvf/jzSVekqRFumNr7k=;
        b=QWnP8jxpWOGPnOfmYlaFq3+LOMT9EN/jiUQQxkAJPJzGjEBHig0CCOb9WpgGk9ZuCd
         kcMrhR09MgP0eT4DuzXiG7P7vkil20CyAa/fX5JoV4hlXjrKJh9BLdbeBInMQe7/OqtH
         MMCWKNPCvZvTGvIlZtLtVK/0izGjtL1kVSjlXK5j14SJ58uHDb4TfNOXF75h1i96QXl2
         uci0lRNQ9xemxvjd2rI7tFeYdF6Zh1vDj5LO7/rQ0QJTdIA+r+34Kfv/eq34JmT0llFL
         Bf3o96PDh8L9/PvvqLYdDcbXvi8LExd1MYuODFzt+HC2Ek1NGoi76yN2eiaxL3mX1gBx
         E9hQ==
X-Gm-Message-State: AOJu0YzWynvAaB76kGMYNQ/Lm0xZ9M0fgPfjkQr9HsO24EPkewbneEfJ
        Z5YpWsKalhxxqsvadAvcysdj4Q==
X-Google-Smtp-Source: AGHT+IGqlgoo4wUMXLVlAqHZbEMker1couiI+m+u0qpCzAbR2CI/aAjORLP/ZrpQrfkF8v7v6brvrA==
X-Received: by 2002:a05:6512:4026:b0:4f9:570c:7b28 with SMTP id br38-20020a056512402600b004f9570c7b28mr20427762lfb.32.1693137053533;
        Sun, 27 Aug 2023 04:50:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 23/23] ARM: dts: qcom: ipq8064: drop 'regulator' property from SAW2 devices
Date:   Sun, 27 Aug 2023 14:50:33 +0300
Message-Id: <20230827115033.935089-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator nodes show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index c3677440b786..191d1cb27cb7 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -589,7 +589,6 @@ acc0: clock-controller@2088000 {
 		saw0: regulator@2089000 {
 			compatible = "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
 		};
 
 		acc1: clock-controller@2098000 {
@@ -604,7 +603,6 @@ acc1: clock-controller@2098000 {
 		saw1: regulator@2099000 {
 			compatible = "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
 		};
 
 		nss_common: syscon@3000000 {
-- 
2.39.2

