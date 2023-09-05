Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD622792CCF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 19:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjIERzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 13:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238814AbjIERzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 13:55:06 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EE124194
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 10:44:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bcc846fed0so43660591fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693935835; x=1694540635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvB2m6jWZ6h3dqLtwhCqsLJZSURv5HFp2WI8WShvmgY=;
        b=u7hThBG2Kn1k3W08xZG7h+DFElKvSqd9y7gbwihm75jB6NlFN8AazCHzdkOrcfjgIX
         OjM9sRXW5FF6f6sGycYAaCSEJNH9PTwAkIvYA5bIJhQdIrhK7LnpAMUa25GpexTtvIZn
         4VrG0Pdxb9r8D0Xf4ha3SPfzJyXCNhNOCCxixL4n4LFajOz9E+yeszHLmtfxiAlLU9gV
         Huy8Q66476NbH1Fp8A1nSBeOX9qFgpNrp/vwfKtSsT7OPt4+MrNmmuXzHIgQJJiVlj6D
         HFdC8bppH+l9a4YicYFQANK1QZiMW+N3L7K9FLPar/x5eNMkU0PwlVEvNEBt3eTlfU7T
         8mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935835; x=1694540635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EvB2m6jWZ6h3dqLtwhCqsLJZSURv5HFp2WI8WShvmgY=;
        b=hiXyNVrbbAUq7qVs5MxE2Tmgtdhyz2TZdiN3A+VnD3/JrbbmbdVnRsD4PQfrUidsJd
         FNTcW4O7C7HpJQHXWgXupIF+vcu5nzah0NsN1wIThf4IGK3rYUbB4I8EhmmXRBj+YWNU
         c/UIaOkqgTY4XLpcf8IwfbZcXtka9+IyksmTOKf+Atx9WbyPhABQKwsrTZbM/bpSFn9B
         rGQTlLN30gtRG4Dn5UoL3n8KPd+dPNVNycRUd3ZjtDzRDgEy5za+7gl9WEjbetiN4qb3
         exgxvfDMyeyYjz8NvvcUfxqY97QTpP23nwXu4o0k84OrM1YboC8r4Y/6J8k80BYqoLQ5
         rhCQ==
X-Gm-Message-State: AOJu0YyuU5Jy1h1Aj7IxAyVVvzw5fkMxPXNmW8s/oPLlUTM7/cvvroHv
        RPoDZkbgRiNBAdJUgajqwRugWQ==
X-Google-Smtp-Source: AGHT+IFkuCioqJOVDcvntY39EZiATGhgvVH3wGIf6xuX/1yMeziKkHJcd7MOrZxQqPdTGfNtR5iVuQ==
X-Received: by 2002:a2e:981a:0:b0:2bc:bb01:bfe6 with SMTP id a26-20020a2e981a000000b002bcbb01bfe6mr352074ljj.21.1693935834712;
        Tue, 05 Sep 2023 10:43:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:43:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/6] drm/msm/mdss: fix highest-bank-bit for msm8998
Date:   Tue,  5 Sep 2023 20:43:48 +0300
Message-Id: <20230905174353.3118648-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the vendor DT files, msm8998 has highest-bank-bit equal to
2. Update the data accordingly.

Fixes: 6f410b246209 ("drm/msm/mdss: populate missing data")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..348c66b14683 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -511,7 +511,7 @@ static int mdss_remove(struct platform_device *pdev)
 static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 1,
+	.highest_bank_bit = 2,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
-- 
2.39.2

