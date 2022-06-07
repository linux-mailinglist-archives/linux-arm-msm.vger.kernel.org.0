Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3880754193D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378329AbiFGVTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381058AbiFGVRR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E228132775
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a29so1226933lfk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O2qnycNDjzB4dFQbZvnsZ97Ybjd2s1ka1P5LN2rGpnU=;
        b=fY4eVUItigtJgeHvg3VY5lGy/icGDdNLR2Uii/vrXdboDbdcDAKK88eJdn2gr+LaqJ
         ogln0wHjW1rbVyh+N+RQPlnoDEDVKirAriNiC4Jkt/oieE7BgNg4OBF+BsCaGdjIH71K
         2jd23jlGPMOaHLYje1sSuwHIQ9QgPP+FNuZJFc44Qg37Q9ImWlrhW9kSBSk0jNvWrywg
         vPGfXG5VGQhHxm9sjcYpiPS6XPeFrhTOncC914wxcXQL1f8BxY7wlCTHjCBY5t9OqS1X
         ILeYPxGqOP1JERYYbVI+TsWLISpXrTq9nT85aYuHIKUKqoLvcbbpZVWjpuKxay+nFhAB
         FzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2qnycNDjzB4dFQbZvnsZ97Ybjd2s1ka1P5LN2rGpnU=;
        b=hFGm9UoGvk5NrbNgl7FlhrYTpQib248vz1sy+c+9TDW4DkCeOUxLhhVcuNwe3Z0IRA
         h5iYclDitbK/kaSorAPDvMcb4DTNt5PwHR0VV6mIj48Ep1agENDVNe29ahPpK+a5bDmA
         1BYnCOXYUGqG1F4voMxdBxAz9cB7toVZClfITDbhvTzQpWNobn+gKD60a/0yUPTS8UaZ
         SQ8vIZSv/+1u/MjaSdAbcsDIYeJqNy6XNEviYHCl7civtq/I1YuK3P6P0qWk8EoS5sHD
         iAVi1F2qO5HoHnH70ipw6xxZ87JmjEIq0ArFvLOynK2u3zzdB4fQofuugBRfMoZM+0u/
         ExLQ==
X-Gm-Message-State: AOAM530CZHLqG3/B6H6QlDEsDFCG9L370vXFqIeVIjtlXR+AtPep9q6H
        DvrzDUKQ0tZl+y+90AHcS7EbzwQEinFG+BeiMhEhhQ==
X-Google-Smtp-Source: ABdhPJw/wSeZ9pSV5Cvm8QerCzYILQ0LyHXjlHxADb8Lhw3dxneUxf67wqRAasEeFvmt1KMzvY0/Bg==
X-Received: by 2002:ac2:4e0b:0:b0:478:6b05:7038 with SMTP id e11-20020ac24e0b000000b004786b057038mr19465595lfr.13.1654628294542;
        Tue, 07 Jun 2022 11:58:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:13 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 6/7] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
Date:   Tue,  7 Jun 2022 21:58:05 +0300
Message-Id: <20220607185806.2771739-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM HDMI driver has support for hpd_regs on 8x74/8084: supply
regulators that are to be enabled for HPD to work. Currently these
regulators contain the hpd_gdsc, which was replaced by the power-domains
support and hpd-5v/hpd-5v-en, which are not used by the chip itself.
They power up the ESD bridge.
However it is a separate device which should be represented separately
in the device tree.
None of upstreamed devices support these properties. Thus drop support
for them from the HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c87a0386647f..03d8f97b0cd8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -364,24 +364,19 @@ static struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_reg_names_8x74[] = {"hpd-gdsc", "hpd-5v"};
 static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, 8x74),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static const char *hpd_reg_names_8084[] = {"hpd-gdsc", "hpd-5v", "hpd-5v-en"};
-
 static struct hdmi_platform_config hdmi_tx_8084_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, 8084),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

