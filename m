Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47EC250EEA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 04:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiDZCWH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 22:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241747AbiDZCWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 22:22:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A54113C88
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 19:19:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id be20so12261609edb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 19:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c4m32+fTXzvjrK8N2PTs9HFTY5JW2xcDekaDXCQn2Jo=;
        b=UJ31W5ZGcTMdSrRnKjrJV8Q7vQiCR0y48RG002zAPW0z545pWer/A2fTaArW9Is7Jy
         epp1b/Me9p6puYs3/q2r3o9R9bp2QEb09OKfTf/KJdjzwPFEPZZskrURVnLpaJZb54PZ
         foOuSGS/UEjxyzsKHE/tENb1LS77Wnf7POSVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c4m32+fTXzvjrK8N2PTs9HFTY5JW2xcDekaDXCQn2Jo=;
        b=Dw0NjXHyLRJ8k4A7FHZ8D3gW9jq+26eu7SwWXYbgo1vLxT3c4U0ihdQ1R3cBkooRz1
         AA/3A2tVU67vKwRU3ZfTao488X3BdYbA5bOQMrCPCQUdSaE+OlNhV3C13DGjdfP6NFec
         V2Tra6eEOk5wodj0asbRo9hQwE3Q8DtR6B4lEZwYO4QaJcsdwk4hdxd41PR1fjhbAJhv
         BPlMcrU6S6nRpDDz308h8y1fnncIvVqoFOw1hqzc2yQoZqbXu7/n+nSnknlmorTQPfZU
         hpsOhJW6A1isCS4e1t3yw0prH2M24zt3CSBcEsx1LA+lSlqMCEFcLKD9Sr24OZYL7ujm
         BE9g==
X-Gm-Message-State: AOAM530Gf9ZMZVPH3j3ebRGff5A2ojmD7kFBQwBLjfgbXAZ6xLHmw86u
        IiAMTJHt5ru1O9O3760HHEYeet+fqIkP+FEe
X-Google-Smtp-Source: ABdhPJyIGV3m40JAeVYOtw9mepmdSpXkeeUeUTuuqjvzqyaBxQiiayKie4WNRXB24kKIEvqG31RiEg==
X-Received: by 2002:a05:6402:2789:b0:423:fe09:c252 with SMTP id b9-20020a056402278900b00423fe09c252mr22935826ede.11.1650939539190;
        Mon, 25 Apr 2022 19:18:59 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id d26-20020a170906305a00b006f3a7ffbb0esm649752ejd.70.2022.04.25.19.18.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 19:18:56 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id e24so3500919wrc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 19:18:55 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr7719873wrx.422.1650939535168; Mon, 25
 Apr 2022 19:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com>
 <3b9588d2-d9f6-c96f-b316-953b56b59bfe@linaro.org> <73e2a37e-23db-d614-5f5c-8120f1869158@quicinc.com>
 <CAA8EJprjuzUrfwXodgKmbWxgK6t+bY601E_nS7CHNH_+4Tfn5Q@mail.gmail.com>
 <9b331b16-8d1b-4e74-8fee-d74c4041f8d7@quicinc.com> <CAD=FV=VxEnbBypNYSq=iTUTwZUs_v620juSA6gsMW4h2_3HyBQ@mail.gmail.com>
 <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
In-Reply-To: <9b4ccdef-c98a-b907-c7ee-a92456dc5bba@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 25 Apr 2022 19:18:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
Message-ID: <CAD=FV=U3MJ1W6CCVW0+Si8ZyAD+_ZBYsL1cT6Y8yhcTvWsCLUQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: move add fail safe mode to dp_connector_get_mode()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 25, 2022 at 6:42 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> >> 2) When there was a valid EDID but no 640x480 mode
> >>
> >> This is the equipment specific case and the one even I was a bit
> >> surprised. There is a DP compliance equipment we have in-house and while
> >> validation, it was found that in its list of modes , it did not have any
> >> modes which chromebook supported ( due to 2 lanes ). But my
> >> understanding was that, all sinks should have atleast 640x480 but
> >> apparently this one did not have that. So to handle this DP compliance
> >> equipment behavior, we had to do this.
> >
> > That doesn't seem right. If there's a valid EDID and the valid EDID
> > doesn't contain 640x480, are you _sure_ you're supposed to be adding
> > 640x480? That doesn't sound right to me. I've got a tiny display in
> > front of me for testing that only has one mode:
> >
> >    #0 800x480 65.68 800 840 888 928 480 493 496 525 32000
> >
>
> As I had wrote, DRM core kicks in only when the count of modes is 0.
> Here what is happening is the count was not 0 but 640x480 was not
> present in the EDID. So we had to add it explicitly.
>
> Your tiny display is a display port display?
>
> I am referring to only display port monitors. If your tiny display is
> DP, it should have had 640x480 in its list of modes.

My tiny display is actually a HDMI display hooked up to a HDMI to DP
(active) adapter.

...but this is a legal and common thing to have. I suppose possibly my
HDMI display is "illegal"?

OK, so reading through the spec more carefully, I do see that the DP
spec makes numerous mentions of the fact that DP sinks _must_ support
640x480. Even going back to DP 1.4, I see section "5.2.1.2 Video
Timing Format" says that we must support 640x480. It seems like that's
_intended_ to be used only if the EDID read fails, though or if we
somehow have to output video without knowledge of the EDID. It seems
hard to believe that there's a great reason to assume a display will
support 640x480 if we have more accurate knowledge.

In any case, I guess I would still say that adding this mode belongs
in the DRM core. The core should notice that it's a DP connection
(bridge->type == DRM_MODE_CONNECTOR_DisplayPort) and that 640x480 was
left out and it should add it. We should also make sure it's not
"preferred" and is last in the list so we never accidentally pick it.
If DP truly says that we should always give the user 640x480 then
that's true for everyone, not just Qualcomm. We should add it in the
core. If, later, someone wants to hide this from the UI it would be
much easier if they only needed to modify one place.


> > So IMO we _shouldn't_ land ${SUBJECT} patch.
> >
> > Just for testing, I also tried a hack to make EDID reading fail
> > (return -EIO in the MSM dp_aux_transfer() function if msg->request <
> > 8). Before ${SUBJECT} patch I'd see these modes:
> >
> >    #0 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
> >    #1 800x600 60.32 800 840 968 1056 600 601 605 628 40000
> >    #2 800x600 56.25 800 824 896 1024 600 601 603 625 36000
> >    #3 848x480 60.00 848 864 976 1088 480 486 494 517 33750
> >    #4 640x480 59.94 640 656 752 800 480 490 492 525 25175
> >
> > ...and after ${SUBJECT} patch I'd see:
> >
> >    #0 640x480 59.94 640 656 752 800 480 490 492 525 25175
> >    #1 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000
> >    #2 800x600 60.32 800 840 968 1056 600 601 605 628 40000
> >    #3 800x600 56.25 800 824 896 1024 600 601 603 625 36000
> >    #4 848x480 60.00 848 864 976 1088 480 486 494 517 33750
> >
> > ...so your patch causes 640x480 to be prioritized. That also doesn't
> > seem ideal. If it was ideal, the DRM core should have listed 640x480
> > first.
>
> So this is a different display or these modes are coming due to the
> drm_add_modes_noedid() call because of the EDID read fail right?

Right, it's from the !edid case.

-Doug
