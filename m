Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2E162B81A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbiKPK1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232298AbiKPK0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:26:05 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 743B36151
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:23:37 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v1so29098361wrt.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdSAVQ71puckRR9im8mq9rOhaC+Mv88lhj00YQialFs=;
        b=R37LfVZXdfhwaTuCYEskPwFUsZkWIMdaR9ntD1Z58b3k63t8RMlLLIOLZamMzJqBso
         0gNPmLlwqfiCerQMTemZ0D/vo4bcFhIsR6T29fakjhvBAOtkMlqNUQMwlAlsSyVU8gAm
         D6fAIc5GEXgcbFT81ReDCzUWacExTuKMatjdbTln6KN8zJKLEor/Zb9gGh/O84VbTMaR
         MQAELkSgd+Fs/i2qv6ol+f6k88Z7+rAEHIMwjLOERl6fjVx1BgFLMJJldxpKUMhSJ3qz
         e+ea7ktRayMcPZhlTB4qwBOdCCfY7fPGs17SZA52qhtDX/Vf6rTIAafPs5a1BytpXA/W
         s5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdSAVQ71puckRR9im8mq9rOhaC+Mv88lhj00YQialFs=;
        b=C8Vt6oua7j+A0P8+EmS4tNHqEWFl9UvlN8CBCkTvNTuOZFeRDTU+x0Xw4ezOctPOCR
         qdiWJKU1glgX6h+6ilG9wxWKBNOH/d7qpSNX1PqvktaMvJ1/gbw6AHV0mDsVQbL05xmL
         vxa99jByT+XkARV81JxfSExLDqo5GxQdZuCCnHPeNdTt4Jvm1dwDvkKMfgz0Y5SRIuUJ
         9b33s8kJq5I63UTeh7v/Gc2CTLy3AOmF4IXG8/OU0BnEdHo/tYHPtRwQQ/DuY4mK4AJk
         aNUb7JYpOiiN33wgkwUqzUawE5Dl0/tfMbNSvRMOA+hZyaWIvM+SHgj7hDq44G1f9g+q
         jUrg==
X-Gm-Message-State: ANoB5pm31OEj57StI+eJyBNt+Ncg4MK4dmgpeluApYu/vVKK5L4tsWoF
        fWD4fDJHpTQb3FcrY3kX9NsUAw==
X-Google-Smtp-Source: AA0mqf4DbEw1kvnp9Dz1TV1uBQU0fg/bQ2C8GhBHA95/esOJkaZvu0TTNv1kKvLGsuh7/gMWfDA/Lg==
X-Received: by 2002:a5d:4884:0:b0:22e:3725:8acc with SMTP id g4-20020a5d4884000000b0022e37258accmr13549349wrq.330.1668594194009;
        Wed, 16 Nov 2022 02:23:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i9-20020adfefc9000000b00228dbf15072sm14927047wrp.62.2022.11.16.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:23:13 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:23:11 +0100
Subject: [PATCH 4/4] crypto: qce: core: Add new compatibles for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-qce-v1-4-31b489d5690a@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-qce-v1-0-31b489d5690a@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-qce-v1-0-31b489d5690a@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible for the Qualcomm Crypto core found in the SM8550 SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ef774f6edb5a..fae578ba3e30 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -302,6 +302,7 @@ static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,sdm845-qce", },
 	{ .compatible = "qcom,sm8150-qce", },
 	{ .compatible = "qcom,sm8250-qce", },
+	{ .compatible = "qcom,sm8550-qce", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);

-- 
b4 0.10.1
