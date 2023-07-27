Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2DE765874
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 18:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbjG0QVO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 12:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbjG0QVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 12:21:13 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680D719B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5222b917e0cso1549156a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690474871; x=1691079671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/odzKdmyEPbBzzMSszAZAD9v3Trah6OzbxWCSFaBlI=;
        b=i9LhTejNzDVakizSzY8iDoFfqGEumSNLXUQ93fQnkMdNArMRci6ea8Pk319FPhK0Bs
         xNyRWn/A8qd6YtZI5yU92e0uazWnrc3vKtn003fPENssWaquIINJVifg6OeW/sZVfHaY
         DCQ0DoGJ6GwiV1mJXxzvXZ4T/xmwXceDyjkwoYnOc5KKl8NWBLf+XOFIlyFQDnq21YZL
         5hpwyWMb4eD9W4Jhdu8xu7gphTNJNQRqKL7oeDf2w3RYM0kxqZCrvhh9ZT20o/3dlWGb
         4eNo/Q92V46OXlPWRbIZ2yRR5a7BD+hpT1M+I8DkVaYoEtMhrbBk0cDqq2mP/tqWR60o
         yUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474871; x=1691079671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/odzKdmyEPbBzzMSszAZAD9v3Trah6OzbxWCSFaBlI=;
        b=FWVGsy3hvKpy52SepBntxmrVpc21A2NcsBp4kCtQj92U/hnJ9g+UqS1RqwTKdIA66G
         ZVYAON+32+Fdtr6MPVyQ9vdDCWkQ0t2IhR8OaL1vVlGa7HQCmnWHYDTkGQNWTnkKy26o
         942YVnoAj45xKgxHdxx3wsHkd81g5xFlFtvfrw+Gh7KgeUckCHjg4hb0kb38Dc2E8hY1
         NjJLmshn61eI7TNejEqbkR0hyeNSOCGbmS3X9AmHgvPQg13XzkDu+/RC/b8aX0Yp++xr
         4SrJ3ugVzw50nRyhTHDtf0dY8WBW1bhZxfGUhlWI/nmqaC3cvel0Mvdae4xbhDqqBsC9
         m7nw==
X-Gm-Message-State: ABy/qLa7NgSYC8an9BQCw1EHm8ysfvV6eQMngrFKD7/+FMmR8Gr1Kd1R
        nwVatY0TCQFojeMtHB/JIiNMeg==
X-Google-Smtp-Source: APBJJlGafRM25b5sc/vyKh5ECWjQXZt/sJOqK0IPTwyP0etH8Ly6ji359kOnH4K4aPaHDaujXjYe7Q==
X-Received: by 2002:a05:6402:1810:b0:51e:5322:a642 with SMTP id g16-20020a056402181000b0051e5322a642mr2237347edy.27.1690474870945;
        Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
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
Subject: [PATCH 4/7] drm/msm/dpu: enable INTF TE operations only when supported by HW
Date:   Thu, 27 Jul 2023 19:21:01 +0300
Message-Id: <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
only INTF_1 and INTF_2 actually support tearing control. Rather than
trying to fix the DPU_INTF_TE, check for the presense of the
corresponding interrupt line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 7ca772791a73..8abdf9553f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -557,7 +557,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	c->ops.setup_misr = dpu_hw_intf_setup_misr;
 	c->ops.collect_misr = dpu_hw_intf_collect_misr;
 
-	if (cfg->features & BIT(DPU_INTF_TE)) {
+	if (cfg->intr_tear_rd_ptr) {
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-- 
2.39.2

