Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9097C6D1141
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjC3VyN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjC3VyM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:12 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA12F772
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h25so26382103lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx0kJTj3o9E5esETPMKD2G8aCz78j9wB+12WboqAR14=;
        b=sfxPf6CjkXIKdelCAvj2i5iBGZSRaOmQ03D/U2jLFCL96AZYQzqGhILJYoLQjI4Kj0
         Dvfo77IOx76Qu1ZXAfR0ZpmMvVhg4lAd6Obe7F7w5t4JSSfE4/AMsf0NK9Rfp1copN9a
         ZGh+cxV9WON0E7QH4Dtp+Vxp4uOWx54VUAabGn7Ii831CPWXiMi3nvnQmorqrzUEEAFl
         LbkUxfp8jGdr9z+7yCC0+qmLQdAPMSn0sHtyFXJZcdRJQT+2LZc484Y6FkwrhJurDAIQ
         5wrVIClmuA+ptCti6iRuvZhsmRXjlc0DGugeHc/BXLpWMijRUqRKRzLFE3zia/h561UC
         8eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx0kJTj3o9E5esETPMKD2G8aCz78j9wB+12WboqAR14=;
        b=3j0RUCDAKZ6RSa+guMxhVQEIMMGXNBHwRiixQSwe4oXCtO9ciGQyp9x1urUqPZ0JwL
         NL/kqA4p4mpJ7IBWUR2lS+7BrFNk+8Vs7va7glQnaHVr2NksTSmgh7TYHb2MkJXsDa02
         VqD4NPTFLCipRFhXN71RN1uijUZrKOdeUaPldymEwI4XRW9gQI7c3TOOjZxN9QDwLhUW
         BzaFDKRqwS6+hjBx/aigl8U9KolDdjHc6QBwhdqae11vAl+UNoKeMnC0pecIVHWpqc33
         gVJE2DKJ5eK8zidI3VsWjh8xglw7BlfM9riQh6Z4k2KOhkrzhqlTZjwZO4iOKDCSApKW
         Dw7g==
X-Gm-Message-State: AAQBX9dxtEyVPLcYM0BC7Uugs8FvfX7gmsIJgfWb/QOmL6kzh/se2cPj
        DyYMEIgheXKvJA2AwADzl6ZAHg==
X-Google-Smtp-Source: AKy350aR1rd/jolO3Pxn5rzoq0Qcp7j0v9c5/Cgd98cuiyDY9RzCIi//idr0LzwI9e4RbeNwZU5/HQ==
X-Received: by 2002:ac2:518d:0:b0:4a4:68b9:66f3 with SMTP id u13-20020ac2518d000000b004a468b966f3mr7006020lfi.62.1680213249250;
        Thu, 30 Mar 2023 14:54:09 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 19/38] drm/msm/dpu: duplicate sc7180 catalog entries
Date:   Fri, 31 Mar 2023 00:53:05 +0300
Message-Id: <20230330215324.1853304-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index bdf1ec36f39f..10bf737f9a60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -81,6 +81,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -131,8 +136,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.2

