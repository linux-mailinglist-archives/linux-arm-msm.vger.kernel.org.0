Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216BA692CE3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjBKCLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBKCLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:20 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62987499F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:19 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id gr7so20207730ejb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSayp2LjaFdAdnYzpEY9EAyvKmYr5groJvofi6dSVE4=;
        b=GBWjGFuoNo5hZbB+cSFD6MmxSUAX6lZUIpLnQCgifqCsoPrOJEKVv32r3sutlxuEkI
         qG9EgRMVqHOzln6L1k9N6P2XRqGO2QoNtGbyhJXDJ4jAVNoZSf34s0nosSq3zLH8ZK3G
         5Fp3ev7mH2GXGoaS2BMcoYsVJ1cMhdqQsXQ1lzG67vKei1sYUaf8HksnzcGnk7oONYxJ
         JJa0rTpF4npuAAt1uMRqN0lKhg+82HGDKkYk61tQPOuCSDMlJhY+MB881PwaX4A8aGmg
         83mHOkYtOXnYaTLl6CM4lib/e9wnESnOUrnoxDBGUn9uBpBnxT6jKT3ZE7dXGKwM9XiB
         7jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSayp2LjaFdAdnYzpEY9EAyvKmYr5groJvofi6dSVE4=;
        b=4/HWy0eH/N265FckZj8RRnMtGN9tBcCjWnK22GzGgW6erkVyiHizmGMt3CwVWcApiC
         VA20xOERmxBs47CC0LzcrZDhxJfAvTk/Txt1sUpO6heTDGBBt/xHDLn3hYohRI0sG3Qq
         PWmK1MvPaW+M458Ovp2fpujI6mCJKJz4v+S2MIDjT+KyiFrqyMjhLQagmspghX634v4k
         H42Jt3Ip+GvEsi7vtLu0MXeH2kHr5eK+tSNhQcBMWgt2tLVr6B8omnNNE1egG941OAhz
         eKSbBoW4WkLK/1NY8aEXMLAy42lXOVCcb75J0FMikaYNqFeqIU2pbPCySvYj0WeZxKyz
         HPhA==
X-Gm-Message-State: AO0yUKUKwj2I5/xV7cMxGpi9e+o4hrwEuBNw40aUF0M//zG6gm4/gWk6
        1Szmngn1npJq1908P52qB0W05w==
X-Google-Smtp-Source: AK7set+QAo8MN85RR6ICDSyTkBe4jK+9H4MQYdFmM9phdVHg5awfxHpjHxQKnj2voaZB+MpBw5PmTQ==
X-Received: by 2002:a17:907:6e90:b0:8af:91a6:de6b with SMTP id sh16-20020a1709076e9000b008af91a6de6bmr3108941ejc.50.1676081479438;
        Fri, 10 Feb 2023 18:11:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 23/43] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Date:   Sat, 11 Feb 2023 04:10:33 +0200
Message-Id: <20230211021053.1078648-24-dmitry.baryshkov@linaro.org>
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

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 56c9a38790bb..a9df4c1a714a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.1

