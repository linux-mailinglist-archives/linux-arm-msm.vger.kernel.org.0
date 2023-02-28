Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A8B6A5BBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 16:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjB1PZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 10:25:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjB1PY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 10:24:56 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1642830EAE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:24:51 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id k14so13675497lfj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 07:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677597890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2YOQCGUDR6LVZWl352w6X7jU8EvLQncBoIP/WOJkXQ=;
        b=DjaJv76Zk4rCmcRuGunlj0ep9NWS6zyfIYu7YtftiZRp9XSogaZWIrjwLSBkqKBrSY
         UwHRP4KC1Wuf8utc5VwOjbDOJXafiQoTunnMuCtvTfp1vuGGM6zIabUcVhJs+u+Vhh8e
         PxnsfrecdvR79S7DuFsFmBs6KTLFMBCTlh7bdm1FndrJVrOeloyLJmcl+Y8Njpx+ODJ+
         fLerzZeHBUFc+TSzuFQCj2QYEha4IX772QEUCsUIAA4pJ8DgxdkJM+Ba+lKyHEViKsdy
         X/cRjUTCqTEh38M0HFqE/d0BMmKTSum3srfh5G9FnuwDxm7Yr2Kr6ODogfYyW4+epu65
         72LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677597890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2YOQCGUDR6LVZWl352w6X7jU8EvLQncBoIP/WOJkXQ=;
        b=wu7M1l5DnY9cMGQND0GfGx/8G0TvEb0dQZ+QIIblPyLfwMf82Sq6kKR6VX55Zzc8Lo
         adb4iHSOjo4zrpsfnAVNodLI/LYAEBIeUyESkxAijDBybdxBoz/QfYHc8k8aMfvZUl4w
         eBIk//2FGb4vY4C65h2w+QDJTzDgJUFK/O6L8B3JpQzC9FkyghwrfVwPwAG7g2R6szNY
         k/9lMZ3KDL/Qr2EFaEjc8hSKWx3f4WOgtuf+R9fOaXUWyDo7aPfV0mThj6uC4VsX+EgT
         +31uBAsugruIGrE0ypZoun1MjjwkHQiFRfF3bx6bseogYi8RdZGSPr3tgTiStqbQ7Yjy
         QySg==
X-Gm-Message-State: AO0yUKUyUZrUrHxm63h3zxkPDKkNkwRkuPhB0PGWnLN11va7VfRuXcbb
        zfY/YDTyr5NIvBCMI102Sjn5mw==
X-Google-Smtp-Source: AK7set/a1fp1jeDKrc0EDY1QxtskC/0PyKb2F5C8WAhtnjPc02nxuFJ7jF7xX9Obt2MUyfSZhNGAmg==
X-Received: by 2002:ac2:4c89:0:b0:4dc:84b3:bc5f with SMTP id d9-20020ac24c89000000b004dc84b3bc5fmr853961lfl.30.1677597890509;
        Tue, 28 Feb 2023 07:24:50 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id h17-20020ac250d1000000b004db3aa3c542sm1363688lfm.47.2023.02.28.07.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:24:50 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 28 Feb 2023 16:24:34 +0100
Subject: [PATCH 10/18] media: venus: hfi_venus: Fix version check in
 venus_cpu_and_video_core_idle()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v1-10-58c2c88384e9@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677597872; l=1023;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xcjWJ5FvVHrRZk+7AUmASQ5Umxw+WM1469ajK0AMX5Q=;
 b=NT8sLJ0hPyGLMNFmZj3Ojb+rbgBq3CUiqsTP0/kwI+y700b2+PK9Qo/SpgBYegJnTPFoDLaRNmKt
 DlKPUMFSCO6P/lFTSi9XBfd45L5VyOjnFiJkaKQKjLJc+m2GV0vn
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

IS_V6() should have instead checked for specific VPU versions. Fix it.

Fixes: e396e75fc254 ("media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index ecfbac36de20..584c84125887 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1543,7 +1543,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
 	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
 	u32 ctrl_status, cpu_status;
 
-	if (IS_V6(hdev->core))
+	if (IS_AR50_LITE(hdev->core) || IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
 		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
 	else
 		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);

-- 
2.39.2

