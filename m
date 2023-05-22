Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C7870B284
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 02:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbjEVAmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 20:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjEVAmc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 20:42:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC99ADB
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f3b39cea1eso2259136e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684716149; x=1687308149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zizt8T4/uGQMQCF98CdS8E/i3f6U3/IZeT/OtJdX66s=;
        b=Ko2WF4bTPQgM8qHFNknx1vVgzZg0edlLshC2M+6/GKzgLgqB71U4IcPyz+iD3WKIdF
         7XKHxZOIroeomHN8y5F26tF8V3O6Sv2W7KjkQY5avUHA8SmUPa7zFybS/saXmCaNnA5i
         EIf2eTAMV5fpjPwcPodzphfR8CJMoxZW1M6ePDw2Bc8Bxd5Cjt/JttI3oqdDAJLJaU4q
         f/Pj/W1LTxUlZVN2kkxWiGveWdpQOKIB/pm/DUbT69vweeiS4faOLSKRmTNaW5JXq/bK
         iHnCsFFpJj6R77KIN1j4V7mAP468rkZ7HX90YJQ7YBfnA6vxEtYzjGYfa3ocb3/3eBIe
         9vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684716149; x=1687308149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zizt8T4/uGQMQCF98CdS8E/i3f6U3/IZeT/OtJdX66s=;
        b=LaEUSFlz1FVcnyesyndHeeuoln6GuERISSloeKtLIhVwSjUpT7Obdyiadn2wwktDVS
         xhOE1yz6F9dYambzipuD9+Wlz9i6dgPrGRJ2lUQ/dmLIC6Jrxpmpu9VwtZjvcrdinlK8
         k+kY2dSfA175N3KmLWviJbfXmk2jS8rB+yBlFdD1WLqunZc3SVMyI3DN/pk3p8UyB5JQ
         nJNJrXqnxg/8iaAjTl26s5EvjFdM++iGY/XVyMSYGdpA4dAlbCs6OhHkn4ZXtLeniF9n
         H23GjnTt7BqyuW/GWevefIjljt2MMgRfvaZdLH7S1XBArl6OK/PpAV9xu/ItUMaJESR3
         gmxA==
X-Gm-Message-State: AC+VfDxwKBRc+9M20NS28WYY9BAcfScQgFaYB04oLc1JylhBdAdUe8gK
        OAZAyWhnLOby8L3IHR8cTdap2g==
X-Google-Smtp-Source: ACHHUZ6rje07H1eP9GoyQCx0cI/hiP57JvjtlDmK1E2FdKYtT/rMvIDiZxV3HUZlMJ8UQDWH5shcgw==
X-Received: by 2002:ac2:522d:0:b0:4f3:8411:f146 with SMTP id i13-20020ac2522d000000b004f38411f146mr3100721lfl.68.1684716149112;
        Sun, 21 May 2023 17:42:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 17:42:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Date:   Mon, 22 May 2023 03:42:22 +0300
Message-Id: <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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

Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
INTF_SC7280_MASK) results in this bit (and corrsponding operations)
being enabled for all interfaces, even the ones which do not have TE
block. Move this bit setting to INTF_DSI_TE(), so that it is only
enabled for those INTF blocks which have TE support.

Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1dee5ba2b312..162141cb5c83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,7 +101,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
@@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = _len, \
-	.features = _features, \
+	.features = _features | BIT(DPU_INTF_TE), \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = _progfetch, \
-- 
2.39.2

