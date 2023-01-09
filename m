Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9F3663364
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 22:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbjAIVoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 16:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238007AbjAIVnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 16:43:20 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594B1E096
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 13:43:12 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j17so15188927lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 13:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQu9gL3piRuPWafZ9zBwIaYQw7mWZB+/XBTu3IqpHn8=;
        b=mI8X8teGSOE6/y6vG1YC33Nwbi6dcOKqEHptm4FK4XKAYE2QtWtj+kHcglw3iQeoXT
         55MlcZylq5yUBzABRxYTG1YTTRK/Hm8VuHhL6cHtdnbB305HlKCd4F/pgreYDgu/rUUU
         mktB4n3r9lgbMlFF25Jf54cbJeNo8mVhykNfHB6nD/J6mfKtE8V7NqFzxUbWXbL+I5vW
         8sdw8+d+zpuixro6LsYE0NbAB3eEMUdfAaB1Lf/TIK01+bD0QDEB2VFTfhE25anit3To
         tgVq8/EK6kPZ1niZL+xduJf5e7VKZpjbTl04jP4mjxVgCVN4601/JXerYfTsbk5WGNUC
         OHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQu9gL3piRuPWafZ9zBwIaYQw7mWZB+/XBTu3IqpHn8=;
        b=xHLd5dEeFg9Ei5Lk3/+yFDzkoo/zOeoqEHTjaIoSbDwGE64n3H3uqej63eSYA9K+Uo
         7Ajj/d8usO90ejIaJis3IqwOV9R+n6y1mAHwcykkW8PG7eOkooUxktrM1IwmKUXWKk7U
         kZsnOZcs7TbZehGdLXSkZaJUBQ6dH/m+OlFBrhJ0MRMlZWRQQPfiU1PGA6Ld7lLBSjsq
         sAVndSsrfSvVK3wXTs2+X88HRSe9glZ3guS3dDDKzxRHQWsX1udvRBCU5/DRmAsvHfgj
         AIE+qyFVxFk2H6lLLDT1gXMXncU2GZnI4YcSqW70yfQqR1uxL0m+2YjutbgCmXhxGohe
         OIIg==
X-Gm-Message-State: AFqh2kqmOWDhh84ghb4qi1Cp0/R0+qfyuxmVD4/Kyi597MpErUV9qf7d
        WbPhJbz9/1kgv8PJO5GpT32hHA==
X-Google-Smtp-Source: AMrXdXuZy/OcVRAo6GelAuse0AQTAor5rOSTurY9nmYgwgR21VtvPD/QIDOxRPQsFP07/wZ6V7uG6w==
X-Received: by 2002:a05:6512:1523:b0:4a4:68b7:deb8 with SMTP id bq35-20020a056512152300b004a468b7deb8mr562746lfb.20.1673300590772;
        Mon, 09 Jan 2023 13:43:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b004b58fadba35sm1785951lfr.296.2023.01.09.13.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 13:43:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
Date:   Mon,  9 Jan 2023 23:43:09 +0200
Message-Id: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8350 has newer version of DSC blocks, which are not supported by the
driver yet. Remove them for now until these blocks are supported by the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Just for the reference. I'll apply this patch to prevent accidental
usage of these hw blocks.

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 50ec0a57c3d7..94d355cc587f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1527,11 +1527,6 @@ static struct dpu_dsc_cfg sdm845_dsc[] = {
 	DSC_BLK("dsc_3", DSC_3, 0x80c00),
 };
 
-static struct dpu_dsc_cfg sm8350_dsc[] = {
-	DSC_BLK("dsc_0", DSC_0, 0x80000),
-	DSC_BLK("dsc_1", DSC_1, 0x81000),
-};
-
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -2341,8 +2336,6 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
 	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8350_pp),
 	.pingpong = sm8350_pp,
-	.dsc_count = ARRAY_SIZE(sm8350_dsc),
-	.dsc = sm8350_dsc,
 	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
 	.merge_3d = sm8350_merge_3d,
 	.intf_count = ARRAY_SIZE(sm8350_intf),
-- 
2.39.0

