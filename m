Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F249544BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245394AbiFIMYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245371AbiFIMYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:24:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0D55FF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:24:00 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id w20so16063232lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VtlQ+3hM/P+ANfbvU+LcjJagzse8umOcu68TzYNqjsc=;
        b=Dz5lfZyEPkdd0N7eAQ27UADDki7GRRZMqHqimmXo/C5FIGp0lmgdhFpuIkWUCkaJJo
         G1unBpX03pOCQ3kgKHpGglHFPJsQXdI2oY8wY2yAaHYTBAroHcyQj9Q4ePWFWpQc4SDR
         wVHE72HladG/nyl13UK9x9/JRQDnJkqPpIki7lRgb9UO2bXkuPCTLxNBgbp98wpUM4lJ
         Wd+sNk9RJEkXVGgT4KiIIs/0P8z6n/Vnfy8gZlOEAAww/5l+CqRUZImGAu/P9j+GI5RS
         5jD6aI5dEH8/qJeVl4AMqyqS6JPj0AOwt7eAc/gc6X5j/TZT2vCeeoIl7T9RNgTATvV2
         whuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VtlQ+3hM/P+ANfbvU+LcjJagzse8umOcu68TzYNqjsc=;
        b=A7jbY4rq7fyoNwJiRnj3OEAfaq3b944gk//NRqnCPSw0hjS/ItMX9PI6vXt9bjETrF
         t0uDYUGfIU+E6XMH5oQH5wrzWX9koDo59ab80J4S6mVe+4usrbB3VdfrMIMPTFfXe6Bz
         3Kb+MZw/2WQ5WCe8MAmKj93jm2wm8EugjrEIqbJtMjy1N3ogb9tems1A8izXAsHrN+uR
         zTVzdU8+FEgimz/J6B9Tmw2LI3GpovBX0r5/AtE283m9y+G57+64vu2tGIcZofP/1BsI
         meRa9fa2A7hg3YodR0FJnxFlxKTs1QKMvNAO+HmW5ZXdEWCZGiVjGKvSM4Onsow7BGpJ
         D7Jg==
X-Gm-Message-State: AOAM5302OomG8j6kwjn6Rfix5yoPPfNy16g6z6S++QnhQPDRHxFHWp57
        J4yUVg0+4XCm80kQSMY0j5Os8w==
X-Google-Smtp-Source: ABdhPJxE+KET2TkT1nz+5eGpQKt7okZGZwF+Kdnl1FePY8swIarLWPWW9LzspzzA2mS5KLuwyemL7g==
X-Received: by 2002:a19:4316:0:b0:479:ed75:5c1f with SMTP id q22-20020a194316000000b00479ed755c1fmr4134295lfa.253.1654777438831;
        Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 08/14] drm/msm/hdmi: drop empty 'none' regulator lists
Date:   Thu,  9 Jun 2022 15:23:44 +0300
Message-Id: <20220609122350.3157529-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several platform configs use empty 'none' regulator arrays. They are not
necessary, as the code will use corresponding _cnt field and skip the
array completely. Drop them now.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 4ec55616a2e5..8f0fd2795748 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -370,9 +370,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *pwr_reg_names_none[] = {};
-static const char *hpd_reg_names_none[] = {};
-
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
@@ -409,7 +406,6 @@ static struct hdmi_platform_config hdmi_tx_8084_config = {
 
 static struct hdmi_platform_config hdmi_tx_8994_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
@@ -417,7 +413,6 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

