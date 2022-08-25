Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2623C5A0F47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 13:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241655AbiHYLeT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 07:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241549AbiHYLeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 07:34:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD4EAEDB3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 04:33:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n15so6739035lfe.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 04:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rAhRbS5Hk1kN9gbEDWwLBULDbxnKhCFi0FL2yZCunlY=;
        b=Av27/C5NVsVRQaqJAXLuQXpw7HiV0wJTfn+9nSBgWIEud3WcL3Gft6ynC1JScUbV0U
         ino1zB+WcHBvRYvbhkOAF+Iu61iV1unfYEaIQ8NL8Q+NLqQCaqr5DT1TYU2igBaf/rzv
         ePh78adyk7hseBfuO5jxF4HevbhOAaMgm0uvEPO583j3CiLRzFGcBO/y4RwtCCLPnOg1
         H2u1I91QEmubGJuRuScSZmWG2x0s0Vq4yYVDSNw6sc1f+urBWA/mrIExWkVxyto0bCrf
         UaXCyMebLCQsdx3Ia9yVdSBGjO44wZqz98mb9P33oDOQUa7tGbWYVCYuQ/PostNU+aLI
         ajzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rAhRbS5Hk1kN9gbEDWwLBULDbxnKhCFi0FL2yZCunlY=;
        b=x6FN0QelEo47NtSQNBN0VfxO5PqX2fFbEnd+dPKyMuZsin8RSGb6QzjBdukeWjrSZY
         Pvxrj++ic+jQfU4jrGhvcDbZdT2j75Wg3blOW+uR5Jz+84uTZtdIDHshMQAPmlzwokjt
         3AJltAGpp/OIu7Uauil9Fkj5Gb83URJAg2LJNaN9hfAQOCGfM9mmVr8p9pfbBHfU2Q8+
         xgxwKysCSF7isoPR9yN/SkaiWRM5tEbrYsGHYHnDaHfJ2qCNtfvODq3ZtWPrK7s71IYP
         h3arPRCs16NOUfMsxV3E+qJIC5T3uiKcxHKAcMw2/vvSzK4oSpNB/Lo7IoKKWb7NDm9g
         2nIQ==
X-Gm-Message-State: ACgBeo3E7/lR6VFxzVmUa7798Rr0WhhEENzRfrs00OZ71m9e/rgrksAv
        wglxt8Y6dUjD2/b4cSwIzl/41g==
X-Google-Smtp-Source: AA6agR5ARi7uYm75nWPki92DVWkyl/mNNshlJuokdO63dhV9ChVFh/gL131JyPDDh3uXbw7046OIIQ==
X-Received: by 2002:a05:6512:b12:b0:492:8943:c813 with SMTP id w18-20020a0565120b1200b004928943c813mr962504lfu.143.1661427225903;
        Thu, 25 Aug 2022 04:33:45 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id e18-20020a195012000000b0048b0aa2f87csm446764lfb.181.2022.08.25.04.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 04:33:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marex@denx.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] dt-bindings: crypto: drop minItems equal to maxItems
Date:   Thu, 25 Aug 2022 14:33:33 +0300
Message-Id: <20220825113334.196908-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

minItems, if missing, are implicitly equal to maxItems, so drop
redundant piece to reduce size of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml b/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
index 676950bb7b37..5b31891c97fe 100644
--- a/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
+++ b/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
@@ -24,7 +24,6 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
     maxItems: 2
 
   clock-names:
-- 
2.34.1

