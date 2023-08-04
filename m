Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 971C377096A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 22:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjHDUJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 16:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjHDUJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 16:09:19 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F236E1706
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 13:09:17 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so38778851fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 13:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691179756; x=1691784556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2aRe3VQp3ojn2kNtDYANj+Z9eCgQlqJ0LeM/h4iA00=;
        b=hcAIZoGIdxlAiQaQ6GwtRgDX+C4CwZ6/hkARq/ty92dtBNOoGHxGy8sYXlfPflHqQX
         Jo8YNfPQu6O4OssNeVRtO0cvfGPwGkF3qeW4JYW2/rW2C7ZbMn+7lD0I5ng3uhjWnMMO
         DMsnpDdlfAEMc3opeoWhRN69H5n051OuBiqqUS28QkK/WKJU2uc6de3hnmtMYRbsHiHq
         ItRkVGVGfkw8ZvN881MjXnAekk8gUWaIe3RWShNUdb7SIE72P7b8Ni8GbJlzEo+dRmRE
         S5oDA3cYHn4uLMP/v10mz5xjmFtumyU5mi1I7ihN6V9dQ2UjRJ9y547GTMSUrXUkbs9Q
         wxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691179756; x=1691784556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2aRe3VQp3ojn2kNtDYANj+Z9eCgQlqJ0LeM/h4iA00=;
        b=g6xNgOxGKe5DLCc2K8Tewp0b5t5mOghi+d1lDkHSsPZFy3+xR7kNxbeI+DQVsu9haq
         5B89DGkzpklaN2MtjAIKre/I9tDHif/pSeFZKL9FE5iyw7GpYUOU+euqoXNX3/t72rnx
         UZ7uIytVzXvjjJ/VL49B2tnM6JcXziflWSHaOr5ASblj7Eki1wfi7YheZ9OhHvVuL5HT
         HCGlUri7TXm+ycHW8BY3dRjCfKzK2P69pUPAUYBpDOgBtfDuzOYEA8iKLKrU1co9+wjX
         ivo8Xmh+Kmm2ABbOLdaoO+tfTexz6DSpa/7RKOpRzWbIVcynDPNxQt4GZ0E8c4v8Hb0I
         rkUg==
X-Gm-Message-State: AOJu0YxR+C+y/DcsosrxlD1ZMm/a/l1w7AfAmlp9UVrN6KsEKeH7mlvt
        tKQ4sBYDc0XBq5/34v682sFx5Q==
X-Google-Smtp-Source: AGHT+IEtkvzoEdpSQR+7jN6IqyrrTbl5bBwSCc7JakEvciOl5bN8auvHh48JxKAMearZGFhjI8ljJA==
X-Received: by 2002:a2e:7014:0:b0:2b6:c8ba:90dc with SMTP id l20-20020a2e7014000000b002b6c8ba90dcmr2120012ljc.36.1691179756151;
        Fri, 04 Aug 2023 13:09:16 -0700 (PDT)
Received: from [192.168.1.101] (abym15.neoplus.adsl.tpnet.pl. [83.9.32.15])
        by smtp.gmail.com with ESMTPSA id m8-20020a2e97c8000000b002b6fed37b18sm580048ljj.101.2023.08.04.13.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:09:15 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 04 Aug 2023 22:09:09 +0200
Subject: [PATCH 2/6] media: venus: core: Remove trailing commas from of
 match entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230731-topic-8280_venus-v1-2-8c8bbe1983a5@linaro.org>
References: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
In-Reply-To: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691179750; l=1757;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3ekrTJqxADKrttESDrJNAWhd4a80z1h8dYphERsMjIo=;
 b=Rii9oUopQl4KfHN4hLHALB6KJGSQQ+1pSmE51EkW0V94JkuEKChVeZn+hftUHQHB5cSRfWfLi
 sZJna2KT8NhAoEidXZneuk4u1/ElO9aOD+b6XKoaxUiIJJ62GhfKcSB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Even though it has zero effect on functionality, remove them for coherency
with other drivers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 3cc38881d4f6..0af45faec247 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -884,14 +884,14 @@ static const struct venus_resources sc7280_res = {
 };
 
 static const struct of_device_id venus_dt_match[] = {
-	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
-	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
-	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
-	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
-	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
-	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res },
+	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res },
+	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res },
+	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res },
+	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2 },
+	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res },
+	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);

-- 
2.41.0

