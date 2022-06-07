Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D62F541963
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359309AbiFGVVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381020AbiFGVRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCE311AFC9
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u26so29000477lfd.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fIR2tgZYRWBLnmVAd7m2XmX6eAHJSTYm0LMHENEbRWE=;
        b=Z9BNMiMWD8ai815uoPih/wJvYyzn8lNCz/NcNp/njpUTlCMhxuWY9AczbOdSGN2aET
         JdHaDCq29y99l4I4k0nFsgiZcDfJ0LJoIXHnzQ+innSecoOrJGy3ZXTcq2iHue0KdZOX
         IWWshIKaJzw5HM54uW72ChqJfg+E3Jjw5o2eQAXtQGG6qiOJiMTKtcKMnX25/OebaKA7
         0vip1wJhXDEqFhPQ5gKJk8+wTZWro850lV3bg0Rs/gyKgjjF275lP+iWQaBYEOFQxP5v
         dIDlLBY08Lxt2qk793Sz739pxUbriQV2bVj+NYXz8W/kS/Jxba/xCv+yMdst320AU4m3
         dE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fIR2tgZYRWBLnmVAd7m2XmX6eAHJSTYm0LMHENEbRWE=;
        b=jv0jdpitXNClIEHRj5KYiGOUmFAm/Nr0dm5H2GilelnDk1k1aqjqd6zXJDgyXJ1oVN
         W+nlRw4ueoUXYQyhWm6FeSIcOyNvi3EQ4c2Z73wpBw5MYXa7ec//RuF7uEVcXBTb4Hg0
         RZlj2v2GyFxoBBB5KOMoxEbX4uTUno5HksVrgkWRxFcBAk4C6YfXuWVfJqwx5EoUPhbB
         qma7Kz9Vdwt8lLsx3op0dc7FRsWuKvcpHw77qifntjwgLvm4foTuoLGRzqQAtXgWgh7R
         Kmw1YHTNWyv1iKd9RWQsKG7z7GnE7xldRvtd6q1V8RvJ879AJW6due9mrGQdddfx/GTE
         Hz2Q==
X-Gm-Message-State: AOAM532PYIuiTKp7L0QZ6otX5K5iXWAKxqV+qBvpGrVZ2rCtzbShCm9f
        jvHUM8jKvAJblHKcQLrZwjD6xw==
X-Google-Smtp-Source: ABdhPJwu0bgwWIs2JvK72GIJagzrhqPdQjv0dGrZtc353kYRQPaEmFzS2q1TS6FRQpFMGlAYnMdMqg==
X-Received: by 2002:a05:6512:3401:b0:479:4000:fbe1 with SMTP id i1-20020a056512340100b004794000fbe1mr8543546lfr.228.1654628293281;
        Tue, 07 Jun 2022 11:58:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:12 -0700 (PDT)
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
Subject: [PATCH v1 5/7] drm/msm/hdmi: drop empty 'none' regulator lists
Date:   Tue,  7 Jun 2022 21:58:04 +0300
Message-Id: <20220607185806.2771739-6-dmitry.baryshkov@linaro.org>
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

Several platform configs use empty 'none' regulator arrays. They are not
necessary, as the code will use corresponding _cnt field and skip the
array completely. Drop them now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 125712c3fca2..c87a0386647f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -353,9 +353,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *pwr_reg_names_none[] = {};
-static const char *hpd_reg_names_none[] = {};
-
 static struct hdmi_platform_config hdmi_tx_8660_config;
 
 static const char *hpd_reg_names_8960[] = {"core-vdda", "hdmi-mux"};
@@ -392,7 +389,6 @@ static struct hdmi_platform_config hdmi_tx_8084_config = {
 
 static struct hdmi_platform_config hdmi_tx_8994_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
@@ -400,7 +396,6 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

