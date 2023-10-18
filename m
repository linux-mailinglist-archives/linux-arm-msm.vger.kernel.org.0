Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2850D7CD5A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 09:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjJRHsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 03:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjJRHsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 03:48:12 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF43F7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 00:48:09 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7fb84f6ceso79825797b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697615288; x=1698220088; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f747C4U8IoZwyu+El4waA+++U856sYb0R6YT3hMoxgc=;
        b=WcfIie4Cx7luVB8N7hbrjPzTB7i+ZbPaI6oq/92bDiywVwvijhAVGBqsVsjqg3dod5
         zJGeOF0waG9en3Rbw84WVK9h1J/xg0JGO2iUbImL2bDDSQjUL5gT+zuhWTuWlhbyEWmt
         WvrfSr1yL7YGOkZJH+Qxf63dPcFhUWW+e86fqDidP8PmxDs63H0MjEq0iN9sVYW0cgmA
         YFC8WbrVmM1f2W8GGU9EXBI/prY+8dD0IA3m589foqNJJVNRarCXEEsFnVwh9f0lBDvG
         LgJvKJuzgYx1oQE9TDry0ckPXv9vjj7SW/eAlhmtjKzwsqRrNDbQ03KyVksDFM8EOML6
         UyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697615288; x=1698220088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f747C4U8IoZwyu+El4waA+++U856sYb0R6YT3hMoxgc=;
        b=NqX8gTxt7eA/EryPTkGd4mVIz01Q6sGLKzUg1nXCREcq0X3D20FCfceSieiKcjAE9h
         E4cUyphKTedzCit6ppu1XN53cve/yfcW5XLm0bhVX4sLTYGcDkY8WD2XGlYYpU/npnan
         zbDWNvAHAfuMPyuZS7Bxw21R7WvxNU5OZozw+zaJFnUH2V2OctMaLhuEqAevCQzJwvMh
         xPzpBuO43b3tLkfHA2N9moIG/NFwCNMI99AsOUFZ+IQfM3o6ny2OrH3YSkyD3gz9C797
         iNRHMe2JtQjwgIC02g46jQa6m3Skb1WfC+LcksohhEZF5K8Z1rgLv6ophEkOpGBUCcWh
         SJTA==
X-Gm-Message-State: AOJu0YyUWUb4YHHatf2pqQ1BR3kBsMFrh3oL5lvoL6KCIdtJf0dHUGn+
        vr6XimKG1Myr9wh6epLbdhej9w7Ht6RBdWS6R2sJzg==
X-Google-Smtp-Source: AGHT+IH8nl7SgUpvgBkgQixVGgpK0NMaVDkGMP6hZfYjxi25iLCtiD6oyBiVsBxjJWdcHsNr7ZkLItkk3bbAVEPUkas=
X-Received: by 2002:a0d:cccf:0:b0:5a7:fae6:1cc6 with SMTP id
 o198-20020a0dcccf000000b005a7fae61cc6mr5006410ywd.24.1697615288545; Wed, 18
 Oct 2023 00:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 18 Oct 2023 10:47:57 +0300
Message-ID: <CAA8EJprdiac17UfMLg-1Kg2urd4PZOs=5DT_1YGrN7u1W0=Bbw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: attach the DP subconnector property
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Oct 2023 at 10:46, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> support setting the DP subconnector type") I had the patch [1] in my
> tree. I haven't noticed that it was a dependency for the commit in
> question. Mea culpa.

[1] https://patchwork.freedesktop.org/patch/555530/

> Since the patch has not landed yet (and even was not reviewed)
> and since one of the bridges erroneously uses USB connector type instead
> of DP, attach the property directly from the MSM DP driver.
>
> This fixes the following oops on DP HPD event:
>
>  drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>  dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>  dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>  hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>  kthread (kernel/kthread.c:388)
>  ret_from_fork (arch/arm64/kernel/entry.S:858)


-- 
With best wishes
Dmitry
