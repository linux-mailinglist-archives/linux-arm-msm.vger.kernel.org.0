Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0EE63D495
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiK3L3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiK3L3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:29:46 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564381A203
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:29:26 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gu23so22367611ejb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=g4zwRW29WPpz2thZu61KxOT33kFiYPjdJn8O5qYNxPph6DuPgMkHYs+nZcWacaCU7f
         gTxy9hKOIGvnGy82GX93mzCGf1z9/2d4ExSz35UcU8LJPhcZfY9TPzS7Oj0FZModf2Fv
         DEs2Dg+vdjOooKqMblRPEQ0gx4xCeX2raSuGdnHaM4ojj/PB7wRFtHjbcKXTAfNGK6OF
         HaB3AJnXLs/im/ez+So+ShqbWZ1LSObv1r2+5C7tB8g5//SkfYrJ8nTsVDO5dyJ6jDd0
         EYCa9bfzgvZuNsTjJqjmfHTc+Izp27IF+JuO7pGOnEYXgFUHTK3PuYpuI+r5j16lxGVt
         xiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quL6WPeERZYedqB/nklThp0WUV+KiBC4sy50mhyRH+A=;
        b=8B2dbXztB+9+ckSvETLoAv/knP298lL9ENLoHZRHualtjzMgK+/FadNnUTpubWUaXK
         5h42KJwFKjkiUGF+eGE4H4H2qXTTK0EIxS7QyGEpgt3AU/Hq7IVakgslspIF5kHIFEqc
         m2YyegOA4p/gLkC9JoZPLb4T1Iq0OiFD35C5RBVNr2D6VuDil94OvSc+N6qfzfFVG/a+
         vxIUT3HhP3ed5Actc+iVDYt1JvhVs7jnPLp3NWgj/z1OKaA2UABPm1zFdaBHu2XzD1wU
         5DHZuaykeOZmFP44PlblGJmEmjFUiBNEN4Usuzmbns7Ry8XX1iKgn9WAerTmPtDudJgN
         tPBg==
X-Gm-Message-State: ANoB5pniT9C6EHb6QhywzTB2V0oIYnmq0sCTS5MMPxxGt3rAAcK3/rz6
        NBG74u7tsZIA8HNbgM5F7orNBA==
X-Google-Smtp-Source: AA0mqf7z9P491em89qUagFeLR3nXWgGsebtZg2qlrn0Cni55JOX4TOd7qtW9BMO5z8C4xvnwCcNG4A==
X-Received: by 2002:a17:906:448d:b0:7ae:37aa:6bf with SMTP id y13-20020a170906448d00b007ae37aa06bfmr50974954ejo.481.1669807764892;
        Wed, 30 Nov 2022 03:29:24 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm521593ejf.202.2022.11.30.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:29:24 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 7/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Wed, 30 Nov 2022 13:28:50 +0200
Message-Id: <20221130112852.2977816-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112852.2977816-1-abel.vesa@linaro.org>
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
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

