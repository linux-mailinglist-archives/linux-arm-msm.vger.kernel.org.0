Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969114F589F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 11:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239249AbiDFJCI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 05:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1452943AbiDFI6k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 04:58:40 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630D611FE17
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 19:51:25 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-e1e5e8d9faso1545404fac.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=b3VgmcVE3acBeuODdkvAAtJXlVuslI4bEciUTqIWCXk=;
        b=Uv+PIrB6cyK6LLEXHNe2noHhf63P0v4ECfEtz/zC4+ThCOWRUaiT7C7Ei3Fflk8r8X
         Y8JNk9YQ8oaJTVUPPWKg6Afa+IcWnWZ/VLZehdbhOcW7rEpo0BdJaCM27cnSCvOT9yld
         YHThOe5G+JB5u6NVpg8gKhFqzWQgxAFswR/Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=b3VgmcVE3acBeuODdkvAAtJXlVuslI4bEciUTqIWCXk=;
        b=GuQrz9BA8zVno11GP/KAVmKPYncty8hNetH4Ih5ihM1Ci4QaX8xLHXBJ5qTmrcH4rT
         Hh/+OToxCl3m6xB1cGFGpFW28ZPTBk0iRkk5cV1cr7N3kqNIywD0d8/fSLCA+0guyL1m
         ghQ/5qTMYFfFJExbCbWrYpaIYLgkJct3YcH5pKlaBSft4b4P6W1Mxw70VpXNiVXIu15h
         iE9a8wBDrzZnTM5uLvamQyObhooFfWl9txTSx0XnCJDkUzqc4xWT6ISmrRmihpSrX17O
         2rg9m3gcunp3QQNgYoODFOX644Ua5MxHAl6BPyzZrlCsqrmh6FfRRZ7+3od7o83GeX8R
         Go4A==
X-Gm-Message-State: AOAM530icPEV2QXdURQMg2+uTVHiLJyck8p4BCfAn++KtCxhlf4eYIn/
        e7Jc8wAArn4HAPqdHEWYDxWu+QBtzekKIR8XMfTe+A==
X-Google-Smtp-Source: ABdhPJwyhOMQxO9obsul5Y1w7P3cWlG8E3ejPRdOhFNq/BGZk2T4u3pPnhmUkLRH6BtD6orCVzZkjOczXsYtx4cXWZk=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr2980516oao.63.1649213484466; Tue, 05
 Apr 2022 19:51:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 19:51:24 -0700
MIME-Version: 1.0
In-Reply-To: <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org> <20220405234551.359453-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 19:51:24 -0700
Message-ID: <CAE-0n53p7MsvwzqzzyHdRzX2XV9_Lv7poTuZMQowha0=f=QZSA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/hdmi: properly add and remove created bridges
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-05 16:45:48)
> Add calls to drm_bridge_add()/drm_bridge_remove() for the internal HDMI
> bridges. This fixes the following warning.
>
> [    2.195003] ------------[ cut here ]------------

Usually this line is left out

> [    2.195044] WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4

And the timestamp is removed

> [    2.198774] DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> [    2.198786] Modules linked in:
> [    2.211868] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
> [    2.214671] Hardware name: Generic DT based system
> [    2.223265]  unwind_backtrace from show_stack+0x10/0x14
> [    2.228036]  show_stack from dump_stack_lvl+0x58/0x70
> [    2.233159]  dump_stack_lvl from __warn+0xc8/0x1e8
> [    2.238367]  __warn from warn_slowpath_fmt+0x78/0xa8
> [    2.243054]  warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
> [    2.248174]  __mutex_lock from mutex_lock_nested+0x1c/0x24
> [    2.253818]  mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
> [    2.259116]  drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
> [    2.265279]  msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
> [    2.272223]  mdp4_kms_init from msm_drm_bind+0x514/0x698
> [    2.278212]  msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc

I'd probably cut it off here.

Is there any Fixes tag for this? Still seems worthwhile to have one even
if this is a lockdep warning.
