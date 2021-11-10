Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC8B44BF87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 12:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhKJLDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 06:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhKJLDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 06:03:19 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988C7C06120D
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:27 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id r28so1976354pga.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 03:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Eecmho/J6Agff4bcpW3b3Dj2ZtsofOUgkrIvTWiN8c=;
        b=leAvj1mXLG0HHHpuqJnYx4iiChlD88CZNwcnrsMCfsebweYhh7+0cGtjUPp2+2Xg91
         itLpKUAmWtnIVRMCe/7gpXX17rZJmMSk67gsHRGP+i4Md3B3cBtFZS3JOQuyYMjtmjLo
         sj4LpG3ZNcqvU8fawzrzltxb81kcAz0udI9Pm1TkjMzRz9fUHT8xpD2y1RiPJXELCBO5
         qX9CSqiQ2zTbMtli+tWsLOnDtm4h97/2IDZqQ+LKwulNix3Km7Nf4QKedfxfzFE0Z+yg
         57QDQdVlQOeG8IvYmaVYw8bSV99q6D3UZdQokfweNzCbYzHDfPoAUW85x6zTrazzixa3
         h+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Eecmho/J6Agff4bcpW3b3Dj2ZtsofOUgkrIvTWiN8c=;
        b=CwX9LRJThezqPcfhcg4mBJRnA70Xor6gR0+Xo0wMJk0Ucz1Ei95xc65Sfqg6BNNDtl
         3XKD/Jk+qR/NG8bNwQvd5Fuy92w8cZCbtecvUYkDuXLVld2Lg/FZLxAg1W5NZ+VWI3By
         WuNvah/cJ74K8Zi4VQojOZRprQLJQwPcDhYSuMrxoh7cuZ9LK2R1JjpFajmtkjrnoPtp
         003vy/2laYaNfFAWnRy4l9SkQ0yF12qWk7gTR078UMxCZWegs46kNha3QQISCWkltchj
         /UeBel0/4Zjbr+T25d9AgXAbEeyf0npPTT7OObvFePTKqjmTjPbjZIA0MakWbKOkB47O
         2lDg==
X-Gm-Message-State: AOAM532lpyL8mW6tLDmb2eCUpENLDHFiD8CHrXRdperCSv6mZjoU1cNu
        jsScZRO/pVjHJQIsl3b0+3wjqmUZrkJJOg==
X-Google-Smtp-Source: ABdhPJxviW6mvmO0Bz+ZTQMwv+gsFrpAJRqvbJUVly9WWffJckKn5XGCguRKyP28KHPeCjFmGfFF1g==
X-Received: by 2002:a05:6a00:b49:b0:49f:cc01:10ff with SMTP id p9-20020a056a000b4900b0049fcc0110ffmr15448827pfo.42.1636542026926;
        Wed, 10 Nov 2021 03:00:26 -0800 (PST)
Received: from localhost.name ([122.161.52.143])
        by smtp.gmail.com with ESMTPSA id e11sm5585282pjl.20.2021.11.10.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 03:00:26 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, stephan@gerhold.net,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v5 09/22] dt-bindings: qcom-qce: Move 'clocks' to optional properties
Date:   Wed, 10 Nov 2021 16:29:09 +0530
Message-Id: <20211110105922.217895-10-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCom QCE block on some SoCs like ipq6018 don't
require clock as the required property, so the properties
'clocks' and 'clock-names' can be moved instead in the dt-bindings
to the 'optional' properties section.

Otherwise, running 'make dtbs_check' leads to the following
errors:

dma-controller@7984000: clock-names:0: 'bam_clk' was expected
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clock-names: Additional items are not allowed ('bam_clk' was unexpected)
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clock-names: ['iface_clk', 'bam_clk'] is too long
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clocks: [[9, 138], [9, 137]] is too long
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 30deaa0fa93d..f35bdb9ee7a8 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -53,8 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - dmas
   - dma-names
 
-- 
2.31.1

