Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F0072FA51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 12:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243215AbjFNKW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 06:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238327AbjFNKWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 06:22:24 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7952C1BE9
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 03:22:21 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b1a7e31dcaso6623021fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686738140; x=1689330140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak6pJEE70i86/FySUfYrSS2au3HzGmo13oLp85+Of0E=;
        b=e5DN8MmVuOUVJKrecInLvzge7vnLUVfPnUv2qoy9gy7Y43omkyW0ZLgoqB3IVkmNYC
         0oP8VZmI/777Qse3/LxtFRfHg5uOVydt+omq5lLpq4xbgLMgi6Xci9ZFr+rgmmwyxxPg
         rBnApm+qLJZzhwU6bsIg8WwUQLPGUKOgAY8LUsuCq/ENbN5tOvDP2W8VR/4oXoieW5L4
         pAQkZ7lOmuaGjmz0ANCr8Z0g2fzO4cBdOAGyjdEwVw+xbJJEylLboXlieG4u9fmVWhoX
         qQD2WT6+doAMu5g/aasnnVy6GW4x0iyn3EW+vXeZGiavD0NB26uu4WrJtqfEWSgcr6Xt
         oUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686738140; x=1689330140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak6pJEE70i86/FySUfYrSS2au3HzGmo13oLp85+Of0E=;
        b=lINuVVDlRPrAK1h2a+WeTLcaXqOt3bNR4+eCZeIO6F405tv8zFTeGgkqs+IIwahZMd
         QhjBCTT2zw+a2Rnq/FbOQ8QFIssjORGD6GianqtjJ7iXp7tkODRwBEscAVqZf79UwoWt
         +KCLlEZZzKa6gHsxJqc95m2XLhJokOCrOHa9g6QMBhMdaG2gQiURrHOm8DV5OfKTAjak
         6tiarYFuQyjh5x1nChq/qevqioMiRi15xcvJkFTjxrKZr8bZuPlG8KXx+e1P78TuAnhG
         EbberTgN/cZM3ME6L6VKfTsZ0ADR72lGVG1QEQ2bCzIZ+ae3HOODPqrB+io6qcX5rrxp
         gGsw==
X-Gm-Message-State: AC+VfDyT8TjmJGHYe9iWYw/R8ioDAERYmEfv4WJCumTecSvQW6hZFqDC
        qVujWoxZG2kKA5uVH8wQ7Q01dg==
X-Google-Smtp-Source: ACHHUZ5lmTu/9NRhwNJEGFH7nnpYNEhBSsDSJp3FrLVJyvwX31wx8PrD+NWh0X7JxLrq3Ws3PoQhxw==
X-Received: by 2002:a2e:910e:0:b0:2a8:bd1f:a377 with SMTP id m14-20020a2e910e000000b002a8bd1fa377mr6578613ljg.20.1686738139839;
        Wed, 14 Jun 2023 03:22:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m2-20020a2eb6c2000000b002b20d8f270asm2520057ljo.74.2023.06.14.03.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 03:22:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 14 Jun 2023 12:22:13 +0200
Subject: [PATCH v5 02/22] soc: qcom: smd-rpm: Add QCOM_SMD_RPM_STATE_NUM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v5-2-eeaa09d0082e@linaro.org>
References: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v5-0-eeaa09d0082e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686738135; l=664;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XHE1WQYZzaLo+c3xD4ALM/GRb1VwY7GuxNqpdL0mBnk=;
 b=Z8yBghNNMxMn+9eINX7qwCSmxht2X+X3SgW1EzzINyO8TFr4knjBpbMfDx/1zQ+Dwdr4u7hVi
 ErEdbmhvwVhCmO/6uGnbLZ2tTSsN1Fsus1YUnk7PWNJP7twlVwuhft8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a preprocessor define to indicate the number of RPM contexts/states.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/linux/soc/qcom/smd-rpm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 2990f425fdef..e468f94fa323 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -6,6 +6,7 @@ struct qcom_smd_rpm;
 
 #define QCOM_SMD_RPM_ACTIVE_STATE        0
 #define QCOM_SMD_RPM_SLEEP_STATE         1
+#define QCOM_SMD_RPM_STATE_NUM		2
 
 /*
  * Constants used for addressing resources in the RPM.

-- 
2.41.0

