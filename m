Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1493359E77D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 18:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241561AbiHWQfD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Aug 2022 12:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244790AbiHWQec (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Aug 2022 12:34:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03EAFB2BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 07:50:41 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id z2so18379806edc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=5HbW8uko2vZ7AfwOU8eshl0aSQHKvNNaKtmoLv6rUEM=;
        b=JVJ/J+80rmibqknLI2dl4D/IfJ9EQwbBZSfvxG712BBjzT3yS+x3AVpptqWtAIaoP5
         6AoLaaLRByrmJMtY636D5RKtuqEryU2Ox4VkD9HvYVOmuivp45RYryYXmKDqEJApQVWi
         nDj+k2TQWI9jk0P895iLQrG5xjpJylgYK15ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=5HbW8uko2vZ7AfwOU8eshl0aSQHKvNNaKtmoLv6rUEM=;
        b=na2p0Xluj5AePQ4uPU/M6ndd7YjfnhGrX477RDbG1faK2noYp9UhdKiwtqaEkrgt/a
         8UBqEIBp2CLs13I9mfASGD10kzPVM0mmrlzqP5R3VZUcZGFC0scYMEtq2/SU5UVxICse
         Bwv7/kPeHca+DMrCth2uxw8MGnAUiiXt9yZ3p7Nibgk3MV+TtMtJJ4K+1SKMXGeCvVn9
         /ejROiGjQJDvCTiEhIVVkOjR1T62XOiM+ilowFC7AmCwUZNLliqZ0Anr0WSz/x7+sXIP
         K5btmYx1r7WEQG9sWVfb2EO2PxWaP3Cz2/OeN+8UvK7RmylDymZ3WF7sqnYR2JEmQHni
         zJ5g==
X-Gm-Message-State: ACgBeo2gsxlpiGfnF7u+wZJ99zkLN37ClOxd13gVp4nLSC6SRWnMokhc
        ueaP2uccMa3IH8prV04EpK7vJkOMGxCJIpaNOy0=
X-Google-Smtp-Source: AA6agR7c82RNAWTWotmjGH6j5+hgP+KD3SpD2CGLpNIRZ4gQ+7FG/QD2IaCmw2hBvPvtVwfx6nIXJg==
X-Received: by 2002:a05:6402:1f01:b0:445:fbe8:4b2e with SMTP id b1-20020a0564021f0100b00445fbe84b2emr4012174edb.192.1661266240246;
        Tue, 23 Aug 2022 07:50:40 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id fk2-20020a056402398200b00445b5874249sm1505544edb.62.2022.08.23.07.50.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 07:50:37 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id b5so13026681wrr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Aug 2022 07:50:37 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr13686062wru.405.1661266236928; Tue, 23
 Aug 2022 07:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220726173824.1166873-1-dianders@chromium.org>
 <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid>
 <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
 <CAD=FV=V5c0bCOCBvdnqVJ6Sa1XKeg+d7kTEL2Okh4GAL66MGiw@mail.gmail.com>
 <CAMSo37Uve4qrAA81zrO9eOGc4y7vjg-OZ9L7m9xWM7UkQ6PzmQ@mail.gmail.com> <CAMSo37U1uxUFkn4Jda5E+nDiz0wp8_ERbNa9BUgWttZ6dEssAg@mail.gmail.com>
In-Reply-To: <CAMSo37U1uxUFkn4Jda5E+nDiz0wp8_ERbNa9BUgWttZ6dEssAg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 23 Aug 2022 07:50:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNNAYtdoocp_ShyNBOBmqSSr79=x_2UKq+yfA+HiOo9w@mail.gmail.com>
Message-ID: <CAD=FV=WNNAYtdoocp_ShyNBOBmqSSr79=x_2UKq+yfA+HiOo9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] regulator: core: Allow specifying an initial load
 w/ the bulk API
To:     Yongqin Liu <yongqin.liu@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
        Alistair Delva <alistair.delva@linaro.org>,
        Todd Kjos <tkjos@google.com>, Steve Muckle <smuckle@google.com>
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

On Mon, Aug 22, 2022 at 11:23 PM Yongqin Liu <yongqin.liu@linaro.org> wrote:
>
> Hi, Douglas
>
> Just an update on the fix you pointed out previously here:
> > > [1] https://lore.kernel.org/r/20220809142738.1.I91625242f137c707bb345c51c80c5ecee02eeff3@changeid
>
> With it I could boot the hikey960 build to the home screen if it does
> not use the GKI kernel.
> but the problem will be reproduced if it uses the GKI kernel.
>
> And if this change is reverted, then it could boot with the GKI kernel as well.
>
> I am not sure what's the reason there, but there seems to be some
> difference with the fix above and the workaround of revert.
> Not sure if you have any idea about that.
>
> Regarding the GKI kernel(Android Generic Kernel Image)[2], it's built
> from the android-mainline tree(f51334eac4de) without any workaround.
> (Neither the revert, nor the fix applied), and the regulator modules
> used for the hikey960 build are hi6421v530-regulator.ko and
> hi655x-regulator.ko
>
> I am still not sure if it would work with the GKI kernel that has the
> fix that you pointed out in. the case that both the GKI kernel and
> vendor tree have the fix.
> Will update here when I have some results.
>
> [2]: https://source.android.com/docs/core/architecture/kernel/generic-kernel-image?hl=en

That's not too surprising. The broken patch is in the core kernel so
you need the fix in the core kernel. I think that means you'll have to
wait until `android-mainline` gets the fix. I don't work on Android,
so if there's some other route to get an expedited fix into
android-mainline I'm not aware of it.

-Doug

-Doug
