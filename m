Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A2263F277
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 15:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbiLAOQi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 09:16:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbiLAOQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 09:16:36 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3F7C6E64
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 06:16:34 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id jn7so1733203plb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 06:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bGgpjHbnhHO+o6mtfV9lfMk8qb8EvPBRn7SUolON6k=;
        b=dnKVXEwXuiyC0ZX3ZLXeZtBw+L3qNU9QQxH28Yn5PRSvvmoYG1VcqFKCTGMCgMWZzH
         oVk2IJ3qxSdNGNGZkoSFCYGjlOhenilTX74Gsx+8S8uOLN6FlUtnorQkv/isyp+++Itl
         +Mk+BEKBl3cwR+1cwRyglYa9H2wX92sruaYms5P5Q2QqdxDxCq8VtvbYaF9UFL6Vw31M
         ZfhM0KGXfs+9jjjkdiNC40SLFYvzPNSsodNEjuVXuYS5EHuax49E+NSGDrk5oGCccj2Y
         SvrIM/zlytRraDodgyeROWS6GGV5BN8ZBZ2coTwPjp8S2CLiyYsl/SzC98JOS7wJBHqE
         mBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bGgpjHbnhHO+o6mtfV9lfMk8qb8EvPBRn7SUolON6k=;
        b=fr5IEn9c11fFn6kWzTVOttrrDU3OiT1fWhNmz8BtsPvXIdNGdmENiTe/eoM0FqrTjI
         mZxUVaK9BIfyDUjtnjRWLMrvjxVvijI9FUJILK78tDB2Nov/wGvLzOqjbkuKUcq8oDka
         GlqZK2Upo2WjEQjB+DH2dDXZNAVzQMJvAEKmztE+g0nURsX/jyXDh7N+eT2sQ+1op1op
         +/TIfIOyQ39MqywLSsdfvm9S19wWTqlguy6FZa5V5MNIGCrKK0cdy8jf/r+v6x9fMye5
         OR2izChSoBB4XAmufYSpfam6yVKfI+PTgoLyKAnag4Lj2UWxg/QRFHu7fCwwRshi1Hcc
         sMjA==
X-Gm-Message-State: ANoB5pnSMX1O2Ur1tgQTTUQIvSyUQooimiKoV7ohAnleDhZgBkwazhvE
        6ysTXnaqwqvE+3BwMyXslzUiXulUJ90D4A==
X-Google-Smtp-Source: AA0mqf6vs7+VYoM+HZo+RIqdoN4FrdznOK9yC7L5LBRh2j8sqhBmD/PiljoQ+DU+lyS9anNTJo5AIg==
X-Received: by 2002:a17:902:f7cb:b0:189:3e8f:fa49 with SMTP id h11-20020a170902f7cb00b001893e8ffa49mr42988925plw.142.1669904193149;
        Thu, 01 Dec 2022 06:16:33 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c61:2814:c945:522d:e948:beb1])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ff0200b0018975488514sm3663041plj.126.2022.12.01.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:16:32 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        a39.skl@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/4] dt-bindings: arm: qcom,ids: Add SoC IDs for SM8150 and SA8155
Date:   Thu,  1 Dec 2022 19:46:16 +0530
Message-Id: <20221201141619.2462705-2-bhupesh.sharma@linaro.org>
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

Add SoC IDs for Qualcomm SM8150 and SA8155 SoCs.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8b1a0f43bd93..5e0524991e99 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -102,6 +102,7 @@
 #define QCOM_ID_SDA658			326
 #define QCOM_ID_SDA630			327
 #define QCOM_ID_SDM450			338
+#define QCOM_ID_SM8150			339
 #define QCOM_ID_SDA845			341
 #define QCOM_ID_IPQ8072			342
 #define QCOM_ID_IPQ8076			343
@@ -112,6 +113,7 @@
 #define QCOM_ID_SDA632			350
 #define QCOM_ID_SDA450			351
 #define QCOM_ID_SM8250			356
+#define QCOM_ID_SA8155			362
 #define QCOM_ID_IPQ8070			375
 #define QCOM_ID_IPQ8071			376
 #define QCOM_ID_IPQ8072A		389
-- 
2.38.1

