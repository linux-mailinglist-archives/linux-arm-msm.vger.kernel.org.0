Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C5B53AAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 18:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356029AbiFAQNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 12:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355216AbiFAQNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 12:13:53 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF0E41F95
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 09:13:52 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 1so2536088ljp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 09:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+I+UyB3gaDAOBGduxnIltchs6IwUUwLGZ1KorhAXgf8=;
        b=YC59mP93jx3kqFL6TDmwE41jd6r7Wr9Duz81GvIgZ5xjLK1EmcKx3ajfJCQnHpnlmM
         0SiEZvngmNOOZKaf7ujE/L49RQrw8JgpQZbspnUvl+wvL0/Ie0SEbP0k7eJV2q4RZsiR
         6UuVRKeh53CNgLO4OjGWqegvYGe3XaELbwRznVIGHK8SPu47x2kh0IFrPqtDTRIspnNs
         MRL28KwGagb3zgFpjaTrT2shbK6uZiEdcp+2SeBxBPl8BFOe7hW77bx+KtCIKmv02juW
         K62BAQ2IQAVOTKwqA/xy00st1A/Iik1KNomcU9eT8AE4Ax0UIZUy7L0GKqrR3Tl4tqdu
         QYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+I+UyB3gaDAOBGduxnIltchs6IwUUwLGZ1KorhAXgf8=;
        b=iOsONHs0gk7g4MIi3TmJZqCYfjgL/uzyrE0XvwYx8RDq6BWGkBZJxwztdUZqyUX7Y3
         oALtebdiv2kjMw4cS3BXTsGjiuKbmuwzRc8ecnaHK5XVA5ZP0lCT+alK0bj6/Dej9NZ3
         F2XllmpbJd88IGTao/vfQ9pK84QpBxSN0neyp88BmYz1zG29m5ZOiMUMhhMddXdPB9Bc
         UoSjm27uZns16uKoRQpac1IrhG983ZtNMMTR9TGIJAzujN3xopfV9s0lJtNXw5lBiHEM
         ZyYrkbuhdACKknIn3jOQcRbiFvG7uWaVkSECciFU7tt9ZHaOdsroozD5vc2HdmRG+9EQ
         iR9w==
X-Gm-Message-State: AOAM5304Cvho+fQZB2j5BT8SwiwRnkl9QKTT1FmjcY16f2dtomwqkdhp
        2yXJdDqV6393SrYkA/+6KMdhcA==
X-Google-Smtp-Source: ABdhPJzR1vk7pIRkoF1uACdua+p+j7XZ6aU5L+tQ75c8TMnbvNO2GpfgyqyC1WznfffN1nTrncxZ/Q==
X-Received: by 2002:a2e:9b97:0:b0:253:eb92:3440 with SMTP id z23-20020a2e9b97000000b00253eb923440mr28964723lji.316.1654100031072;
        Wed, 01 Jun 2022 09:13:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 09:13:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/4] drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
Date:   Wed,  1 Jun 2022 19:13:46 +0300
Message-Id: <20220601161349.1517667-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
References: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
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

Drop the unused field xin_id.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 550b2e2b3e34..e8adb118fa85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -20,13 +20,11 @@
  * @base_off:     mdp register mapped offset
  * @blk_off:      pipe offset relative to mdss offset
  * @length        length of register block offset
- * @xin_id        xin id
  */
 struct dpu_hw_blk_reg_map {
 	void __iomem *base_off;
 	u32 blk_off;
 	u32 length;
-	u32 xin_id;
 	u32 log_mask;
 };
 
-- 
2.35.1

