Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5D16DB7CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 02:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjDHA16 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 20:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDHA14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 20:27:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E5BE1BA
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:27:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g19so43111036lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680913674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0F6te40Cb/Ad/ox5RO4Z2KRQpaY2oFJdM/k3yKFfV94=;
        b=IzrnaasFKXy0N3jlJFdW8Z5eDspSyDGhW/GDGKvqO+BuMzlL7dLghr5KKDV69Y4AGM
         uKlH3/gsn9YMNj/KsReVKH83vrxHqCVbwcS82WxSERQM/36thUeANcKw1jm7Y9CgizNR
         qhkARizC4sEIA1xG6sUwCoOZh2pVKC283CDCLhu/ZxrfwB/lb5yBirZQm1R4J8pvYzad
         l89hiNAUZ4z36wXT6298HZ8s5PZ2KRZVD3AsToOCpirQyveNl2eJDLjOW2mgwqu6L/w9
         WCl/pCg499g0OHZWklMXevavt14ypdYp7aYSBDV5P2JDR4qhRbQ8KwMWlse2gCKFSs9O
         XwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0F6te40Cb/Ad/ox5RO4Z2KRQpaY2oFJdM/k3yKFfV94=;
        b=h1ji/n7qywNBUj8Xgr1DZXd2I9B2iQdTAj7hAHHOLJHSEhKcciTlEdRbQVN6RZn/2t
         qQ5mIqyg6dyDpO/dSD3+tkTBwLwNEvUhqdsEngt8bWCawQMfPh1sdOvIZLzKYphjzdMm
         nCkZkpHIqFW1t3TMrfSU4sbjuNNM9iyAxAJfurvXXBhs3cHcn4HmSetueBWe3XBcQVRs
         dudDnrw3XmKht4agpfmK8AOU94li47NzRk6oKE71FB9QmDI/AqNV7y9op92i3bDGbKY+
         VcE8RTaTlV2fJlLHiQ5kXVmvXSFdq3lzPtE+3N6jiCm7GrTmhwxxe4nxOMxHLR0KpKXa
         AgOw==
X-Gm-Message-State: AAQBX9dv0IxgKhG9cCB/8pCapLwmP4Qgysz4oMfOBBSjnC/t9YJonR5n
        e7AV+JkJscaXjzxZYfuDjUDELQ==
X-Google-Smtp-Source: AKy350b2wbXFMZJQfSlITNPYmwClKMG1rCnTeltJYoSbVsAPPdHkBGanUTqCiBOKl1fohmdDlgZRgA==
X-Received: by 2002:ac2:44c8:0:b0:4ea:c730:aabe with SMTP id d8-20020ac244c8000000b004eac730aabemr1157484lfm.20.1680913673898;
        Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 4/4] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's ctl_0
Date:   Sat,  8 Apr 2023 03:27:50 +0300
Message-Id: <20230408002750.2722304-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
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

On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
so switch it to CTL_SC7280_MASK too.

Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
for SM8450") had all (relevant at that time) bit spelled individually.
Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
despite being a mismerge, correctly changed all other CTL entries to use
CTL_SC7280_MASK, except CTL_0.

While the current BLOCK_SOC_MASK style is not ideal (and while we are
working on a better scheme), let's follow its usage as a least minimal
surprise. For example, sc8280xp, a close associate of sm8450, also uses
CTL_SC7280_MASK.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index e111ca1f4bf5..221358b9892e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -47,7 +47,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-- 
2.39.2

