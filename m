Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 309D86DDC96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 15:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjDKNrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 09:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjDKNrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 09:47:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84911BDA
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:47:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a29so9308369ljq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681220840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7u3cWIrv9ii7tk7AluAyAc28Sz76nQ4EdYUWb/87faI=;
        b=jFgb4agX4lazt4/ZszyG08ELsETbvW3xLfgM0i1ouStqSP+Y9JAqhQoEJTrvSt438F
         FOmWYogsRPjMbzL6YUfgpUW1Olfo6C6I38OQq2hHrFm+L9c7NiEPB6YwEabMc2LJUOV9
         o7cLSMREy8g3A5Dip9viKPO4t7XiVYL16IJ61tPrVmcLiyVbh2EPhaXzhuGgh1oL0Qzr
         m83uDro7GKL2aLlOhS1O0j51QekunK/Ur2DUp9ICMDZLp+czYGbvaYNcFTLNlnGHqLA+
         8R0gSWs4D0r3507poUVxpYLjxWckZBpSNqf+oaOPGYLS6mpBXZuyJdtyEDUTPOvaliHP
         pZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681220840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u3cWIrv9ii7tk7AluAyAc28Sz76nQ4EdYUWb/87faI=;
        b=Q7XrvuMwxTilhCXJNgaaID/omk/Ohpdl8hh4u8zN0UxvlepySZLIk2Krr8+XwTKaxo
         YHQTwY4JCw/afjTJdWoeugYzZTS0tJlZ2sEkSQgrYrIlehWIwZWA+xCEDbUCtVCg8Dq/
         MO4ZfbmTl8mZ84FEVPIMZGVYL74oSh2+LH+hnpumIRcKk2wu1kHJimdCwyhj2Eos38ST
         4iatZMH+7wGPH7FQ1RbR8/Ac1u/azu3r02lh3z271Pm5Yxm7kDGxber/XgsjMpLW5jj9
         q/0esp8wOKIwKSGcFFJLWNdna0hytI0ZP7bzwaPfeV8+QA4NejerUEmHG0Xg2XTxokiP
         p71g==
X-Gm-Message-State: AAQBX9dZwAm68ScefsqBjDQ6erZ0Gii/uT9qZ/NmbbDW9DGctbgk01O9
        vmtGc/vWgNhhN0QFeZdSmyahyQ==
X-Google-Smtp-Source: AKy350YYkyug7myhwYEEqkIYfm6neRPDD8G+4mIaKDqjpoSh5zOv+O4G8T55cOewfN97R+ZEMXOsBw==
X-Received: by 2002:a05:651c:86:b0:2a7:8544:1e71 with SMTP id 6-20020a05651c008600b002a785441e71mr1007706ljq.3.1681220840146;
        Tue, 11 Apr 2023 06:47:20 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id c10-20020a2e680a000000b002a77583b718sm1245887lja.12.2023.04.11.06.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:47:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Apr 2023 15:47:15 +0200
Subject: [PATCH v2 1/3] dt-bindings: power: qcom,rpmpd: Add SA8155P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-hanaau-v2-1-fd3d70844b31@linaro.org>
References: <20230411-topic-hanaau-v2-0-fd3d70844b31@linaro.org>
In-Reply-To: <20230411-topic-hanaau-v2-0-fd3d70844b31@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681220837; l=1558;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=oNW0CgFyxBXeievXT87JHE+KppSisz4HMgd5P1GQgyc=;
 b=1gOb3wAz8sBLrYX3/bS5JEeK4J5PuGFWkLeVjGnuGJoLuky+eOYnSAc6VULEQjLEUBTpPCf8JMUF
 Sh/t7bqlDncO5N7MseZ90ARv39biQHBUWccpuA55CBT4K+ihKTin
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for SA8155P platforms and relevant defines to the
include file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 include/dt-bindings/power/qcom-rpmpd.h                  | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index afad3135ed67..f9c211a9a938 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,qcm2290-rpmpd
       - qcom,qcs404-rpmpd
       - qcom,qdu1000-rpmhpd
+      - qcom,sa8155p-rpmhpd
       - qcom,sa8540p-rpmhpd
       - qcom,sa8775p-rpmhpd
       - qcom,sdm660-rpmpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 1bf8e87ecd7e..867b18e041ea 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -90,6 +90,15 @@
 #define SM8150_MMCX	9
 #define SM8150_MMCX_AO	10
 
+/* SA8155P is a special case, kept for backwards compatibility */
+#define SA8155P_CX	SM8150_CX
+#define SA8155P_CX_AO	SM8150_CX_AO
+#define SA8155P_EBI	SM8150_EBI
+#define SA8155P_GFX	SM8150_GFX
+#define SA8155P_MSS	SM8150_MSS
+#define SA8155P_MX	SM8150_MX
+#define SA8155P_MX_AO	SM8150_MX_AO
+
 /* SM8250 Power Domain Indexes */
 #define SM8250_CX	0
 #define SM8250_CX_AO	1

-- 
2.40.0

