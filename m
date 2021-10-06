Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86184245CF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 20:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238724AbhJFSPu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 14:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238617AbhJFSPu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 14:15:50 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C667C061746;
        Wed,  6 Oct 2021 11:13:58 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id q125so3407719qkd.12;
        Wed, 06 Oct 2021 11:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NOaBOPz8i+O7Nvu+1OdYIiTsjTnPZXXG1aRRHwVWaes=;
        b=AgjTndlLCPgcYsrpRYD01HzjWeYISmjdonw8Hnid1YISZRLheKFJZ2mxa//j1BjvL/
         Swd5lnkpWVERG3I0a6LEN/Io8vmKgpVm9IAePb0dyq3pvBx4z1hr/629t+yO/wAuWxS1
         zabvxfyYugMxQgfkShs7Jll60gD4dGkxGJ67su/LN3334v+0TlfALAF37arbt87EIy+2
         jWuZBpbWnpDrW1MCs1himRanPTcCuRkM5xyvbPV8Yu59L8BBJIVXFtsfX8RCl9WVyYoi
         B1x43Voo2TwkmbszVoq8HyWp8jvrfnFlV+nipOGSRfkW2saoRG3I+jEs61S5hTFGrxAh
         c/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NOaBOPz8i+O7Nvu+1OdYIiTsjTnPZXXG1aRRHwVWaes=;
        b=m+9+ykcduevLCTwuadypJAN/kZeLAHsjk3nZ+6If9vAbY+03CZTLjRvIDyLHHpTKj8
         enGsIS0KXvnFOUM0hBwRWZLqR9TiMWITbfHcnGm4O9E74D+q2IB4e+eng4++J4kFgAXw
         yRKNY2X/3vmkyMQm2cpn4o+v4EYGf8WpeeieQj5Dimsw96Qxc/ZErpq9Cph2QJdrPjtF
         OmCNo5Z1mJv6yExtXAIl0a5zH32bhhVQX4MF8xOHQ0vIQ3ZmseU8Gfs5aU0qsh6acR0k
         VFsD4SR2gqQoyB00S/LbhhzP2ycvSCyd+cCWbAzXOGON//LxUD8y6ecJUzASRE+h9OB6
         aAfg==
X-Gm-Message-State: AOAM531n0ZdOMjQjv4V8bK0Knf4u3ZDInoAIktD9pJbT2rAQLUfSjikU
        Q9w6Zr8Mx5ARNmlZGPJHVLRsXaYbpRwPH3fvPRXgQ76WpOI=
X-Google-Smtp-Source: ABdhPJzQza8MCc+CRIQ6rCIZKgcp6jeSnmLreX3UGSR7Uf5P4Kjs7LFrxyPTyRMDJV77X3e3ggDHM7g1lvjWGSTHg7A=
X-Received: by 2002:a37:af02:: with SMTP id y2mr154191qke.33.1633544037137;
 Wed, 06 Oct 2021 11:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210902214708.1776690-1-robimarko@gmail.com> <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
 <632a7d28c23a8497d35ea009bfe89883@codeaurora.org> <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
 <YUurqDL/S15RziCQ@builder.lan> <CAOX2RU7094=BODK+dBCjFmQmgh45RBUusSFJVLThK9DaU=esxA@mail.gmail.com>
In-Reply-To: <CAOX2RU7094=BODK+dBCjFmQmgh45RBUusSFJVLThK9DaU=esxA@mail.gmail.com>
From:   Robert Marko <robimarko@gmail.com>
Date:   Wed, 6 Oct 2021 20:13:46 +0200
Message-ID: <CAOX2RU7DgwUDSYWtkP5+wJctxYWtXqGnSXzhZbnsFbcZiqYjmQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Oct 2021 at 20:05, Robert Marko <robimarko@gmail.com> wrote:
>
> On Thu, 23 Sept 2021 at 00:18, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 22 Sep 15:23 CDT 2021, Robert Marko wrote:
> >
> > > On Tue, 21 Sept 2021 at 08:24, Kathiravan T <kathirav@codeaurora.org> wrote:
> > > >
> > > > On 2021-09-20 14:55, Robert Marko wrote:
> > > > > On Mon, 20 Sept 2021 at 04:52, Bjorn Andersson
> > > > > <bjorn.andersson@linaro.org> wrote:
> > > > >>
> > > > >> On Thu 02 Sep 16:47 CDT 2021, Robert Marko wrote:
> > > > >>
> > > > >> > IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> > > > >> > supported by the kernel add the required DT nodes.
> > > > >> >
> > > > >> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > > > >>
> > > > >> Thanks for your patch Robert.
> > > > >>
> > > > >> > ---
> > > > >> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 28 +++++++++++++++++++++++++++
> > > > >> >  1 file changed, 28 insertions(+)
> > > > >> >
> > > > >> > diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > > > >> > index a620ac0d0b19..83e9243046aa 100644
> > > > >> > --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > > > >> > +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> > > > >> > @@ -82,6 +82,29 @@ scm {
> > > > >> >               };
> > > > >> >       };
> > > > >> >
> > > > >> > +     reserved-memory {
> > > > >> > +             #address-cells = <2>;
> > > > >> > +             #size-cells = <2>;
> > > > >> > +             ranges;
> > > > >> > +
> > > > >> > +             smem_region: memory@4ab00000 {
> > > > >> > +                     no-map;
> > > > >> > +                     reg = <0x0 0x4ab00000 0x0 0x00100000>;
> > > > >> > +             };
> > > > >> > +     };
> > > > >> > +
> > > > >> > +     tcsr_mutex: hwlock {
> > > > >> > +             compatible = "qcom,tcsr-mutex";
> > > > >> > +             syscon = <&tcsr_mutex_regs 0 0x80>;
> > > > >>
> > > > >> Since it's not okay to have a lone "syscon" and I didn't think it was
> > > > >> worth coming up with a binding for the TCSR mutex "syscon" I rewrote
> > > > >> the
> > > > >> binding a while back. As such qcom,tcsr-mutex should now live in /soc
> > > > >> directly.
> > > > >>
> > > > >> So can you please respin accordingly?
> > > > >
> > > > > Sure, can you just confirm that the:
> > > > > reg = <0x01905000 0x8000>;
> > > > >
> > > > > Is the whole TCSR range as I don't have docs?
> > > >
> > > > Robert,
> > > >
> > > > TCSR_MUTEX block starts from 0x01905000 and has size 0x20000 (128KB)
> > >
> > > Thanks, Kathiravan,
> > > TSCR mutex with MMIO reg under it works, but there is some weird probe
> > > ordering issue.
> > >
> > > For whatever reason, SMEM will get probed only after MTD does and this
> > > will cause issues
> > > if SMEM parser is used as it will return -EPROBE_DEFER but the MTD
> > > core does not really
> > > handle it correctly and causes the device to reboot after failed parsing.
> > >
> > > Now, I have no idea why does this variant which uses MMIO regmap probe
> > > so much later?
> > >
> >
> > Mani, do you have any input related to the probe deferral of the SMEM
> > partition parser, because SMEM not yet probed?
>
> I did some more digging as it made no sense to me and it looks like it
> gets to driver_deferred_probe_add()
> but then gets stuck in the mutex_lock() after which it resets the
> board without any kind of error.
> I can see that it gets to this mutex_lock():
> https://elixir.bootlin.com/linux/v5.15-rc4/source/drivers/base/dd.c#L136

Scratch that, it was a printing issue I can see the SMEM and NAND drivers
being added to the probe deferral list but it resets after the NAND
driver gets added.
Only if it would print a trace and not just reset.

Regards,
Robert
>
> So, this is some weird bug unrelated to the SMEM itself, but it's an
> annoying one as it resets the board.
> I am now kind of stuck debugging it further, this is beyond my capabilities.
>
> Regards,
> Robert
>
> >
> > Thanks,
> > Bjorn
