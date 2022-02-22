Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D287D4BF207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 07:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiBVGXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 01:23:17 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiBVGXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 01:23:16 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F303B1EC65
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f37so22710455lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Feb 2022 22:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B35/xt4SCJGelHk6jNUJaO+E/UL5oTZkMPlhEe6zMWM=;
        b=YomQ4ZP/jD1H5vI90v10St0iBplfmy54PC26Ap+h3GmjOR+gnoHnFHPpVUjgb6uA7w
         34I3fAP25VKfcuB+fQA0iwkaxaTWciTAWNr2jDeni5IO1MLa1wpyjmQQJkvEk1Z/D5ou
         slQ8eumdxDCH6EhBCgWH6TeOL4MWQBeoDIZBy7wvU2f8kF4Cnp7CjiIAqlL47uWKstRf
         UmLRlZ3l6t7E1pkn02MCTxJDFSkKqGTaJJ+RTNK7zGHRWlLgkerz0CNYuhst5iY8Z8WA
         PXqlHFLZ51k9Kbhc+zMfhHPX0k8ueCdO1jihicO5UujGCmjGbLmIZBasDevJAWChcm3/
         Wqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B35/xt4SCJGelHk6jNUJaO+E/UL5oTZkMPlhEe6zMWM=;
        b=r5szvKDlkagsvaqxRATmKb+1JyeyD5pwppi2QgRvuqN26ga0Ze77P4rQJfUw37QfWf
         78ySnZn5FtD7/q8Z78lQ23wj9Qdrs073FpfEiCujPRzta+9WovK4YGLfllvx9SY9UYS9
         MqATrMXinyQQE3crvTOebmVfmNHhlYM9zzMbFup6+TSIzFIdlAnXAJEh4BYPu5a2bgQc
         DclMoTVg7+fwVt2B8k40MmRXXqp81aH94A/LD34RoaRi6hTCcqT08KliiMGuuD6Ra5Y4
         +be6I2n4jwuG5bk2jx7MDtF7W4H1YpFi8HKv92Dpo1hMI5zLMBosV9Ti32YNPObdrxU4
         GymQ==
X-Gm-Message-State: AOAM531Hnj8xdY8DyRPnS/LG2Ra5pk8VAlTOWDa5cMekrb3/Ttxr39Ek
        MNsBTcfAoAQJpkyBh6bGKH/Zrai7uAtrHA==
X-Google-Smtp-Source: ABdhPJz5JzjpVpvHC0qK5xpcOikwk5W1ftiXPaHBXYJ7M0dDH3lK6AXehDmgzB247Sz8ItuHi57TCw==
X-Received: by 2002:a05:6512:3094:b0:442:ca74:a610 with SMTP id z20-20020a056512309400b00442ca74a610mr16095850lfd.438.1645510970379;
        Mon, 21 Feb 2022 22:22:50 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.65.160])
        by smtp.gmail.com with ESMTPSA id j24sm1216245lfb.59.2022.02.21.22.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 22:22:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/4] drm/msm/dpu: drop INTF_TYPE_MAX symbol
Date:   Tue, 22 Feb 2022 09:22:44 +0300
Message-Id: <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org>
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

This enum value does not correspond to any of actual interface types,
it's not used by the driver, and the value of INTF_WB is greater than
INTF_TYPE_MAX. Thus this symbol serves no purpose and can be removed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 4f8336cc7911..a9b6d0955539 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -220,7 +220,6 @@ enum dpu_intf_type {
 	INTF_EDP = 0x9,
 	/* both DP and eDP,  handled by the new DP driver */
 	INTF_DP = 0xa,
-	INTF_TYPE_MAX,
 
 	/* virtual interfaces */
 	INTF_WB = 0x100,
-- 
2.34.1

