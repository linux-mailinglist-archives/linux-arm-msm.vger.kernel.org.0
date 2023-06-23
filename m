Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CDF73B93E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 15:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjFWN64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 09:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjFWN6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 09:58:55 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6197DE48
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:54 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b46f5f4d79so9103461fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687528732; x=1690120732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIPapwS0VMu+wGq+Urug2AT2MCJbQHQnh/g0ltMMjs4=;
        b=Hak4tsYIfEepTwZkWlNigHuwL7fEFVH0RgwEi27fX3YConuf914hnwjqCm3DhGE7je
         mtzbDAlolGPQvAWTD+r06ecDBW7eHuDb18+1bCF3gy/1X/pFjlknvjQfjY6wd5w9n5qI
         j492aylTrQWBe0Yas37fxs3/lbmLLF6no160jBGhGyxEQtrlqoyW0NMOqpjChgM8ctad
         RslcK7KvpEbOfmwNcQU//dlxbux/6WxragZwUmz0i+s4Wybink/PoHsqB1nnJr9h+5mf
         DvqMcTubeyBXlfVfCcsKUysUH0UlBCpW5yzyA+MssBDQkdS5KnJy3oqfuWIkeXCV3LBI
         7ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687528732; x=1690120732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIPapwS0VMu+wGq+Urug2AT2MCJbQHQnh/g0ltMMjs4=;
        b=R+g1ssn6GmLe+eM8Ml2kGxrPY4q3FVRmXGrbFoBvl1MMayv9Fr0+r/yDpCEBcuZ66F
         H6LFshMqSmHkHOZIVWVAL/gOjU/VKsYM1JQHxDUqVjECO/dXnQzu9BVkUYmon3f1WCaL
         TIcak6YfqqLwMd1iVRk8sHbldBI+e93Q0XWb8OF2nrwEbO24S0pMxFNYQG44AiTAAp3f
         0XiwZRC9BLKZU1sN1TWnl0GSVpsN01TkAnS3KcvNrtfGcXVmzp6+a/A+qVj6EK44mTjI
         i+tywJj1OgysKpgXah8b93C4PItxeYQofY0LqMWKZ6Hsv+Z9PYiZezTNH365FUaxDCPc
         4Ysw==
X-Gm-Message-State: AC+VfDwAG5I50NMCSsrs4Onz02s4pdXGx2yCQrttmk7gB45gHtGJOZn2
        cBJVrYmnLMfM5yyXAwW3MtdKQw==
X-Google-Smtp-Source: ACHHUZ6HhxYzygSwvCnSTPeCfM2VScj9CICogwmsSA5qNEVnWyJGZ/ZEKnW4nAV0d6KT9mUUUZnzlg==
X-Received: by 2002:a2e:b532:0:b0:2b4:5c28:908a with SMTP id z18-20020a2eb532000000b002b45c28908amr7611933ljm.7.1687528732761;
        Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 7/7] drm/msm/dpu: merge dpu_csc_blk and dpu_dsc_blk into dpu_simple_blk
Date:   Fri, 23 Jun 2023 16:58:44 +0300
Message-Id: <20230623135844.1113908-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
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

Merge struct dpu_csc_blk and struct dpu_dsc_blk into new struct
dpu_simple_blk, which contains just base and length.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7cb9ef940225..4b3fb104c412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -283,11 +283,6 @@ struct dpu_scaler_blk {
 	u32 version;
 };
 
-struct dpu_csc_blk {
-	u32 base;
-	u32 len;
-};
-
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
  * @base: offset of this sub-block relative to the block offset
@@ -301,11 +296,11 @@ struct dpu_pp_blk {
 };
 
 /**
- * struct dpu_dsc_blk - DSC Encoder sub-blk information
+ * struct dpu_simple_blk - DSC Encoder sub-blk information
  * @base: offset of this sub-block relative to the block offset
  * @len: register block length of this sub-block
  */
-struct dpu_dsc_blk {
+struct dpu_simple_blk {
 	u32 base;
 	u32 len;
 };
@@ -403,7 +398,7 @@ struct dpu_sspp_sub_blks {
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-	struct dpu_pp_blk csc_blk;
+	struct dpu_simple_blk csc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
@@ -444,8 +439,8 @@ struct dpu_pingpong_sub_blks {
  * @ctl: DSC controller sub-block
  */
 struct dpu_dsc_sub_blks {
-	struct dpu_dsc_blk enc;
-	struct dpu_dsc_blk ctl;
+	struct dpu_simple_blk enc;
+	struct dpu_simple_blk ctl;
 };
 
 /**
-- 
2.39.2

