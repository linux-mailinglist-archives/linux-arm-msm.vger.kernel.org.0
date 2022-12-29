Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30A1F6588DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 04:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbiL2DBW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 22:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233089AbiL2DBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 22:01:15 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854C112760
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:12 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bq39so18123515lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 19:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MW0phKWlXpbBUcPLtblyJtyFj83QhXQn2uWltgLH9s=;
        b=o++t5rB/h8ngTpR/bexCoPX+Bi6Xi6oLat8zSbkIu/FOFiAXdUrVZlu75Q19eRl0kA
         YlBFdyzX9byjG4unHRP+HwQ71/kGldNs0/qwNfmGMXKIr0TrYx283fEc7Te306W8uwYQ
         e0X47OTOQ9p3qqdWMMtKXkbRQa4xNCN5mNps2vIiel1BkZaSbM/ryUXzadad6BqLnm0m
         hfTfFDmFEQ6j7sf3JLOGKfdq+bUnEz0YU0+VjT2mqHAhPlz4BhaNc+HlZEFTfEMwDC8V
         1nz3okN4z7HSaS34wmTo7WI/KG7+r+4Z2JOEPaazK3P+W1+xK9Pms8uH4IJDRX/0ZF8S
         CM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MW0phKWlXpbBUcPLtblyJtyFj83QhXQn2uWltgLH9s=;
        b=ng2LbQVUlYS+l4R/qu2vzRKlHlPglC+6VgPkTD0/9UmvL2qPcBPBTtR7j9Q+1HcMrf
         l8fL1EbvkX/Z2ynTtiOJ55OVaGaNrkCDV4DEb5vvhMJaO4rjxOUAVJR7VgvY+O6jfhLf
         y7l3XT1/fw4zFKUbdc1/YZ9in16ydYO/yqmlNdd6593NGGLp6SuOJm+2yIxSfSHAN3F8
         C2gjW6plp0SS1L3lWdZpde54XjxS4nOO7bi0dR6MZe+b2nT6UfPnMtlkXV6c3eZ6Dl5x
         HouoRIqK0LtbTfCxIpJ60S9bLAi/PMRvDA56soGBriYqJCefXumC4Ek6Ee3ICKWp2dl3
         FaXA==
X-Gm-Message-State: AFqh2koFowSUzrRlVo3FIEm10C4GpT7gO1QQlk5iYyBFgCvJ1X4QAoOv
        PI6jz8692cjoYbEMsUVL34m8qg==
X-Google-Smtp-Source: AMrXdXvxiqdPQZVqwwXwrOOrRYtjN+1TYudN30JA/pkSqvXvBeO5ECH9nwWkCEvVSaA+JM+v85uMtg==
X-Received: by 2002:ac2:414b:0:b0:4b5:3505:d7f9 with SMTP id c11-20020ac2414b000000b004b53505d7f9mr7044911lfi.35.1672282870900;
        Wed, 28 Dec 2022 19:01:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512024b00b004b57277474esm2883070lfo.106.2022.12.28.19.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 19:01:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 04/20] thermal/drivers/tsens: Drop unnecessary hw_ids
Date:   Thu, 29 Dec 2022 05:00:50 +0200
Message-Id: <20221229030106.3303205-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
References: <20221229030106.3303205-1-dmitry.baryshkov@linaro.org>
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

The tsens driver defaults to using hw_id equal to the index of the
sensor. Thus it is superfluous to declare such hw_id arrays. Drop such
arrays from mdm9607 and msm8976 data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens-v0_1.c | 1 -
 drivers/thermal/qcom/tsens-v1.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
index 04d012e4f728..0bc4e5cec184 100644
--- a/drivers/thermal/qcom/tsens-v0_1.c
+++ b/drivers/thermal/qcom/tsens-v0_1.c
@@ -635,7 +635,6 @@ static const struct tsens_ops ops_9607 = {
 struct tsens_plat_data data_9607 = {
 	.num_sensors	= 5,
 	.ops		= &ops_9607,
-	.hw_ids		= (unsigned int []){ 0, 1, 2, 3, 4 },
 	.feat		= &tsens_v0_1_feat,
 	.fields	= tsens_v0_1_regfields,
 };
diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
index 1d7f8a80bd13..96ef12d47bff 100644
--- a/drivers/thermal/qcom/tsens-v1.c
+++ b/drivers/thermal/qcom/tsens-v1.c
@@ -387,7 +387,6 @@ static const struct tsens_ops ops_8976 = {
 struct tsens_plat_data data_8976 = {
 	.num_sensors	= 11,
 	.ops		= &ops_8976,
-	.hw_ids		= (unsigned int[]){0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
 	.feat		= &tsens_v1_feat,
 	.fields		= tsens_v1_regfields,
 };
-- 
2.39.0

