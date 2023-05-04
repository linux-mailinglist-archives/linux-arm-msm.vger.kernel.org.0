Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04CE96F66B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 10:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjEDIDO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 04:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjEDICe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 04:02:34 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8673C39
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 01:01:56 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so2142091fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187314; x=1685779314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/UccTAcuhBCUZ5FF6aUwvykUnIdd379ssRafTBI8b8=;
        b=k2wfBVJ9WXNUj0tgbgW8gkMU+/1meB/9vIXZndgxm10dezJlhYaNqAPsHBh9q1qZXh
         Kuzy0NH+RKCmcAn0b/jTlJi0hdiXCA3gFuqeN9yHD5AccDS8ZPHDOGwV0/CpD6CpSVeb
         k7iUiSekl9SQqyFw58h/RnWjkyaeBgx9MPRTqAjdLjYST/x9x4IJv/EMWxMHjF5vOBjK
         WnhfME2HEuhEMZEKe3g26jLri7ePZ7f3r05v2O3ejxVPa/+HQ1GN44m8ljadhbrCAa0C
         sSMWTn65rUyY8YDNDnJvpVAyibwd/Z6wyf5b7wy+e4Tz53+i8b1Pc0ZV4+XGst10qHFg
         hVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187314; x=1685779314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/UccTAcuhBCUZ5FF6aUwvykUnIdd379ssRafTBI8b8=;
        b=XLU7SuueDAhrDPxU1N+echW8TycyuJ5sYSELlxD2dvD8Moi9JYZ+2DMr3hrD+H4B/2
         oIcJCvACwjeIgr9ltmgD2sUSWtCADec0dIIa6Mf7Ci8CQPuQGo9d2Un+SAZMTV6haN9s
         JG+Qv+Hf0NB7WBZn/DM3jLfza5SG1ACghOJTTs26xnoXN4kfE52jsF2YnAKZ6xx3shRb
         Py6dLS/EiH1gvDmFVFCn2j7TahxVqbw8g+1oOKBNwWvoX2mcUXxx/uqnA3CvXo9PqgyU
         UUc1Xk3EddvuXn7OzKvr9zyjAuUm0Je4yhCWpiqhYt8XiPA50U7uezJ1EokMj7pNymHg
         dfFA==
X-Gm-Message-State: AC+VfDyhV2cRnb0qFAgvebfP5ljtbmWuNRAnGEH3TAUBnxuugY42TgAP
        FDzI0S+0B71S/RdXmjPdN9uWhw==
X-Google-Smtp-Source: ACHHUZ6vO4z0T75jgR0++P5IOouAIDe27JjNuh4RcoH0KoDzBwzm0rdiclGAxrYSwR2VBML3esgORw==
X-Received: by 2002:a19:ac08:0:b0:4ef:e990:8a53 with SMTP id g8-20020a19ac08000000b004efe9908a53mr1563858lfc.18.1683187314397;
        Thu, 04 May 2023 01:01:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b004edc512515fsm917165lfi.47.2023.05.04.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:01:54 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 04 May 2023 10:01:14 +0200
Subject: [PATCH v2 18/18] media: venus: hfi_venus: Restrict writing
 SCIACMDARG3 to Venus V1/V2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v2-18-d95d14949c79@linaro.org>
References: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
In-Reply-To: <20230228-topic-venus-v2-0-d95d14949c79@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683187284; l=1033;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Heez1R9g/upp/lte+28AqBemWtRoQ6abP6tBXj2nEJo=;
 b=dlplnoZoob7e3VzE6E58BXJl+xaZE0aZvFCtEc6T9JXS3KuWqNZRqSdT20GugI1L0NPZI0gc8
 ikoGUOm0MXWB6U7pfzKbOSW8+HPXRQE4CGqJwARcFQfYAN/c1rUZA2G
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

This write was last present on msm-3.10, which means before HFI3XX
platforms were introduced. Guard it with an appropriate if condition.

Does not seem to have any adverse effects on at least SM8250.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index d6df99a921bb..6405771568d1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -462,7 +462,8 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
 	}
 
 	writel(mask_val, wrapper_base + WRAPPER_INTR_MASK);
-	writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
+	if (IS_V1(hdev->core))
+		writel(1, cpu_cs_base + CPU_CS_SCIACMDARG3);
 
 	writel(BIT(VIDC_CTRL_INIT_CTRL_SHIFT), cpu_cs_base + VIDC_CTRL_INIT);
 	while (!ctrl_status && count < max_tries) {

-- 
2.40.1

