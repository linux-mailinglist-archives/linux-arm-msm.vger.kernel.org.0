Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E5C5E925C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbiIYLGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbiIYLGU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:06:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9231E31DF0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:17 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id t16so590407ljh.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=C/wNr99B2GiUlR8zUtFoudPrSaA10BysS6EdLdtxQpo=;
        b=q5sjHjZH08xL8H1+KbHA+tjykZzFLfv4FLTpMC2SFwD+K/q7No8pq5kh0PQGV6wSXD
         JIcWMob3qfC5yjs11E1rdgqssGmIbbbXrhIUqPAn6y+wvRd+lQjuhE7mWK5yEmnKPtpD
         W7H1crRNCF28GhUhVpyTB8Dk5SX9fRu7UETafoLRKJUfS7gL0LfTlCZF2It2ENKl7N0Y
         U3RCexl/uhJlGa5e9kfMIfZ97u7KxAUzPCUsyWAPvpG9ShZiCC39/jSnWIlxgUX0gmCm
         7lysvzdQJzMGOgpHe+uS1Nzq+FGZ4TBN4s51x8Z8l3cyA4lBrBzxHpi0FsIOsWHO0Dcn
         zBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=C/wNr99B2GiUlR8zUtFoudPrSaA10BysS6EdLdtxQpo=;
        b=0DcxVfc2IcuEMEeEt0QzwN7CUvIb8EU6bMSagQJZHiUcAOOm8fv6lDwjPKbVOkCAFQ
         R+hSdWY275yGzQgptIcLMl3L3iODED3RntL+MNj4BrNM9mRaN9Ildfb/otAX4knjU9Mx
         YprCyO0lDvxdpEcws8glCHNf4e8yLN2beF/b3wm/DUJ/+rlf/vhx3rdZ68KPSsR4erQn
         Wn1BMgyGVucTYn+Tee4hOZcQ7aJ7H44pZYplKgn/iWaQ2/kPAGqWIw9SxkLJgq5K3Hx4
         yLa0iutcFUyGFWKCzQ/KkrI1meR1csABm3eQ2vV0fLESI7YW7Q1UleAfAUqpQwwarFIP
         1CCQ==
X-Gm-Message-State: ACrzQf0060YoWpXhvM4ync9y8wvXsD8S4lTD8Uh1kkkkupIiCDQCIhW4
        g6C6HX4V9zwpnl85NVxShBZqOg==
X-Google-Smtp-Source: AMsMyM72JdDAK3wnFMe5qxkdnn5tOrv4q3177detMxlGlkr85J4zXrick+TT4nzMdIn/AxhN30dx0A==
X-Received: by 2002:a2e:b8d6:0:b0:26c:4776:ba2e with SMTP id s22-20020a2eb8d6000000b0026c4776ba2emr5562540ljp.143.1664103975877;
        Sun, 25 Sep 2022 04:06:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/15] arm64: dts: qcom: sm8250-sony-xperia-edo: fix touchscreen bias-disable
Date:   Sun, 25 Sep 2022 13:05:55 +0200
Message-Id: <20220925110608.145728-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

The property to disable bias is "bias-disable".

Fixes: e76c7e1f15fe ("arm64: dts: qcom: sm8250-edo: Add Samsung touchscreen")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 72162852fae7..601a21c381f8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -613,7 +613,7 @@ ts_int_default: ts-int-default-state {
 		pins = "gpio39";
 		function = "gpio";
 		drive-strength = <2>;
-		bias-disabled;
+		bias-disable;
 		input-enable;
 	};
 
-- 
2.34.1

