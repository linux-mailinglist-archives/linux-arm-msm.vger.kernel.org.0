Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC23B6934EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjBKXNs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjBKXNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:46 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157811630F
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:45 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gr7so23953388ejb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WbyKJIgDAkTSKP0Na63Y4h/aBgg8FAGD3rP0d+12KQ=;
        b=AxVQ5DpOn0azvPcrChBh7G9KXgsRJaYaX/Ed9CjYRi0D/1aZDdC4+1vlIjjYI+RVvZ
         9Cg8M3NQV0ITPfeSn+6HNpVSeUG8Om5Gql2bHIYKm2BAdH1IzNEBiea8489c94ejnl1d
         ocuN5/fqNE2GaXDMw2wVoUdXa1izHHF4DfluGjVOOeXo/zcK/659sSttjyx677lYppcF
         ip5NPWnZjbzaWzcXxMLRFsGCPwqETkgiBOGUIACSS/PCuIu53qvMRJge0wHJTIyk3MHe
         JcmPJaOVnawHh5RUQ7kubx8BABMiKFvfPh31ONbczag5SYDKjnbGR+zH3u6No2zZ+Bhf
         XZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WbyKJIgDAkTSKP0Na63Y4h/aBgg8FAGD3rP0d+12KQ=;
        b=pNSqTQrtM+lQjXlLlSMMjjXG4zIjWNmO6S2Hqotd1JEzD2r4XL0hT+72cKPsTQtEco
         eDmdvUiIpSyemomCNDuop7qVWZyyqTFc7yE5Y/QeIPuLEZxLX3hhxc6mvk6z8r/qgs2P
         Us9ik8RgFsdX/rB6XIM/cckePi/u+EfsiPx1lZ8lw6WVqabR2cJ9CSaiuyiRDPVrGl4F
         VP7Vw/T0Tg4ugPweCNVZ8/3GtfNQ6qUo4QqiO0zGlYgPSqrQmsC3uUvNDbp4Z/0BOitD
         h6P4wYVIBuqnISGrWjL2o0M7xhlhbr5rb535Ym1c3BzmHmrfFBhFV2/C4ySb00h9nn81
         2gqQ==
X-Gm-Message-State: AO0yUKU8lPFovapsWrBDZlsF7SoHK26a1YgysxOHO8aNOJ5rKTEifPmE
        oMQv9v7d7TBFNIDzU0D9cTxXLQ==
X-Google-Smtp-Source: AK7set/oGeRfjLa2O028Pogw0/n/fWEuELrkJSavwxaa6YHX8OvN4qbViOvG4vpfY9hMD+xgiYTHnQ==
X-Received: by 2002:a17:906:5a9a:b0:889:58bd:86f1 with SMTP id l26-20020a1709065a9a00b0088958bd86f1mr20241448ejq.14.1676157224729;
        Sat, 11 Feb 2023 15:13:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Date:   Sun, 12 Feb 2023 01:12:46 +0200
Message-Id: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index a3a79d908451..094876b1019b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.1

