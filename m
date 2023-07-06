Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9F274A5B8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232508AbjGFVLl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbjGFVLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:22 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B28C1BD2
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:18 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1b3c503af99so1152213fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677878; x=1691269878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQZMOPuU2NT251VkgOhkBFz/GJRkDGlyYehHpTo6xuo=;
        b=IPrF1n0sR36WYe5zNFlTJDASB+I8bjHE3t/RGZgzGTI46Pi1kD1tdXyTiAQQ5NaY2+
         9jehIcXPadJ8peSCl1S5EvghQQucTULwAiM+TuGUQtKQb+72zRdf5DPp5rDIgH0Z3r9b
         t8sTHTJEBmKfeUBV6+41lO7PMSo59loOJKLU4oDIacF1DuYWWpZpN/vzxoziKGGvls52
         lEKYb2g4CrndLCYKM2ptJCZcpN4TwlINPR2JZR2BCA+p6UPU2bg4hRi20DFX0ayWWHLk
         suarsp/CQG5nE4wyVjs+IusMWAcwBli5liBGgJ00+OCFd/NM3Cq8BSkKIjvlN0oKuTa7
         kgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677878; x=1691269878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQZMOPuU2NT251VkgOhkBFz/GJRkDGlyYehHpTo6xuo=;
        b=QLRU3xESuiWpKTNjY5PTdu2Vwj8f3+PPsgj1k3QQLdus8UpbRovABcQV9Z+bEqb33p
         xyYKR3Hg645F3WpjBjTgV7GlodBABjnINZdmf3m16oxlPKKCjZX9oAvjIxQnznYa5x0C
         eBig9BIGE8wvO131DTA+ctbTBRJw15fgYC3Fs9SglUJn1k7xGqwomVemhKr6MZVIN1NE
         Qdl5Z9Fg4PaaPdkrLCdAwBmsbbiDsvI/rvMkWCVTG0sGwFBEZJw+JNtfFUjZGC+c/Ej9
         jNe1dmXyyAQaSwddP3n1TM5W8NyczKIvXh1+g6MJJvleU3eDSGUuF5h9DE/90OiN/KJK
         NQWQ==
X-Gm-Message-State: ABy/qLbYkxoTTKHTy8alO+T4PUdlwHZ+ZnpRKh9XwfZ+xNuFmFVPlGBO
        rXtk/00U4Lri/rF7XGEagRagEdGOKXk=
X-Google-Smtp-Source: APBJJlEAMkpjVtA5YgRuxsX3a+0QdhTSNWRfvjDaeZNAGweIXh4YuU30w3UfBmFBzSh0FOkdHxL1hA==
X-Received: by 2002:a05:6870:438f:b0:1b0:25b4:4b77 with SMTP id r15-20020a056870438f00b001b025b44b77mr3528266oah.14.1688677877851;
        Thu, 06 Jul 2023 14:11:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090a2a4d00b00262eccfa29fsm233856pjg.33.2023.07.06.14.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 11/12] dt-bindings: drm/msm/gpu: Extend bindings for chip-id
Date:   Thu,  6 Jul 2023 14:10:44 -0700
Message-ID: <20230706211045.204925-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Upcoming GPUs use an opaque chip-id for identifying the GPU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 58ca8912a8c3..56b9b247e8c2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - description: |
+          The driver is parsing the compat string for Adreno to
+          figure out the chip-id.
+        items:
+          - pattern: '^qcom,adreno-[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$'
+          - const: qcom,adreno
       - description: |
           The driver is parsing the compat string for Adreno to
           figure out the gpu-id and patch level.
-- 
2.41.0

