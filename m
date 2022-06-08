Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E071C542FE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238714AbiFHMHv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbiFHMHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD441D6877
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s13so22482391ljd.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fUnu09gAxtr9Fbq67p8BUkdq2kOj89CYJwRNUT1mbWg=;
        b=P3/PC86lktVsIK1+SWqrg+LO5K1wShkRhcrwr3csOskceR8GtslTxKB4an9RhfDNBx
         /XZIgYCy4MlSYJaDU/osvto9MmtJt8SxPTKE1p/w62Ec82Lhj8Qw10Z2h6hdMJYqGNPw
         OJyvb1JqwvciPTXiI9ywJbZcQCoPfe75HK502DfoJN9bvW0PDtVZrIhoqFb/z3taR/dQ
         SVcR4BeZRro/z8ftDGHW/q2IbKAfAMdmVgKVFgZQQzmx/mHyiL2LHraMwyn9uXWQrKix
         gdD32tIhzR1BWkVnpQXGONMoseHXX4OOloBWXvGm8BtwVZ9mWOwn1Lt/ggNM4/QEPBM0
         FZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fUnu09gAxtr9Fbq67p8BUkdq2kOj89CYJwRNUT1mbWg=;
        b=MKwmo+eYGTbZGF853AuzcUOnUGhzbNreRNV+gaqWF0SDiPSzmshzspgQMIpJAtxQZU
         /R/1L4Vnkpi8WK8IcthJMjP57Py7+wYxBw4vS4EUvWDGohKLvUglFiR0MKQ79BHFfy1a
         LkoynVzHga0eyeJYaaZTuhHFc/KmFFZWAqQLKSdQbLl3mHdl/VqFJE7Fyxjw5w6VKLZ0
         tbwRm6WyX4s2TxVlZpfot6W+ZysRv4hN06dRLL6jDCJwkor+/17HXNf1FC8v2kSCNZ72
         YeQlT0GIBgZ9sl5KPnIp5WwKxUDFHZG/9orlKTrJwTpPLOes13uRkXm/qJRu1JHUCeDD
         nABw==
X-Gm-Message-State: AOAM531ZPQ4NdkVn5ovAJbQrP8wkOfeAmpR/yvFw8ZogitwTHopb56pO
        OgKT0maEAndUiwTweyhYImRBVg==
X-Google-Smtp-Source: ABdhPJxPKQ12vUYB6x/iFUiRQmyY2lhKiYbVI719bSwqZKO0+mUbuBM2VNtgHx1GAIsj0r0e/Eadmw==
X-Received: by 2002:a2e:97d0:0:b0:255:7c1c:f3ba with SMTP id m16-20020a2e97d0000000b002557c1cf3bamr15093302ljj.49.1654690056892;
        Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
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
Subject: [PATCH v2 11/12] drm/msm/hdmi: reuse MSM8960's config for MSM8660
Date:   Wed,  8 Jun 2022 15:07:22 +0300
Message-Id: <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
MSM8960's config for the MSM8660 (8x60).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index a718e0ebf6cd..e3b35b406e51 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,8 +353,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static struct hdmi_platform_config hdmi_tx_8660_config;
-
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
@@ -561,7 +559,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
-	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
+	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
 
-- 
2.35.1

