Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3C768F716
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjBHSiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjBHSiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:38:22 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FCFD2708
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:38:13 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id r3so12002824edq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfZc7P3L4wBNnQQQ85wu2I6wsnovvh4e+MgGEWnocfk=;
        b=ZBpTHLCOzMVFoTQz2Jv4TYznabdtVlf9SsXJ3IEnljIUSkls1CsSKMmmrVQAkzSPhg
         /EbaraW0GDrRpCzuBZ1XUU7R1ZNk6clJqwVjWcGTjWSGZPzPnCXEjdAX9u1/yl0PXxVU
         GlKnql0RJ+yH7icZuYdYWxhhiTQKWIjO2qqLTg0jFTckkMCwCwkiyKEh1GugzgZbRytI
         WqpVD0WWM46A3nN//MjpwMfjZdvwvx9+TPAnQ3ClO5PoFQ/4XHbUo+Smm1mxDidqYCOi
         w4PGWgwbh1RzMA0CBRtCu7l8AwLGgc03qvHrPSbG8vtUe9G5LdXIInRyr19bsD8ayOts
         HhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfZc7P3L4wBNnQQQ85wu2I6wsnovvh4e+MgGEWnocfk=;
        b=09oFLqfbaQ9VPuMqT6sss8WJZf73QXOwj6YhaXdRSDdMuyaIANhdh+zRl/d+43FYWG
         a0kv/M6r1Z+iaW/1zfkR8e9pmXkDzuyyxJa5XI0TNemr3Gs4StualbOD9RbD5GRku4Fw
         ysm6XJWgdLM2Zeqj29WwVpQ7xe5xKfbl0rWUJ9YQAsfMiBRapXBP3BmY2Mw8ov+/fW5e
         EIejxEau532xJML77QVt+Lha3vqZ0T9QriwIVuTbW1yJvn04s2UcR/HVjRJ8eylM/wWG
         6neUpMyfhhz26xpa1RSjpNQR8TZLkNoOgPrIaoadMRoJQmZAUgOcAwccBl/PeQWu8MDd
         mIdg==
X-Gm-Message-State: AO0yUKXfUzdFwPWJFi92FIyTbA5QbPB7GbKLFZYcjgRZvzXJgasG86uc
        jWKe23EUvSMPcbqwPCAZOOf8yw==
X-Google-Smtp-Source: AK7set+cagKM9BkXSwtVGVWAopVYKfpge2UcnWjcZKoOJhfslhwYQ0HE0OsSczF2Wqb0Odj7qMPg7Q==
X-Received: by 2002:a05:6402:510f:b0:49d:fd2a:39cd with SMTP id m15-20020a056402510f00b0049dfd2a39cdmr10565597edd.1.1675881492090;
        Wed, 08 Feb 2023 10:38:12 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b004aaa8e65d0esm5179663edj.84.2023.02.08.10.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:38:11 -0800 (PST)
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
Subject: [PATCH v9 02/14] MAINTAINERS: Add qcom-qce dt-binding file to QUALCOMM CRYPTO DRIVERS section
Date:   Wed,  8 Feb 2023 20:37:43 +0200
Message-Id: <20230208183755.2907771-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Add the entry for 'Documentation/devicetree/bindings/crypto/qcom-qce.yaml'
to the appropriate section for 'QUALCOMM CRYPTO DRIVERS' in
MAINTAINERS file.

Cc: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94971603568b..864bf5b7520f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17199,6 +17199,7 @@ M:	Thara Gopinath <thara.gopinath@gmail.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
-- 
2.33.0

