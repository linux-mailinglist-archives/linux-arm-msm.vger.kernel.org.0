Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556286BB594
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 15:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbjCOOLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 10:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjCOOLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 10:11:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00EC65079
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:11:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d36so24476114lfv.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678889489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GQC372p350UPtIPazu4oAK/bKFzzByhaQ607sxvNsw=;
        b=bMCLdOfJluKG93B8X14Nwvuclf3pIxYV9nJ44F8j74KokL5uGvwX6qtV/nIERxr1MI
         4tELUHZqrpzvfSc2j7VvQhq62SkbPdt6P8DlFlk6uNflt0wALcX49ZDOBBI590gBwmev
         TwhTDO5zBH0JlLwREURezNvS4tngu339X61BXg1JYkvG6t4P3Sllg6t5BSRfRzQZbitl
         Ud6irwWAPtybBBI0ppbyQoAUR2CA9XIXzCDsS+4iweP4l4nt8i1VgswZD0dl2w2uzQl3
         j+Eq18n9brkSU1mI30uYOM1krysO2lgfH5+oKIIy+accMdfBK2SVjSpz+sIUzI0kCcII
         nQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678889489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GQC372p350UPtIPazu4oAK/bKFzzByhaQ607sxvNsw=;
        b=O+dsRzN/6cRjNWe3HBMkVMnMsk729soCqe4aFtsb+PlQm+8lsa4bDl3jHJYBEExK0f
         6QouXQqW0gtit4AMlHJ5lFDC6vLJi8i+RJRaK5/GAPwAH/H4/DdK7zn4wI7dV4XxOD8z
         rHjvzWUaQIpv2fnNgDaTQmiz0FDxZ2qkd/YsWCCSgTB+M5RAHgZM9PYLIUM4eCrjE5P+
         KhpwHpjTOeRC/YkO49XzIX4ANKM5wVY5/ZX6bSy0z5WNbP/WYCp8gpmZhG+ZGUsY3XzC
         IBsCU40LeCuS81uEMB1pEOOd6E0Xeo8stW8jlyydcH2laWyHenV9Nc3MU/yFlo1k4n6Y
         bmFQ==
X-Gm-Message-State: AO0yUKVIM4fS+SEZrsCHTAIpWa8s+ObB+LOU16RreAVjnQYQmrlx/y5n
        4RnulR8sQqXb9HpSsvAm61OYcw==
X-Google-Smtp-Source: AK7set9o805hGVxYPiz65okFpyO220Y0Q8INLHwXyZy6iH2TNwPx1vH5IdQY6ziOwj2AlfmjrlnkjA==
X-Received: by 2002:ac2:531c:0:b0:4e8:595c:60f9 with SMTP id c28-20020ac2531c000000b004e8595c60f9mr929959lfh.32.1678889488911;
        Wed, 15 Mar 2023 07:11:28 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b8-20020ac25e88000000b004e845a08567sm824678lfq.291.2023.03.15.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:11:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 15 Mar 2023 15:11:20 +0100
Subject: [PATCH v3 2/7] soc: qcom: icc-bwmon: Remove unused struct member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v3-2-77a050c2fbda@linaro.org>
References: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678889480; l=829;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GxK3RcvPqvln4dblV3dJH1wiiHqaQgKRfsfh0wbDHFI=;
 b=IUdpG314IQktpj0Td1iiXq+sbbjJkBs31p8n7U7SlhJh3ZNTYng5PeMJKje6xOBOjPvqSKy7MQgE
 SY083UvyAnLJYhlQyxXXqSPDcNogGDYi64sglWLpWELQH3mkFn86
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

bwmon->regmap was never used, as the regmap for bwmon is registered
through devres and accessed through bwmon's regmap_field members.
Remove it

Fixes: ec63dcd3c863 ("soc: qcom: icc-bwmon: use regmap and prepare for BWMON v5")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/icc-bwmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index d07be3700db6..d45caf512e2d 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -164,7 +164,6 @@ struct icc_bwmon {
 	const struct icc_bwmon_data *data;
 	int irq;
 
-	struct regmap *regmap;
 	struct regmap_field *regs[F_NUM_FIELDS];
 
 	unsigned int max_bw_kbps;

-- 
2.39.2

