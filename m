Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53551D014D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 23:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731458AbgELVwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 17:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728362AbgELVwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 17:52:46 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506A9C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 14:52:46 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s21so4233893ejd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 14:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O4BzKmbylApLOnSfM+nrMM/hyiWATtFOUiCO5CA/gu0=;
        b=ljrhK9vmMiB0J9pD6t7tqOjjHCdSW3dr7hP1cpXTCuBWDRZRpkmEp85wHm1bXY44ig
         /eTWFU49Nflfz/1Kt1G0ZHW0K+UJhb+4O6qy1Neyh2qB1JI8KDMgBjsYwSlF/Yfqqbmn
         6TgRZr1cY1FCEvn7RAsMYy8WuajMPnO6rMrYrus6Yz30SCK+aWBx2a/1ZZ59ucJX3vPH
         xoBJoiCEnFVRKSBSCOdoFe11n7NQgWG/BOGcmrIuJ/e8z5sr8lv45nH3vsHJatlIsvr1
         18dmbsOeNH2WaBxvqW8hAHaOh0VGCsLpTy+N+Fn1JvMHeAHOWYhw9ZIXDLXDe+w9fdLf
         QveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O4BzKmbylApLOnSfM+nrMM/hyiWATtFOUiCO5CA/gu0=;
        b=Z657N68xjsWiPJ+2oyUlXiB6lBhf2O1mTyfA2QbUpSmXcKiGa14v49cJ8EZS9bHLBT
         /3YpVqV/MFqpA3WkcE36wDlMjL1TykgJ3a4jp5s1erWbkLDnsRQulqUJhqo7IWg+E38f
         JQHvdjVetfhAv1897MGUOnEp443VBnfu388dsFMlSGPSMLaF/Z65djWWtVyjaBAQTCEj
         P3xHxRBSy15iG1nZN1hc5sHyyJOM6Oz7nY4WqhuedINxBK17ugFnnqaFMd9Ea/1/rkb8
         jRVqMbfOFFM/f6ZXIG/A8TEvDTSUdZbTd9htKyeGq2eCJd8/ohSBLa61nim0vawBgsJc
         OfDw==
X-Gm-Message-State: AGi0PuYRV2RdEBa/6ReHMLGpD+x3tly6F5f8edQGWQUYHTCvxSw+tmCd
        hBaHF64H/oWZq4lH2qKjfPsrwCxwCe1t6smbU114uA==
X-Google-Smtp-Source: APiQypJCjSCLEyKfEKlONxcMlHZcGz28WztE5xYmTNh0QIAfnsOsvc9WLfBK7oWIijxNpnp0UsHxz930cSxlkb5wr1g=
X-Received: by 2002:a17:906:5918:: with SMTP id h24mr17682027ejq.210.1589320364653;
 Tue, 12 May 2020 14:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com> <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com> <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
 <5b0f5d77c4eec22d8048bb0ffa078345@codeaurora.org> <759d47de-2101-39cf-2f1c-cfefebebd548@arm.com>
 <7d343e96cf0701d91152fd14c2fdec42@codeaurora.org> <CAJ9a7VgEiX19ukjwakNHBHDeZJ05f5Z7pAYG9iEnpXCuuDfBqg@mail.gmail.com>
 <a4bba03d41a2b0145b3c6c19d48698eb@codeaurora.org> <CAJ9a7Vj4eyv1n=RxuqfV=pdBN3SDG+ShYS5J4s40KJtqOnR7vw@mail.gmail.com>
 <ae0fe2050be01cc1403c7d53a0da8cb8@codeaurora.org> <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org>
 <eee1b9a90266eed9a9c75401f0679777@codeaurora.org> <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com>
 <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org> <37b3749e-2363-0877-c318-9c334a5d1881@arm.com>
 <d47271ee6a2a6f0f30da7e140b6f196c@codeaurora.org> <CAJ9a7Vg95tcgMXgQKLAZc=TpV6FnPZ7wdF=Kwbuy7d2kRCjYQw@mail.gmail.com>
 <364049a30dc9d242ec611bf27a16a6c9@codeaurora.org>
In-Reply-To: <364049a30dc9d242ec611bf27a16a6c9@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 12 May 2020 22:52:33 +0100
Message-ID: <CAJ9a7VjAoUmMG9pLEzE_rMSpOjwVOi-ZCinF87n9H0JgfMDsiQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple connections
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI Sai,

On Tue, 12 May 2020 at 18:46, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mike,
>
> On 2020-05-12 17:19, Mike Leach wrote:
> [...]
>
> >> >>
> >> >> Sorry for hurrying up and sending the patch -
> >> >> https://lore.kernel.org/patchwork/patch/1239923/.
> >> >> I will send v2 based on further feedbacks here or there.
> >> >>
> >> >>>
> >> >>> 1) does this replicator part have a unique ID that differs from the
> >> >>> standard ARM designed replicators?
> >> >>> If so perhaps link the modification into this. (even if the part no
> >> >>> in
> >> >>> PIDR0/1 is the same the UCI should be different for a different
> >> >>> implementation)
> >> >>>
> > I have reviewed the replicator driver, and compared to all the other CS
> > drivers.
> > This driver appears to be the only one that sets hardware values in
> > probe() and expects them to remain in place on enable, and uses that
> > state for programming decisions later, despite telling the PM
> > infrastructure that it is clear to suspend the device.
> >
> > Now we have a system where the replicator hardware is behaving
> > differently under the driver, but is it behaving unreasonably?
>
> Thanks for taking your time to review this. For new replicator behaving
> unreasonably, I think the assumption that the context is not lost on
> disabling clock is flawed since its implementation defined. Is such
> assumption documented in any TRM?
>

Looking at the AMBA driver there is a comment there that AMBA does not
lose state when clocks are removed. This is consistent with the AMBA
protocol spec which states that AMBA slaves can only be accessed /
read / write on various strobe signals,  or state reset on PRESET
signal, all timed by the rising edge of the bus clock. state changes
are not permitted on clock events alone. Given this static nature of
AMBA slaves then removing the clock should not have any effect.

The AMBA driver only /drivers/amba/bus.c  gives permission to
remove/restore the clocks from the devices (pm_suspend pm_resume
callbacks) - this reduces the power consumption of these devices if
the clock is not running, but state must be retained.

> >> >>
> >> >> pid=0x2bb909 for both replicators. So part number is same.
> >> >> UCI will be different for different implementation(QCOM maybe
> >> >> different from ARM),
> >> >> but will it be different for different replicators under the same
> >> >> impl(i.e., on QCOM).
> >> >
> >> > May be use PIDR4.DES_2 to match the Implementor and apply the work
> >> > around for all QCOM replicators ?
> >> >
> >> > To me that sounds the best option.
> >> >
> >>
> >
> > I agree, if it can be established that the register values that make
> > up UCI (pid0-4, devarch, devtype, PID:CLASS==0x9), can correctly
> > identify the parts then a flag can be set in the probe() function and
> > acted on during the enable() function.
> >
>
> So here I have a doubt as to why we need to use UCI because PID =
> 0x2bb909
> and CID = 0xb105900d are same for both replicators, so UCI won't
> identify the
> different replicators(in same implementation i.e., on QCOM) here.
> Am I missing something?
>
> Thats why I think Suzuki suggested to use PIDR4_DES2 and check for QCOM
> impl
> and add a workaround for all replicators, something like below: (will
> need cleaning)
>
> #define PIDR4_DES2      0xFD0
>
> if (FIELD_GET(GENMASK(3, 0), readl_relaxed(drvdata->base + PIDR4_DES2))
> == 0x4)
>         id0val = id1val = 0xff;
>

Please look at the CoreSight components specification 3.0 (ARM IHI
0029E) Section B2.1.2 which describes the Unique Component Identifier
(UCI).
As mentioned above this consists of a combination of bits from
multiple registers, including PIDR4.

> ... and the rest as you suggested.
>
> >
> > This was a design decision made by the original driver writer. A
> > normal AMBA device should not lose context due to clock removal (see
> > drivers/amba/bus.c), so resetting in probe means this operation is
> > done only once, rather than add overhead in the enable() function,and
> > later decisions can be made according to the state of the registers
> > set.
> >
> > As you have pointed out, for this replicator implementation  the
> > context is unfortunately not retained when clocks are removed - so an
> > alternative method is required.
> >
> > perhaps something like:-
> >
> > probe()
> > ...
> > if (match_id_non_persistent_state_regs(ID))
> >     drvdata->check_filter_val_on_enable;
> > ....
> >
> > and a re-write of enable:-
> >
> > enable()
> > ...
> > CS_UNLOCK()
> > id0val = read(IDFILTER0);
> > id1val = read(IDFILTER1);
> >
> > /* some replicator designs lose context when AMBA clocks are removed -
> > check for this */
> > if (drvdata->check_filter_val_on_enable && (id0val == id1val == 0x0))
> >    id0val = id1val = 0xff;
> >
> > if(id0xal == id1val == 0xff)
> >    rc =  claim_device()
> >
> > if (!rc)
> >    switch (outport)
> >       case 0: id0val  = 0x0; break
> >       case 1: id1va; = 0x0; break;
> >      default: rc = -EINVAL;
> >
> > if (!rc)
> >    write(id0val);
> >    write(id1val);
> > CS_LOCK()
> > return rc;
> > ....
> >
>
> Thanks for this detailed idea for workaround. I will add this once we
> know whether we need to use UCI or PIDR4_DES2.
>
> > Given that the access to the enable() function is predicated on a
> > reference count per active port, there is also a case for dropping the
> > check_filter_val_on_enable flag completely - once one port is active,
> > then the device will remain enabled until both ports are inactive.
> > This still allows for future development of selective filtering per
> > port.
> >
> > One other point here - there is a case as I mentioned above for moving
> > to a stored value model for the driver - as this is the only coresight
> > driver that appears to set state in the probe() function rather than
> > write all on enable.
> > This however would necessitate a more comprehensive re-write.
> >
>
> I would defer this to experts as you or suzuki will have more idea
> regarding this than me.
>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation

Thanks

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
