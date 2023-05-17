Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340C87073C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 23:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjEQVPD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 17:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjEQVOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 17:14:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5125CA245
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:14:43 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ac770a99e2so13739211fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 May 2023 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684358081; x=1686950081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGodNVX/frMkABBLHr47hHKAI4yOnNqADEGr8yuNWnc=;
        b=HilD8Z6Yn8MXx1FuSrj/gfL3Z2QlQ7NM05MZGgj+CHNjuUzXCbigE/ZtaU57VO9oFi
         9I0Gf5M8/8DnVfzrUf+/NUlBhTObJhIDTJqh3KFI7wF5ZgOnbw40WbLI5hXMfDc8dGUN
         6F7RPF4g5YeUbFilMkniHtDCJTY4iUlaJpd+oKTULXGZpJFO2ZHwJKdf0p0Y2o9iFnud
         J+srixZripfOyfj75nEbsAg/QxOyXwEZDtcDBAAY+d/Oek+ZNAeZ+awLYG4GiHbKiJJX
         SwFaTsdpbLrf8ss3wFALVPIFtHd9Chp3DU188UVW0lfgpOGILagi0P9ngYHSEaQDTbOl
         /Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358081; x=1686950081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGodNVX/frMkABBLHr47hHKAI4yOnNqADEGr8yuNWnc=;
        b=O63J7d7vvBsB7+Eff6SpAG5FRGRzjTOqNK0JDLksxqRE4Hik34LW2Re4ROgnJTph0H
         bF8GRdQmDSl6WMKTeAdhU37qgZ5LivSmdd6EJlR+/R4GQOYw1YjOcFDNhLS0aeZiXHr+
         VvvYY/RT66ojLe1FXy04TjKZ81EM0r4eJtU4Eu4WNMQy3FFZiYqmr3jaFbD6JPBoIUkW
         0BnGTrnVwYri66Vy+5EHUKpAPE6dSBB203/WgzZNQI5lWVY8PUJIfGp2ysKhUBM9At6F
         jsQ/CPNDqgQkFAvWDDT4Kdbt/xoKW6Qhpc+J6EmSjYIkQ3Fwuz1OiH3gi4nRJfbviVYw
         dvKQ==
X-Gm-Message-State: AC+VfDyhHA2eDjUhu1qEcaWfRlHyCgt7gevRby5/6CT0KLDBie3TXChZ
        ky9dvzUcEaP6J5GqqvIP/hcabg==
X-Google-Smtp-Source: ACHHUZ4Pk7gv9/u3lGdJcdqYx3cDDJLUZRjzAiiB+N8Lbi0NEpOHL+DnmVQUi7y5k8kAuMPJ3mT0BA==
X-Received: by 2002:a2e:90ca:0:b0:2a7:f1e8:b08 with SMTP id o10-20020a2e90ca000000b002a7f1e80b08mr9439220ljg.19.1684358081314;
        Wed, 17 May 2023 14:14:41 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8345000000b002ac88e29049sm4781142ljh.43.2023.05.17.14.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 14:14:41 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 23:14:23 +0200
Subject: [PATCH v3 10/17] media: venus: hfi_venus: Sanitize
 venus_cpu_and_video_core_idle() per-VPU-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v3-10-6092ae43b58f@linaro.org>
References: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
In-Reply-To: <20230228-topic-venus-v3-0-6092ae43b58f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684358064; l=915;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7JZorB0pUApJvhWmRa0skblAX3OBAMRX8izC1hetESc=;
 b=bGbLMrqhUnj1TC2JbGm2E6a72BDHCzqWi7diiqThBzkw8Y3vPQ3eeUHJxDo5bclivNhQGqp82
 FowJwNNcqK5CXa97p/DP8DXQIs3IJ9ufutXfgg7d2HHhhZX2fHk2D4R
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

Replace the general IS_V6 checks with more specific VPU version checks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 9665fdcfe8b2..2db5361cd5df 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1537,7 +1537,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_V6(hdev->core))
+	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);

-- 
2.40.1

