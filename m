Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D375E7F25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 17:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbiIWP6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 11:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbiIWP6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 11:58:32 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AC0A11A23
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 08:57:50 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id b6so531802ljr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QErVhPRsr6N34SxJtyWhiwnyHyeW0kuOVw7a/uaJPXU=;
        b=K90C3hBC6wd5wX5fUY+1rT0FrcxSVMtXeBam2xxfpXbCDnmo2fyDcdgG9nSnADKhgc
         o2OWb061x6VWvbk9dEQrp/ePFAimAEzue6BUNwKD8D+jnciw5fX8KSljEMbkxJ4ubc5+
         JcsV14M4u1b4vcTxCWhY/vF4t5qB+ONaqEsca+a0xJ8LewPoup13Tr+JooMVwEw/6NfW
         VL9HsHhxI9BEbeBoZsgPhA7P5nhbAvydwvQo8DZ9hwF9uZ+OY35lyF9WSCg/iLLERh1O
         Hy6hTcAaGuVVEh5xCawr/KmXvG54ToUvvcdhRwVK6HCyTvcjHApHE4dAHP4Q5DniMhzR
         lwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QErVhPRsr6N34SxJtyWhiwnyHyeW0kuOVw7a/uaJPXU=;
        b=JTVgqKC3ZcFhRxTOOm6Tu7U/sIgEHhoLbG89eTD2CNT4GG9qYWT6NKcQY0PVHd8RqV
         6m8iCeVsQbzJ6Af2gPVh/WwyVoUHREtPB+JUoW4TGy8mKiGNftUhKwVjkPl1k25hS+tk
         b54l0+vMEUY3TvUEnbmJ4XIvZzX8A1lOPkuANdp9fkQJnYqZcR1BSNC9SDXBO8+iXfeR
         sCz9HP7srZyYiTm0imCOJywlIaj8W5HNPDMi8qIOI1OErOzO4I9Fmo/Ia0OWSLJrBxrs
         qkMxa+1DkxZ/KoyeICHyb8HoeeuncZG1OAqq6nyYrKxvBgLuL9L4L/ifQa75FCRH10R/
         dhow==
X-Gm-Message-State: ACrzQf3bnB3R436PUk2s0Zoe0yytLbql7wkXcwzlAJ6d2goiPDuHQeY7
        1BnpbMY/Lm+gk+lAkl3nEA3B/Q==
X-Google-Smtp-Source: AMsMyM75V1fMGaL7US5/aDsMjZmatRFTONq2M7J8EAALYekOySKgoE+XfmX2rP9Y0C4bmxwyKYSNYQ==
X-Received: by 2002:a2e:9dd3:0:b0:26c:3c23:a7e0 with SMTP id x19-20020a2e9dd3000000b0026c3c23a7e0mr3014306ljj.22.1663948668446;
        Fri, 23 Sep 2022 08:57:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be17-20020a056512251100b0049a4862966fsm1502286lfb.146.2022.09.23.08.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:57:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] slimbus: qcom-ctrl: drop unneeded qcom,apq8064-slim compatible
Date:   Fri, 23 Sep 2022 17:57:37 +0200
Message-Id: <20220923155740.422411-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
References: <20220923155740.422411-1-krzysztof.kozlowski@linaro.org>
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

Bindings require usage of fallback "qcom,slim" compatible, so
"qcom,apq8064-slim" is redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index c0c4f895d76e..bb106eab8ae2 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -718,7 +718,6 @@ static const struct dev_pm_ops qcom_slim_dev_pm_ops = {
 
 static const struct of_device_id qcom_slim_dt_match[] = {
 	{ .compatible = "qcom,slim", },
-	{ .compatible = "qcom,apq8064-slim", },
 	{}
 };
 
-- 
2.34.1

