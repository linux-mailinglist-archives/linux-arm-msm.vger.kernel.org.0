Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A5C687F28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbjBBNus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjBBNur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:50:47 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6DD74A7C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:50:45 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cw4so2017761edb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QCYdqQ/bmLydThWvBMl8ol4ClUHNrk5t8Rx+9b+yeA=;
        b=uO+OsJkw621RoLD8CtWflQ9UWFKkuIs3yzudR5MBOF9v1t5tmdCvvjUJ6YANZHew3J
         Ro0t0D2i/NGKW68HkPP1KK4VuTky/+fRPjZsRVuB50212Y2xVE6kru7/bn1NUTOxkL8w
         UZ0w8/Q+YSrjteKkdtAKiDS4HqWPbLm7SNvr6WUhrkpydjb8x+d/V2iaLGWZSmvAYeit
         U0wKRdLYZ/lG5362R1Y2WikkaqLA+ZS1SeHOC3UKbqyw/RvotPlw3R9o7SRN/so5eH5T
         e2utZ4GO8SBmSleiB80/oO2FIqbQJHwJ+WlefavB/sFRn8ofX8007ECLQ4WM/gR+/Q7l
         OjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QCYdqQ/bmLydThWvBMl8ol4ClUHNrk5t8Rx+9b+yeA=;
        b=vmM/pCCs5rTaZK7FQ3SfIZ8vaFV0s++rBNS05iZ4PoL7U3BbATu0gJUn33lp+A/7me
         LRuijS6W57AeNzv29vXS1Et759NG9TusmzFsS1RHFsW5+hrdjwCa5AS3OP+qb5LKh93U
         tFWSjkppDF3ZThc1EfDXbS7oA8vVe9FY3W1oXb3qxhY0SoFK9mtNvzB6Fz1MFBVphDZp
         q25+Ik+XIsoXVGNHHaLxFOqCGPunwRIbks5a7R0k2WstJBG/r8lRcl4dpSQixuWXfKIu
         CGxm/noV14MQ8btqhZrIVyUcpfkV4AnxMGGZM3B8dauRie2W028MvsgL4lBRAHkErdWH
         HwBA==
X-Gm-Message-State: AO0yUKWbfwY2Gb7XEp1PuMysMate2RKDVAT9ZAKGo6Ns2YbXsZIkG28D
        orfDF5BDCq34EdFSiswiwEPODw==
X-Google-Smtp-Source: AK7set+O9Yy03cF0T/DMFgfTHtwInhNbhYOz/+nD7dqVTJVxGGKhLjZcn38Gy9tw1oXxq4pwCNDNIA==
X-Received: by 2002:a05:6402:5511:b0:490:ff75:7aa with SMTP id fi17-20020a056402551100b00490ff7507aamr7145512edb.1.1675345844077;
        Thu, 02 Feb 2023 05:50:44 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7c157000000b0049e1f167956sm7596332edp.9.2023.02.02.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:50:43 -0800 (PST)
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
Subject: [PATCH v8 2/9] MAINTAINERS: Add qcom-qce dt-binding file to QUALCOMM CRYPTO DRIVERS section
Date:   Thu,  2 Feb 2023 15:50:29 +0200
Message-Id: <20230202135036.2635376-3-vladimir.zapolskiy@linaro.org>
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
index 590bcd047a7f..5530f07d1c31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17196,6 +17196,7 @@ M:	Thara Gopinath <thara.gopinath@gmail.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
-- 
2.33.0

