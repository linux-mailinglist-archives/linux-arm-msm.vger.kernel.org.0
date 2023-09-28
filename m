Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBBD7B1A7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjI1LSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjI1LSa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:18:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E07083C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50307759b65so20730627e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899799; x=1696504599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=IZ9UD6Hp5lp4A5sU5mSeXMtj3VfmWJVVGifMjsmseGhOGfidhBNQt8haKW1IlAjpiQ
         mIY/+/M47EKKWrs4r1p73erKw80ZUUw4/gdQ5/JF0yeGQW+QLmeJtxAKE6iu2mCujMNv
         6aP70eTYY3NGJpMQai6uKXIjcu9P65keNfiPPHXNRB4F4xoVRWxFJPyN8vakjzAh6oP2
         6ypLAXPsA2AhtOgkiBUIrw4Vu0wcG6gytpTjqQS2KU+5O23xbOz58bFlxZumLda2Wmzx
         7rF93xyA6whpDUpw1VfqtiMBBROqnoKCO3jlzLWckSz6bQaFEWd+RLt0FVrir37a85AX
         xavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899799; x=1696504599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=OBv2rYriPkue50mXHfuGkKOFSXtkgjs9iRLQ8QV1BeksGyM6NdgJdbybXYzvksEgQm
         8pQGyxekmIGvvSHXld4DJy1C3Y98RD8gdADTfUkf7BSRiXwvVbGDpw0bSrtLIuZwXmab
         d/oPKHwp7Pk61d++hs6vRq8Iqg5NfvoafRSDdsx6AcaCbJBFFw6GntE3FazyHWaZTZa2
         Nc641Um1SZLAW2cPxdx3EYKbxkjzRw9BCB39LPnPygixkStPOgpisMYZ4noq8B/Xv1qe
         Ck1IUkF+MMsB8X6MnRUg7h8sH494k4Cz0moUXC4RYtGBqoWpulZ+P0UAhAGfvIrsm5pc
         JFmQ==
X-Gm-Message-State: AOJu0YxKPwncVL3F0iEgrPrp9jeZmEOV9qJOy0f77EVf2gDEYHay8SW5
        NcqC6WWWE7vE+Sx68Ywcimeg/g==
X-Google-Smtp-Source: AGHT+IHs4BEIb3K6wYvwHxL4p5CqDe1+YQl/dXfmh3TBE8urT/HY3ABoF5hl90DcpvKbMm8Y9pmZ2Q==
X-Received: by 2002:a19:790c:0:b0:500:8fcd:c3b5 with SMTP id u12-20020a19790c000000b005008fcdc3b5mr772169lfc.12.1695899799367;
        Thu, 28 Sep 2023 04:16:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:16:38 -0700 (PDT)
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
Subject: [PATCH v3 10/15] drm/msm/hdmi: correct indentation of HDMI bridge functions
Date:   Thu, 28 Sep 2023 14:16:24 +0300
Message-Id: <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

