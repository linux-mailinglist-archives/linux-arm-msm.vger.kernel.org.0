Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290CB699579
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjBPNPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjBPNOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:55 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD2D53563
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:48 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id x29so1938182ljq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676553287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yd9lAcpRbHxF9RdOizjwYgJ/PMIKmYOw1xnRDHR/30=;
        b=l8znhmby9Ou/ayAkmoZRFWINUtrj5JOzTE+qO0v5ncxadXQX+sRPJZrSwlx3b9U5LQ
         JGD2YxEHCWY+a0/6/phBWXfrkWKf0XbXbw4h29RYUa4t4IdwHYfGLpyeTJA7CR47BslD
         cxLmBpcfUz9asR25xyvhwK6VnwQBtE0Ok6Yt4LImw2GJ4/SyihNAphmibYOApmhEtRyP
         I2Ch19kzlsNWNOQI3RtkzC5dBxIzV7h8EOAdkYVzdB6uMIFSg+7QGPc1aP2AO2kgHP4C
         wdqkUeuwRINLInCO8XvY3HH9l4NCTnS/Jx+nu0L/xcUgB1OoRod5bB8EyJc4dzQY7wD7
         YK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676553287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Yd9lAcpRbHxF9RdOizjwYgJ/PMIKmYOw1xnRDHR/30=;
        b=Y762/9FzBD1AdRNb90z++rui93dSzy3rKu85MpRfimNXX6CEir6bgG5xD5sY0+8Z63
         8Fyur/Rzp4R9+osIZxGch/nm118GVHdLr3z4YrY8Rvku/Q4TZvzsbLj7Cps4tfNRuLBS
         f1OZhMkgmGmmvU/Afuo5ABoAWD68Gq76Lo/juocHc28HQBdKPljgn1uGgMlZ2eiPfHoT
         WVymIIEJfP8eN4IsPSof2KrXHR7MYvh2jR8cUmV2DNGODR/i2/h1WilYjbHDl35geicz
         c9AZhlbMe62nXLt3CC/CCe7BCCV+Gngf2ltnpAqxVAf4qVWCDfEf2JOi6xjuU/KAOqzZ
         E7hg==
X-Gm-Message-State: AO0yUKXeHWtjCLfHySCP9aVcQU9W3/dtmC5S+mWzWWRfrz+kxsu9+ivG
        P9aAz1bAVuH6yz+/8Ib5GG/LyQ==
X-Google-Smtp-Source: AK7set8AC3akpCxImrycnKhop5QhurFRa136ZAhMWjejhNcYZ5p0qpTdFdN7gvG0ODXMGfP1qhBIoQ==
X-Received: by 2002:a2e:9913:0:b0:293:4eac:734a with SMTP id v19-20020a2e9913000000b002934eac734amr1593461lji.0.1676553286845;
        Thu, 16 Feb 2023 05:14:46 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:46 -0800 (PST)
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
        linux-crypto@vger.kernel.org
Subject: [PATCH v10 10/10] crypto: qce: core: Add a QCE IP family compatible 'qcom,qce'
Date:   Thu, 16 Feb 2023 15:14:30 +0200
Message-Id: <20230216131430.3107308-11-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
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

The added 'qcom,qce' compatible value will serve as a sole QCE IP family
compatible, since a particular QCE IP version is discoverablem thus, if
it'd be needed to differentiate various IP versions, it can be obtained
in runtime.

Two IP version based compatibles are left untouched to preserve backward
DTB ABI compatibility.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 5bb2128c95ca..fce49c0dee3e 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -293,6 +293,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
+	{ .compatible = "qcom,qce", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.33.0

