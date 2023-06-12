Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F25A172B787
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 07:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbjFLFkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 01:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235719AbjFLFjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 01:39:35 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD42F10D0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:39:33 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f63ab1ac4aso4437988e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jun 2023 22:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686548372; x=1689140372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tfSMMNSy6Z3dTRBojoQkv78dxEs3QjtEnCrcqetfSI=;
        b=k3zZWbQ+mrX6ywklFiBilg2GTBEAOog51Qkh0SfDm3g3P0x6q940R5XH1Y/z/qMmR0
         FaU+r6kvHVgbksBN2x/Nrpo/ifEZhx33FhDxnd+7HEJUarGb3GitITZk+OQfmbNnI1F2
         Hr45+OjyPDLaabLGZkyRvFH2yiZ6A1b7eO0Rdz4D0rqJmh1E4P5uyVLyltCxdHlVWRHq
         9E/8NpCy7yLQephAySALRgWGmQUQ2JJoLs8cf0OeoQHhpcGWF52etC1dgYtoB4JsFqkI
         jurHSTwEld5bHKnn1NUhWKroq7rl6Q0sSiHmDP+hvQK7905HCOe+4NKjcQBkREFzdwcI
         yN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686548372; x=1689140372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tfSMMNSy6Z3dTRBojoQkv78dxEs3QjtEnCrcqetfSI=;
        b=YYXhhZV0/fIddYmJeRrVBRsYiA+5F5NMSusydZa8zuaAnz/9NeouyeV9kBGBzr0lyH
         W9q8b9MzKaZ90k7X7PRrFjhgR1ydJkXzMLhbH8EWwlirLOZTaPG8lBMutp5TZkOUmv7I
         cZlYjkimUi/eId1MPsLlC2+HnyMKTn9ghsvKJbTYi7azx78nYNN+wXs/qum6TxJu8+P7
         dn8XP1vR9936kou3sYk7+aMPS3Vp6JP+1q55BYfzXoeIBti8mMbaQZlt+zTZFix7a+RF
         AGnMyi/+StiQVUFDqhRHH/enNvwg3AFTt4q1yUIkVg823/HSYAheosNko/6/zQGZtday
         i+Fw==
X-Gm-Message-State: AC+VfDzn6znUlfqrr1qICaIQgFvbsauhN2E1DF4rGyksC80rE9Gz6cmh
        YdAh4otXR60TcAwMbH4sFoQiNQ==
X-Google-Smtp-Source: ACHHUZ4qCMQazXgSyMWDZvV43fJKQEv4MABxank6FGdih0/Y3fZtg9SXjo0DRBP4FSZlc5uZwcHCMA==
X-Received: by 2002:a19:4352:0:b0:4f1:4cdc:ec03 with SMTP id m18-20020a194352000000b004f14cdcec03mr2832595lfj.18.1686548372136;
        Sun, 11 Jun 2023 22:39:32 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id n6-20020a195506000000b004f38260f196sm1324125lfe.218.2023.06.11.22.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 22:39:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 08/18] cpufreq: qcom-nvmem: also accept operating-points-v2-krait-cpu
Date:   Mon, 12 Jun 2023 08:39:12 +0300
Message-Id: <20230612053922.3284394-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

the qcom-cpufreq-nvmem driver attempts to support both Qualcomm Kryo
(newer 64-bit ARMv8 cores) and Krait (older 32-bit ARMv7 cores). It
makes no sense to use 'operating-points-v2-kryo-cpu' compatibility node
for the Krait cores. Add support for 'operating-points-v2-krait-cpu'
compatibility string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index a88b6fe5db50..fee9736f7326 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -238,7 +238,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENOENT;
 
-	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
+	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu") ||
+	      of_device_is_compatible(np, "operating-points-v2-krait-cpu");
 	if (!ret) {
 		of_node_put(np);
 		return -ENOENT;
-- 
2.39.2

