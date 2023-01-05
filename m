Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A9865E4B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 05:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjAEEhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 23:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjAEEhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 23:37:15 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B5A12602
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 20:37:12 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bs20so32916063wrb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 20:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V8n4KZU3ErLZb7D+5oV5JKZTvhpFWTfVUw/4LSSiqWc=;
        b=T1QBcW/bIgzKPnVeL59jcQEp1vZU40PnLLKdMX6yYF0va5o0MbdVKdVFMz9QrQdS0l
         Yt0Xs6/NsGHezhsriK5sZ4sYw2H/SuTxo5h8+6Bc3TcyQc8pP0TcjJBiYHJgX02FQan5
         rUYWSmhY+M0qbWO43UYTMqaCtiJAJJ8XIQkhbNF03YM37VN55TaeXVA7yKf+WjWwt2EB
         hMgMOj1eV4wMxwLCnSbJJ0hfeVFgRUBwUHuuYY08yHZaGuLomJ5ubCds7DiXUZiD5M/0
         4qG/mavSBdUCvfIM7arRtQjJP3UmFfsTkw6aKEx7d0xiVeXJi0lT8pKVf4aTJEtlYN/t
         vO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8n4KZU3ErLZb7D+5oV5JKZTvhpFWTfVUw/4LSSiqWc=;
        b=tWPMYyMoOIgu9HLzm2bb+18o4I3/bXDnNQHyLVH9QlPm5iQyrrHVTeLFk8AdT36RXO
         FyLwR3yBwwsPVTuAeqJ7YJN0LTue031aHQ26GjCWfk6ldbNg37It0IG17+Zauoldxovz
         M3JfZXvHZ4vvXqWMFek2TGTBIjetAKwdeH5a3ZK530M1nZv0ZnBnKkQVKdthZDMl7eVy
         ZTGTcCqhpuZfZPkHy+5ywVHMEylSLoFbmfA4eQidol14FeVC9r46ihuRhaacsYcX+/pD
         OUldpbXkeYytwqauMNLL3rAJSN9Shs5twkCL7hmGKvNpxEaCb9LH35lZKZ5mJwavlPvL
         W9Kg==
X-Gm-Message-State: AFqh2kowaD+16RuEPQuS98svFGvdiVQUmyfwoLVWzBgfowRNJ+lGfCe8
        Igxr3V1LIOVnQEJL0cNaYXg=
X-Google-Smtp-Source: AMrXdXt/yqQWzK0JIKHjU/7CDgvchWlRfZKhJFMKPVJnTZ3cGXeN8hOkB/m/K6zF7kNjhTkMv6m3QA==
X-Received: by 2002:adf:e690:0:b0:2b3:f6f:293b with SMTP id r16-20020adfe690000000b002b30f6f293bmr335845wrm.47.1672893431502;
        Wed, 04 Jan 2023 20:37:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m16-20020adffe50000000b00241bd7a7165sm39712107wrs.82.2023.01.04.20.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 20:37:10 -0800 (PST)
Date:   Thu, 5 Jan 2023 07:37:08 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     oe-kbuild@lists.linux.dev,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm: another fix for the headless Adreno GPU
Message-ID: <202301050715.xoGxiXQq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231022937.286491-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-another-fix-for-the-headless-Adreno-GPU/20221231-103022
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20221231022937.286491-1-dmitry.baryshkov%40linaro.org
patch subject: [PATCH] drm/msm: another fix for the headless Adreno GPU
config: loongarch-randconfig-m031-20230101
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/msm/msm_atomic.c:194 msm_atomic_commit_tail() error: uninitialized symbol 'async'.

vim +/async +194 drivers/gpu/drm/msm/msm_atomic.c

d4d2c60497cfc5 Rob Clark        2019-08-29  181  
d14659f5de7d28 Sean Paul        2018-02-28  182  void msm_atomic_commit_tail(struct drm_atomic_state *state)
cf3a7e4ce08e68 Rob Clark        2014-11-08  183  {
cf3a7e4ce08e68 Rob Clark        2014-11-08  184  	struct drm_device *dev = state->dev;
0b776d457b9476 Rob Clark        2015-01-30  185  	struct msm_drm_private *priv = dev->dev_private;
0b776d457b9476 Rob Clark        2015-01-30  186  	struct msm_kms *kms = priv->kms;
2d99ced787e3d0 Rob Clark        2019-08-29  187  	struct drm_crtc *async_crtc = NULL;
d4d2c60497cfc5 Rob Clark        2019-08-29  188  	unsigned crtc_mask = get_crtc_mask(state);
91a514e50f1157 Dmitry Baryshkov 2022-12-31  189  	bool async;
                                                        ^^^^^^^^^^^
91a514e50f1157 Dmitry Baryshkov 2022-12-31  190  
91a514e50f1157 Dmitry Baryshkov 2022-12-31  191  	if (!kms)
91a514e50f1157 Dmitry Baryshkov 2022-12-31  192  		return;
0b776d457b9476 Rob Clark        2015-01-30  193  
d934a712c5e6a3 Rob Clark        2019-08-29 @194  	trace_msm_atomic_commit_tail_start(async, crtc_mask);
                                                                                           ^^^^^
Unitialized.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

