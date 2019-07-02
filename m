Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD1E5DA3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 03:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfGCBGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jul 2019 21:06:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45208 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbfGCBGM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jul 2019 21:06:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so691409wre.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2019 18:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7PbiqxZ6N1zfuiJYD7wJ93Pdo9aQh0IzeX8dcJ4X5FU=;
        b=pSfYXKs/eqzCFbQjrWkC99dJ2GBbcgfGiqD4o3TT1CTRmGJKlgGUmxb64JYxtewy9i
         P4m7J1uixRsx52J41BThoDYqSjJKJBBVrDWCyj9I8Ea61Y92rPgjr1pLTBd0RQJPFzmU
         M7V32ufMqcgtq8htDIXCzupTlkp4UjI9gHxwKnnjp9I5KC8XIMpLESjEz2ky6JmdWBUZ
         fpUrAlbfT2IsMegG37jVJuagyqNW4pkpQtkIeE58VcZQYGISG+P5AuwWh7z/Nf5nXZpG
         e0YVm2O6FdZtWrWdqJ8y44qc1Kznwh6KOm+3xKsBu3WKOzbgEmB8k1YSrTXZcEvtEq40
         T4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7PbiqxZ6N1zfuiJYD7wJ93Pdo9aQh0IzeX8dcJ4X5FU=;
        b=CeaD3JFDErhuCp6/kSz5lDEZuWUGRE7ZNWLJEEUrFUq98RsMjZEL/1K1NkN2/o7aeJ
         DBlrSBjBGS5gTdLXgbWHPTFqNTvgP7te8mc7oHokYPJ/q8gnfXtMSnAkZSqrYX/LGQ06
         yj8vux6wY2pj3+kXyMLkeL9trYqSHIkBdEpW9QYlTRee54m6U4QcJ9qkE6/oQarY3iQY
         R9zdWPuaMHVVkAupcBCai18WmiFOMzwR9z0oJt1ymlQzCoqk5xHws/q53NOTZpE3ZIES
         Zqge9ge7ZO59qwRQNweeRSjjFQqOSsxxfhFM/nm8ntrOYM+9A9zj/EcVLj7g1G4dF9fN
         CSfA==
X-Gm-Message-State: APjAAAXArXVLw1Id7nRLnNZG0fbnoNRG4j3YfumJ+Dr42xVoOw7RUoA3
        JIdIwikHsJwy5K+z3Os4L8SoJJdjA8g=
X-Google-Smtp-Source: APXvYqxy3HQDztVC6uezZn9eBQs5Zkluz0+aQTRZh5ueKntVlQ8XLFFH3aUcx4MBnkHOUdh7vxHexg==
X-Received: by 2002:a5d:6182:: with SMTP id j2mr14634480wru.275.1562104795656;
        Tue, 02 Jul 2019 14:59:55 -0700 (PDT)
Received: from bivouac.eciton.net (bivouac.eciton.net. [2a00:1098:0:86:1000:23:0:2])
        by smtp.gmail.com with ESMTPSA id w25sm226281wmk.18.2019.07.02.14.59.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 14:59:54 -0700 (PDT)
Date:   Tue, 2 Jul 2019 22:59:53 +0100
From:   Leif Lindholm <leif.lindholm@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
        Alexander Graf <agraf@suse.de>,
        Steve Capper <steve.capper@arm.com>,
        Lukas Wunner <lukas@wunner.de>,
        Julien Thierry <julien.thierry@arm.com>,
        linux-efi <linux-efi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] efi/libstub: detect panel-id
Message-ID: <20190702215953.wdqges66hx3ge4jr@bivouac.eciton.net>
References: <20190630203614.5290-1-robdclark@gmail.com>
 <20190630203614.5290-3-robdclark@gmail.com>
 <CAKv+Gu_8BOt+f8RTspHo+se-=igZba1zL0+jWLV2HuuUXCKYpA@mail.gmail.com>
 <CAKv+Gu-KhPJxxJA3+J813OPcnoAD4nHq6MhiRTJSd_5y1dPNnw@mail.gmail.com>
 <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGv+uAXVV6Q78n=jP0YRDjYn9OS=Xec9MU0+_7EBirxF5w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 02, 2019 at 02:01:49PM -0700, Rob Clark wrote:
> > > So we are dealing with a platform that violates the UEFI spec, since
> > > it does not bother to implement variable services at runtime (because
> > > MS let the vendor get away with this).
> >
> > To clarify, the above remark applies to populating the DT from the OS
> > rather than from the firmware.
> 
> yeah, it isn't pretty, but there *are* some other similar cases where
> efi-stub is populating DT.. (like update_fdt_memmap() and
> kaslr-seed)..

The problem isn't with the stub updating the DT, the problem is what
it updates it with.

update_fdt_memmap() is the stub filling in the information it
communicates to the main kernel.

kaslr-seed sets a standard property using a standard interface if that
interface is available to it at the point of execution.

Since what we're doing here is dressing up an ACPI platform to make it
look like it was a DT platform, and since we have the ability to tweak
the DT before ever passing it to the kernel, let's just do that.

Yes, I know I said I'd rather not, but it's way nicer than sticking
platform-specific hacks into the EFI stub.

(If adding it as a DT property is indeed the thing to do.)

> > ... but saving variables at boot time for consumption at runtime is
> > something that we will likely see more of in the future.
> 
> I think this will be nice, but it also doesn't address the need for a
> quirk to get this into /chosen..  I guess we *could* use a shim or
> something that runs before the kernel to do this.  But that just seems
> like a logistical/support nightmare.
>
> There is one kernel, and there
> are N distro's, so debugging a users "I don't get a screen at boot"
> problem because their distro missed some shim patch really just
> doesn't seem like a headache I want to have.

The distros should not need to be aware *at all* of the hacks required
to disguise these platforms as DT platforms.

If they do, they're already device-specific installers and have
already accepted the logistical/support nightmare.

/
    Leif
