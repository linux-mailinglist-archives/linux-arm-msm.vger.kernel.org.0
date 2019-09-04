Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7C6A92BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 22:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfIDUBi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 16:01:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41808 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729503AbfIDUBf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 16:01:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id j16so99593wrr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 13:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=JCNSU8zuFffQH3IN2sAAGv7QBbOUi5d4/dyTjM3iQBA=;
        b=y7zjrTqYbdm4vAstK7azobzgWjVzIZ5ldkjh4BmXeP0B1mWYubxD1LnX4QmG2eQcJj
         pB6MjLlbYhk27CRdHfU453vbsVLi6ZpusmXG7SgfxVyZTow36qm6V032keVH3Bx+qQqx
         BbWWBkiipVzl1S8DKRU7Akt92DtSbFcTElgSTg1Kps6+9nlFxY4W0/CDyPOtVEKs3utO
         zSft3HDnM1YVJX17Kjl/ONhABuVOLF28eKpu7TvShjaAPbDYNWSSVnnk2iTZq9IZgZUy
         NeJdx+y932RsNDO9EqlwICezMVuVguJUDD8NM4GIMDY6pPoIP9w37ibntJY+bnR5ah3d
         /nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=JCNSU8zuFffQH3IN2sAAGv7QBbOUi5d4/dyTjM3iQBA=;
        b=aw0TTfZjty/3/v3dzLDxWUANxP12skHzaw+SP86NK7MltP7cgBynpAoB8dFwsDbfT/
         Qku2Ad4POEl0khD/eCIUAIqnyEoJ6POHjyCUfJtPPaTgJVXKYuJbOAYZ/7c2IdX7UmZk
         u31e/gwFgWhx5MQB9KVJXhyoP7ekUwvbV7PC8iHDBlq2D1LmC5G2Sq6H6hpEQozcFHeG
         MWJUKyZ7CLtut+Z3Ozw05jtleBrk2LwIG/al+1G/A1Lx9j/g87wliUNRV9VJy1S2iwNq
         6CVTTl/psbcFRooHPkC1LHVqOP8S5qSZeBtblSQrlDCFfIUr3g0dP9Q6BdTb2c0l5aYH
         eUAQ==
X-Gm-Message-State: APjAAAX7X8V8RvFX3rohmVDka88Z8bEPXEaM5Dm3pO17UcvbXVc78MGE
        18fdKKVvS5IwlD9JaLHHddeDhA==
X-Google-Smtp-Source: APXvYqyN0dIJyvcBXKxN2V3Fdd9bsbiNhCY2jKRDrvFe/zrl6Y4+0fkbjyiKaEh1bx5ZqmtSI5VP+w==
X-Received: by 2002:adf:e947:: with SMTP id m7mr36164812wrn.178.1567627292475;
        Wed, 04 Sep 2019 13:01:32 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id b184sm50211wmg.47.2019.09.04.13.01.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:01:31 -0700 (PDT)
Date:   Wed, 4 Sep 2019 21:01:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Message-ID: <20190904200130.GT26880@dell>
References: <20190903135052.13827-1-lee.jones@linaro.org>
 <20190904031922.GC574@tuxbook-pro>
 <20190904084554.GF26880@dell>
 <20190904182732.GE574@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904182732.GE574@tuxbook-pro>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Bjorn Andersson wrote:

> On Wed 04 Sep 01:45 PDT 2019, Lee Jones wrote:
> 
> > On Tue, 03 Sep 2019, Bjorn Andersson wrote:
> > 
> > > On Tue 03 Sep 06:50 PDT 2019, Lee Jones wrote:
> > > 
> > > > When booting with ACPI, the Geni Serial Engine is not set as the I2C/SPI
> > > > parent and thus, the wrapper (parent device) is unassigned.  This causes
> > > > the kernel to crash with a null dereference error.
> > > > 
> > > 
> > > Now I see what you did in 8bc529b25354; i.e. stubbed all the other calls
> > > between the SE and wrapper.
> > > 
> > > Do you think it would be possible to resolve the _DEP link to QGP[01]
> > > somehow?
> > 
> > I looked at QGP{0,1}, but did not see it represented in the current
> > Device Tree implementation and thus failed to identify it.  Do you
> > know what it is?  Does it have a driver in Linux already?
> 
> QGP0 is the same hardware block as &qupv3_id_0, but apparently both are
> only representing a smaller part - and different ones.
> 
> But conceptually both represents the wrapper...

... which doesn't actually do anything in the Linux implementation.

It only has one register. :)

> > > For the clocks workarounds this could be resolved by us
> > > representing that relationship using device_link and just rely on
> > > pm_runtime to propagate the clock state.
> > 
> > That is not allowed when booting ACPI.  The Clock/Regulator frameworks
> > are not to be used in this use-case, hence why all of the calls to
> > these frameworks are "stubbed out".  If we wanted to properly
> > implement power management, we would have to create a driver/subsystem
> > similar to the "Windows-compatible System Power Management Controller"
> > (PEP).  Without documentation for the PEP, this would be an impossible
> > task.  A request for the aforementioned documentation has been put in
> > to Lenovo/Qualcomm.  Hopefully something appears soon.
> > 
> 
> I see, so the PEP states needs to be parsed and associated with each
> device and we would use pm_runtime to toggle between the states and
> device_links to ensure that _DEP nodes are powered in appropriate order.
> 
> That seems reasonable and straight forward and the reliance on
> pm_runtime will make the DT case cleaner as well.

Essentially yes.  The issue is translating the ACPI tables into
actions to be taken by the Linux Power Management APIs.  Again, we've
requested documentation.  Now, we wait ...

> > > For the DMA operation, iiuc it's the wrapper that implements the DMA
> > > engine involved, but I'm guessing the main reason for mapping buffers on
> > > the wrapper is so that it ends up being associated with the iommu
> > > context of the wrapper.
> > 
> > Judging by the code alone, the wrapper doesn't sound like it does much
> > at all.  It seems to only have a single (version) register (at least
> > that is the only register that's used).  The only registers it
> > reads/writes are those of the calling device, whether that be I2C, SPI
> > or UART.
> > 
> > Device Tree represents the wrapper's relationship with the I2C (and
> > SPI/UART) Serial Engine (SE) devices as parent-child ones, with the
> > wrapper being the parent and SE the child.  Whether this is a true
> > representation of the hardware or just a tactic used for convenience
> > is not clear, but the same representation does not exist in ACPI.
> > 
> > In the current Linux implementation, the buffer belongs to the SE
> > (obtained by the child (e.g. I2C) SE by fetching the parent's
> > (wrapper's) device data using the standard platform helpers) but the
> > register-set used to control the DMA transactions belong to the SE
> > devices.
> > 
> 
> Yeah, I saw this as well. If all the SEs where the wrappers iommu domain
> things should work fine by mapping it on the se->dev, regardless of the
> device's being linked together.

This is my assumption too.

> The remaining relationship to the wrapper would then be reduced to the
> read of the version to check for 1.0 or 1.1 hardware in the SPI driver,
> which can be replaced by the assumption that we're on 1.1.

Also correct.  You would be left with a huge duplication of code
across each of the SEs however.

> > > Are the SMMU contexts at all represented in the ACPI world and if so do
> > > you know how the wrapper vs SEs are bound to contexts? Can we map on
> > > se->dev when wrapper is NULL (or perhaps always?)?
> > 
> > Yes, the SMMU devices are represented in ACPI (MMU0) and (MMU1).  They
> > share the same register addresses as the SMMU devices located in
> > arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Right but this only describes the IOMMU devices, I don't see any
> information about how individual client devices relates to the various
> IOMMU contexts.

I see some _DEPs which detail the MMU{0,1}, but that's about it.

> > With this simple parameter checking patch, the SE falls back to using
> > FIFO mode to transmit data and continues to work flawlessly.  IMHO
> > this should be applied in the first instance, as it fixes a real (null
> > dereference) bug which currently resides in the Mainline kernel.
> > 
> 
> Per the current driver design the wrapper device is the parent of the
> SE, I should have seen that 8bc529b25354 was the beginning of a game of
> whac-a-mole circumventing this design. Sorry for not spotting this
> earlier.

Right, but that doesn't mean that the current driver design is
correct.  ACPI, which is in theory a description of the hardware
doesn't seem to think so.  It looks more like we do this in Linux as a
convenience function to link the devices.  Instead this 'parent' seems
to be represented as a very small register space at the end of the SE
banks.

> But if this is the one whack left to get the thing to boot then I think
> we should merge it.

Amazing, thank you!

Do you know how we go about getting this merged?  We only potentially
have 0.5 weeks (1.5 weeks if there is an -rc8 [doubtful]), so we need
to move fast.  Would you be prepared to send it to Linus for -fixes?
I'd do it myself, but this is a little out of my remit.

Nothing heard from Andy for a very long time.

> > Moving forward we can try to come up with a suitable plan to implement
> > DMA in the ACPI use-case - but again, this is feature adding work
> > which should be carried out against -next, where as this patch needs
> > to go in via the current -rcs ASAP.
> 
> Sounds good.

Great.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
