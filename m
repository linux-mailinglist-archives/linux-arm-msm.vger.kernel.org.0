Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083664A545B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 02:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbiBABBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 20:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiBABBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 20:01:15 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFC7C061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 17:01:15 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id q11so4802944ild.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 17:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SlA+CRxN1+l3Q6yf6tu5cYnYlmBs1/fByPS12U2oI0k=;
        b=fo/VVwycn1Uqn6OK+5mbn/4uxSczpI91VNZPf/j2vArqlSDljsgEI1EHHuyfyjSt/s
         S6vfcVpHHnEWCAeJf91hsMXp3U2kbHwBdlt8f65Kyb+ggvAbeNoCRxDxhxzEB7JLJH4L
         qeoRVkH3OOnE/wXc4ErYDPQnrrubvAd1YRU8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SlA+CRxN1+l3Q6yf6tu5cYnYlmBs1/fByPS12U2oI0k=;
        b=AS2rX+5Ld2VCKdbn6isGjjzXOWUK8/0kJXOc94QQWFsEpxYGYnYc7QB0Gt9O2qZY+s
         2uGrdw08PdB1c/gXzJ3a9kIWlSgEgQ4kprGqdCy9CI8U9OJsSHrsLagYMaupOgZp+Mas
         MCuo44DyeQqLhJDL6JGLytEYPrNw6QcZ4MuJX5lH+RC2/gAm6xVUfoTzdK7YbaJWXLar
         8Mi9PJ+czzFaNa/qKMDTcWr54w3OhN/2+kVasycPvrRIxgL3dMnT5moxEmVft97L504y
         JsPl7ozfUuBaTB5QuINRVOF32kB409Ww+CF4b8XBlFHHFa9JXJC1A/R3HkjAn983h7Pw
         eXpg==
X-Gm-Message-State: AOAM531AvYPXANeD6TTumkxpaEw0HQtoz1S6nYO3AhldZ8LMKt1h2MWB
        5kD6P9hM3W3ChIs4iktFTe4rKBy7PPwbQw==
X-Google-Smtp-Source: ABdhPJwV+9Cpyres0NARehqkMtVmEcun7rG3y3PRk9fWqB4FEWqQS3FEM7QAXh/sQ9nN9W6EIWBvfQ==
X-Received: by 2002:a92:c569:: with SMTP id b9mr13258419ilj.140.1643677275171;
        Mon, 31 Jan 2022 17:01:15 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id k13sm18769771ili.22.2022.01.31.17.01.14
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 17:01:14 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id 9so19314759iou.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 17:01:14 -0800 (PST)
X-Received: by 2002:a05:6602:140c:: with SMTP id t12mr12178540iov.177.1643677273820;
 Mon, 31 Jan 2022 17:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20220125224422.544381-1-dianders@chromium.org>
 <20220125144316.v2.5.I5604b7af908e8bbe709ac037a6a8a6ba8a2bfa94@changeid>
 <CAE-0n528Bxdj+DKhi2Lan4qR_=4KHD7A1Zkr15tmu+MchryJ1A@mail.gmail.com>
 <CAD=FV=UcpKaLQ31CGKUnaNnZcYnM4N_t8VC43FPGktoYDiMfsw@mail.gmail.com>
 <YfC5i2jR5N+pmHoZ@ripper> <CAE-0n50sX9-0MxcpF+3Rwqm75jSw5=aNwdsitLwE2sEA69jLJw@mail.gmail.com>
 <YfgRS/UtRn6Ewwhj@builder.lan> <CAD=FV=V=pbmP-wKhAOVRBC0M=YjYm3Ym-022g8uBEZOxKW-8BQ@mail.gmail.com>
In-Reply-To: <CAD=FV=V=pbmP-wKhAOVRBC0M=YjYm3Ym-022g8uBEZOxKW-8BQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 31 Jan 2022 17:01:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQ0gR18x9rhioLtYGO3oWtny1c52YaiZHUG=PG03d+OQ@mail.gmail.com>
Message-ID: <CAD=FV=WQ0gR18x9rhioLtYGO3oWtny1c52YaiZHUG=PG03d+OQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc7280: Add herobrine-r1
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        kgodara@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        quic_rjendra@quicinc.com, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 31, 2022 at 8:50 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > Either we leave it as is - which follows my interpretation of what the DT
> > spec says - or we (and the DT maitainers) agree that it shouldn't be
> > there (because this dtb won't run on any random qcom,sc7180 anyways) at
> > all.
>
> I'm curious what part of the DT spec says that we should have the SoC
> in there? I know I've always done it, but it's always just been
> following the examples of what was done before. When talking about the
> root node, I see this in the `devicetree-specification-v0.4-rc1` spec:
>
> ---
>
> Specifies a list of platform architectures with which this platform is
> compatible. This property can be used by operating systems in
> selecting platform specific code. The recommended form of the property
> value is: "manufacturer,model"
>
> For example:
> compatible = "fsl,mpc8572ds"
>
> ---
>
> That doesn't say anything about putting the SoC there.
>
>
> I would also note that I'd be at least moderately inclined to land
> things as-is and deal with this in a follow-up patch, though I'm happy
> to spin if that's what people agree upon too. This is not a new
> problem and so it doesn't seem like it makes sense to glom dealing
> with it into this patch series...

I noticed that you applied the first 4 patches in the series (thanks!)
but not this one. Are we waiting to get agreement on this before
landing? As per above, I think it'd be OK to land as-is and then I'm
happy to do a follow-up patch to clean this up since this isn't a new
issue. Having this patch outstanding makes it a little confusing with
the other cleanup patches that I'm posting... ;-)

Thanks!

-Doug
