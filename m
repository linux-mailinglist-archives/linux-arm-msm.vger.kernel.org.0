Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF52692CF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjBKCLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjBKCLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:31 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A25C75357
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:30 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p26so20142015ejx.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBtSSJm2Q681SOzEVunP/jb9XeoFSAOX+ipDA69kELA=;
        b=sg9keBqbMjfQQcQif+oaVQK+Yp92o+f8F2PwyWq/LjwzIDi2rbjysyaNEQ+0cYu/4R
         XiYyTZm/q6pOSjdD9Nf94LYR7Sn+6fEjKXOO5fKLVRQTPvLX9jvojbGf0YbqhBHC6qc4
         Ff4DrcZxUGXAswWb7yHSO23+8JAnohre3f+maki4qcL9S2Uc6ZmK6iHllTLM0XdjcoX7
         +dDMCyAfBGIZ/CgUjmooDymdtmhSB+7WX/XUfG2LzGwubv6N2vqa6qCcXE8lTIlcOVL9
         95Zm//fX2kyvZyLNPNf/xcZFo/B0YJNDPIsYE4pHpvPBhRzDoY8n0qOR3zzunXZsbG49
         GXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBtSSJm2Q681SOzEVunP/jb9XeoFSAOX+ipDA69kELA=;
        b=iY7JhPwTWHsd2o0ID7K3Zp6E4E6UKwMfogUGijEEwGdf3doFn4YJDZyjikvnIPVL3g
         bVcBkL8kTVdzK8BGe6GBrBPt2V2sYbjsxd05Oplpwzn0EiDTfjW0YCDg2pVz92nBzg6y
         21pHElWD+Y7mIJDrNBM9gUrZNrSVCVanfgNosxFxBga5+1ycUEbvwXGjEoafG+4vRXV+
         SZuzXfIQFc6DJQfAZLHRwMyJDyNEEpK5PC30cBK0SN8flHuAnz71EUA5exg7epdJI8rH
         wbnX1eIomJSwMd3E3hJK8IjZhvdt6dqsNYifbeKqEvKFGjm+8cG5PglBBEbdruOSXN1E
         ngSw==
X-Gm-Message-State: AO0yUKX4pWf4XMK1gy36KG+8htpXvcVjM1vfrod7LTxXneiWnNPmgf3L
        +voSgrBLA0V1ng3CbcZ3BG+UsQ==
X-Google-Smtp-Source: AK7set/8GT6CyKBxL1KJtK3UcufJdzrnHerTpNHB08294/NiEUeA/bAY7Ko8x4PnHY8cQxdz1IG3lw==
X-Received: by 2002:a17:907:10c6:b0:8b0:4559:38f with SMTP id rv6-20020a17090710c600b008b04559038fmr543652ejb.23.1676081488929;
        Fri, 10 Feb 2023 18:11:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 32/43] drm/msm/dpu: enable DSPP on sc8180x
Date:   Sat, 11 Feb 2023 04:10:42 +0200
Message-Id: <20230211021053.1078648-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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
index 1787dfd1e28e..5cc5f59f07c9 100644
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

