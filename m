Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12265745D72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 15:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjGCNbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 09:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbjGCNbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 09:31:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10292E6F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 06:31:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so1586171e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 06:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688391079; x=1690983079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0Tw3K884EqPljezRBvFH8q3oj/FtWnGBPlC6pRuCDw=;
        b=qW3/NAVcPirJqJtbsyH+kRmHKIvIUgTk/AzW93yk8n28IMpfwy1cuLTyLConHraNgl
         4uf84sfG2b8Xp/SDX/h3gnP3OhZj4hdDuRc335s4naLazI3i9wOfhxEU/zraW3/K9MJs
         aXqhZfHsKeZOMinT5nsmYYKXU4h9UnVdybQY5VOWEZc+DRJcPPvXCMDFYQfgZAzUPSjn
         K4NtELU6FwE1q9I1H7jmSGC1UT6SrbrCZM5jpmVC4LV7nXUl/f+Y1opJCZl/Y/RmCyl/
         LvwYlFA36QDaGkNCS5eRMbcMQjwuWXGAnG0c/Y0yERirIg6s5uL96ZnoE3lbrmVPUfw6
         25Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688391079; x=1690983079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0Tw3K884EqPljezRBvFH8q3oj/FtWnGBPlC6pRuCDw=;
        b=VCqArTJJXfdJQ7234NhQsQZK711aBGgOpScFURoUXumlM3D02Xx4o/n0VSRM+EfY7I
         LCzb71r39QLeouDRE85DTZt13h+wYZszIjqP9jvRsTz+YY3Qkm/tMUJ18WKggxpBoma2
         zVU8Cobtq3/wMXl5+nPpU7YZ7dKpflKBVl9mCB1f5s74AMkBV12CqLN9BUbab+JpBtK5
         EEXv3HVgIl9o9Eskg2VQPs3ZqWOcLDBQXSyThm6061/29itW8uo1F7CRMNPS5LW+/xdt
         qhwIWRvWKO6+CgVJ8EqmvZbYsgo0AeeOGBF4903HKv/5P9iIh4ybXqK8CANH3T7GqvSq
         RH4Q==
X-Gm-Message-State: ABy/qLayOutcRBq91m9+HJVym8qY7heLXHuZKGbxFzFieYXtR+qb1d7Q
        cdVbER3VfmEDkc1vOIsalV2/Dw==
X-Google-Smtp-Source: APBJJlEVXabz5Lbs4x3OROPIw1FnLVfehVIcKeuvIHlckHEVUZDMlAKu0MUZX7eoO8xfVvtOYGc8tA==
X-Received: by 2002:a05:6512:36d1:b0:4fb:9d61:db4d with SMTP id e17-20020a05651236d100b004fb9d61db4dmr6401322lfs.18.1688391079411;
        Mon, 03 Jul 2023 06:31:19 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id ep7-20020a056512484700b004fbb1f70ceesm833417lfb.227.2023.07.03.06.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:31:19 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 03 Jul 2023 15:31:13 +0200
Subject: [PATCH 4/5] soc: qcom: geni-se: Allow any combination of icc paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8250_qup_icc-v1-4-fea39aa07525@linaro.org>
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688391072; l=1230;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=co9BdW2nWkUZOcUTizkeFw8YjDRYAbLHFxUe7vw2Hi8=;
 b=Ujk0LJDy05oagsVI8a6ZmnNEpYOuoJq5uyL6lqwIgDGgLZ20MpLNP89MZUyPsBsmv07eQPoRN
 Ej8VC4qyRHWCZhU8eSpTrxsn3vV2PM+Q5TalSz6YgYzA2YdP3bIRV8v
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all SoCs provide all the usual paths. By the looks of it, at least
SM8150 and SM8250 don't have one that would resemble "qup-core".

Check for the error that icc_get throws and assign a NULL value to each
path that can't be found to effectively allow any combination of icc paths
(which, like previously, includes no icc paths). The ICC APIs gracefully
handle a NULL path by exiting early.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index ba788762835f..a5e2e8925c8e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -813,8 +813,13 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 			continue;
 
 		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+		if (IS_ERR(se->icc_paths[i].path)) {
+			/* Not all SoCs implement all the paths */
+			if (PTR_ERR(se->icc_paths[i].path) == -ENODATA)
+				se->icc_paths[i].path = NULL;
+			else
+				goto err;
+		}
 	}
 
 	return 0;

-- 
2.41.0

