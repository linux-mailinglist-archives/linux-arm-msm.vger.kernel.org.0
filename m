Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3341687F39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbjBBNvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbjBBNvH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:51:07 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65538F27B
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:50:55 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id u21so2072517edv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCbqvORx24QYDOSwcFJXyWQd0s0yT+w31F5oNZstwBs=;
        b=bmmg3KkS0nzITvHmzjv661grJmumPmx8/8K9g7d7Oh2ZCJY8hOoUZkJPa8pJW46iYD
         xAUFij6lYoXFfTb6qfRo3Lsf8BCWXXwMx0a5Tm0R4zX/yck4nUWBqHsgAGvN3wDKJW00
         h7mqVxbLIE1aHkPdAYvP3UKDrAbhgXSgj1XOgnJBbxQuqi62knS/p3k6pq005OEpniB6
         HRUSO6nwBVTD0uzy1srgQD9UuyMWOuVzIsdrIHyqtg7g4mM39TsYYKQO80axpLvvCCQZ
         sYX2z+rMm6q4wdIrA9YAgC22BpOEDw9y+HYOGard8PEsZz4g3yk8vuc6isK4qabV+2Bk
         9T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCbqvORx24QYDOSwcFJXyWQd0s0yT+w31F5oNZstwBs=;
        b=Q4OS50LlIcdgPUuizvw+H4QXLBJqywa9r9xhIAvbDOstRH1ctSsiUNrDYKpV25dRlF
         AF+anhSoebGh5BdOVc8ryPIlCGHtmTjqezTNGYWzOE7qWlUf1sT2Qz71TYQ/MQu53k9h
         Ag/uLp23ds4OOE/ADqd+V8QFhYtxTeZ2ywCjqW7w3WCtfx2xONwxh9a1rfP8nSC6hJrR
         Qqhr1vJtpRmrXp+0u7b8F8+077Lr9ig4sirnlJOzBjpNchpbLHNGC7GGCafvvnzyHB57
         QKOpcI2OcuYDSay9nJXqITTl+YGIkRBH+Oq1bOVn0KRvoIGpsvi+LzTz4rfJnX06BhuP
         NXuA==
X-Gm-Message-State: AO0yUKWpmsZH6xCDFOCsa4nWjbp4yFW893B3CBUDzzTXemuKpqLUBOqL
        e+fnqdG5IMny1G3qoT0X0GSP1w==
X-Google-Smtp-Source: AK7set+5WXg+XjiI2lc5qdpF6HR4DET7H/I4VycOwstEgIu9xLxEX+9Wo3oax3fAcYLWaEOwdSh3PA==
X-Received: by 2002:a05:6402:74c:b0:4a2:590b:668a with SMTP id p12-20020a056402074c00b004a2590b668amr6528640edy.3.1675345854269;
        Thu, 02 Feb 2023 05:50:54 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7c157000000b0049e1f167956sm7596332edp.9.2023.02.02.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:50:53 -0800 (PST)
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
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v8 8/9] crypto: qce: core: Make clocks optional
Date:   Thu,  2 Feb 2023 15:50:35 +0200
Message-Id: <20230202135036.2635376-9-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
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
default by security firmware and the driver need not/ should not handle the
clocks. Make acquiring of all the clocks optional in crypto engine driver
so that the driver initializes properly even if no clocks are specified in
the dt.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: herbert@gondor.apana.org.au
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Thara Gopinath <thara.gopinath@gmail.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[Bhupesh: Massage the commit log]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/crypto/qce/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 336edba2513e..8e496fb2d5e2 100644
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

