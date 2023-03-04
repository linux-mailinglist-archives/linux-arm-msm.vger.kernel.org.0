Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 168BC6AA97D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjCDMeV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjCDMeS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:34:18 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D796C1C58B
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:34:07 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id s11so20489676edy.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677933246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8yQ1qBvXQ9opSpVPmf3vHZw3VB8tmpxiwvms9bjU34=;
        b=RxGT6RcG2w2hfRNvgcK0QBGl13MH5HZDryPOr9kYVR+dwQZmf/uYpFs5UKRMmXraoE
         JRvPtVj/5wW+EkO8wLxJJYGHHFvm8duCRjig4rCyvXrduvL8ixujfkoei+jRX5ubWyVi
         cPL8W4iE2t4z4wrabt5BVWf1NQGgsdUb7ikI0UOJfFHk6vb/30p14ueAEurmeZbYWgPD
         9DmnkzuJEABEgfKB/d9AcwaByqGTLQ2A5albdOpwE4xhtfhJzhmwFivGsNiHM+3rGXTg
         ozB2upkrWOkRvDraXCBTfDiec8xZaJxgPFouUJiQhDkWdI6VEr3HqABwqdw7heWeSz0K
         pHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677933246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8yQ1qBvXQ9opSpVPmf3vHZw3VB8tmpxiwvms9bjU34=;
        b=4rBhzljSXIL8Dx2SbzGDFDwm7baqnlVGd4qcNy/byzHfR9FEo6E0dwi9y51o3D+2Z+
         oUfaquTQ+6YUyC4xE9MfEnGO/bAA71GN/t9bA9UnlIcJ7ULu82YA0buoogroN7T/Y7Fg
         uhqAZEDhUoSULRMHEodp8mUA58z12SWgz9iHEFL3gO8KBEZw4SFJuAwYMSGmzznjdzzK
         Qa8rZ0y1GKYmsS+ufU7sZ9RRNOjkF5LaJrxzEaYUCjvHg9t4umu3MvfXhbLn/02yTExN
         WuNToFjor9oaoPKjP189m+JZwofLfCcv2P82CLcdAj/OYl7AnJE4QTZ9Ey07mybAJu7O
         39tw==
X-Gm-Message-State: AO0yUKUHp58iCro9+1Yh+5Wm0tnKrGNtAwZu6OeHR4UJBV4H/Mgkmi26
        aGjyGke9U1Y0CNgOO2ejO3udTA==
X-Google-Smtp-Source: AK7set/qFWIs4RMOUVdgNeis5COP6IMIphG7C4tIH/jCmeT6Zz/hdGBOGHHjE2FyHxge3eL4t8J8Ug==
X-Received: by 2002:a17:907:8a06:b0:889:ed81:dff7 with SMTP id sc6-20020a1709078a0600b00889ed81dff7mr6186765ejc.9.1677933246419;
        Sat, 04 Mar 2023 04:34:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id q27-20020a17090622db00b008b1787ce722sm2017087eja.152.2023.03.04.04.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:34:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] arm64: dts: qcom: sdm630-sony-xperia: correct GPIO keys wakeup
Date:   Sat,  4 Mar 2023 13:33:55 +0100
Message-Id: <20230304123358.34274-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
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

gpio-keys,wakeup is a deprecated property:

  sdm630-sony-xperia-nile-voyager.dtb: gpio-keys: key-vol-down: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index e52580acd5c8..2ca713a3902a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -112,7 +112,7 @@ key-vol-down {
 			gpios = <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
 			linux,input-type = <1>;
 			linux,code = <KEY_VOLUMEDOWN>;
-			gpio-key,wakeup;
+			wakeup-source;
 			debounce-interval = <15>;
 		};
 	};
-- 
2.34.1

