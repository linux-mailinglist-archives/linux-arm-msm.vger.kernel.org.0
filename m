Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8986A5BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 16:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjB1PY6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 10:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjB1PYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 10:24:43 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB25523D94
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:24:41 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id t11so13740937lfr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ouo8uuwT0BL/iQ4qXVVvn9es2W+dnKtqVS64weaqnUQ=;
        b=MXojN0LQNc12UfetxbjfKcOeN3fOc8ssW4PDbnrCCAwiuiISZAMi8iZJXruAU5Dzsy
         dheXR6o+/1DWsozRRmd1phRIQHszUZRdmmxGq1r8y+oqBrrOQfenBMSxH2R/soLlXnqE
         Ru3OgG5WZFHRniWrMaM4viC7ymV85fEM3Yqt+jjhDOYCXafe6GAE5RMKckfrde+LaEZM
         sEaIq0VvYpgS6s00z9zH7TqnM4r3dVoyzB2f/vOlIR99WPnLJiO3BfvZ/RJUhhJ2rxCB
         4+QXRnpXxmxvzjrU333C8uJn6Po1Ep6EmbDT1P0YzJgsN/2kedLNS/zfO4qIdqjeM+Om
         SkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ouo8uuwT0BL/iQ4qXVVvn9es2W+dnKtqVS64weaqnUQ=;
        b=OIgwz3I3CcxjTMpSna/kltqhhycT0HH6lXJpfL15ce9eyKypCuL5DhDHu38MzLQrkg
         b4XOiINFBjxSt97RXwLrVeKs4Sq4KQ58Wv6AOQ4ysvJzCjnFLvgA/nhxd6Bc92gogVX2
         7mwpHGzOXEplnfAb8hGlYz2IbZ/2Hhbeur5XYEetPsPAcwPlGSC4djF5drsjQv9RzoGw
         6pMfHlvv1PP2qxiCwkKflZVDJCLworTRbVDXm+Mtc/h74NKLD7rV8SevR13qe49PfKN2
         a3aGGGJxdtwchKQMoRKAOrzg/vuORWITb+RUpF+PPHg5qwDf0I/AWqk4YuZuW8Fjwok7
         5YgQ==
X-Gm-Message-State: AO0yUKVYwyRM9ls0T31V2khDxLVE5UO26WTdSLJTcLHxewAJQDixvF+1
        6YgApq/0kZxUGZIiglvUsmUPsw==
X-Google-Smtp-Source: AK7set+v1RYt9YnAyku5oDjya9Oq9ZbPSki6r6U/t468yKs+brqB6FzGHVTYwK2Szcb+U4KdUjFgyQ==
X-Received: by 2002:a19:520c:0:b0:4e1:27d5:1245 with SMTP id m12-20020a19520c000000b004e127d51245mr737241lfb.49.1677597879962;
        Tue, 28 Feb 2023 07:24:39 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:28 +0100
Subject: [PATCH 04/18] media: venus: firmware: Leave a clue for homegrown
 porters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-4-58c2c88384e9@linaro.org>
References: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
In-Reply-To: <20230228-topic-venus-v1-0-58c2c88384e9@linaro.org>
To:     Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=1076;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=LhE7R96rM2LJyxG+NTkMKHvW3mNwrGGFDkZtGywlnuE=;
 b=oMSaelWO7J6BsFG1tAJQU96xUGll1OWl5vsqn0f7Yz13BEhTSShoDxY6os/RVoqCN/DUbBRzdvqv
 rwCrO1vsBpSJEGD31GNpS9AHeprFsLKg7QRhIilIkuW86fl1zSp8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Leave a clue about where the seemingly magic values come from, as it
is not obvious and requires some digging downstream..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 61ff20a7e935..1bb6406af564 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -241,6 +241,13 @@ int venus_boot(struct venus_core *core)
 		return ret;
 
 	if (core->use_tz && res->cp_size) {
+		/*
+		 * Clues for porting using downstream data:
+		 * cp_start = 0
+		 * cp_size = venus_ns/virtual-addr-pool[0] (yes, addr not size)
+		 * cp_nonpixel_start = venus_sec_non_pixel/virtual-addr-pool[0]
+		 * cp_nonpixel_size = venus_sec_non_pixel/virtual-addr-pool[1]
+		 */
 		ret = qcom_scm_mem_protect_video_var(res->cp_start,
 						     res->cp_size,
 						     res->cp_nonpixel_start,

-- 
2.39.2

