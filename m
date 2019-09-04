Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B898EA9754
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 01:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbfIDXph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 19:45:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46538 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730318AbfIDXpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 19:45:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id t1so326786plq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 16:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=vu/9p2fe9GxGN3cNpeW7qpxXHEjWh+kyFDAn4s7xdho=;
        b=Mqab7Fib6jTd4940cCY9Q0mYQnIuq3We/SHz2mL2Xaguh74hw/YHmMotjdASz5B1b/
         zuDwDOKTVZWYyT70lCDc+8RSNJ72EYJejYwJclxAyL/16HukhCpLsphM62qK7vaKXJos
         nIoWYhg2qNnWmXebvnGAyro0j/Nawne7vsdA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=vu/9p2fe9GxGN3cNpeW7qpxXHEjWh+kyFDAn4s7xdho=;
        b=ODTpvwNjiGLsp+1qx2Y0mA+5V6iW4UbOu+bdIjJk/xTEq4SWo1SKOb9mRlTyNPT16m
         RY+o9NCUNGzuvlIBvYz+KmKJXwW6sVjanvj24yJ/pXtspCkSHsrYyWUsIg3clKiafQGP
         tsz/lItdcErfI28SACdXT4FtErS4uUVIc6WmXGO//aXNltriLiAPtHva/fBoS7ngJXqB
         N7YBjZ8XXbe3KHUn1t34phYrkFdY+aYSmfL6Ck22M9zlq9miOTR8jeOjxc3jiGzeQPxr
         q00+CedKPCr2cGvME45pg4ZO687BE/wDjbwxYkvelKcWyNIa09Hu+Cs9mwn4qGxXEjWP
         Nq6A==
X-Gm-Message-State: APjAAAXy/okqMGzVVffPmSodlj+7QiXOfAR2X4yUVoChOYJUgIMa5pp4
        BRs1bKewqjGH958WaqusjelpjQ==
X-Google-Smtp-Source: APXvYqxSeCbsEH7VIZRhORWAP49G1l4WDjZqdXrxRw+p5ofbVPXVM0QFnnhvRjBWMm8NbbdRATHs2g==
X-Received: by 2002:a17:902:7449:: with SMTP id e9mr376613plt.242.1567640735962;
        Wed, 04 Sep 2019 16:45:35 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f62sm190298pfg.74.2019.09.04.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 16:45:35 -0700 (PDT)
Message-ID: <5d704c9f.1c69fb81.a1686.0eb3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190904182732.GE574@tuxbook-pro>
References: <20190903135052.13827-1-lee.jones@linaro.org> <20190904031922.GC574@tuxbook-pro> <20190904084554.GF26880@dell> <20190904182732.GE574@tuxbook-pro>
Cc:     agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 04 Sep 2019 16:45:34 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2019-09-04 11:27:32)
> On Wed 04 Sep 01:45 PDT 2019, Lee Jones wrote:
>=20
> > On Tue, 03 Sep 2019, Bjorn Andersson wrote:
> >=20
> > > On Tue 03 Sep 06:50 PDT 2019, Lee Jones wrote:
> > >=20
> > > > When booting with ACPI, the Geni Serial Engine is not set as the I2=
C/SPI
> > > > parent and thus, the wrapper (parent device) is unassigned.  This c=
auses
> > > > the kernel to crash with a null dereference error.
> > > >=20
> > >=20
> > > Now I see what you did in 8bc529b25354; i.e. stubbed all the other ca=
lls
> > > between the SE and wrapper.
> > >=20
> > > Do you think it would be possible to resolve the _DEP link to QGP[01]
> > > somehow?
> >=20
> > I looked at QGP{0,1}, but did not see it represented in the current
> > Device Tree implementation and thus failed to identify it.  Do you
> > know what it is?  Does it have a driver in Linux already?
> >=20
>=20
> QGP0 is the same hardware block as &qupv3_id_0, but apparently both are
> only representing a smaller part - and different ones.
>=20
> But conceptually both represents the wrapper...
>=20
> > > For the clocks workarounds this could be resolved by us
> > > representing that relationship using device_link and just rely on
> > > pm_runtime to propagate the clock state.
> >=20
> > That is not allowed when booting ACPI.  The Clock/Regulator frameworks
> > are not to be used in this use-case, hence why all of the calls to
> > these frameworks are "stubbed out".  If we wanted to properly
> > implement power management, we would have to create a driver/subsystem
> > similar to the "Windows-compatible System Power Management Controller"
> > (PEP).  Without documentation for the PEP, this would be an impossible
> > task.  A request for the aforementioned documentation has been put in
> > to Lenovo/Qualcomm.  Hopefully something appears soon.
> >=20
>=20
> I see, so the PEP states needs to be parsed and associated with each
> device and we would use pm_runtime to toggle between the states and
> device_links to ensure that _DEP nodes are powered in appropriate order.
>=20
> That seems reasonable and straight forward and the reliance on
> pm_runtime will make the DT case cleaner as well.

I think we tried to push for pm_runtime here but it was rejected because
of a missing interconnect framework? See
https://marc.info/?l=3Ddevicetree&m=3D152002327106864&w=3D2

>=20
> > > For the DMA operation, iiuc it's the wrapper that implements the DMA
> > > engine involved, but I'm guessing the main reason for mapping buffers=
 on
> > > the wrapper is so that it ends up being associated with the iommu
> > > context of the wrapper.
> >=20
> > Judging by the code alone, the wrapper doesn't sound like it does much
> > at all.  It seems to only have a single (version) register (at least
> > that is the only register that's used).  The only registers it
> > reads/writes are those of the calling device, whether that be I2C, SPI
> > or UART.
> >=20
> > Device Tree represents the wrapper's relationship with the I2C (and
> > SPI/UART) Serial Engine (SE) devices as parent-child ones, with the
> > wrapper being the parent and SE the child.  Whether this is a true
> > representation of the hardware or just a tactic used for convenience
> > is not clear, but the same representation does not exist in ACPI.
> >=20
> > In the current Linux implementation, the buffer belongs to the SE
> > (obtained by the child (e.g. I2C) SE by fetching the parent's
> > (wrapper's) device data using the standard platform helpers) but the
> > register-set used to control the DMA transactions belong to the SE
> > devices.
> >=20
>=20
> Yeah, I saw this as well. If all the SEs where the wrappers iommu domain
> things should work fine by mapping it on the se->dev, regardless of the
> device's being linked together.
>=20
> The remaining relationship to the wrapper would then be reduced to the
> read of the version to check for 1.0 or 1.1 hardware in the SPI driver,
> which can be replaced by the assumption that we're on 1.1.

Could this be described in the DT compatible for the SE in the future
instead of reading it from the wrapper register space?

>=20
> > > Are the SMMU contexts at all represented in the ACPI world and if so =
do
> > > you know how the wrapper vs SEs are bound to contexts? Can we map on
> > > se->dev when wrapper is NULL (or perhaps always?)?
> >=20
> > Yes, the SMMU devices are represented in ACPI (MMU0) and (MMU1).  They
> > share the same register addresses as the SMMU devices located in
> > arch/arm64/boot/dts/qcom/sdm845.dtsi.
> >=20
>=20
> Right but this only describes the IOMMU devices, I don't see any
> information about how individual client devices relates to the various
> IOMMU contexts.

The only thread I recall describing this is
https://lkml.kernel.org/r/945b6c00-dde6-6ec7-4577-4cc0d034796b@codeaurora.o=
rg

>=20
> > With this simple parameter checking patch, the SE falls back to using
> > FIFO mode to transmit data and continues to work flawlessly.  IMHO
> > this should be applied in the first instance, as it fixes a real (null
> > dereference) bug which currently resides in the Mainline kernel.
> >=20
>=20
> Per the current driver design the wrapper device is the parent of the
> SE, I should have seen that 8bc529b25354 was the beginning of a game of
> whac-a-mole circumventing this design. Sorry for not spotting this
> earlier.
>=20
> But if this is the one whack left to get the thing to boot then I think
> we should merge it.
>=20

Agreed.

