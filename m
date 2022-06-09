Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C42544BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245421AbiFIMYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245397AbiFIMYG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:24:06 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C9FBE3F
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:24:02 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s13so25938297ljd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X4dzb76g0ocgyTMGcs1anU/tp0V4LQ4BIXrQi2z++Tk=;
        b=mmT9KWDi+BmGJTdwCedNj/txduFmZEyZRfecsqYUQx5J3STr9BV/oS9mpQIibZCmRd
         bJ6EKmy5AqwicxxxBaKPSs4re83uxQ7/efc3Stt9OxpUPefYp6FmADdCTnGWHoi9iDp/
         vzUlznup5QmJPMkS3IbYlnlwqxY371zo17YN4z8NJ74awlHRbWy8zIewsxAJEfwsx406
         wS0Dpyu6Gp8npMjbJG0xwJ3r0aKfPG5Pfx7UNGmJSnnPpGOXjuQUURknae7ukgDWLdpv
         npVouhbC3Jyez1CK+Muk02WJ+E9WNIoT1/PdkHd9Jh50XT1UZuAHT2APO8z6XboF5qg3
         JJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X4dzb76g0ocgyTMGcs1anU/tp0V4LQ4BIXrQi2z++Tk=;
        b=hP2fGvlAwpDc8dop0mCLu5SykM74rVrXdEV+TPDLc1IBPqz/sG7gnApl5qbxR88fVl
         ea+1T4p/Hk9r24xDunnAUGDDRfY3wruV5HgXNslUfxC5TG/x1Sn91lTpRuCKXD3GzMoT
         dJg3PK+mmxgqQckZSPH2DEdoWSyv+R6liGJwt04l1QObrZgHt1Z1fwpOcQAz0UTnUzq6
         L9fxzr2BwwszOuLh2gMgKCnXp8rl3UqtXLI3GaFYwDUbM9ElMfJ+9xtVa7dfNumGtgql
         dPs2NKSe9ZqjNfHaFPlVIimOpXX4ftnM8gLfR1vBe+Sqib0MZXbOsYV2zNlSoVFbSRWA
         mQVg==
X-Gm-Message-State: AOAM53113zY7iJK+JOUVUBaWHe5KVepWXwwDrdinKkR71FqJzYPS3Anf
        Gt5pDg/zDCxc81LGODmeOSA5aQ==
X-Google-Smtp-Source: ABdhPJwzLnPBNshBT9ozlBlmQIEA8JA3fN9m2SqapRLtuvq1rdctLl0zL0rtACOU9xkPyRuJpr5blg==
X-Received: by 2002:a2e:8803:0:b0:255:8be7:c03a with SMTP id x3-20020a2e8803000000b002558be7c03amr14052361ljh.487.1654777440885;
        Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:24:00 -0700 (PDT)
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
Subject: [PATCH v3 10/14] drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
Date:   Thu,  9 Jun 2022 15:23:46 +0300
Message-Id: <20220609122350.3157529-11-dmitry.baryshkov@linaro.org>
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

Since there is no more difference between the HDMI platform data
between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
single entry.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 48cd6b9a7565..0f1c63f68569 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -392,27 +392,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static struct hdmi_platform_config hdmi_tx_8084_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8994_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
 /*
  * HDMI audio codec callbacks
  */
@@ -583,9 +562,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
-	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8996_config },
-	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8994_config },
-	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8084_config },
+	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
-- 
2.35.1

