Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37BA778D95D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbjH3Sc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242951AbjH3J65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 05:58:57 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828EBCDD
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:53 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52a5c0d949eso4934248a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389532; x=1693994332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNs6j3Ggs2JWRbc5ZnKbQBXSzYL49uka3JdqYW+Ab2M=;
        b=SPtsM+1X/Bj7RGHNV3Z7c9pzhdLQobQ32YhJ0DXAZDGab88dcYHhzrDvNQulKV4vi7
         N8yJimOKI0VdToc358sFAOeH6uS7tj7IkCMzR2zBa9Li8mq8ecEIppINgfF6z6SCdQ3l
         Xc+XSqkP5h1XU8yihi7NFSRNj92fMC91BbxYJ4fqDiDptzvrzsOdGprQjqKmXDV93kyL
         jqiHgRirFvyxe4Lffw65gyzQRBLTzf5XTrz38xpvjRrq7JqF48noIzCjfvpVAnwh/cES
         FRBDMK0/tKBo4ensZXRxuPppjEpczyJbXGkrToN43PdUhif9U6mU5cBFemi6nhabxHaS
         cjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389532; x=1693994332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNs6j3Ggs2JWRbc5ZnKbQBXSzYL49uka3JdqYW+Ab2M=;
        b=RDeOXPQJzt5j8aTrpCYW2E9QHVgZBVjY7Gm9FA50VAmDXQ2JHsvmun/YJQYlARY3NA
         4cx3rgLkPxHI7GoxDch+6s2rrjguQpvk0/mMLNzS8EjTr+HJUP14mTJWA5pPtZs+SsFl
         B8cBgrIOmwK39wWOT+F3MaLQvB/4tdFP+n1I1vTdBhIiv3qLL6u2Jn34jHMeXl3UUKdv
         B35EyxUVaf7FbQt04Mnx/O0elsOKqfyUFCXzOXehD4H5ZTQ+wSrSGXxpTHS2kISuO4G6
         kiTEgklLrR9/SMcFaNLLHHZ/ycbcAABU0fEJ9XXrJcxDx+/BfILUpJihIxo4sXf82R0T
         tNVA==
X-Gm-Message-State: AOJu0Yw0O1bE4hBwB0Sqj09aW0FNRZlWgDUgigA+oFU1t4TyVfp25DLd
        o1TASgIvxUo6qsO5jDVs3UFexg==
X-Google-Smtp-Source: AGHT+IGOpJWT1BIO52CgEaoaxvd+0F80/V3wR3R9uefOOSQL+y96/QoEafSts3Kl97HWgTVhtP3qTA==
X-Received: by 2002:a17:906:8b:b0:9a5:a0c6:9e8e with SMTP id 11-20020a170906008b00b009a5a0c69e8emr1614064ejc.31.1693389531990;
        Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:32 +0200
Subject: [PATCH 07/11] dt-bindings: arm: qcom,ids: Add SoC ID for QCM6490
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-7-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the ID for the Qualcomm QCM6490 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index be12e1dd1f38..b6aafb988e08 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -233,6 +233,7 @@
 #define QCOM_ID_SM8450_3		482
 #define QCOM_ID_SC7280			487
 #define QCOM_ID_SC7180P			495
+#define QCOM_ID_QCM6490			497
 #define QCOM_ID_IPQ5000			503
 #define QCOM_ID_IPQ0509			504
 #define QCOM_ID_IPQ0518			505

-- 
2.42.0

