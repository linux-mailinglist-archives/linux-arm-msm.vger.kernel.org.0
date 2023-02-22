Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3031B69FA04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 18:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbjBVRXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 12:23:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232650AbjBVRXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 12:23:07 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59ED24EEC
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:23:03 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id n2so7726620lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677086581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drQma7nNWgYIegGN8xjgb6Jv9bqzaE0wjeikGVtXijQ=;
        b=DNxBThzaxRiww7qKaICnUKL7RfJtsyRoZsTXpSleR1Xq1JIkxPBxuFItd7xulubWZf
         ebYg0b9MlmnT+f3S04htKDogisAN0H53dScPVhlIMBVOWL107+mxyIyrvlmsdJsvJfhm
         3cVrBHoPXdRvhgi0fU4mxR4zCR0pocptcsNKVRmoRr11xWTus3hRD0axwZRftnVBCgfW
         sEFAA3CEjLEOxfsbB6TBaNXyhFMCXjOSjyUp09448lDS87AyDWT92teYHOLIEKc6NB5Q
         3SrrzK92oIJoOsYFiWmZRipzselEn7jlUN1j1uhAxe6Snrh3sO9fECZDFRoYFlO72FnB
         w+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677086581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drQma7nNWgYIegGN8xjgb6Jv9bqzaE0wjeikGVtXijQ=;
        b=go9Q0nuPlACpooWtst0osYUQFX1y9tMRNqj+hQ4rrZuSUb96jucJ7ZPKR2YJPVZ9eF
         v6AX4vvIRV4mNEd0L2kGBtbZ+unrRaDfMLKP398D1LvdvSI+xCl44rdLfKBTeS83fgNA
         P0H7uI7uUB2MY7Er/E56QoxlxJdQonrbi19cj7nxRLUvDEPwPChM1myTbmWBgT2e1Nok
         ACwOu6W1yuH97D5vgSZWXO0033RVhN9GXGgKh/9fA8mhSSWl+e8gwghWpKGtgwU/bqPX
         vq5CpOW2dSCX0mTrJgVhGqCnqoy1mVtZCRvSq1DPylvH/004cLDw0WkOMPWHcxOaMVv+
         h9/Q==
X-Gm-Message-State: AO0yUKXetq4ZZ2BdLF0bkCa5sDUJTZJtcZttdzbcnY+Oxf2QfHqBmwdw
        wc9qbF91ZJ5iV5enWErSsA0JPg==
X-Google-Smtp-Source: AK7set/oNq2wFyvgMGH0MurxbxUeHP/fVQKjHvAFF7a139Vj/tEWgFyc144tx+RJM/FuxpXsfSRs7A==
X-Received: by 2002:ac2:43ac:0:b0:4dc:807a:d135 with SMTP id t12-20020ac243ac000000b004dc807ad135mr2841298lfl.5.1677086581569;
        Wed, 22 Feb 2023 09:23:01 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r3-20020a2e80c3000000b0029358afcc9esm805233ljg.34.2023.02.22.09.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 09:23:00 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v11 09/10] crypto: qce: core: Make clocks optional
Date:   Wed, 22 Feb 2023 19:22:39 +0200
Message-Id: <20230222172240.3235972-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
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

From: Thara Gopinath <thara.gopinath@gmail.com>

On certain Snapdragon processors, the crypto engine clocks are enabled by
default by security firmware and the driver should not handle the clocks.
Make acquiring of all the clocks optional in crypto engine driver, so that
the driver initializes properly even if no clocks are specified in the dt.

Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Thara Gopinath <thara.gopinath@gmail.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[Bhupesh: Massage the commit log]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/crypto/qce/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 0654b94cfb95..5bb2128c95ca 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -209,15 +209,15 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	qce->core = devm_clk_get(qce->dev, "core");
+	qce->core = devm_clk_get_optional(qce->dev, "core");
 	if (IS_ERR(qce->core))
 		return PTR_ERR(qce->core);
 
-	qce->iface = devm_clk_get(qce->dev, "iface");
+	qce->iface = devm_clk_get_optional(qce->dev, "iface");
 	if (IS_ERR(qce->iface))
 		return PTR_ERR(qce->iface);
 
-	qce->bus = devm_clk_get(qce->dev, "bus");
+	qce->bus = devm_clk_get_optional(qce->dev, "bus");
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-- 
2.33.0

