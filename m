Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B81B42BE32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 12:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232278AbhJMK7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 06:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbhJMK66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:58 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB26C0613E7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:33 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id g14so2131457pfm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yng5eTw4n0HbKQV0Xcv/zVYYMU50wsVq8rLsKT3wyb8=;
        b=szAdfCtZjTXtVtUeM38ldIve5EF5/0Br7s8W9cXxA9prF7ZYrNeqv8KbrhJPl0wM1o
         gU5pe2tTYCljGIJIf2d6lDfa8pYlMCM3WwHPA0McScpbpHJMLI/cne7dylw83Q5brGiv
         Liqx0mwINVuSCL+UM0cunoJgEackJehBKyGEs4czcLlSkn9lwfBAAuY2LkenjkpEha5o
         xsEdKmkLs/vzHhVPRvvjYR7yWUvBBN8vEEZ6lPYZoZwwWFzFtmzKsSdQ5Q++auOH4/wj
         3nlH7ULPuPiAKzy0LLxS0CHvWfYTM5lfmC1AlM6J42a1a7m9eCIeqBpT8bGNirAMb+SH
         AHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yng5eTw4n0HbKQV0Xcv/zVYYMU50wsVq8rLsKT3wyb8=;
        b=r1uKU5vnJ6uneknNjDUmI7KwRXnZrts0l3Tz8umGtXwJApy9rR0VgkpbMq8oduB85V
         4yWMLGDNlXVD5bB1OdmnMlEhrwrTst1JZqipbadw5Ksl5sbstTiakPMS+ReqlG5+dcPB
         J3MOPUxNKfXZxIZR0pPczoMFOU5rngCFh5fu+cKUUy12ogdIk2N2ST68otewyQ4QmD8b
         2PAVfun44rvwLraGYP9J0P44rpxTVzkK/Usi/ljtwaxH9/61K2nCliuZ0t80ljHRNXhS
         sEw/zfJOwIBP/C7pcBA1g96gGJkPYVOdfVIqaQzpZZ2joXjhCyZ51gTBerR3pmrH20e8
         hRcw==
X-Gm-Message-State: AOAM533QhQb0x9PmPwLFvkJtygcQ3odTPoJFws8toxmMxANaYkWgzUJK
        OHc5je71zBtZhMK52VX2v61Eo8LHMEXD9Q==
X-Google-Smtp-Source: ABdhPJwYqosT/5ArpzWpSNWo3I/WZjXdW4f7C8zC1FkxtUmdTuVDdpIyEmleWaacjSPv08d4vT6Fog==
X-Received: by 2002:aa7:81c7:0:b0:44c:517f:a759 with SMTP id c7-20020aa781c7000000b0044c517fa759mr36699311pfn.3.1634122592461;
        Wed, 13 Oct 2021 03:56:32 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:56:32 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 08/20] dt-bindings: qcom-qce: Add 'interconnects' and move 'clocks' to optional properties
Date:   Wed, 13 Oct 2021 16:25:29 +0530
Message-Id: <20211013105541.68045-9-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 'interconnects' and 'interconnect-names' as optional properties
to the device-tree binding documentation for qcom crypto IP.

These properties describe the interconnect path between crypto and main
memory and the interconnect type respectively.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index b7ae873dc943..954f762090f3 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -32,6 +32,14 @@ properties:
       - const: bus
       - const: core
 
+  interconnects:
+    maxItems: 1
+    description: |
+      Interconnect path between qce crypto and main memory.
+
+  interconnect-names:
+    const: memory
+
   dmas:
     items:
       - description: DMA specifiers for tx dma channel.
@@ -45,8 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
-  - clock-names
   - dmas
   - dma-names
 
-- 
2.31.1

