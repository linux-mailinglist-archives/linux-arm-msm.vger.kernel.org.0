Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25A433351C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 06:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbhCJFZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 00:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232215AbhCJFZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 00:25:37 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C7EC061763
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 21:25:37 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so6841366pjv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 21:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p4MDtuxttZdWJgfIxJ4SM6O/1KHz1jNmyfxro35Wyqk=;
        b=OLHdvE3oZF1gLJa3AqWetIIfuy8vOkVDfzZoQEvKGMoqQll51NJnHR4+YTKjp5oNN4
         Q3pHVyEBvacEC4lEMZOV1gQfcjTbqVqHVRGtydSp8ix/HuUI8wUvwKp/8/C6yTieKNDX
         mIWq9D1aOFMRp6jfgljPMR9uNLYyNw1gXqemix4izHO/f4wLz7TVJDoVojOZ8aopH3yF
         nQ+i1t5lL3z1M4ATMVBcbdhU/ZLbAA67XQP0rF34qeZ9EHc4u1fvMSw3U2F3rD4n++9p
         VL1VdRZtRP1bGjhKFe25FQEW9O011aNS+AnPAjCJzFdtxr0sisR3Eg62J769ZuFBb2Yf
         S46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p4MDtuxttZdWJgfIxJ4SM6O/1KHz1jNmyfxro35Wyqk=;
        b=shn1n3ApyYcppcdTUpPwzwIGxS6sy/2t1ifT4VXKlkPxuQsTBl1BjX1hYXDCmntUOb
         /5FFPBFGr+NbQ7VRw6s36DSYb46phodhLR3NimMxR9vV5+JLnRABeni+d8YNgvaB2mxI
         qylhH1HEi1OY2cTnMKZeFLI9bGrdF9G3zQK4RGo4W2JAxdyUWpzj5/dGTMzsA3zj7k0z
         XyG1wL644GPhgfMVTr2+yie+1oLHT1tw/VDzCfOdGiVSD7Kv+lK/42/PD9uEKlYL485Y
         l8D8+2svfvRd/+Xt94raPJTKWulbt6q9mdMc+YP5DzZFlb1pTv3MFMR0UEIPOYKV3A33
         vq4g==
X-Gm-Message-State: AOAM531TBTIcFi8Ff/bbLBTEKt7OFJAtgCPUmAAcu1f0fDSTL+1dVK4x
        RefbHzW+PG+NDJvH99u3NHKW9lbTjU5Zg7KaAqY=
X-Google-Smtp-Source: ABdhPJyS5ECOzQLssg9/FjnR9+o0WdEdayJ0uAQQhEFdmEQ23w+cSKxH0RA+0EEs/vpnz5noxWwQvg==
X-Received: by 2002:a17:902:f702:b029:e3:dd3f:d151 with SMTP id h2-20020a170902f702b02900e3dd3fd151mr1643353plo.18.1615353937065;
        Tue, 09 Mar 2021 21:25:37 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:25:36 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 2/8] dt-bindings: crypto : Add new compatible strings for qcom-qce
Date:   Wed, 10 Mar 2021 10:54:57 +0530
Message-Id: <20210310052503.3618486-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Newer qcom chips support newer versions of the qce IP, so add
new compatible strings for qcom-qce (in addition to the existing
"qcom,crypto-v5.1").

With [1], Thara tried to add the support for new compatible strings,
but we couldn't conclude on the approach to be used. Since we have
a number of new qcom arm64 SoCs available now, several of which
support the same crypto IP version, so it makes more sense to use
the IP version for the compatible string, rather than using the soc
name as the compatible string.

[1]. https://lore.kernel.org/linux-arm-msm/20201119155233.3974286-7-thara.gopinath@linaro.org/

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
index 07ee1b12000b..217b37dbd58a 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
@@ -2,7 +2,11 @@ Qualcomm crypto engine driver
 
 Required properties:
 
-- compatible  : should be "qcom,crypto-v5.1"
+- compatible  : Supported versions are:
+		- "qcom,crypto-v5.1", for ipq6018
+		- "qcom,crypto-v5.4", for sdm845, sm8150
+		- "qcom,crypto-v5.5", for sm8250
+		- "qcom,crypto-v5.6", for sm8350
 - reg         : specifies base physical address and size of the registers map
 - clocks      : phandle to clock-controller plus clock-specifier pair
 - clock-names : "iface" clocks register interface
-- 
2.29.2

