Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3836542FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238687AbiFHMHw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238723AbiFHMHs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D611D7852
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s6so32856035lfo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TJk/SikG5/vA45QkNSVMmjHsA7wDjKxXh9SBvVTqBUw=;
        b=sV7t8YmUJotbqhmny0KXLae01QlXJrO1YBHx77u9k3QFfh+3zqvPItyBJyaS1FSv7n
         zofVscq7IFaRIt37QtUg3Xah/S/2x5BMa7bt5TIsFxMVg3v9WsuE2gmGUQrKz7jfteZb
         LxpkyVpOdjs1wgqiib7kPuH29KShJYz1qzWB7qr2fDY4oCeeLt8Y7J1TC32OqBr5sik4
         LvHn0NljE/1m1OCvzbP68KOKpqvV5Tgoy35yGPZUblvdRh8i6Jifb6O0do8lrkwasnEZ
         /J8MC/UF9y286BcUe0J/rS4twQRemKlVO/7pONjdufzYWOzlIMMGgkSppW52k6Crup6/
         hAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJk/SikG5/vA45QkNSVMmjHsA7wDjKxXh9SBvVTqBUw=;
        b=lBH12vnF2DA8wctFP4NZPtIeNQtBFoM0lJD7vbzgSGcHshIgrg39Pl4t2BX3XBv9vw
         nDgrUpPIVOcafp+vnrs2+DOwdoebXJdxlJBZ7zTmQ+Q5h1k7vUSp404oEDYVWhlEt1WL
         mCU2tNLwc3JaY7kAXHTrRBGVAKHLNtY2SVPy+BedcF+zTxqySkJ/NXMhoLJxIwcSe6Cb
         Ym+jmWwZeM8KsSgcaVF1FkL56hzbKydrHvXo7psbpOzvvE9NszH5VQxFLmd70vDRG2CI
         feEmI/NsKaN5ymgN4KbRCwVQvwnM88fDQ0p8zyTqcmk8yuyrQxu1PAgmDR1sJeamixLr
         Heqw==
X-Gm-Message-State: AOAM531WpAwu2Vr6npI5Rote2ijzV32NigkS1/W91hpVavroApZDqVzT
        xKRExO50sxG7RKwZvmFjUOM4UQ==
X-Google-Smtp-Source: ABdhPJwLAAPw1s0RFNSdQ2kbvtrB/PHpfA5nUjCe4dgJOTxGw02vXyxc47pFvRGLPzW0518hV1Di7g==
X-Received: by 2002:a05:6512:15a9:b0:479:56e2:6f1b with SMTP id bp41-20020a05651215a900b0047956e26f1bmr7015597lfb.219.1654690057808;
        Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
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
Subject: [PATCH v2 12/12] drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
Date:   Wed,  8 Jun 2022 15:07:23 +0300
Message-Id: <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
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

Declare that 8x60 HDMI PHY uses the core-vdda regulator and slave_iface
clock (this is the same config as is used by the 8960).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
index 95f2928cb2cb..1d97640d8c24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
@@ -122,8 +122,20 @@ static void hdmi_phy_8x60_powerdown(struct hdmi_phy *phy)
 		       HDMI_8x60_PHY_REG2_PD_DESER);
 }
 
+static const char * const hdmi_phy_8x60_reg_names[] = {
+	"core-vdda",
+};
+
+static const char * const hdmi_phy_8x60_clk_names[] = {
+	"slave_iface",
+};
+
 const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg = {
 	.type = MSM_HDMI_PHY_8x60,
 	.powerup = hdmi_phy_8x60_powerup,
 	.powerdown = hdmi_phy_8x60_powerdown,
+	.reg_names = hdmi_phy_8x60_reg_names,
+	.num_regs = ARRAY_SIZE(hdmi_phy_8x60_reg_names),
+	.clk_names = hdmi_phy_8x60_clk_names,
+	.num_clks = ARRAY_SIZE(hdmi_phy_8x60_clk_names),
 };
-- 
2.35.1

