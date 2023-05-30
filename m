Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3817715FA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 14:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbjE3Mb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 08:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbjE3Mbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 08:31:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9F01BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:31:14 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af98eb6ef0so47166991fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449849; x=1688041849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyFXYw29tyYHnh7jUZGsXGdVkCfkSlUBmlV0J/bqh7E=;
        b=l29c14kS+E/k9kDpvUSsaoSoMSoOGaa7uEtNOCc+pvtVMZilXyTwYxL5NTdY6zWZGD
         a3++h1FVa8I4pmXyD5vJ/F70mJDQod7U1OafHsF3nDYxXUDEyQ4fTGUVhcsmc4VDti+p
         kHi14Enek42nmcHLBjqtIB//pkcSBxOq6mxj+Z9z+xi+UxpPucYbZ7NndkqKhkuCvWUr
         60u1xBd81TW/eaugYEDzz7Hb1lIWXCgaoSGzufyP0B9Bkol8NRq6hGzaWNCuHIo5u3p4
         ct1QRaR6STzNw/IU2XwUghEQ/FWOI0rxrS1GGqNSGwpwLXnpcdTc8tkDenE5kk1KsMKx
         xZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449849; x=1688041849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyFXYw29tyYHnh7jUZGsXGdVkCfkSlUBmlV0J/bqh7E=;
        b=azlBhSzJNLkBSkvlhvbwV53f8s060mRtXd4SgwCTKJG8Z9SDdIgMueoGhVgOGt+8MX
         ZSrPyOC4FCL7JIvWtd/LUNYTfLt4ncYoPyYFIK3sxZeSXwqhkW0r4WQcJylCNYXkE1AT
         ggZcQL6l2Tot5bAhNgOlb1ucrkChkiAnr9/v1R4yn9RD+xULPWh2MzHBSK0SRKPMSr+P
         UzJUNN8vrZtYU6b60nAtOI9dNDutzFFBv3ZNknr6KAXpROIDi/uNWwoAaVJd3XQBwUF9
         EhXbFPcA4dkY51motkuIFUnJ+BeUnAgsmkf2ZZkGxgKC6mOQIVkO6NKZCl1iigaafKrd
         EACw==
X-Gm-Message-State: AC+VfDzUfsKiL5at8KilMjZWp318HTJwMwmSf9YNpsBtdlWwKUjI9feH
        iSPigjI8+Hdv1Ph9F2FSwDYT2g==
X-Google-Smtp-Source: ACHHUZ5H96w3r5Nr2GfN0aIY1qXkTny4w+kmfV2bIoO0UXxr+zVKEk9g699+0IR+//wfrCJPNLY7Qw==
X-Received: by 2002:a2e:740e:0:b0:2ae:df5a:9637 with SMTP id p14-20020a2e740e000000b002aedf5a9637mr674229ljc.21.1685449848871;
        Tue, 30 May 2023 05:30:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u18-20020a2e91d2000000b002a8b8baf542sm2854814ljg.126.2023.05.30.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:30:48 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 30 May 2023 14:30:41 +0200
Subject: [PATCH v4 07/17] media: venus: core: Assign registers based on VPU
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230228-topic-venus-v4-7-feebb2f6e9b8@linaro.org>
References: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
In-Reply-To: <20230228-topic-venus-v4-0-feebb2f6e9b8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685449837; l=911;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jLkMwNqqG57kt4LLfCZOGle80CsutpLNKoM94v0Cd64=;
 b=ZadOsG66UgcLTo3X0cHb8UNZN5x0jCBfFaACQBzQpgsBcyGqvCeZtjHcxSxETIaI+Lhv5p3CH
 vQu9zy0kwbxBgxO1KQD0iLji/JjndvQ/N3nj87i+3d3AMHD4I1T6NlN
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

The current assumption of IS_V6 is overgeneralized. Adjust the logic
to take the VPU hardware version into account.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 01671dd23888..69c77b2137cc 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -246,7 +246,7 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 
 static void venus_assign_register_offsets(struct venus_core *core)
 {
-	if (IS_V6(core)) {
+	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		core->vbif_base = core->base + VBIF_BASE;
 		core->cpu_base = core->base + CPU_BASE_V6;
 		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;

-- 
2.40.1

