Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BECA8544BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 14:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245384AbiFIMYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 08:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243256AbiFIMX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 08:23:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F13E2ED7D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 05:23:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s6so37675167lfo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZJYymURK1ooLEfSP/aqRxnY76lXz03RkU1O+1NjQuyM=;
        b=uDnry5WSdqH+pwItT/cc+DSFONG1148sG3cnJOUymCn4MtVCSkYzQzIwe6o3d6XRPh
         lPhG49tE9aUWAe0XD3Aw4qV9DJr4/q775qRROAhEcl5F32vZThdJL0DGd+8Rbo7st34z
         2B9n9arjnKi8MRnX3xAwoAQ/2QUrznAppuw3OyX9Nd/NwcPLejMMB/E9TLBdfdh8wmni
         lwzvAGmEd/v8V0aERPk8HMjzTQQteYO9NdyIFx9S/P32pNbsb/gnkBtYBqu2c9h4q5I4
         BzKjJlYrT1WOk3GwjzMnxiJkTx/82xVKfLIKZ1EkCiSuXnF0DVAs8Em2p2u/YJZQLtaE
         H7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZJYymURK1ooLEfSP/aqRxnY76lXz03RkU1O+1NjQuyM=;
        b=mGuLESPwNWTYiBYG0AOen0fHE4wWGWvNKi3VaND+Ia+EAnTx9g/b7GsfqbUwi6TpaP
         61VJC1J8Qj7wF+qVgHWb81orhh4gA4EC2HkHX/kwpLHVnnI/W/UOwRz72mjv1/d2PesX
         z0ctFy0gdEEx7aHQ8lpQJSNAvz0sSGjvhZN12ztgf38fmffJ5/VOhZQQXcdPNdCy6wys
         YLWd5w6pOUalHgyKnWUYDICvjEsAcFYC38HytRsmsCYqeBfJGNhmzNx/OcNaeCht/qoY
         aXUoWboKB94TGZ8JV7mb9OBOV/esR7LK4/5c9qXDmZlT2OOD6DRFupgxzsmbLQ/oN3hz
         +clA==
X-Gm-Message-State: AOAM530MlvVxlYvc/AE8QNXURijYxw5AJ4WrKdUtFr5yEunt1JKGA8aD
        qrh5ZbUTu9ikNylMdyK1ysuIXA==
X-Google-Smtp-Source: ABdhPJzWBEDpXdjV9Ao8W/BgvF8xy/D2dXZWL8SxAJGm0ZX6vEp/+cwP9Ox1cWo4IGKtTGjclQMWrw==
X-Received: by 2002:a05:6512:4004:b0:479:1d77:4e43 with SMTP id br4-20020a056512400400b004791d774e43mr18884709lfb.537.1654777438019;
        Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 05:23:57 -0700 (PDT)
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
Subject: [PATCH v3 07/14] drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
Date:   Thu,  9 Jun 2022 15:23:43 +0300
Message-Id: <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DB820c makes use of core-vcc-supply and core-vdda-supply, however the
driver code doesn't support these regulators. Enable them for HDMI on
8996 platform.

Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6d79f1b910a5..4ec55616a2e5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -416,7 +416,7 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 };
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, none),
+		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-- 
2.35.1

