Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9D163F27F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 15:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231794AbiLAOQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 09:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiLAOQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 09:16:43 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14456C6E71
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 06:16:43 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so5374565pjp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AquwkY9JKICEs0Q8aP22cNjRsLjkfNh8gmTpulqNCNw=;
        b=XjfXQcWvNPpyKr1lXoYMU+u/WgLL/UfQ15UJa0ZlZJT3dd+EpKgxLpxBbYnf37VpeU
         JBHIfk6cz0K85O8FFVbbBqWFv5dn02wrmeTffi5rHFCXS8XnoMsQ5l5TgR2oD6a9VZZ5
         TdFQrBValxpnuAcPQBxgeTqWAc3yctxgj9hPSxsncMro+1Qo5otwb2N1l1rFPDLYgyaw
         IgDprIXif3PTQIfYKEJe4X1wpPvbdr2txjTpeMYRF25BTB3jftrxKWJThr0eOt99fz/K
         S9ilNHEhgCGJrJymYXXIEbdIAilCIpOdIoqclgL81TAskkrOmh0a8Cj4DBfbO2ytiohw
         WLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AquwkY9JKICEs0Q8aP22cNjRsLjkfNh8gmTpulqNCNw=;
        b=ecFvnezKIdf4Z7FOGljhDyazTXRlSCnL3IKCf2+HnNqgE6GReIuRHQ4nBsUAfcXYR9
         cMV7+AfiaDAgvpUHnqsPjBxWSDX/6W6/NhUZGgh/plTlwn+T6TGYFdx0HSsy/prTQ29C
         Fxd5qT+M5y9+MMKzXoG2cVokZYzmFywhkx4BBtjD8pzF8Z28vJw2SHGudJK/MzQUJIUD
         KfpIZkQVJB1QqoxNLfTepIbJT99169jx9A/KKUigbHzntctBNtPKGjVuRI3zP3TG7NiD
         /fbLdqnTgnrYfqrOFbbG78H9Ic+hcsBEUJSQW0OHXXXapMCjTgsnobkJLmwOe1OIvomF
         8DQA==
X-Gm-Message-State: ANoB5pnU5IRUDcoyoZpPJozZJ2fmT58R85Is4yQyRj16vPUjKuven1Kv
        Dd4H8hPT73fEXESwP82HTNl1TR3WOne2VA==
X-Google-Smtp-Source: AA0mqf7fYciTgDh3ZmXNH39sjxynrqUcRug2zTWD+BxdudoykZbGtxChnDXxn8AfxTUIgy9SUAESbw==
X-Received: by 2002:a17:903:22cc:b0:17e:539:c405 with SMTP id y12-20020a17090322cc00b0017e0539c405mr47142174plg.53.1669904202136;
        Thu, 01 Dec 2022 06:16:42 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c61:2814:c945:522d:e948:beb1])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ff0200b0018975488514sm3663041plj.126.2022.12.01.06.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:16:41 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        a39.skl@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add SoC IDs for SM6115 / SM4250 and variants
Date:   Thu,  1 Dec 2022 19:46:18 +0530
Message-Id: <20221201141619.2462705-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
References: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
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

Add SoC IDs for Qualcomm SM6115 / SM4250 and variants.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 include/dt-bindings/arm/qcom,ids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 5e0524991e99..8f5324dd3ff2 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -125,11 +125,13 @@
 #define QCOM_ID_IPQ8071A		396
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
+#define QCOM_ID_SM4250			417
 #define QCOM_ID_IPQ6000			421
 #define QCOM_ID_IPQ6010			422
 #define QCOM_ID_SC7180			425
 #define QCOM_ID_SM6350			434
 #define QCOM_ID_SM8350			439
+#define QCOM_ID_SM6115			444
 #define QCOM_ID_SC8280XP		449
 #define QCOM_ID_IPQ6005			453
 #define QCOM_ID_QRB5165			455
@@ -137,6 +139,8 @@
 #define QCOM_ID_SM7225			459
 #define QCOM_ID_SA8295P			460
 #define QCOM_ID_SA8540P			461
+#define QCOM_ID_QCM4290			469
+#define QCOM_ID_QCS4290			470
 #define QCOM_ID_SM8450_2		480
 #define QCOM_ID_SM8450_3		482
 #define QCOM_ID_SC7280			487
-- 
2.38.1

