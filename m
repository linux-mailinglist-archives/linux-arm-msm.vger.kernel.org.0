Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB1878D85E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbjH3SaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242918AbjH3J6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F791B3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:46 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1465777a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389525; x=1693994325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKtgdDeh3KGEuNDRaZoZ19ZkmrfCqDJYBlZVW0lWVIw=;
        b=oRgKORGQ4IjGWo5kvSfaotzAPwxitDtK0ILXoqAtV2gfr4yjFH41ndOaRTCeHPmit1
         Cuhhcy9mVbhbwe9YwSxd66AcinmBEaAYLACkuydS29uNg0OosW6EHkdjNYAvgxsMAr6e
         1Z2HI+Y8hxZAVUOmPyTljmWX3GF1cc34lfSiYgV/cXbYn2Wt3Fnwcqsiz26NWA69lolC
         H786Dy1vBwayvVf8B8nBjiedA6NE0NCgQlO+XfYIboc02SHNIxCguqpdcZaVPiz29Hq0
         9OxJ9zu7B9/JQlsOCnZqfNUto3SYXu9dkXN87Ao3+C+tyniEIBVjCPZYqOlm2qOxYJll
         zh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389525; x=1693994325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKtgdDeh3KGEuNDRaZoZ19ZkmrfCqDJYBlZVW0lWVIw=;
        b=IgQJEB9Sg9xFSniYaT1c/pPytFIquzViBv3KYuTMzLJxoC0BtxQyn3msSC0XyZwQcm
         IjDP2UChkt2N0Cs2eC7ahIRTswsNU1flFUbYe7RXKCZ4oHzV2nzsoy8iZEYw8J40hBat
         6XKFSVSK+YRKabPCpAib5WDEXYnxEWZSAneoNIDlU3/KeWH9E7AVkMqXyEuBukzSNQl1
         5IZKRtx/4uwTxmVCIJop1h41cvnDRDAlmlNKTHBMp2aGFPxfoQuUZLsJH6pzO/rzShiC
         p1si5TPICEYldXZu82w9gicrIn55ZvFeX+D6cDhOVPTCEARH4obg9kpYirkkmcK1EHtI
         faNA==
X-Gm-Message-State: AOJu0Yxzt4Fvt3LWfknfYBi8si4blUkVs9tiZmST3+KNuqacTuGnmCuz
        9KDqRYKY1bkADLFo41dyMRukdg==
X-Google-Smtp-Source: AGHT+IFvaPiFN9nageuHk31s1vdZkno6Ubq7GZhPBE0O982W9QQGDgTFFzP8fTeAc7MFi4EBvubAIw==
X-Received: by 2002:a17:906:9bde:b0:9a2:1e14:86b9 with SMTP id de30-20020a1709069bde00b009a21e1486b9mr1942919ejc.0.1693389525352;
        Wed, 30 Aug 2023 02:58:45 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:44 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:27 +0200
Subject: [PATCH 02/11] nvmem: qfprom: Mark core clk as optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some platforms like sc7280 on non-ChromeOS devices the core clock
cannot be touched by Linux so we cannot provide it. Mark it as optional
as accessing qfprom works without it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/nvmem/qfprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 14814cba2dd6..739dc502b39e 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -423,7 +423,7 @@ static int qfprom_probe(struct platform_device *pdev)
 		if (IS_ERR(priv->vcc))
 			return PTR_ERR(priv->vcc);
 
-		priv->secclk = devm_clk_get(dev, "core");
+		priv->secclk = devm_clk_get_optional(dev, "core");
 		if (IS_ERR(priv->secclk))
 			return dev_err_probe(dev, PTR_ERR(priv->secclk), "Error getting clock\n");
 

-- 
2.42.0

