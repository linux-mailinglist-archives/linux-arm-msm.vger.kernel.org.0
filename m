Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818EB7B197C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjI1LES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjI1LEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54B0CFE
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:39 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so20106663e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899018; x=1696503818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPuoBnKtEFgCdxUoOIFl3Fx3Gw36qHVcIvB+5tSO88E=;
        b=zWXkJBg4JO6dMsh9Fjh0LCuQDFnGVGOThYr+cIQa9TSbrVdh8wF8rSrIo37D0WkKqB
         b5mVRu2CRVrsLskyDsXpjQkz/tguADtxsT3cs/jMMBZJinuO2bSws64BOnqtdYYLzfLe
         M5Kk/1t6p15r85q8xABcjLFyAuC+GD4pXxVhzSuzpt1avtNpUXnhtuS9DkJZU2KNkto5
         08w+5D9kIcz3FJpcIWQNlqS0jutKwWysEszvdW/aXlwJn+mA0/sBlumD/IbkdJZiPodW
         b1tbRDDubaxJf1+9UMcjrr9WsuzYF+B5nxHuv1e4wyblNQZLoijsHJ7Ca8oJTKo/EOQa
         kZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899018; x=1696503818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPuoBnKtEFgCdxUoOIFl3Fx3Gw36qHVcIvB+5tSO88E=;
        b=ecMxUYzvYc6SDZ+1J5lLsJokL7pIxZCz5LgzXdx/2QEK7uneA0WfzHMR2BYyFU66Hd
         wFW/JI3CpouG+jAsEZ+/D97/k12JxeMJeXp4cG6fdqq5duDZFzWICcofaPLu2REhMWfh
         qgIYxaI7+zEHjU9ErSSTJv8bk+D8G76sHx4Hxnfm799Yaw3Qrs94AlTDlPxys5LrDqjn
         WQaFkjJS59S5RyVTM2UZvcfXQQ273k67Ft3OoTgM8JErq6CIiAHFB201dsu9IkU6edSB
         CwA8kx1K41Ka7U3luJxAJLgksB3KPQ3Zh47KJAf0O7e44sU2iI6tDPOtQMvKhJlsHfFQ
         4JPA==
X-Gm-Message-State: AOJu0Yw35cYnCmcHDWdcigMPJ8/XlOG8wBUpUT18t8KICe1KdK/HXud3
        daUZ/d7mrJKlCI5l2ovCI36oBw==
X-Google-Smtp-Source: AGHT+IF/M9Jyw3OeLTaqNePUWIKm53MEV/E7kAJpZOWwgw3jIhAUfBVCpdbH7cR5iqM0Tf/kY07Tiw==
X-Received: by 2002:a05:6512:1150:b0:4fe:8c1d:9e81 with SMTP id m16-20020a056512115000b004fe8c1d9e81mr1007934lfg.36.1695899017918;
        Thu, 28 Sep 2023 04:03:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 31/36] ARM: dts: qcom: msm8960: drop useless rpm regulators node
Date:   Thu, 28 Sep 2023 14:03:04 +0300
Message-Id: <20230928110309.1212221-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The set of regulators available over the RPM requests is not a property
of the SoC. The only msm8960 board file (qcom-msm8960-cdp) also defines
this node together with the compatible string. Drop the useless device
node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 774f507fa25a..f420740e068e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -200,10 +200,6 @@ rpm: rpm@108000 {
 				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ack", "err", "wakeup";
-
-			regulators {
-				compatible = "qcom,rpm-pm8921-regulators";
-			};
 		};
 
 		acc0: clock-controller@2088000 {
-- 
2.39.2

