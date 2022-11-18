Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D9B62F57B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 14:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241618AbiKRNDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 08:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241462AbiKRNDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 08:03:43 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5DE19028;
        Fri, 18 Nov 2022 05:03:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id x5so5084503wrt.7;
        Fri, 18 Nov 2022 05:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+mJ3Edh6kbESl5APrMtH6TLnWHibJoDuQN4pmY1e5w=;
        b=Wx0jlzYay9LjVVSsN2mBigPaEKv37M+N8DcqfI0O38RcH3Co0sRBe1xZWo8497xfiP
         kSMQO7AdA2uhiE2scezpG5UtE5duf5ZOElYbDjAJCGoH4/hr1sl0SLY1+WW9JgnfqpG3
         g8CRZQWUkSbdd4GaQFRmewD8J1dRUyJGObMCeH7ML5vA9Nd7ibKQ3k+Rq+TEviS4kt+w
         AV9tojYVnWs7bWXUwzkM6lgUKXvo4S5vzSmZXNe0U4L9cI6is02a1nL1q5mTQjwxkt/X
         DcvCi4dXw470wasgEEKvAa92ov4U6ehpYVGZ2lCMf+p9Vu9J0gMEnaAuNhvJjftzbBf0
         qgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+mJ3Edh6kbESl5APrMtH6TLnWHibJoDuQN4pmY1e5w=;
        b=FQFcRdwBqWyLXe5Xuw1f3QfUvTxGiC3/wg7jw2OEUF4OU5stqe7Bi1YoA6rW3aI+ty
         YCFI4dHbMt3tb4GisfoBzDV37qDuZknVIZDekZ53cCfXiYE4zYeCpJNEtcb09fPRfB2I
         ukWG4AWo6jU7mNgUahun/TOKStEKDPkarU0cNbn+VHm8sdR7XfD0hpRkJAycIdY2Xy5N
         QG/BfTtxhJL27pZzM69hrmRjkQOekL0zuli+ePj8I+MOh5azymvj6ie2uRbePIEGKLa/
         LnkI2soGRI7uHNStBkmKTspQjIkrrTWJFK607Vt19IIfOxxGEOwWneefe26I8HMBTRB+
         1TfA==
X-Gm-Message-State: ANoB5pmOcr46QqNwxGJbDIFWBewXF7n7nbSap8CkY4LAd60aJ8dedk4C
        N8CVzL/4pmMRyMnpyFRIkUk=
X-Google-Smtp-Source: AA0mqf44OUQxhKuuRxrZCjitDqseknQPFZscOEbgs+3XxXYr+Wn8F78z00bs+cb03HVN8YAqvWcm/w==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id u14-20020adfc64e000000b0023678cdf3d2mr4365829wrg.719.1668776621156;
        Fri, 18 Nov 2022 05:03:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9996185wmg.46.2022.11.18.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 05:03:40 -0800 (PST)
Date:   Fri, 18 Nov 2022 16:03:37 +0300
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
Subject: [PATCH v2] drm/msm/hdmi: remove unnecessary NULL check
Message-ID: <Y3eCqQ2pm1uQnktV@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This code was recently refactored in commit and now the "hdmi" pointer
can't be NULL.  Checking for NULL leads to a Smatch warning:

    drivers/gpu/drm/msm/hdmi/hdmi.c:141 msm_hdmi_init()
    warn: variable dereferenced before check 'hdmi' (see line 119)

Fixes: 69a88d8633ec ("drm/msm/hdmi: move resource allocation to probe function")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: Add a Fixes tag.  Re-work the commit message.

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
