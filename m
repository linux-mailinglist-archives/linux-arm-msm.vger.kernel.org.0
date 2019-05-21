Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801AF24B2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 11:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfEUJKB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 05:10:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33703 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbfEUJKB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 05:10:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id n17so28355699edb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PSdPOItR/QwQaJqAWDzyHjSOY0FhX0Q6RByw0iZfWqY=;
        b=LRgF3QOdZRfOdkdcevF4kHXKpLVf+DmgnDacDANvUI/gJ05zyHF+rFhWral3BX2t5a
         AJ+s8NZT0eJHefNlxPmxnDRpDW3x3YNDwEXIYtO228pxHr+jNhr45VMKgvEdUUF0YW8k
         t3rsUQityMohQJFpsxx9FCJ4P2P235mLpB1no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PSdPOItR/QwQaJqAWDzyHjSOY0FhX0Q6RByw0iZfWqY=;
        b=J2VT/VLcJC8+p8uvKpJTj0/niz7cjb0Az4K221HBBc4fAvL8b8iC7C2FWTNAZLN0w2
         fjFlq0Wnf0bR2bt5L3bg5BZigf+yc0/NTs5bDuWpjZWypVlU/vueI1Rwx/+Dh7uFh80Z
         y4pgnllV3yDHtebpjyuf0p7I0SN2NcLjpqQs/DN3SLQOQO/uYs0LjBjrHEVfjHDoOy5A
         cWyt5VOuAhR47ozuG14+eUIevaJOFkBFjICXlTlWDfjhegcxBZi7z6cslfDN2Fbm8yJk
         r9g+lYW13cwQKrFI1VuPs5d3x11silqMGHcBy9ALDdMUEfSYAM2qAkqXVFAWiWnfA4YP
         3qGg==
X-Gm-Message-State: APjAAAUAjD2a/qlmPU6cYvBj6uVAPfIZ3H0ZUvrH9q5njlwyxkoYWw3n
        i2rewalacH5jy5WKjb3BXD8MIXgde1h04cz4
X-Google-Smtp-Source: APXvYqxJIiHsoKTL8vq2lT1iB4JzbxlzWJ7AuusfW652KTs9pym00UPxJxPdqlmD8pQiAVkKSy3mUA==
X-Received: by 2002:a17:906:5f82:: with SMTP id a2mr28277984eju.297.1558429799356;
        Tue, 21 May 2019 02:09:59 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id v15sm3468267ejj.23.2019.05.21.02.09.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 02:09:58 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id s17so17679138wru.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 02:09:58 -0700 (PDT)
X-Received: by 2002:a5d:5048:: with SMTP id h8mr681332wrt.177.1558429797759;
 Tue, 21 May 2019 02:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org> <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org> <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
 <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
In-Reply-To: <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 May 2019 18:09:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
Message-ID: <CAAFQd5CNGsnqjpLsWSTf=8r+hSfyOgD8SU-tn5EbHCCuuSgH6A@mail.gmail.com>
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
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

Hi Stan,

On Mon, May 20, 2019 at 11:47 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Tomasz,
>
> On 4/24/19 3:39 PM, Tomasz Figa wrote:
> > On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> > <stanimir.varbanov@linaro.org> wrote:
> >>
> >> Hi Hans,
> >>
> >> On 2/15/19 3:44 PM, Hans Verkuil wrote:
> >>> Hi Stanimir,
> >>>
> >>> I never paid much attention to this patch series since others were busy
> >>> discussing it and I had a lot of other things on my plate, but then I heard
> >>> that this patch made G_FMT blocking.
> >>
> >> OK, another option could be to block REQBUF(CAPTURE) until event from hw
> >> is received that the stream is parsed and the resolution is correctly
> >> set by application. Just to note that I'd think to this like a temporal
> >> solution until gstreamer implements v4l events.
> >>
> >> Is that looks good to you?
> >
> > Hmm, I thought we concluded that gstreamer sets the width and height
> > in OUTPUT queue before querying the CAPTURE queue and so making the
> > driver calculate the CAPTURE format based on what's set on OUTPUT
> > would work fine. Did I miss something?
>
> Nobody is miss something.
>
> First some background about how Venus implements stateful codec API.
>
> The Venus firmware can generate two events "sufficient" and
> "insufficient" buffer requirements (this includes decoder output buffer
> size and internal/scratch buffer sizes). Presently I always set minimum
> possible decoder resolution no matter what the user said, and by that
> way I'm sure that "insufficient" event will always be triggered by the
> firmware (the other reason to take this path is because this is the
> least-common-divider for all supported Venus hw/fw versions thus common
> code in the driver). The reconfiguration (during codec Initialization
> sequence) is made from STREAMON(CAPTURE) context. Now, to make that
> re-configuration happen I need to wait for "insufficient" event from
> firmware in order to know the real coded resolution.
>
> In the case of gstreamer where v4l2_events support is missing I have to
> block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
> STREAMON(CAPTURE) (vb2::start_streaming).
>
> I tried to set the coded resolution to the firmware as-is it set by
> gstreamer but then I cannot receive the "sufficient" event for VP8 and
> VP9 codecs. So I return back to the solution with minimum resolution above.
>
> I'm open for suggestions.

I think you could still keep setting the minimum size and wait for the
"insufficient" event. At the same time, you could speculatively
advertise the expected "sufficient" size on the CAPTURE queue before
the hardware signals those. Even if you mispredict them, you'll get
the event, update the CAPTURE resolution and send the source change
event to the application, which would then give you the correct
buffers. Would that work for you?

Best regards,
Tomasz
