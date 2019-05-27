Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096D22AFEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2019 10:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbfE0IS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 May 2019 04:18:56 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38032 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfE0IS4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 May 2019 04:18:56 -0400
Received: by mail-ed1-f68.google.com with SMTP id w11so25524580edl.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2019 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ngdR6Ro3qn7ZGyLFGLKvSdhPqv+ELHfz/McePmePXw=;
        b=NF9jvX+KkRyAzN9Z4tiBQoEU28hBWIbk6SBE+vj7vIe+t8OUdUSFFDLsKzQ/isEFCk
         nrbsvjniSWyiJMEk76S+sK16S555XHSeQYeBF9vbygt6X4e0nFFdUMYoo+EMNJesiydQ
         MrVuRYeOno70/Yg3H19nWhrXl6xrD0J6Mjhkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ngdR6Ro3qn7ZGyLFGLKvSdhPqv+ELHfz/McePmePXw=;
        b=RCDcgWp5/34KIXcG21WsKluLI9muiYSRUIcP2M/sguyxeKlszmReAK55KD3hq9O+KE
         z7Pqr856zOKdTrqix5pqHPe79/lW8MFvNPjoPUThCD+F1uuZp7v+iaudTvOB7iFINh6E
         zfpLNvaDQBc2JSXRVgWk3ou6biyBW6M1HIf/5zmJwdOqB8i72cf+BNdddgzTfZApuB6Y
         rGs2mlcV8kl8gbS9g1AgWbNARwpxHxf14HMIULql9AaqT735fcJcoGfomUPyOhKGw2U8
         FxHisSy1KWFml5qI4GIcFKFmUJnOlIruk6npbnbGiOOIU0z6O3b9JaVrONwFFDfCssvM
         DIzA==
X-Gm-Message-State: APjAAAUoeXWiU8weBR2254lHbdVpnUzibzHCKoGXWPhIHWd50aoVUPic
        XVW+LfpcpJUPUeG8NizEcdidR2AeF4qrOA==
X-Google-Smtp-Source: APXvYqz60DClU3KDj5/oyowFpVVJqN07Basewp3pfx+2WyEKYigTtUKNaJwql9wvHL/yIWDHO59cwA==
X-Received: by 2002:a17:906:27d7:: with SMTP id k23mr19758586ejc.37.1558945133730;
        Mon, 27 May 2019 01:18:53 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id s22sm1589666ejx.75.2019.05.27.01.18.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 01:18:52 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id w13so7600424wru.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2019 01:18:51 -0700 (PDT)
X-Received: by 2002:adf:ec42:: with SMTP id w2mr22234669wrn.77.1558945131083;
 Mon, 27 May 2019 01:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org> <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org> <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org> <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
 <01b6683f-9378-e6f2-501f-e2213e6c690d@xs4all.nl> <CAAFQd5Dw-1A2gXuC54Z7808L6Vm9mjPpE7Kbj-TZC18_k_FgVA@mail.gmail.com>
 <a9b11ba0-adca-f974-67a5-a0fe54689bba@xs4all.nl>
In-Reply-To: <a9b11ba0-adca-f974-67a5-a0fe54689bba@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 27 May 2019 17:18:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CMpQ4ODyeBPnOv4w9ktqPsiqJtSkpRhAx+XgQ=Lz9crQ@mail.gmail.com>
Message-ID: <CAAFQd5CMpQ4ODyeBPnOv4w9ktqPsiqJtSkpRhAx+XgQ=Lz9crQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 27, 2019 at 4:39 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/27/19 5:51 AM, Tomasz Figa wrote:
> > On Tue, May 21, 2019 at 9:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 5/21/19 11:09 AM, Tomasz Figa wrote:
> >>> Hi Stan,
> >>>
> >>> On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
> >>> <stanimir.varbanov@linaro.org> wrote:
> >>>>
> >>>> Hi Tomasz,
> >>>>
> >>>> On 4/24/19 3:39 PM, Tomasz Figa wrote:
> >>>>> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> >>>>> <stanimir.varbanov@linaro.org> wrote:
> >>>>>>
> >>>>>> Hi Hans,
> >>>>>>
> >>>>>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
> >>>>>>> Hi Stanimir,
> >>>>>>>
> >>>>>>> I never paid much attention to this patch series since others were busy
> >>>>>>> discussing it and I had a lot of other things on my plate, but then I heard
> >>>>>>> that this patch made G_FMT blocking.
> >>>>>>
> >>>>>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
> >>>>>> is received that the stream is parsed and the resolution is correctly
> >>>>>> set by application. Just to note that I'd think to this like a temporal
> >>>>>> solution until gstreamer implements v4l events.
> >>>>>>
> >>>>>> Is that looks good to you?
> >>>>>
> >>>>> Hmm, I thought we concluded that gstreamer sets the width and height
> >>>>> in OUTPUT queue before querying the CAPTURE queue and so making the
> >>>>> driver calculate the CAPTURE format based on what's set on OUTPUT
> >>>>> would work fine. Did I miss something?
> >>>>
> >>>> Nobody is miss something.
> >>>>
> >>>> First some background about how Venus implements stateful codec API.
> >>>>
> >>>> The Venus firmware can generate two events "sufficient" and
> >>>> "insufficient" buffer requirements (this includes decoder output buffer
> >>>> size and internal/scratch buffer sizes). Presently I always set minimum
> >>>> possible decoder resolution no matter what the user said, and by that
> >>>> way I'm sure that "insufficient" event will always be triggered by the
> >>>> firmware (the other reason to take this path is because this is the
> >>>> least-common-divider for all supported Venus hw/fw versions thus common
> >>>> code in the driver). The reconfiguration (during codec Initialization
> >>>> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
> >>>> re-configuration happen I need to wait for "insufficient" event from
> >>>> firmware in order to know the real coded resolution.
> >>>>
> >>>> In the case of gstreamer where v4l2_events support is missing I have to
> >>>> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
> >>>> STREAMON(CAPTURE) (vb2::start_streaming).
> >>>>
> >>>> I tried to set the coded resolution to the firmware as-is it set by
> >>>> gstreamer but then I cannot receive the "sufficient" event for VP8 and
> >>>> VP9 codecs. So I return back to the solution with minimum resolution above.
> >>>>
> >>>> I'm open for suggestions.
> >>>
> >>> I think you could still keep setting the minimum size and wait for the
> >>> "insufficient" event. At the same time, you could speculatively
> >>> advertise the expected "sufficient" size on the CAPTURE queue before
> >>> the hardware signals those. Even if you mispredict them, you'll get
> >>> the event, update the CAPTURE resolution and send the source change
> >>> event to the application, which would then give you the correct
> >>> buffers. Would that work for you?
> >>
> >> As I understand it this still would require event support, which gstreamer
> >> doesn't have.
> >
> > I don't think it matches what I remember from the earlier discussion.
> > As long as Gstreamer sets the visible resolution (from the container
> > AFAIR) on OUTPUT, the driver would adjust it to something that is
> > expected to be the right framebuffer resolution and so Gstreamer would
> > be able to continue. Of course if the expected value doesn't match, it
> > wouldn't work, but it's the same as currently for Coda AFAICT.
> >
> >>
> >> I think it is OK to have REQBUFS sleep in this case. However, I would only
> >
> > Why REQBUFS? While that could possibly allow us to allocate the right
> > buffers, Gstreamer wouldn't be able to know the right format, because
> > it would query it before REQBUFS, wouldn't it?
>
> Oops, you are right. It's got to be in G_FMT(CAPTURE), but *only* if
> nobody subscribed to the SOURCE_CHANGE event.
>
> >
> > For this reason, s5p-mfc makes G_FMT(CAPTURE) blocking and if we
> > decide to forcefully keep the compatibility, even with in drivers, we
> > should probably do the same here.
> >
> >> enable this behavior if the application didn't subscribe to the SOURCE_CHANGE
> >> event. That's easy enough to check in the driver. And that means that if the
> >> application is well written, then the driver will behave in a completely
> >> standard way that the compliance test can check.
> >
> > I guess one could have some helpers for this. They would listen to the
> > source change events internally and block / wake-up appropriate ioctls
> > whenever necessary.
>
> I really do not want this for new drivers. gstreamer should be fixed.
> A blocking G_FMT is just plain bad. Only those drivers that do this, can
> still block if nobody subscribed to EVENT_SOURCE_CHANGE.

Yeah and that's why I just suggested to mimic coda, which doesn't
block, but apparently gstreamer still works with it.

>
> > Another question: If we intend this to be implemented in new drivers
> > too, should it be documented in the spec?
>
> We most certainly do NOT want to implement this in new drivers.
>

Makes sense.

When venus was merged initially, did it already have a blocking G_FMT?

Best regards,
Tomasz
