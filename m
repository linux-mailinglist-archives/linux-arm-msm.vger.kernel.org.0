Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84443542FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238699AbiFHMHq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238701AbiFHMHo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C62A1D106D
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id s6so32855856lfo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORFFh/OvwkdHyQw6T41fKq8t4AfCf6S/1IDmxoyQ/4c=;
        b=wDi7mI3wFjv+MqE1wKSSFLB8GGcxe+vfPK0vtxw3GUBXmzYkA/1Ov4rnTQCOrdFvDa
         WCzA7ufrcjUn0xLCY/pr3hTjPeVdsyGB9vWa5KJgx5aunKyFtxRuLFRTHcfrW8ULQWlQ
         4qWFCkoe1mX4vdziltcPI5wegX7NYuzr0s5aOmZ0X1YcuBP6ywgxzn6J7a8glXk2SJFC
         VYLo348CEhpBzGjZoPACRRXcnYOvnTHSLwmv9sx1zluWS4s0XHjVhVcY2tQ+Y0Onsca+
         ZR5pADzA/lyp4L3d9SFlzEi8MQT0ezCXnaBh+C8UeidMrEZfper3ZItUBagrFi3sRMRI
         pLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORFFh/OvwkdHyQw6T41fKq8t4AfCf6S/1IDmxoyQ/4c=;
        b=iDn6zj0bURKsgkPtAz1G2WqAE7VC1++6+8WI1us/YwLwwYBmzaUIoWejfBmH+FAbdz
         +WIf4feTbOVONwsw3pncrt5iK8HnrfV+XEAvxkP/3cGZxsEX3+r3ZyokGEQvqrIT3Smj
         H/YdsizItAqOwW6vSZcx6ZL0s3zFjYJU2ToFGEul0mr6X6/rR/kGDcJ0oE76g0qylpLA
         SkVGmXLVDXGOGD17oLNYGsx15SAkE4W4dq1FXvzWndVOnYUgK2INI5TtYCwkYOHUprtr
         HEAljPQbVTJcOitUj41M49J0JBzZ8Q9xP/ATcDYYXvB4K5vOCYtjj+4tbZiu1MNyzSUS
         SduA==
X-Gm-Message-State: AOAM532vHFifpPtc8kFH6eTFk223QmaS1OSNB+oZ7b8HRLZXri9DHtmC
        xV0pmY46iUyOI33d2QYiKAtKBw==
X-Google-Smtp-Source: ABdhPJy+dxO/IWKY0573dyyNPc6FWVijcUPdMYkPtITz4qJPlvq4+Y19DzS2iPFWw9L8FlKp3vWCTw==
X-Received: by 2002:a05:6512:53a:b0:479:1725:51f2 with SMTP id o26-20020a056512053a00b00479172551f2mr18043645lfc.688.1654690054546;
        Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
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
Subject: [PATCH v2 09/12] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
Date:   Wed,  8 Jun 2022 15:07:20 +0300
Message-Id: <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
index ebc87f2a626c..bc6ec6aa2cb9 100644
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

