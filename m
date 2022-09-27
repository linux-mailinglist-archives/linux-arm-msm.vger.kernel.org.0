Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4B7E5ED14B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 01:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiI0Xw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 19:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbiI0Xwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 19:52:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEB9D2D76
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 16:51:14 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id e18so7521739wmq.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 16:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EclbgXkR0mZEcTyap8uP7fSpjmIKQllNtUhSwqaIvc0=;
        b=M6V+lTjEDGwEvQOqK7JnorXurM06HpGosDHlaTxApFl8HVJJerfXiyx/Vb4tvhZk8s
         RtEVs2MuQuG7uCDQWG+GmHnhd8/IVWaJDw6/BqYa3U6d3vXNkfJDwgggXwo3Q1CisCQo
         xB6efWZvJLu0bZxLM9KCIk35GkCxMYKb5dsppfWxT1Gzy2Hn4owTYycFNBjx0twwHjQl
         vU1epYoFZQp+pXCgFUxzPjj0bKC5VeULWbayKjxyk2oA25QdZT6b540S1zV/fmvCtYi1
         qj4nea4tFJ9ZjkF8TNC3uzxCvcHTdZZn5BXWVIe4c/8td7BT5ZK6UNwJudizSaOe1pxS
         9oZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EclbgXkR0mZEcTyap8uP7fSpjmIKQllNtUhSwqaIvc0=;
        b=QLQBB87dsMmg29x4n0zo+SIDrcQNMI+Ptni0ATRInGdF/IGPoNcmpMrrgatdDHjlhn
         T9OIcJh8QBLop11qvyKdJl9pAJuAB4Bv0ZbkxqJfEraqzirj7UuvV8Hf3Ma4PTywadZB
         l4zDOvIWTR0TBBWd0VDFNIOsUvjl1gYvC9itEqCJejNM5OLL/ZHrFicRKC+QV0/H2mW/
         9JcxfuDuFXd9CWhmpRYKL0FM8NlYmvx9oE/6M+EahE9N2WbcEyiYpTnve3Kh4qslBQhI
         auMAJAplkAbYzNAJn87s5aRkAFyYwvykNAPFzlJ+0+SOcC/PSC3tdqL2mpCCwyL/LviW
         SDvQ==
X-Gm-Message-State: ACrzQf0R4HWlBFjYHJg9tR5QO4z9KZ9HcFOoChPPuVTfwKvFZKcTg+bE
        KnBw+3d6rd51E1jfbxBFbpXX+Q==
X-Google-Smtp-Source: AMsMyM6So8SeK0Kf3pEYW19EiPJSMYebn+RCMx4VMcl1OC/ruQWw6x3HIQlq9ovDtdSJQ1eYRrZetw==
X-Received: by 2002:a05:600c:5490:b0:3b4:8db0:54d7 with SMTP id iv16-20020a05600c549000b003b48db054d7mr4558045wmb.62.1664322672525;
        Tue, 27 Sep 2022 16:51:12 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b003b27f644488sm145301wmq.29.2022.09.27.16.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 16:51:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v5 2/2] MAINTAINERS: Mark Lee as Maintainer not Supporter for MFD yaml
Date:   Wed, 28 Sep 2022 00:51:08 +0100
Message-Id: <20220927235108.227566-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927235108.227566-1-bryan.odonoghue@linaro.org>
References: <20220927235108.227566-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Running scripts/get_maintainer.pl on
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml gives Andy Gross,
Bjorn Andersson, Rob Herring and Krzysztof Kozlowski but I'm told my yaml
changes needs to go through Lee.

Change up the MAINTAINERS file so that get_maintainers.pl includes Lee as
Maintainer in the output list as per
Documentation/process/submitting-patches.rst.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 936490dcc97b6..ee3bafe9a08d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13905,7 +13905,7 @@ F:	drivers/media/i2c/mt9v111.c
 
 MULTIFUNCTION DEVICES (MFD)
 M:	Lee Jones <lee@kernel.org>
-S:	Supported
+S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
 F:	Documentation/devicetree/bindings/mfd/
 F:	drivers/mfd/
-- 
2.37.3

