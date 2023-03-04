Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25286AAAD5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 16:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjCDPje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 10:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjCDPjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 10:39:31 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03CAA27B
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 07:39:30 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id t11so7326151lfr.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677944370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXa/TCpVNEWyWlP7s5FovRg6HG2GrupX5kByuFYwqVw=;
        b=boDbMYdVX6/Y8u0jawoTUBOLG5gjvRu8THsESIJEc6NOjpPXtJ9FNhYOnwJEUwVMVS
         9jt/f/c0IKfYEIAoY/sthuXAedtCvqHDweCseQKvf9sK3Devq414jrmEA3d/TErIuODZ
         7TCBZEPIZxEbJs9lH4/lYsTE9+xAciG2QXV+RQf3nCLut4Ei+orI83DyJ8VDmcmcQnSj
         zltHBNanX12FyYqGSA/SaGlqIfUTgTE/FT/Hj6o7oQpDsmMGMZ6nB+gI8/Ns3D/D0nX1
         Nar6cJO41hk0HSINJVhmJjg/O/tpsqgTLJO+VWIPpnteiJqbzNpz+XyVcf7BL+5osG9+
         GsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677944370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXa/TCpVNEWyWlP7s5FovRg6HG2GrupX5kByuFYwqVw=;
        b=IQA+VLGSMMZWPrimE/i4SkFn0Dfm2ADzvN3Vv5VbAtZx779Uc3WXVvzd7wPn60x7gR
         TBbDWc+4hnyjmaZhlHVLup1xFwE0QZgQOBonYySTkWnU4zjlu/cA49X/M0wbad+0eCwU
         By0rMUuwupqnnSVEXxnttQB+xxzOlpmWcKPkHTADcq8bl8C8VAy288VInvgpeoeiO9FT
         9rRiKgkcDEjQBlvbgGX3PhXXRXNW6ZVaydd53iWwjEjAKIOA/IoOTSiU+FdL2qf12VZH
         veGyOOoBnORPbBareZAaKUhqdxUPspM5rty8QksQwROnX1tb4ENdEhfmuPaiLnI9iKkg
         6j3w==
X-Gm-Message-State: AO0yUKU8crWiaOMprcjSdbXBgqwxvkh1FAL+9J3+/DbmSzmzLtIim7IZ
        Pgz+FVYKemWExrRLkfrFj1uBpA==
X-Google-Smtp-Source: AK7set/sBMjzA4I+wi326/+Td/U5LnpEQA4QFfR9NgGBlMZNWl0tdWa5FiQiXUZ4t9njtghrh6OhfA==
X-Received: by 2002:a19:5203:0:b0:4e8:28f:82fc with SMTP id m3-20020a195203000000b004e8028f82fcmr26120lfb.27.1677944370368;
        Sat, 04 Mar 2023 07:39:30 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id f14-20020ac2532e000000b004ab52b0bcf9sm855065lfh.207.2023.03.04.07.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 07:39:30 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 04 Mar 2023 16:39:21 +0100
Subject: [PATCH 3/3] soc: qcom: icc-bwmon: Remove unused struct member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v1-3-e563837dc7d1@linaro.org>
References: <20230304-topic-ddr_bwmon-v1-0-e563837dc7d1@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v1-0-e563837dc7d1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677944365; l=784;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qWo6zMTpy3xe0wyRSkH90VHxKiqh5/knTMsgd/eEzYU=;
 b=BB0zfXIufSgOmbYVaimXXk2UXPtwIjqh1tUplrVjqTKNuJEYIjVY+3Iwr9xtelTbkp5r/tnwgSqy
 0rLjhymCBgpCo0G/gDG7YDGM1V3JGGXplngv+6wU+5UMjMUQVzVV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

bwmon->regmap was never used, as the regmap for bwmon is registered
through devres and accessed through bwmon's regmap_field members.
Remove it

Fixes: ec63dcd3c863 ("soc: qcom: icc-bwmon: use regmap and prepare for BWMON v5")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/icc-bwmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 9ef632d80ee3..3f88ccedde60 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -189,7 +189,6 @@ struct icc_bwmon {
 	const struct icc_bwmon_data *data;
 	int irq;
 
-	struct regmap *regmap;
 	struct regmap_field *regs[F_NUM_FIELDS];
 	struct regmap_field *global_regs[F_NUM_FIELDS];
 

-- 
2.39.2

