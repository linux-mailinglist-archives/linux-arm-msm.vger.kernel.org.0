Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738DC14F06A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 17:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729292AbgAaQI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 11:08:27 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46116 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbgAaQI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 11:08:27 -0500
Received: by mail-vs1-f67.google.com with SMTP id t12so4642884vso.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
        b=cCCXrbR60CBlDAGSpmvFYrjjyE1DVVDlZhNhjXqkIlKpR2BcoPRCHGrUSSTCDfRqDk
         72D2LUsRS4KoF3mrsLr5JyigXGZ9EsF0j5WPA+OZLvWstHHFS/ADUWF2H+JRsfTpY1YT
         ZYDGjjQ7IrKGRYG64lWiFl0zCmZnBnqC4m0/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
        b=o4X/lVxj3p++ifs13cpMnSPLNCn2CEmGM38VYuThH9j7qTwBn35l+MGoWS5tYJvsuV
         sFoA7ZPc++3Z0+QFjw+5xRFtQ3b00bKy3zaIMd3I2UnGgSt6nneaG9gTotLbcP0gwBpK
         PxOZLVOMuSrDVYZbo0iz/Rd5BE1Ul+MhfwRnUXK1p8ueYv0nlUAe8tGuaCkPLmj2DNP5
         05hGJg0hd2eHYZDHocjDUlt9lHr2tI+HrWVs2lELkIc6V4+1W63Vb2eq/glhZ7RVPE4M
         tjJSeV44PepZw5l2XKxrBXzWqpyyv7h0xCUgpWWH/HRnAIuvdZHzQDhmKzUQIKAPBkwj
         3LHg==
X-Gm-Message-State: APjAAAUmsFW91P9MYde2q4/f3pl6UjaM5B23/Bs/m5A320hekPouocIB
        d1paLHpkDn8JUMkpmWSu9bwHdK3UdGY=
X-Google-Smtp-Source: APXvYqybqHmu8DC0/05okoHjRwLoE5oamguIZTPvuJaY6oxWLtMZTpclCimF9+LLNqq3cNcGDPt3wA==
X-Received: by 2002:a67:f315:: with SMTP id p21mr7659325vsf.39.1580486905797;
        Fri, 31 Jan 2020 08:08:25 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id f22sm2393359vso.8.2020.01.31.08.08.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 08:08:24 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id w4so600468vkd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 08:08:24 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr6709266vke.40.1580486903706;
 Fri, 31 Jan 2020 08:08:23 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com> <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
In-Reply-To: <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 Jan 2020 08:08:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
>
> >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> >> 0 0x10000>,
> >> +                               <0 0x0b490000 0 0x10000>;
> >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> >> +                       interrupts = <GIC_SPI 304
> >> IRQ_TYPE_LEVEL_HIGH>,
> >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-names = "hfi", "gmu";
> >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> >> +                              <&gpucc GPU_CC_CXO_CLK>,
> >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> >> +                       power-domains = <&gpucc CX_GDSC>;
> >
> > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > different?  Bindings also claim that you should be providing
> > power-domain-names.
> No this is still needed, We need the GX power domain for GPU recovery
> use cases where the shutdown was not successful.

This almost sounds as if the bindings should mark the GX power domain
as optional?  The driver can function without it but doesn't get all
the features?  As the binding is written right now I think it is
"invalid" to not specify a a GX power domain and once the yaml
conversion is done then it will even be flagged as an error.  That's
going to make it harder to land the your patch...

> I am working the Taniya
> to get the dependencies sorted out to bring this change in. This should
> be
> okay for the time being.

What breaks today if you add in the GX power domain here?

Oh, I see.  It's not even provided by the 'gpucc-sc7180.c' file.  What
happens if you do this for now:

  power-domains = <&gpucc CX_GDSC>, <0>;
  power-domain-names = "cx", "gx";

That seems to be the trendy thing to do if a phandle to something is
"required" but the code isn't ready for it.

-Doug
