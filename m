Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF33751077D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 20:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352606AbiDZSv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 14:51:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352688AbiDZSv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 14:51:27 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4EE89CC0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:48:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id be20so15114529edb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fi4UID/HmFece7oTL/UhSNA9qggnqUU7Xw1cgGW6Rg0=;
        b=aqWjLkdHqdOFB49iwf5Y4RQwk+Ttcp7/V4Ed9GhbY0FJtH/LOgxkMwi6yimmLKCDKQ
         b15sUfrqFb4zKv92ew4D5gnVulyEv3XWxOqsnWuf7A7Hsv9YkfsB0yJ+Jq3GnUix8T92
         OhjiEgYtIeKLE63VdPnbE878TJT/VB/AdbkpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fi4UID/HmFece7oTL/UhSNA9qggnqUU7Xw1cgGW6Rg0=;
        b=gdc6LaD0nJo1pM+Z7V3LNZOmmGdoQCZ+KLAjPcJkfSTW1/28Sd//oIsjhAwHrx1obb
         uk1hjDBVm+sQkYMPgSabuQf+MDtDuQOBQEkEjK17aZba76ZiaXBHq/+L9S5Hnlxv1Abj
         BdjdSuL/Gk0iAeMiWhlcP8TZbd2Nl1z0PPauhqCIKfSUKfeDRexzCRW0syurRR9n6GZk
         m1iQlR2RaobQBUSyGPzlkZomxGzzFhPIFOLQF6TH2cLM+ep6tVHG0DLahbHjKcXDHQ/e
         jTzBLPquCqejGZ+hgxrZMANUEKO7FBK0xTSfcFqY4ERn7QqcNFyQ7av+Si78/nUNkTQs
         d19g==
X-Gm-Message-State: AOAM531WRqBYBiCmvS3boNzBLIRF6au1ufIBSjAPQJV7IfiUj1Dyt1DC
        eeGyxufjpY22W5MgryAZntq2vofRde884e14X/c=
X-Google-Smtp-Source: ABdhPJxx5ym0HUvQzkGmpQFBJiFVdBbAUeHXm8pRoca4uwry/mX9AMCIuP2YEIonctGt6xDJjs83kg==
X-Received: by 2002:a05:6402:3493:b0:423:f2a5:df94 with SMTP id v19-20020a056402349300b00423f2a5df94mr26431431edc.261.1650998897075;
        Tue, 26 Apr 2022 11:48:17 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id x17-20020a170906297100b006e49a9535f3sm5287630ejd.114.2022.04.26.11.48.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:48:16 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso1139724wmh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:48:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr22469790wmb.199.1650998895809; Tue, 26
 Apr 2022 11:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org> <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com> <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com> <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
 <d3d1d0d5-d3e0-0777-5b20-cdf24697742d@quicinc.com> <CAD=FV=W2WPdiY2zq6JC_-10kOqzDuiUYQOdYbyRyw2k-fbXFXQ@mail.gmail.com>
 <eaedbc40-f8cb-aaf8-f335-ef48e3cf82cc@quicinc.com>
In-Reply-To: <eaedbc40-f8cb-aaf8-f335-ef48e3cf82cc@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 Apr 2022 11:48:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJsWRjawybS2222MupBLVD7rLyKxUPBmax8PaFX8N4dA@mail.gmail.com>
Message-ID: <CAD=FV=XJsWRjawybS2222MupBLVD7rLyKxUPBmax8PaFX8N4dA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to dp_connector_get_mode()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 26, 2022 at 8:37 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> > Can you provide the exact EDID from the failing test case? Maybe that
> > will help shed some light on what's going on. I looked at the original
> > commit and it just referred to 4.2.2.1, which I assume is "EDID Read
> > upon HPD Plug Event", but that doesn't give details that seem relevant
> > to the discussion here.
>
> Yes so it is 4.2.2.1 and 4.2.2.6.
>
> That alone wont give the full picture.
>
> So its a combination of things.
>
> While running the test, the test equipment published only one mode.
> But we could not support that mode because of 2 lanes.
> Equipment did not add 640x480 to the list of modes.
> DRM fwk will also not add it because count_modes is not 0 ( there was
> one mode ).
> So we ended up making these changes.

Ah! This is useful context and makes tons of sense.

This really feels like something that could be handled in the core. OK, See:

https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid


> > I guess maybe what's happening is that the test case is giving an EDID
> > where all the modes are not supportable by the current clock rate /
> > lanes? ...and then somehow we're not falling back to 640x480. It's
> > always possible that this is a userspace problem.
> >
> > In any case, would you object to a revert of the patches in the short term?
>
> Not sure, if you saw this change kuogee posted last night.
> https://patchwork.freedesktop.org/patch/483415/
> We did decided to remove all the code related to these test cases and
> handle them in IGT.

I hadn't seen it yet and I wasn't CCed. :( I'll take a look now.
