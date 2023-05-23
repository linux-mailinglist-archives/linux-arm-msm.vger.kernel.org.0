Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB2370DC40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236761AbjEWMQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236762AbjEWMQO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:14 -0400
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EF5130
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:07 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4effb818c37so8126584e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844105; x=1687436105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=SL/WVHABS704+8O+JkeKaXTNIjTPa6bMNxe4CV7AGXBoUs/Jdt4ceFX7jQwNDAyN1+
         BJOdBVhocMwX+gbdjC8AlbYXA9mlNGWCdJM+iikUuY1fcz4I/dmwnnMiBgAXlV1S7tXL
         jfviyHrP2KDMfy76e8Lg1peoMrw1hq/5Ocuk0nQ3vXbGRwtzQf8YiTGt0icIpgU0fNWQ
         iRUecbmN3nbJywrZahJkGoXLhrzzXS8TR5ngxOFwOZcBG1P36g9r3irNgFshMUr9qw7x
         xL47QOII4bg1JQ5vU0zlR9msEyIZfYCj9nDGwfhp4y1OYpJtNIXrATNNec4qpF2HkvxP
         JrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844105; x=1687436105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=h+WCR0w2QueAWbyzUA5vmIXnqohA3vRltahiVazAOIShDviJAR+iiXl8KC7MLLVDwt
         v7G3F5fi1sVsyBdhEakgIJpMOTKVYAvh24rAQ4OGDQ658jxgdCkCt0aKiN/s1+U4nYug
         SgSKi4xxP7JDTpgdsFNWdwvuefPAlvS+7J7HC8rslvJs82ostJrLntg1gx5syDlyDpyc
         0OOa2ykKMxzjsjpE8oSHQKIWULVAvOv9arq65cKnWA6eqOrb4Um/IEkzPsJhU4tS0bQr
         /krd3ei6W9Nj6inXhYdUvL0LjazYGE4YTUxhvXlZW/BajQ7o4ZBAeZlSeI9L/w5uVerl
         Ds2w==
X-Gm-Message-State: AC+VfDzIPSBCI5Q6LSCuvRbIzIDAFcBit4oYzTh6UD/1PxxFNiV+i75g
        +js9JGs9he/N4bqP/6nvMBjjxA==
X-Google-Smtp-Source: ACHHUZ7RIvGjdINojHjJ65ERgUVxZ9JLqK/cT+DIqTF6C4Xu/7dDxF+Uml9xZ924hzI/Ju9SUi5sYw==
X-Received: by 2002:a19:5213:0:b0:4f3:a0f5:92e5 with SMTP id m19-20020a195213000000b004f3a0f592e5mr3853326lfb.31.1684844105762;
        Tue, 23 May 2023 05:15:05 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:15:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH 10/15] drm/msm/hdmi: correct indentation of HDMI bridge functions
Date:   Tue, 23 May 2023 15:14:49 +0300
Message-Id: <20230523121454.3460634-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 62ce1455f974..fbcf4dd91cd9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -291,12 +291,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

