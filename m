Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C6F523D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 21:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346625AbiEKTI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 15:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243793AbiEKTIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 15:08:25 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB766D19F
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:08:23 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id dk23so5915367ejb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
        b=dBuK2lymrrDPdlannsOQHXnUcfuHTrBkOPfEbu7qkW0E5kYO5Z+bFsewwOP9kO18lS
         Ebs/5hwuDtsE7odsW2FMFSxqELyAfsWmglvZotYHMj+VC+iTD8HgUjirJo2F71hfTMdW
         r33xYQIIdwMLG8WV5P6snakQvBwy2w3VlziQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmamqcS6UVefjf9ZEAc++snoGPnFlkAJ7A2gr6Hybu0=;
        b=pS1+8M3p3Inp8yemNtlVkVPAGWgg3XMM0VKTm0qSAcj86lhBo+Fvgj6+Xs2y/wfV8D
         cmaRjiHBv5s4SpmQt7VpNgfsenzHVRO6PM51wzo3iYVSn1gbQGDmugZvPdtcsefiXQh3
         dKww3KYL5qsOC4FMD4poDWCjs3OQM5W09z93Wtxn2PLZZVwRNmXiq2n2oqvdzBdwj/ib
         GZRhhvA9booYYFckfg3gildrgc4y0zt7/XaUp/iewlz0GaVQ88nI/2zpmdVwoUf1XMJz
         d7EouoH5jKmWICcVdyOHOFTxrKI8ui2qLyiTnONCkHTAOSSeaVJm5T14KMO25/4SXxvN
         mKTA==
X-Gm-Message-State: AOAM532t1eG+J/3SZW3Z6yEeuuNr1sMFg+ganuKZ7bkBn6qiXhWUrLum
        xNim1b9/RgE+TZHLQcPkAK5rxr0EXf6LAGlRIqY=
X-Google-Smtp-Source: ABdhPJyXivkxti7l+gz/wbfbhfSCTIyrG8ALlw4s23FyfUe6KXYZUc5zPr99VVyoK+siD3nL8/Pj7w==
X-Received: by 2002:a17:907:8693:b0:6f8:635a:1d32 with SMTP id qa19-20020a170907869300b006f8635a1d32mr20830881ejc.663.1652296102128;
        Wed, 11 May 2022 12:08:22 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906848300b006f3ef214dc6sm1266679ejx.44.2022.05.11.12.08.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 12:08:20 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id r188-20020a1c44c5000000b003946c466c17so1169404wma.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:08:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr6316930wmq.145.1652296099201; Wed, 11
 May 2022 12:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com> <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com> <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
In-Reply-To: <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 11 May 2022 12:08:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Message-ID: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
To:     Rob Clark <robdclark@gmail.com>
Cc:     Dave Airlie <airlied@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 11, 2022 at 11:40 AM Rob Clark <robdclark@gmail.com> wrote:
>
> It is missing in this revision of the RFC, but the intention is to
> have the gitlab-ci.yml point to a specific commit SHA in the
> gfx-ci/drm-ci[1] tree, to solve the problem of keeping the results in
> sync with the expectations.  Ie. a kernel commit would control moving
> to a new version of i-g-t (and eventually deqp and/or piglit), and at
> the same time make any necessary updates in the expectations files.

Wouldn't it then be better to just have the expectation files in the
ci tree too?

The kernel tree might have just the expected *failures* listed, if
there are any. Presumably the ci tree has to have the expected results
anyway, so what's the advantage of listing non-failures?

                  Linus
