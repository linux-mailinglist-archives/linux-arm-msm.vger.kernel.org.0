Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEFC1693501
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBKXNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBKXNt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:49 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705F8193C7
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:48 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id jg8so23961601ejc.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHQQmWOhgfHuVxPNefuUhrb3kyDxId/lJ4kO/uFtf+0=;
        b=D840DiePbnHiL2RRj5f+XCcNdzN4zBVAFosHBGU0JZD7G/On3F/l11kQW2D0YDXbUB
         ysHm0MAxF5S/sAVJDNxLyZumDSRiVApYTB6XbILeO7mNhbyktoXSPHs+IVqXVzp2rujX
         kqrWMRy/sC0qw6EjWeqBKa9OtGHyY/78qzcq5xwlU/O3orEyWMiGYHq3dMbHcEc91Ey4
         YKxfAxECNeoWkaDnZzpJcq1/C9kCX5b49L3bPaoE3jWSqML4Oi/utDCk5JAyksAKjI2z
         2SXef4NIGgBVUTJN2TLOcefAzq5rMWoeBEQFfFu7w/V8yJUbwnQN31mPCrqc6u4sfCxN
         i33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHQQmWOhgfHuVxPNefuUhrb3kyDxId/lJ4kO/uFtf+0=;
        b=1DSgueq3rd3KmhWxAD/EVEinf77ZNtdjO+QrCoUIvp9J4rJMbQHh4PKp+hU8ITnYiA
         PxIA3NM2lwcv5KBwumDkmZFCiWO7fvSYHp4bUIvvkcJ+H/hRC++OUvQwApa+CgC6PInF
         +TsoYFGs1fZkKZLMwZozOw05Ajzosk8HsBu+9qI9xljQNuuee7/Xw6YeUmJD3ErN4kzG
         JhjgM3Zu4k05EqE6DRCghBBk1v6ckL+R8bW9+5ffUOxi4xZaZmvPAPs88StQ+MExEzAC
         TW+592secs5qxhBAbUJOSQbwV+8qaTY4uixlnEqZaBgrBNB9XHOXS6CRg70mIFPeK92Z
         bhGw==
X-Gm-Message-State: AO0yUKVusKvKiHqBbVJwG8vCJsupI2yHPO3PekPxmIFK6Pp9Y1O3cgGW
        0ZA8oFlC5gINdb65fcqZk2Bm/Q==
X-Google-Smtp-Source: AK7set9QFVBfv9yUIuYShfB+fY8WNSPt8xwa1IBgCo7gX2eRbPO1lA7sl4OrFtMPBsk6OrFep+LfTg==
X-Received: by 2002:a17:906:6b1a:b0:895:58be:954 with SMTP id q26-20020a1709066b1a00b0089558be0954mr18894745ejr.58.1676157228100;
        Sat, 11 Feb 2023 15:13:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:47 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 40/50] drm/msm/dpu: enable DSPP on sc8180x
Date:   Sun, 12 Feb 2023 01:12:49 +0200
Message-Id: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c51e1bba1533..457733a6986e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.1

