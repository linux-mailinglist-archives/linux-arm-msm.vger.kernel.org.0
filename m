Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB18644E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 23:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiLFWpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 17:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiLFWpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 17:45:24 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E743E082
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 14:45:23 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id t17so9944684eju.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 14:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=km3sc4WNJHj66j5ElBLj6gCEbFo3eGIHA8T8y3GC0hSe4ObdQIKin1e7rmMNNmMwrl
         DORT7+YpXsTjcOk2cn2BGWdRpCVG4Iyumpjt1nNEMl7j/gHi6fXdeu6pP8gIb7KOxFW3
         40wS2R3F8/dakst5nRXTpxTLM33grVYz0sJaenbubOjlf20Gtkl8RNMOnqJTm7GXh+ZF
         lhBon/lyPd+ToD2e7FsW00d/dFKpDkGdw/HBMgRIf2lr4CgEm6j4p5vweNzKmLWBY19q
         14h+DlPMwAive9J4aOCnhQa5sj6NeuQ+pPL9te9ONRBWZpircLclEmkZaga237uLOlnY
         +TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=ZCz8w3e3Tm43ZCd2kbijNm8gTdedTBhnbDqK2Ifa5o5+9wA9Nq3B6lGZEmCpyB0aup
         XDVkrPVto6IFPHVrYVwX7M+zMKP9xL+n1+Y4DrOjthbP/iha/jlwdTNBN4AS2hgU7BnM
         8s3kVsKqGIHKX9BRt2Kc+yWod+/2FcAfdDYqUtMUN80bjFDw92M7eU5nyqo86ZKHZ9cE
         7Fh3ZuropHbEuJGHTaxdBkSZ9QvhV+sOQ1u26CQ3bE8ruFw7dGSj0CZxrKn/SUEFUs7b
         EnfDb5pblJZ8qyEVr1ZlwVwsMkd0gvhUrMw2LY5rGejiiempXyhYciqbu9anoJQ5USNl
         i+kg==
X-Gm-Message-State: ANoB5pltkZ/aK//Bp4/v3BSM227kbTMKM+SnK2PsJsd0W8fdwm8X/VJR
        9KZjmS1dPzFhUQO5UGuoKbxymA==
X-Google-Smtp-Source: AA0mqf4mhucr8q5TNMbO4UMt96Y5U7B38CIRZFcZoeKoYmM4xcvKhMHJL1+5vX7dRKNkeEuBI0U0RQ==
X-Received: by 2002:a17:906:3a41:b0:78d:9caa:31b7 with SMTP id a1-20020a1709063a4100b0078d9caa31b7mr62814250ejf.263.1670366721498;
        Tue, 06 Dec 2022 14:45:21 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b007c0985aa6b0sm7820772ejg.191.2022.12.06.14.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:45:21 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/5] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Wed,  7 Dec 2022 00:45:11 +0200
Message-Id: <20221206224515.1495457-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206224515.1495457-1-abel.vesa@linaro.org>
References: <20221206224515.1495457-1-abel.vesa@linaro.org>
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

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

