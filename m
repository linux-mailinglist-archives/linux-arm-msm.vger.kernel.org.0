Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170601CF3B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 13:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbgELLty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 07:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729652AbgELLtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 07:49:53 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF330C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 04:49:52 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s21so2614355ejd.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lA/R5cVw7J1OmmeQncwj7MPy4zj1gdAinlZlJ95cbUI=;
        b=wuMCK2rvXLnDaU9m4S0liETjI9bAycUXRoXjT0RHih1TYmlF0pN4qcHnXPGT6yO2Yo
         DhPZyDCy/Cz0pguGC3Hhmcntjf2+VB2ApAxuQzM2vmRrL2qMF8MyKr8l+vQdmLCgteo8
         Ed+AsX08wiBEg5guj0AajFPm3iwUulS6LLWg/2ho+qLA0mVxhvWTCeR8E0tS+Uvuuehu
         DidaXBXpezG6q0LWNxgjKm83TMrBOGRZUpvoAYJDFLdzsEFyQOmQkX98fOxjeVLRDa3C
         y2CUackZNK4XoumiH3QXerr51bnGBe+stMdFxTVF33yP0MX1pYiDyTP5dyYg9gZywGxI
         GSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lA/R5cVw7J1OmmeQncwj7MPy4zj1gdAinlZlJ95cbUI=;
        b=XQYNUTIz9SWWUXivK2dZ/ILbuCPA4v+t27FW5eora9jG3O9gMYEFWAL/4jTYxdJtKh
         wlVa6Uhy1JRMyuZ3LSdICGbe+yKjMFgZRNd1id2ELDyM6Cab7AYP09GaT9OtyV5NVsbN
         TBWYrbzMUR/39H9j20lirM+Os1T86QPuISFeBqezLDur8v4Bs7dy8LbZo+DXm60/qZ8v
         AxMsLc4x/gKOZOslxM7CPvKAEiLut26uVdERZk6KFjdsf5Iiuo5OgdCkWyvrIbaccu3l
         VEJQ8TVRk4yMcWATtmudFUhAFBakTF5X8xWW7M4noR4nJqf72Rly7mKGZWml2YLk4kq7
         hxnQ==
X-Gm-Message-State: AGi0PuYM51tgusLbtMEpLHdaBEBQoU4yf+DMyrPHv7H0g72MAu5pykl5
        ahgLPpjcdGIgRnUNFkXX0QyhiFg+3ee/b5sGBlgiyA==
X-Google-Smtp-Source: APiQypLplB6Fpsp0/cGIgeyVF8/uimdfMyMJdF+9xoAJYrueFeEeoZIhB1dFnymvfs0q1NYiHUC9SJIKyN7xJJ5nftk=
X-Received: by 2002:a17:906:7c0c:: with SMTP id t12mr17772468ejo.2.1589284191497;
 Tue, 12 May 2020 04:49:51 -0700 (PDT)
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
 <d47271ee6a2a6f0f30da7e140b6f196c@codeaurora.org>
In-Reply-To: <d47271ee6a2a6f0f30da7e140b6f196c@codeaurora.org>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 12 May 2020 12:49:40 +0100
Message-ID: <CAJ9a7Vg95tcgMXgQKLAZc=TpV6FnPZ7wdF=Kwbuy7d2kRCjYQw@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI,

On Mon, 11 May 2020 at 15:41, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Suzuki,
>
> On 2020-05-11 20:00, Suzuki K Poulose wrote:
> > On 05/11/2020 03:16 PM, Sai Prakash Ranjan wrote:
> >> Hi Mike,
> >>
> >> On 2020-05-11 16:44, Mike Leach wrote:
> >> [...]
> >>
I have reviewed the replicator driver, and compared to all the other CS dri=
vers.
This driver appears to be the only one that sets hardware values in
probe() and expects them to remain in place on enable, and uses that
state for programming decisions later, despite telling the PM
infrastructure that it is clear to suspend the device.

Now we have a system where the replicator hardware is behaving
differently under the driver, but is it behaving unreasonably?
> >>>>
> >>>> I checked with the debug team and there is a limitation with
> >>>> the replicator(swao_replicator) in the AOSS group where it
> >>>> loses the idfilter register context when the clock is disabled.
> >>>> This is not just in SC7180 SoC but also reported on some latest
> >>>> upcoming QCOM SoCs as well and will need to be taken care in
> >>>> order to enable coresight on these chipsets.
> >>>>
> >>>> Here's what's happening -  After the replicator is initialized,
> >>>> the clock is disabled in amba_pm_runtime_suspend() as a part of
> >>>> pm runtime workqueue with the assumption that there will be no
> >>>> loss of context after the replicator is initialized. But it doesn't
> >>>> hold good with the replicators with these unfortunate limitation
> >>>> and the idfilter register context is lost.
> >>>>
> >>>> [    5.889406] amba_pm_runtime_suspend devname=3D6b06000.replicator
> >>>> ret=3D0
> >>>> [    5.914516] Workqueue: pm pm_runtime_work
> >>>> [    5.918648] Call trace:
> >>>> [    5.921185]  dump_backtrace+0x0/0x1d0
> >>>> [    5.924958]  show_stack+0x2c/0x38
> >>>> [    5.928382]  dump_stack+0xc0/0x104
> >>>> [    5.931896]  amba_pm_runtime_suspend+0xd8/0xe0
> >>>> [    5.936469]  __rpm_callback+0xe0/0x140
> >>>> [    5.940332]  rpm_callback+0x38/0x98
> >>>> [    5.943926]  rpm_suspend+0xec/0x618
> >>>> [    5.947522]  rpm_idle+0x5c/0x3f8
> >>>> [    5.950851]  pm_runtime_work+0xa8/0xc0
> >>>> [    5.954718]  process_one_work+0x1f8/0x4c0
> >>>> [    5.958848]  worker_thread+0x50/0x468
> >>>> [    5.962623]  kthread+0x12c/0x158
> >>>> [    5.965957]  ret_from_fork+0x10/0x1c
> >>>>
> >>>> This is a platform/SoC specific replicator issue, so we can either
> >>>> introduce some DT property for replicators to identify which
> >>>> replicator
> >>>> has this limitation, check in replicator_enable() and reset the
> >>>> registers
> >>>> or have something like below diff to check the idfilter registers in
> >>>> replicator_enable() and then reset with clear comment specifying
> >>>> it=E2=80=99s
> >>>> the
> >>>> hardware limitation on some QCOM SoCs. Please let me know your
> >>>> thoughts
> >>>> on
> >>>> this?
> >>>>
> >>
> >> Sorry for hurrying up and sending the patch -
> >> https://lore.kernel.org/patchwork/patch/1239923/.
> >> I will send v2 based on further feedbacks here or there.
> >>
> >>>
> >>> 1) does this replicator part have a unique ID that differs from the
> >>> standard ARM designed replicators?
> >>> If so perhaps link the modification into this. (even if the part no
> >>> in
> >>> PIDR0/1 is the same the UCI should be different for a different
> >>> implementation)
> >>>
I have reviewed the replicator driver, and compared to all the other CS dri=
vers.
This driver appears to be the only one that sets hardware values in
probe() and expects them to remain in place on enable, and uses that
state for programming decisions later, despite telling the PM
infrastructure that it is clear to suspend the device.

Now we have a system where the replicator hardware is behaving
differently under the driver, but is it behaving unreasonably?
> >>
> >> pid=3D0x2bb909 for both replicators. So part number is same.
> >> UCI will be different for different implementation(QCOM maybe
> >> different from ARM),
> >> but will it be different for different replicators under the same
> >> impl(i.e., on QCOM).
> >
> > May be use PIDR4.DES_2 to match the Implementor and apply the work
> > around for all QCOM replicators ?
> >
> > To me that sounds the best option.
> >
>

I agree, if it can be established that the register values that make
up UCI (pid0-4, devarch, devtype, PID:CLASS=3D=3D0x9), can correctly
identify the parts then a flag can be set in the probe() function and
acted on during the enable() function.

> Ok we can do this as well, but just for my understanding, why do we need
> to reset replicators
> in replicator_probe() and not in replicator_enable()? Are we accessing
> anything before
> we enable replicators?
>

This was a design decision made by the original driver writer. A
normal AMBA device should not lose context due to clock removal (see
drivers/amba/bus.c), so resetting in probe means this operation is
done only once, rather than add overhead in the enable() function,and
later decisions can be made according to the state of the registers
set.

As you have pointed out, for this replicator implementation  the
context is unfortunately not retained when clocks are removed - so an
alternative method is required.

perhaps something like:-

probe()
...
if (match_id_non_persistent_state_regs(ID))
    drvdata->check_filter_val_on_enable;
....

and a re-write of enable:-

enable()
...
CS_UNLOCK()
id0val =3D read(IDFILTER0);
id1val =3D read(IDFILTER1);

/* some replicator designs lose context when AMBA clocks are removed -
check for this */
if (drvdata->check_filter_val_on_enable && (id0val =3D=3D id1val =3D=3D 0x0=
))
   id0val =3D id1val =3D 0xff;

if(id0xal =3D=3D id1val =3D=3D 0xff)
   rc =3D  claim_device()

if (!rc)
   switch (outport)
      case 0: id0val  =3D 0x0; break
      case 1: id1va; =3D 0x0; break;
     default: rc =3D -EINVAL;

if (!rc)
   write(id0val);
   write(id1val);
CS_LOCK()
return rc;
....

Given that the access to the enable() function is predicated on a
reference count per active port, there is also a case for dropping the
check_filter_val_on_enable flag completely - once one port is active,
then the device will remain enabled until both ports are inactive.
This still allows for future development of selective filtering per
port.

One other point here - there is a case as I mentioned above for moving
to a stored value model for the driver - as this is the only coresight
driver that appears to set state in the probe() function rather than
write all on enable.
This however would necessitate a more comprehensive re-write.

Regards

Mike


> Thanks,
> Sai
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
