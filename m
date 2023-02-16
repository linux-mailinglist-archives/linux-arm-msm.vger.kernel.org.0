Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34EF469955F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjBPNOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjBPNOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:41 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF4453554
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b16so1860318ljr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676553276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8Dshvhn/u6JxIEsr1GHQ58ZptmtCs5B/Gl7LxOGqZU=;
        b=EGhvTziYsFm7oahPnP1OkeV+Vwy1O4j5rpvmA67G0FkQ7h+lWM+v9lYck948g1rshd
         k7L/m9J/+24+TzJQr0j0XMW97XCiAnfRFBbc1fzMEyt7B7GC10q3oLIhHeDozqkf2JlO
         WVAWyfC4JjIjiwa9Cwo3rQOKwdVZYBxDG+UkoQkK29eOkArEsmMVPf07luruOVXJpeme
         g0aivotitBH7by2qVt19YTJv5oeSJRUeh0/YjcktYhdWRHvf92tu4NkBWCciKIXl9Bqw
         l2KRX4CiEjfPltzBoppxfLCHp/UnKy24gy8TJCPELuU8b41Bmq3HMnnLbYwwN1eg7ug4
         lStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676553276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8Dshvhn/u6JxIEsr1GHQ58ZptmtCs5B/Gl7LxOGqZU=;
        b=JEK3ZPf4twbHfhPAmjcofHMcyx72hgVEHbTt4IaJvChlkZ9I01Tz2UfiBrgfKv7Phg
         Fpd+6CwPXpAxQi8ZcRYddlNylQa4kcxymCKugnENsa7yTUWb7cSKdsP6+FFIWYPgd/4v
         aMgGLyEakDjD6OJ3KmcaTsEY3Wbf9Oex1DAuoxfXzcpZQDqzB9TseEBj1B80f4pn8ZN5
         ZU/j6spn+6iJrdJENhF3vnBJkAxtOTmejieKKIWNl/QWRFYv63X5BuqpC3AvMMabfykQ
         nInJLQC5UbNmnYFaVP6o3ckRBBiltfZErPUTvZ97T2Bsf6isancaRievORQC4CvfuRRJ
         /e7g==
X-Gm-Message-State: AO0yUKVAryqLVLqhWb9kvB/7geMB/fyByAsFDjWV2a+4Fmc2cLBoXXS5
        jkW/4LD8Ex2Cp7GjhUDuPetwqg==
X-Google-Smtp-Source: AK7set9uMYvXdjN7EkZNCcEXNePvuhN+rv+yPlRbDXytheBC2JAOp4/tMtVRGt2cwIyF7vxxEgOZ5w==
X-Received: by 2002:a2e:be0a:0:b0:293:1696:a042 with SMTP id z10-20020a2ebe0a000000b002931696a042mr2018625ljq.4.1676553276325;
        Thu, 16 Feb 2023 05:14:36 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:35 -0800 (PST)
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
Subject: [PATCH v10 02/10] MAINTAINERS: Add qcom-qce dt-binding file to QUALCOMM CRYPTO DRIVERS section
Date:   Thu, 16 Feb 2023 15:14:22 +0200
Message-Id: <20230216131430.3107308-3-vladimir.zapolskiy@linaro.org>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Add the entry for 'Documentation/devicetree/bindings/crypto/qcom-qce.yaml'
to the appropriate section for 'QUALCOMM CRYPTO DRIVERS' in
MAINTAINERS file.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abf3589423b..e93f0d45b400 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17272,6 +17272,7 @@ M:	Thara Gopinath <thara.gopinath@gmail.com>
 L:	linux-crypto@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
-- 
2.33.0

