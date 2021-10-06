Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF27B42365B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 05:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhJFDvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 23:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhJFDvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 23:51:25 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338E6C061760
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 20:49:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j5so4473259lfg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 20:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6uSTYKI1iDVQ1/5MVV35eiuQr3oTGL96afJoVN7XpE=;
        b=XMP0oiRighob77xlb1PXIzbL2qu7sd7BzC0FticBn2Be9aA1nYfrnT70VCqohLdx3q
         vA8YhA0yyD5li8ZRYbhNQz+bdNWHdMYyMIk/y4Ha2x3vA3udI+GGWlrbxZsA8V1I10i1
         +QF/eMLISmlGltEdbr7NmJVTaVM6rHQWjAxJgTpetWPilWj8OFNsLi/Zcq240E8/V4Qh
         FRNjGIq5x8LN0FTLd2H8v1Q5jPAVjGnYoo+hpozvUPnpE50RwWjatQsa30Z7S5s2o/jI
         CNlW4Kha+zjkWTI/jp7b5/BBvFjjpVfJRGQ48r7KLmQhSADf9iuCcnB03Pjt5t5/Grtx
         a2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6uSTYKI1iDVQ1/5MVV35eiuQr3oTGL96afJoVN7XpE=;
        b=KJaUzmBmWsKYA00ub5se6krVdcIpzpkBS2AP980a5lzwLRxPvyOByUvFnW16d9ie5Y
         ooNfM5irLPwn+jLl3o0h+7KSofUK3PXKQBIUSuEHVuIqej0MF6qURE9S4/lyHAm1Wrcp
         W1EUld3eJUgRTktxJe7VQRB4fNfruEEuGbs4ppmq6B1xAggtxM/02+JESDL9znYndKNE
         HCoYQH31Uw0mlUPp/f/6AyuYqshX0M687iZrnhDZTL9iC3+1uEX6lu8RXaIMNww8QUha
         ZgCoQs40ReTEJUP2P1dCfU5d2av6bXJ+Jo6yKDSnLeKNjJJHJen2tOkqiRgK1BzqfQ/C
         Th8g==
X-Gm-Message-State: AOAM530uATK3WuEGgGz8T3iNaoHvMPKWRdExZOLqZnNT4sgpb9yo6kYE
        HoilaPq7uk+OVjQImgJQ3LGXdyUHJnG03xiX4uIx7g==
X-Google-Smtp-Source: ABdhPJya/cHmu4jYQmBnP1nXJTIFK74KW21Myh3oIz3kpdEwg32cUPpqXnXVmYd4H6feMiKWwtLp8SDERd4E6oJYIJg=
X-Received: by 2002:a2e:5442:: with SMTP id y2mr26848306ljd.436.1633492159155;
 Tue, 05 Oct 2021 20:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org> <4a508fc1-6253-9c11-67fb-f84f17fd2719@kali.org>
In-Reply-To: <4a508fc1-6253-9c11-67fb-f84f17fd2719@kali.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 6 Oct 2021 06:49:08 +0300
Message-ID: <CAA8EJprsfzFWP1KH61UEkjJmY8rDFTN5i_53Mc0e9n3oxJsBNA@mail.gmail.com>
Subject: Re: [RFC v2 00/13] create power sequencing subsystem
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        ath10k@lists.infradead.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steev,

On Tue, 14 Sept 2021 at 02:39, Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 8/29/21 8:12 AM, Dmitry Baryshkov wrote:
> > This is the second RFC on the proposed power sequencer subsystem. This
> > is a generification of the MMC pwrseq code. The subsystem tries to
> > abstract the idea of complex power-up/power-down/reset of the devices.
> >
> > To ease migration to pwrseq and to provide compatibility with older
> > device trees, while keeping drivers simple, this iteration of RFC
> > introduces pwrseq fallback support: pwrseq driver can register fallback
> > providers. If another device driver requests pwrseq instance and none
> > was declared, the pwrseq fallback code would go through the list of
> > fallback providers and if the match is found, driver would return a
> > crafted pwrseq instance. For now this mechanism is limited to the OF
> > device matching, but it can be extended further to use any combination
> > of device IDs.
> >
> > The primary set of devices that promted me to create this patchset is
> > the Qualcomm BT+WiFi family of chips. They reside on serial+platform or
> > serial + SDIO interfaces (older generations) or on serial+PCIe (newer
> > generations).  They require a set of external voltage regulators to be
> > powered on and (some of them) have separate WiFi and Bluetooth enable
> > GPIOs.
> >
> > This patchset being an RFC tries to demonstrate the approach, design and
> > usage of the pwrseq subsystem. Following issues are present in the RFC
> > at this moment but will be fixed later if the overall approach would be
> > viewed as acceptable:
> >
> >  - No documentation
> >    While the code tries to be self-documenting proper documentation
> >    would be required.
> >
> >  - Minimal device tree bindings changes
> >    There are no proper updates for the DT bindings (thus neither Rob
> >    Herring nor devicetree are included in the To/Cc lists). The dt
> >    schema changes would be a part of v1.
> >
> >  - Lack of proper PCIe integration
> >    At this moment support for PCIe is hacked up to be able to test the
> >    PCIe part of qca6390. Proper PCIe support would require automatically
> >    powering up the devices before the bus scan depending on the proper
> >    device structure in the device tree.
> >
> > Changes since RFC v1:
> >  - Provider pwrseq fallback support
> >  - Implement fallback support in pwrseq_qca.
> >  - Mmove susclk handling to pwrseq_qca.
> >  - Significantly simplify hci_qca.c changes, by dropping all legacy
> >    code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
> >    parts of the chip.
> >
> I tested this here, on the Lenovo Yoga C630, after creating a patch to
> do basically the same thing as the db845c does.  One thing I noticed, if
> PWRSEQ=y and the rest are =m, there is a build error.  I suppose once
> the full set is posted and not RFC, I can send the patch for that.

Please excuse me for the delay in the response. I was carried away by
other duties. Yes, could you please provide a fixup patch.
I'm going to send v1 now, containing mostly cosmetical and
documentation changes. I'll include your patch in v2.

> One question I have, if you don't mind, in patch 11, you add a second
> channel to qca power sequencer.  I've added that here, but in the c630's
> dts, "vreg_l23a_3p3: ldo23" is empty, so I added the same numbers in for
> the regulator, and I'm wondering how to test that it's actually working
> correctly?

That's a good question. I have not looked in the details in the ath10k
documentation. I'll try finding it.
Maybe Kalle Valo can answer your question. Could you please duplicate
your question on the ath10k mailing list?

-- 
With best wishes
Dmitry
