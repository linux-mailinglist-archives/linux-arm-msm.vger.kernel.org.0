Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB92789B38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 05:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjH0D2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 23:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjH0D2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 23:28:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE1ECD5
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 20:28:10 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9338e4695so32462211fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 20:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693106889; x=1693711689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwfUF3EYgRVowKMk7VzgTE9mIXza2VTBkWULkxA1a3Y=;
        b=o2U3iefzt2SEM7nfET/xOsW/Z5X3GB6s+NoSCE1D1YRV2TGuaFa1NsgZbOpbjgT4kZ
         3XW3OphD58dA4uUAOvjD5AFMAXoThWM3T5Nl5o+7u6kSKyH32d/Mc8FYxCJa+7vI8kGU
         h0fVgvPdI2E0oiMJw2AJd2e4KlWOWn36vnM/gIA2moopQtjmJha1ATGbyTqlQxM2vQDr
         apq5nnamOmv4sdLVdy4rwCT6qsoI3JHtPG8AkOtordO/2tLjUSmIzyys9UBZom5/RRRZ
         fuxc15k/1HWX0nugUQTjGyqWswuFPM2CaLOtprDgt8KKZiasoGyFChKywHyi4QyN8nm3
         7nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693106889; x=1693711689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwfUF3EYgRVowKMk7VzgTE9mIXza2VTBkWULkxA1a3Y=;
        b=JPyTceZMKguCeAd/1pQoPwi0BsMd9CQxry/jEF1gfwiPHvWbO4aCL8gaKUD0Q4lZTO
         MP7oPmM9TBRfhTgxIjSYfDZ908l6a8llYnm2cHVb+ovGDp8yWyC1H/CARfm/JRboK+wm
         yeIZr6tTfA6qyI6qirUigKYaNfLHHiI79BP88Af0w1VP8qLyaqfNzzmjt4oXnFTHgGuQ
         UTqL9L4YidD00/Hg1W58On+kFmkJ5UML+TZ4E2DIOrPrFnX7gXBevlWeUBpahYcM8A0v
         MDhFkv7sFi74OadlsHAzz95hxMWNJCbig4N2RkHvpX0aKlhNBLZon085KaLvbJ8amQMh
         0t2Q==
X-Gm-Message-State: AOJu0Yz9S/41RFJFgyUWpaJZI33NemGhFcqBSzt8U58TyRDCY6zrePJA
        SK5Wp3HI0ylDC/csCj9pmdrqzw==
X-Google-Smtp-Source: AGHT+IGg8zVbzuFFSiqDkEi6k4ZwbCaoAlD5/PcWXNyrojkFLqRlpymVSukD0uP3p7jUxDOeOAkfkw==
X-Received: by 2002:a05:6512:4026:b0:4f9:570c:7b28 with SMTP id br38-20020a056512402600b004f9570c7b28mr19830480lfb.32.1693106889117;
        Sat, 26 Aug 2023 20:28:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w7-20020ac254a7000000b004fb99da37e3sm955709lfk.220.2023.08.26.20.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 20:28:08 -0700 (PDT)
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
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 6/6] cpufreq: qcom-nvmem: enable core voltage scaling for MSM8960
Date:   Sun, 27 Aug 2023 06:28:03 +0300
Message-Id: <20230827032803.934819-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827032803.934819-1-dmitry.baryshkov@linaro.org>
References: <20230827032803.934819-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reuse APQ8064 config for MSM8960 to enable core voltage scaling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 35e2610c9526..2590c673cd3b 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -408,7 +408,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,ipq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,apq8064", .data = &match_data_apq8064 },
 	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
-	{ .compatible = "qcom,msm8960", .data = &match_data_krait },
+	{ .compatible = "qcom,msm8960", .data = &match_data_apq8064 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_match_list);
-- 
2.39.2

