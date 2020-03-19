Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECAB18C29C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 22:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgCSVxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 17:53:39 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39424 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgCSVxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 17:53:38 -0400
Received: by mail-pl1-f193.google.com with SMTP id m1so1631497pll.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=5LUA4b+2SbuX5pz6Qw7zYT21GzewUpDmcXH9BX3vcFc=;
        b=awxnB4eAkRjRl9q5UYQjmmdNzQsc1KyXNqpR2yheQC+GsZxZyP3ORuKC/zqxsmKNBK
         RAbtkLzGjEN3ReCgxWeoJ+4UxEA8ihlPBAck1g6XIH1PPsS6mdam0dbK8TLVfkPm6Gw7
         05YS+6qMtfo/2eV08NTOqUWVJK+7ShgOZfrDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=5LUA4b+2SbuX5pz6Qw7zYT21GzewUpDmcXH9BX3vcFc=;
        b=kxa8Gr4dbGuiCFV//17qh3Po7/r6//ULKG1dfq09tBc/RB4AbQIoeLTC/tvH/y4nKy
         EQKPhrApDPU44xERCDZ7+ziouZap0TzJXz48QPMJOXSWGqhbpeoO0apu76K5LYZ+8jSj
         wRo/y7QN5k0uzuMs/ufDO4PzAaFHmhB9AV0OS/yX8tb9e0K/EQsv/2yzn7nRGIsjJOU2
         mV1M63ieeTF8gmQcVtiO+aGNWvaYTet0o6S9vwvnEjsyMT+aR4p7h9luVxQpVQDR0xR7
         oZCTCG8ztYiTNuBa3ixRYNkmLBc3HhsXsK7OFiEjlJelfJ4caxzXRkq+wl92749EyY9W
         toHA==
X-Gm-Message-State: ANhLgQ350IM1JRk1oug6C8M/wvRCSWiAhrz3Lo5T/T1xkqdtz7DsEqT7
        /nuMaF5FakkQ3aI8QoHDo8N0uw==
X-Google-Smtp-Source: ADFU+vvrsV+zI3RoNorTznotYVHzvCN1c7bkOcoJCRTPyK2/J6IAknvRhqrEXH3QAJd+yxoPvz0DzQ==
X-Received: by 2002:a17:90b:f0e:: with SMTP id br14mr6081834pjb.21.1584654815052;
        Thu, 19 Mar 2020 14:53:35 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q71sm2981604pjb.5.2020.03.19.14.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 14:53:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b5124e41-df99-c5d0-28d8-f0157db77ce1@codeaurora.org>
References: <1584019379-12085-1-git-send-email-mkshah@codeaurora.org> <1584019379-12085-2-git-send-email-mkshah@codeaurora.org> <158441069917.88485.95270915247150166@swboyd.mtv.corp.google.com> <bc2f75bc-1223-68b5-3c64-8ea17ee677cf@codeaurora.org> <158456608487.152100.9336929115021414535@swboyd.mtv.corp.google.com> <b5124e41-df99-c5d0-28d8-f0157db77ce1@codeaurora.org>
Subject: Re: [RFC v2] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Thu, 19 Mar 2020 14:53:32 -0700
Message-ID: <158465481295.152100.8582940107266934812@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-03-19 02:56:31)
> On 3/19/2020 2:44 AM, Stephen Boyd wrote:
> > Quoting Maulik Shah (2020-03-16 23:47:21)
> >> On 3/17/2020 7:34 AM, Stephen Boyd wrote:
> >>> What happens if irq is "disabled" in software, because this is the fi=
rst
> >>> function called on the irq, and we aren't in suspend yet. Then we get
> >>> the irq. Won't we be interrupting the CPU because we've enabled in PDC
> >>> and GIC hardware? Why doesn't this function update the wake bit and t=
hen
> >>> leave the force on irq logic to suspend entry? Will we miss an interr=
upt
> >>> while entering suspend because of that?
> >> As PDC (and GIC) have a role during "active" time as well, interrupt s=
hould be
> >> enabled in PDC and GIC HW.
> > Sure. When the irq is enabled we want to enable at the GIC, but if it
> > isn't enabled and we're not in suspend I would think we don't want the
> > irq enabled at the GIC. But this code is doing that. Why?
>=20
> Since we want to wake up in idle path LPM as well, when IRQ is marked as =
wake up capable and even though its disabled.

No. IRQs that are disabled but have wake enabled on them should not wake
up the CPU from deep idle states (which is what I assume you mean by
idle path LPM (Low Power Mode)). Only if the irq is enabled should it
wake the CPU from deep idle states, and in this case irq wake state has
nothing to do with that working or not.

> >  I'd think we
> > would want to make enable in the PDC driver enable the parent and then
> > make the set_wake path just update some bitmap tracking wakeup enabled
> > irqs.
> >
> > Then when we enter suspend we will enable any pdc interrupts only in the
> > PDC so that we can wakeup from suspend if that interrupt comes in. When
> > we wakeup we'll resend the edge interrupts to the GIC on the resume path
> > and level interrupts will "just work" because they'll stay asserted
> > throughout resume.
> >
> > The bigger problem would look to be suspend entry, but in that case we
> > leave any interrupts enabled at the GIC on the path to suspend (see
> > suspend_device_irq() and how it bails out early if it's marked for
> > wakeup)=20
>=20
> No it doesn't happen this way in suspend_device_irq(), not for this disab=
led IRQ.
>=20
> Agree, it's a bigger problem to set IRQ enabled at GIC HW which is alread=
y disabled in HW and SW but marked for wake up.
> However suspend_device_irq() is of little or no-use here (for that partic=
ular IRQ). Let me step by step give details.
>=20
> This will benefit everyone to understand this problem. Correct me if some=
thing below in not happening as I listed.
>=20
> Step-1
>=20
> Driver invokes enable_irq_wake() to mark their IRQ wake up capable.
>=20
> Step-2
>=20
> After enable_irq_wake(), drivers invokes disable_irq().
> Let's break it down how this disable_irq() will traverse (in current code=
, without this RFC PATCH)
>=20
> Step-2.1
>=20
> In kernel/irq/manage.c
> disable_irq() =3D> __disable_irq_nosync() =3D> __disable_irq() =3D> irq_d=
isable()
>=20
> Step-2.2
>=20
> This will jump to kernel/irq/chip.c
> irq_disable() =3D> __irq_disable()=C2=A0 =3D> which then calls chip's .ir=
q_disable via desc->irq_data.chip->irq_disable(&desc->irq_data);
> Note that this is a GPIO IRQ, gpiolib set's this .irq_disable for every g=
pio chip during registration
>=20
> (see below in drivers/gpio/gpiolib.c)
> irqchip->irq_disable =3D gpiochip_irq_disable;
>=20
> So it doesn't take lazy path to disable at HW, its always unlazy (at-leas=
t for gpio IRQs)

That looks like a bug. It appears that gpiolib is only hooking the irq
disable path here so that it can keep track of what irqs are not in use
by gpiolib and allow them to be used for GPIO purposes when the irqs are
disabled. See commit 461c1a7d4733 ("gpiolib: override
irq_enable/disable"). That code in gpiolib should probably see if lazy
mode has been disabled on the irq and do similar things to what genirq
does and then let genirq mask the gpios if they trigger during the time
when the irq is disabled. Regardless of this design though, I don't
understand why this matters.

>=20
> Step-2.3
>=20
> Call Jumps to gpiochip_irq_disable()
> This then invokes irq_chip's=C2=A0 .irq_disable via chip->irq.irq_disable=
(d)
> which finally arrives at msmgpio irq_chip's msm_gpio_irq_disable() call f=
rom here.
> it finds that IRQ controller is in hierarchy, so it invokes irq_chip_disa=
ble_parent().
>=20
> Step-2.4
>=20
> This invokes PDC irq_chip's qcom_pdc_gic_disable()
> At this point,
> This will go ahead and "disabled in PDC HW"
> This also invokes irq_chip_disable_parent() since PDC is also in hierarch=
y with GIC.
>=20
> Step-2.5
>=20
> This invokes GIC's gic_mask_irq() since GIC doesn't have .irq_disable imp=
lemented, it instead invokes mask.
> This will go ahead and "disables at GIC HW".
>=20
> Final status at the end of step 2:
> (a)=C2=A0=C2=A0=C2=A0 IRQ is marked as wake up capable in SW
> (b)=C2=A0=C2=A0=C2=A0 IRQ is disabled in both SW and HW at GIC and PDC
>=20
> Step-3
> Device enters "suspend to RAM" which invokes suspend_device_irq()
> Pasting the interested part here...
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (irqd_is_wakeup_set(&desc->irq_da=
ta)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return true;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ..
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __disable_irq(desc);
>=20
> Note that it bails out with above if condition here for IRQs that are mar=
ked wake up capable, as you have already pointed out.
>=20
> For the rest of IRQs it goes ahead and disables them at HW via invoking _=
_disable_irq() (be it a GIC HW or PDC HW)
> so when device is in suspend only wake up capable IRQs are finally left e=
nabled in HW.

__disable_irq() considers lazy setting or not and leaves the irq
unmasked if the irq is lazy disabled. But we have the
IRQCHIP_MASK_ON_SUSPEND flag set in the gpio irq controller and that
properly masks the irq through the hierarchy if necessary. Again, this
is fine and all but I don't see how it matters.

>=20
> Now, If any driver that has only done step-1, then it make sense that it =
will bail out here and leave IRQ enabled in HW (to be precise in its
> original state at HW, without disabling it)
>=20
> But some drivers did step-1 and step-2 both.
>=20
> Yes even for this case, it will still bail out here, since its marked as =
wake up capable but it defeats the purpose of bail out
> (bail out is to NOT go ahead and disable at HW), but by doing step-2 driv=
er already disabled the IRQ at HW well before
> suspend_device_irq() is invoked.
>=20
> In other words, IRQ status stays same as what was at the end of step-2 (d=
isabled in HW)
>=20
> So this whole function is of no use (for that particular IRQ part). Here =
driver is disabling IRQ on their own via step-2 and then asks
> "hey remember I marked it as wake up capable in step-1, so IRQ should
> resume system from suspend when it occurs" completely ignoring
> the fact that its already disabled at HW in step-2.
>=20
> IMO, drivers should not even do step-2 here.=C2=A0 They should just mark =
irq as wake up capable and then let suspend framework decide whether
> to keep it enabled or disabled in HW when entering to suspend (Read may o=
nly do step-1, then everything works fine with current code)
>=20
> Hope that above details makes it clear on why I way asking earlier to
> remove unnecessary disable_irq() call from driver, I don't understand its=
 usage
> (at least till now its not clear to me). May be there are some reasons li=
ke seeing spurious IRQ when entering to suspend so driver may want to disab=
le it in HW.
>=20
> But then responsibility is falling on either suspend framework to re-enab=
le such wake up capable interrupts in HW.
> This may be done by again invoking enable_irq() before bailing out for
> wakeup capable IRQ in suspend_device_irq(). I don't know if this is accep=
table.=C2=A0
>=20
> Someone from To/Cc may clarify if above can be done. Note that it may cre=
ate problem for other drivers which does only step-1, by calling enable_irq=
()
> during suspend, it will update desc->depth, so this agin need to be undo =
when resuming.
>=20
> Otherwise, it is currently falling onto the individual irq_chip's to avoi=
d disabling in HW in the first place.
>=20
> this RFC patch tries to do same and address this problem in PDC irq_chip =
when control reaches at Step 2.4, to NOT disable at HW when the IRQ
> is already marked wake up capable, it bails out at Step 2.4 in PDC irq_ch=
ip so that interrupt is left enabled in HW at both PDC and GIC HW level.

I don't see any need to change genirq by changing how
suspend_device_irq() is written, but I'm not the maintainer of this code.

>=20
> > so we should be able to have some suspend entry hook in pdc that
> > enables the irq in the PDC if it's in the wakeup bitmap. Then on the
> > path to suspend the GIC can lose power at any point after we enable the
> > wakeup path in PDC and then the system should resume and get the
> > interrupt through the resend mechanism.
> I thought of this to introduce suspend hook in PDC which decides to keep =
wake up marked irq enabled at PDC.
> But then someone need to keep it enabled at GIC as well.
>=20
> PDC does not directly forward IRQ to CPU. PDC brings SoC out of low power=
 mode where GIC does
> not have power cut, it replays the interrupt at GIC in HW and that leads =
to forwarding interrupt
> to CPU and resume from low power mode.
> So PDC and GIC HW status should need to be in sync.
>=20

It sounds like PDC just passes along the level or edge and relies on the
parent irq chip (GIC in this case) to have the irq unmasked so it can be
seen at the CPU. If the irq is masked at the GIC does it still wakeup
the CPU if it's unmasked at the PDC?

Does the PDC have any other registers that can latch an edge type irq
across suspend so we can read it on resume? If that exists then we can
have software resend irqs at resume time. I think this was asked before
and the answer was it doesn't exist.

If there isn't any sort of latching, then why can't we unmask the irq in
the GIC hardware by calling irq_chip_enable_parent() from the suspend
hook in PDC? That should guarantee that the irq is unmasked at the GIC
when we're suspending and the GIC is about to lose power. And presumably
the GIC state is restored by hardware on resume so that the PDC can
forward the edge to the GIC which can interrupt the CPU because the
interrupt was left unmasked. The idea is to capture wake and enable
state in a bitmap, unmask at the PDC and GIC during system suspend if
it's marked for wakeup regardless of enable state, and then mask in the
PDC and GIC during resume if the irq is disabled in software. Does that
fail somehow?
