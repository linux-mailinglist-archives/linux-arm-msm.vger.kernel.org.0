Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B72AF5B67F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 08:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbiIMGfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 02:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiIMGfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 02:35:32 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467341583F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 23:35:31 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id lc7so25253456ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 23:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gKNkp5TT0XjbSEmbU4M+B2B1cDxK13/0CThFH853tls=;
        b=oWWEF/08VQtpBTsplhTEQ87f9wS6PdIe0WOT+m9wrHcVpU1Gbf6/v9mUpGSDwch3nR
         A0Zib3++wgkeB2Ne5BzvDdzU+eifZFHaQGbgrGEK0/vux33BpwRSjkNkzUNwtnnOeeHH
         s0dkzYSP2obWbdCHPijdD2H/iA0Pku8Ki4LTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gKNkp5TT0XjbSEmbU4M+B2B1cDxK13/0CThFH853tls=;
        b=VCw6RoEtu9rZijivPnLD7ORXBtDx6pa3JT5V4Z2axjlQCOTqtxTULZTJQn59D8Pdg5
         X5tfeiLzxReOyroN5pElrR0LQNLJUx2Lcj8Lw9FuHfoGHRY7mBTXNnPzJZGzVqJ5j9L4
         CiMqHISaN/F422wCJKb42MA8rPj6RtqaGw2qG8OgaANdXptC1j0dI2prKH3lWTVUqeGt
         uDie0lzUi446DccUEecHDPlRPc9jhwbREDn2uDiC1ObtO1K2Iku7Uhk9e7s+bOBEB36m
         oZ3/NQSQskYp9em9L5aZQZXSyBTV2dFYuQUK6lHiPeukFozjjYFDQMiLSoYrkFcp++w3
         Fk8g==
X-Gm-Message-State: ACgBeo1S4yQvOXfLlOOrdvrcGsU2bxuxKC+petJd2K9bAC1jNDSABXjM
        u000pxv3eC5E0wqKDV3/yyZhEcgA/iYhOLwSg6k=
X-Google-Smtp-Source: AA6agR7e+HrKt607P2zlWH8eyn9+89aHhsHa1VRb7omITWAT4fcH8Ndm/vjCpIZgst4S1ApGoIvqgw==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id fj3-20020a1709069c8300b00779c14c55e4mr13103349ejc.619.1663050929590;
        Mon, 12 Sep 2022 23:35:29 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id kv24-20020a17090778d800b007707fc31b8dsm5496012ejc.26.2022.09.12.23.35.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 23:35:28 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id az24-20020a05600c601800b003a842e4983cso8849709wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 23:35:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr1199949wmq.85.1663050927147; Mon, 12
 Sep 2022 23:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-5-johan+linaro@kernel.org> <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
In-Reply-To: <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 13 Sep 2022 07:35:15 +0100
X-Gmail-Original-Message-ID: <CAD=FV=U8_bjPm3NEOWqzehrx0xFV4U771nTuhhOiM9gKDVCo5g@mail.gmail.com>
Message-ID: <CAD=FV=U8_bjPm3NEOWqzehrx0xFV4U771nTuhhOiM9gKDVCo5g@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
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

Hi,

On Mon, Sep 12, 2022 at 7:10 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/09/2022 18:40, Johan Hovold wrote:
> > Device-managed resources allocated post component bind must be tied to
> > the lifetime of the aggregate DRM device or they will not necessarily be
> > released when binding of the aggregate device is deferred.
> >
> > This can lead resource leaks or failure to bind the aggregate device
> > when binding is later retried and a second attempt to allocate the
> > resources is made.
> >
> > For the DP aux-bus, an attempt to populate the bus a second time will
> > simply fail ("DP AUX EP device already populated").
> >
> > Fix this by amending the DP aux interface and tying the lifetime of the
> > EP device to the DRM device rather than DP controller platform device.
>
> Doug, could you please take a look?
>
> For me this is another reminder/pressure point that we should populate
> the AUX BUS from the probe(), before binding the components together.

Aside from the kernel robot complaints, I'm not necessarily convinced.
I think we know that the AUX DP stuff in MSM-DP is fragile right now
and Qualcomm has promised to clean it up. This really feels like a
band-aid and is really a sign that we're populating the AUX DP bus in
the wrong place in Qualcomm's code. As you said, if we moved this to
probe(), which is the plan in the promised cleanup, then it wouldn't
be a problem.

As far as I know Qualcomm has queued this cleanup behind their current
PSR work (though it's never been clear why both can't be worked on at
the same time) and the PSR work was stalled because they couldn't
figure out what caused the glitching I reported. It's still on my nag
list that I bring up with them every week...

In any case, if a band-aid is urgent, maybe you could just call
of_dp_aux_populate_bus() directly in Qualcomm code and you could add
your own devm_add_action_or_reset() on the DRM device.
