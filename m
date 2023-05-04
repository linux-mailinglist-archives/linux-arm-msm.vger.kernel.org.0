Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D77F6F668A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 10:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjEDIBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 04:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjEDIBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 04:01:38 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3215840D3
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 01:01:35 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4efeea05936so170881e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683187293; x=1685779293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDmBIF6Y44gX79pnQMyT5DRSZ/9AxwD6dwqNk+EZPk8=;
        b=MHbqK33JgS0axtQcdvgU9TcYSWkAhYQCWUCF/YZDTSgIqlPNHwNHP2i1PbcGRFDedG
         jTxV7Kdbuu82B9anxCuDCw9Ft/B2liBnx73kIFdoG72sVUnuoEcDhmYJCo91us2cmJF3
         6rQzYhlym1+rOK5YQoUff7mqpWzBbqmWwjOptc1uGUj1kpJ2jpZNxkvsGHNspAj4rQYZ
         pCypFUQEln6itSexDK1cyQ2BjWg9i+CbZdRoM3dYH2KI3+qBfminxpFZM0VnllumYj0m
         lIvpq9Gzp4IzznTmNlU0HYfJWtMRYM7sKDnvQtjcQcOdmgnpXFHlY6RD12vL80qEjyWS
         Y1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683187293; x=1685779293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDmBIF6Y44gX79pnQMyT5DRSZ/9AxwD6dwqNk+EZPk8=;
        b=YTGuEktu3t/+UP8ngm0qCnDw6x7pKtp1wum9F6yA3ROtmhGl0m5dQ7H0b9o4eY9i98
         zFIgiH9kW+xNMTk0ohRZY3HSHobm0gIhlOecas4Ysh7A0yiWnLnnChZ0Ew7IfY+5fAxg
         NfongJJF6d3qpfF/ZNe1C9wHK1GJH5sxTCYO7G/VieuDMJqPpCI+X3BkRETPZSnEqR0P
         tgOXtTfdEOO/mZ2E7xjfOqJ758PMKNMA4xaT/BYT7wa9beVzl1ObN6x4xxulGnJAfZDP
         STmaqiqNZniPz8xaN/umhOUs6Z0CPFdijVc9bwzAABZ+rnlpYPpVECwGa7SRQ0LyuQA4
         /7zQ==
X-Gm-Message-State: AC+VfDyHaG7/hUAT5YjupucUR9uXujihHBkiip2kMHVxS4jZe82J7V6b
        Tg15DVVHlQRe05GxLEH+TSxx8A==
X-Google-Smtp-Source: ACHHUZ76Tv+u6xmHCKSd01Dh7EVcTXoRDPpvwVq/ExtPhxsabNqIj67Odz+oL/j/63fOAAg44debuA==
X-Received: by 2002:ac2:4943:0:b0:4f0:1149:c875 with SMTP id o3-20020ac24943000000b004f01149c875mr1538841lfi.31.1683187293566;
        Thu, 04 May 2023 01:01:33 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n26-20020ac2491a000000b004edc512515fsm917165lfi.47.2023.05.04.01.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 01:01:33 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 04 May 2023 10:01:01 +0200
Subject: [PATCH v2 05/18] media: venus: Add vpu_version to most SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v2-5-d95d14949c79@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683187284; l=1998;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=s9xCNGDsq440Iu3/b5ZyYc59czGdU6SE4WtTXaMHwdU=;
 b=AQ1D0N86iXcaboS6CgN7GlpWPksHa7YyngiCZKPd6Wmzjnx8oNjO1ikfZCU+quDMrdSyjRZZv
 P7OIfelt13eC2W9ifDF7jg+ZKaeQ1mDSxe2hGijjafDJtLQ4a9JeZLh
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

Add vpu_version where I was able to retrieve the information to
allow for more precise hardware-specific code path matching.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 2ae867cb4c48..01671dd23888 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -684,6 +684,7 @@ static const struct venus_resources sdm845_res = {
 	.vcodec_clks_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -709,6 +710,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -756,6 +758,7 @@ static const struct venus_resources sc7180_res = {
 	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
+	.vpu_version = VPU_VERSION_AR50,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -809,6 +812,7 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
+	.vpu_version = VPU_VERSION_IRIS2,
 	.num_vpp_pipes = 4,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
@@ -866,6 +870,7 @@ static const struct venus_resources sc7280_res = {
 	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
+	.vpu_version = VPU_VERSION_IRIS2_1,
 	.num_vpp_pipes = 1,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,

-- 
2.40.1

