Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78ECB353984
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 21:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbhDDTit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 15:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhDDTir (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 15:38:47 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA49FC061756
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 12:38:40 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id j206so1899189ybj.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hEMNHDnnEQTjGv+UBbBULrhzzRLe2F12R53/17VXjb0=;
        b=B9GsalE02xtsa8Ddda3CbCRC3tgdul4XcIcP0nXJWPj6ZBEBCDqu6TFaV+hf29YHOb
         GjT2WxqKW+UhQWV0uCrOip2FEtH07IjCUjX/Uo0i5GGfaJbUhw/GjjdcTMKTW0NXLHid
         SC//VYMBgq8daR/x4TFSRd0OQeZn4p0G3Akp5f0BTH+vU73ZFqD+Jkj4E8og0Fuj6sNW
         QzYIPCK5WFQxcVuLUq1Qjgc589t6idc1f2vbEc0+7rcDJr2t2QzhcLAAjZ2no2j5WB3Q
         qLtHlvP1nMpCJ9ZYD13KOvtaSjd38CpnlFpXjkqSOaUayAp7F0EnDNodE4frOB0U4V6B
         1hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEMNHDnnEQTjGv+UBbBULrhzzRLe2F12R53/17VXjb0=;
        b=pA42WS/d3XnS36vEqzLZufUeVxn9bxUxUgGGOKE/MVP/XFFVDBtQUBTNMCwPeLZ2eK
         uGHufXthS9NGNhD9xUuHZVfJjvNE6r6zZ3ngFzRa0Lkx0nKHGHuNIng5beGeauMt+h/Q
         aoGNKYtHXzvbEZJ/lzVFMRv617YbJEi8uBvSWq/DTzSx7aSJJ/NKbYvakUvx2fd5JRUY
         85x5Vd36Ty/tp0y0MrwXykSspdXFMhYxIsag+nNK+e/WZAHTgRbLAzY5M8HhKoye3r4G
         9d6efQwPvt+6RaTHScAa8ts47AgKwCYrbTEhcgaH3TYDyYTZNwZlE/hPYY1vFJDRBmOs
         9vZg==
X-Gm-Message-State: AOAM531rDDfojIJg3ITf3KXxH5irnz8fp3KQpIaq0KPeEDEXr1V6tTwZ
        U2Vnbci0cZ7+cz5UEURpjaHOnWvzU4SqrNhK/+iQtA==
X-Google-Smtp-Source: ABdhPJz7yKjYPXOvq/L5w95hcEIYgnl6cI3gbVvEXDXBNHYxPbIEf9kUM+pwpFesgz3Y3w/9LOYMcbJNw+oWaRy7XJ4=
X-Received: by 2002:a25:686:: with SMTP id 128mr30849619ybg.258.1617565120199;
 Sun, 04 Apr 2021 12:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <1612945128-23174-1-git-send-email-amit.pundir@linaro.org> <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
In-Reply-To: <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 5 Apr 2021 01:08:04 +0530
Message-ID: <CAMi1Hd1zaqimVjy9-LyXduie3r1prnePC9fjVsHm8zJ07FdEWQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Angelo,

On Thu, 11 Feb 2021 at 00:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 10/02/21 09:18, Amit Pundir ha scritto:
> > From: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > Enabling the Display panel for beryllium requires DSI
> > labibb regulators and panel dts nodes to be added.
> > It is also required to keep some of the regulators as
> > always-on.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
>
> Hello!
> Your patch looks good, however, I have a few concerns...
>
> > +&ibb {
> > +     regulator-min-microvolt = <4600000>;
> > +     regulator-max-microvolt = <6000000>;
> > +};
> > +
>
> I think you want to also configure overvoltage and overcurrent
> protection values for both LAB and IBB, as these regulators may be a bit
> dangerous if used without.

It turned out I can't boot if I set regulator-max-microamp lab/ibb
values from downstream DT. Verified it a few times and same result.
Here is the decompiled downstream DTB for reference:
https://pastebin.ubuntu.com/p/4nPxzq6zf7/, just in case.

I'm not sure if over current protection value is tied to max-microamp,
but I added it anyway along with pull-down and soft-start properties
in next version of this patch.

Regards,
Amit Pundir

> Besides that, even if it wouldn't be that dangerous, since the
> protection features are present, it would be nice to configure them
> properly as in the rare event that something bad happens, you would be
> able to save the hardware (or at least have a chance to!).
>
> > +&lab {
> > +     regulator-min-microvolt = <4600000>;
> > +     regulator-max-microvolt = <6000000>;
> > +};
> > +
>
> Same here.
>
> Yours,
> -- Angelo
