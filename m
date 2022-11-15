Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A73629986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 14:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiKONDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 08:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKONDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 08:03:30 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A9B62FF;
        Tue, 15 Nov 2022 05:03:28 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id i186-20020a1c3bc3000000b003cfe29a5733so3207022wma.3;
        Tue, 15 Nov 2022 05:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YXSEudsc9acCjyZ9gI8tQXstRzlGGklsZOdLPbwiNo=;
        b=PMayZRM3eFKCloLvTyzjYH6LundInUpmC31aN3lOF2x/ELF21FR0on5O7mVTSts3wO
         g6qm9lIbCtI8Tu8FHtJix+MBnLjKr1/rkxg/+WE9K9PKjLveqXUvHcQ85bWBsSDINlSr
         NrpD7YfIdnWlboCxGpzoS3BzxReT2llXaselZxlKWSyqXa4VfI+0D8cdeBnK2GSvVVSi
         6njp/YfDclStsXVecpjj6FjKKKFzw4TMCIafqnL7riRl+pFgXkts9fkurtXGeyEqTs7C
         bmGnN9KdjMwud2LsVHKBIE3ht7urWyxIWIv5WLaXjQr2dE5th7oKBXOc0xOaz/UcvLoZ
         ZSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YXSEudsc9acCjyZ9gI8tQXstRzlGGklsZOdLPbwiNo=;
        b=xzccDxg0lfc4UGIR+vLtVzmbTlNOb8wPhpkSZAMLQnQN84D/QptpUi9GtXqq8FirIm
         xKzxu+stbaZKHfUBwHIIwdLRmKebt8nJTECOCEhGazGjz7jyYJaf4rkWXoeExbml8KJb
         jzo2hUVKRijm/gggWgrLXJJL7yGk2EKGMU8msldN9AXRCY0vxbDmKG2YoYiOeKfT1Wsz
         3PRSqFXOcerXWky5Vutr7xc5xOF+iKGu9HkmS5ifuEpaO2NgckyNIc3awLotFgAog0A/
         PqzRH/afyxW4yTZRMibZonV2e5oRaB8Jr/0epawSzbkH9cQsslH04lPpyCAYqfkmRfYc
         /z7A==
X-Gm-Message-State: ANoB5pmXXqAbi3jWX8azV6fBMt/ZOzaIvcHSMSu6rOZWq9rWcqa0V9nV
        kUkJ7rGBncB+P2a+GgEOP1M=
X-Google-Smtp-Source: AA0mqf71K83H64nJ0Vkrsq1NmTXORfV6reFULGsEXiSiBsSthy861Vt8C3VPP8OLOOHxWLuqHMIZ4Q==
X-Received: by 2002:a1c:740c:0:b0:3cf:b49e:1638 with SMTP id p12-20020a1c740c000000b003cfb49e1638mr1449541wmc.50.1668517406464;
        Tue, 15 Nov 2022 05:03:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003cfd4cf0761sm13933778wmq.1.2022.11.15.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:03:26 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:03:22 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/hdmi: remove unnecessary NULL check
Message-ID: <Y2o0TKZ5WRYnQXna@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This code was refactored in commit 69a88d8633ec ("drm/msm/hdmi: move
resource allocation to probe function") and now the "hdmi" pointer can't
be NULL.  Checking causes a Smatch warning:

    drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
    warn: variable dereferenced before check 'hdmi' (see line 119)

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 7001fabd0977..4d3fdc806bef 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -138,8 +138,7 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 	return 0;
 
 fail:
-	if (hdmi)
-		msm_hdmi_destroy(hdmi);
+	msm_hdmi_destroy(hdmi);
 
 	return ret;
 }
-- 
2.35.1

