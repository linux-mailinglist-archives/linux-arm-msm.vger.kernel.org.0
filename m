Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD6FC42460A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 20:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbhJFS2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 14:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhJFS2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 14:28:15 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3676C061746;
        Wed,  6 Oct 2021 11:26:22 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id x12so3476962qkf.9;
        Wed, 06 Oct 2021 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MW5tHpMjCfEp2ujWAs5HwJDY4QO3gYqom+zIppRuqpk=;
        b=Qc6hmZMtR7hj7SMkVwT3Qp9i91IzcDo8nkb8LT1TUO9Z9h35Xn25e+VUXjOrRAr62H
         ebRrgIXcE+yfW6HdsGVBDF+DkmtYWJTtWzq6I0v3GQ7honc7LA9gZzUZnYftECbtmTsh
         aIp7UrBYbBM2++qmIu78d8pph3C5QX7mac5/Q4RkLWsMTzwVANyFhVEJcF84tcDHOtBu
         livJ7yU3agWK2L/cSli2EIfxpGV/XrLq7nVv/wLPfyqNGKxRep2+g3MZbKWbzDmrd5Hr
         3rUAohixBxdzX7WCbbyVpjfYNNPKFKnKfF08EjeJIdkHQBV8QR2OUf8PAqolkwPwJBYV
         LWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MW5tHpMjCfEp2ujWAs5HwJDY4QO3gYqom+zIppRuqpk=;
        b=fPvCcJ8hL1wq3F5ZgivMqyHQSUWgfukNJaB3fr7dz1Q68c0zlM6fYLnfRcZ6+TL/Tx
         eWZauykmkftYjjWAKwBwEwbvu5Fipoxj01Ktbp5+AMLrNMmt0C4Py7R0i5gvm+zpfdht
         G9EsA3FOd1WfN7FeS42f6A09BBDAYnbholHPlC74bT4qsiI5BdHNuv0ohQ4bqgrnpO+P
         CkXbvaKHH8UiLcIdGBPIMXL0oE/SY8zJgtRYL05MG6oy3DH1yoNuYUEH8NmPxtuTfo38
         QeD2LnythzTvNOKJcqwPWzO91kG3y2EKHVJX3bUNlHiFI6IxpJFg6yZBUPsR83vajH0k
         E0cQ==
X-Gm-Message-State: AOAM531aYQwq0C2A3W91nh7qfbjOBs179hovlTNmyXl7xNCH/nFESTZH
        gf9nbUoFXqMkcOeEKNtghD2WAza4aOV9i9qzLL8=
X-Google-Smtp-Source: ABdhPJzLcLJsxRSBGw+zSWXGMASZJrbr2DfMYmSywwZ8SZRVzhbbVnYAZtC3YPyNrHooddEvk2Gk1UeKldkZnL/sTQ8=
X-Received: by 2002:a37:af02:: with SMTP id y2mr209498qke.33.1633544781895;
 Wed, 06 Oct 2021 11:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210902214708.1776690-1-robimarko@gmail.com> <YUf3aKn78+41Cb/G@builder.lan>
 <CAOX2RU5b46H7nqm6G4mHLSqEhGiWktwWjUKF5w10Ut+AdKea-A@mail.gmail.com>
 <632a7d28c23a8497d35ea009bfe89883@codeaurora.org> <CAOX2RU5+jeXiqz8oss8Sd-BWa059uAv5xu=7nx_YF4RYpG2S6w@mail.gmail.com>
 <YUurqDL/S15RziCQ@builder.lan> <20211006182419.GC33862@thinkpad>
In-Reply-To: <20211006182419.GC33862@thinkpad>
From:   Robert Marko <robimarko@gmail.com>
Date:   Wed, 6 Oct 2021 20:26:10 +0200
Message-ID: <CAOX2RU43D72yx1Kyb0jRMMOLgBd1OMscWLH-dEdp0P=L-5quHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq8074: add SMEM support
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Oct 2021 at 20:24, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Sep 22, 2021 at 05:18:16PM -0500, Bjorn Andersson wrote:
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
> >
>
> Sorry, missed this earlier. I did face the probe deferral issue before and
> submitted a small series for fixing that:
>
> https://lore.kernel.org/linux-mtd/20210302132757.225395-1-manivannan.sadhasivam@linaro.org/
>
> These 2 patches are in mainline now. Robert, can you make sure that you have
> these 2 patches in your tree?

Hi Mani,
Yes, I have those patches as I am running this on top of 5.15-rc4 currently.

Regards,
Robert
>
> Thanks,
> Mani
>
> > Thanks,
> > Bjorn
