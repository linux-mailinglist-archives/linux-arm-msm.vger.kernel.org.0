Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A2C51C446
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 17:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239638AbiEEPzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 11:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbiEEPzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 11:55:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852674A3E5
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 08:51:44 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gh6so9598476ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1imTbFvxSu0eMtn2Ea7a1QwVSeRsNsaWdQpXFh00o/s=;
        b=JfpSQd3gaJ+Ed4G9YtnYm6kZ+FIOM5VXR603FG7MY0xIZqMeY7V4l9wEpXstNwsAHP
         cDfh4ZcNUGOGdlbv+HwQWvDMXX3/9wCujtPuU5aEMRr0agBAlVueTJrufPNjOVTdCUG7
         eY47+K/EnXB1451xaJMDLF2X/0Wn3e5z2TpVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1imTbFvxSu0eMtn2Ea7a1QwVSeRsNsaWdQpXFh00o/s=;
        b=CdyzOWQHWZZOu96cwJhZ9awhTY/pZB98xlFXoCpbK40ILOgsavZtLKOdDBLRfMQsgd
         kyGp1X2EtwTw8wyWVl0WX8t05jeL9oIIypkJxRYiqBDlmjinbHAaZMuqGpXKF1L5lHUa
         QISElrcnXwmVVqf2cwj+fWkqm+VmVdjkbjzVYfm13ebiusLUzpTaQZv3Sq8eLmuBiJW8
         aKfzKNySADZCOnCPqrN2oQqW9+pTp05/ynIeVM+QcyFZMbBrFeaWMxvlwY8GJVn+rAgI
         quTqs5N8sVMdYTXXzmpj6H5XFvC64/voouuuIkfiDEu+2ErGRNnuSlgAKedoU4g+Um73
         meng==
X-Gm-Message-State: AOAM533+hEvF7ODfHWjNGvE3VUnmUhtyC5jJCIf+AQua8VPSrOU9fkbh
        LzO1M/eHt5/DmaxOW2RHo1+vhrAZtQkyaJgNXVk=
X-Google-Smtp-Source: ABdhPJyoaew060Ibqvd/cR4DwUcmrFlsJfRYRlrO5iljlaNuhb9YLNFb6N6tJOTdZ8oC13QgMtmaIw==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id l18-20020a170906795200b006da94c9cccbmr26523475ejo.469.1651765902868;
        Thu, 05 May 2022 08:51:42 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id n21-20020aa7db55000000b0042617ba63c6sm953715edt.80.2022.05.05.08.51.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 08:51:42 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id a14-20020a7bc1ce000000b00393fb52a386so5384506wmj.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 08:51:42 -0700 (PDT)
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr5628302wmk.118.1651765494778; Thu, 05
 May 2022 08:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
In-Reply-To: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 May 2022 08:44:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Message-ID: <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
To:     dri-devel <dri-devel@lists.freedesktop.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ville,

On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> If we're unable to read the EDID for a display because it's corrupt /
> bogus / invalid then we'll add a set of standard modes for the
> display. When userspace looks at these modes it doesn't really have a
> good concept for which mode to pick and it'll likely pick the highest
> resolution one by default. That's probably not ideal because the modes
> were purely guesses on the part of the Linux kernel.
>
> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_edid.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Someone suggested that you might have an opinion on this patch and
another one I posted recently [1]. Do you have any thoughts on it?
Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
don't have an opinion, that's OK too.

[1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

-Doug
