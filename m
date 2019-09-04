Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA5E4A91CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 21:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbfIDS1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 14:27:43 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39553 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731866AbfIDS1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 14:27:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id s12so6776634pfe.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hcgr0VxcpCtaw3Dc0RHut3CLe6dtkm704Ap19iiCF4g=;
        b=FVMPdbiqgNuDWL9MVZtz6ke7PVgv1nk5oc1YUeJYi1I+U+/BPp2cGWSkULQ1fpkS12
         Tv1l9I2Y8n5E6J1fyyjSxe2hWOBcRx4N/EVrvhP7/MUYxJ0p1ZXzFLkj7VyNUGnWsPtH
         Wp9CAE6KwYXA1m5SZ0oxWyRzR38ejmY48BaRLdQu25bL9bRuoCBfEJcFcu1zXSIfQRmK
         Bw/n3f2ILVspWKDTx1xjRsC4MlgMBl44gzIbw8rLrhzMWLMwMs4MjUYOC9rR2zzv7Irq
         hq1fejQjry5fLWbQSoEmyzQEH9ST+j83mtbbFrD2qUQmpEeB6F37LeuyaIwDZJQFhhnF
         7ycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hcgr0VxcpCtaw3Dc0RHut3CLe6dtkm704Ap19iiCF4g=;
        b=UNlzoB0GcfH0G+qHqwMjckFOt0Ah6MhhNmg5ikw6x0TEIgytY7gZ4u+DpO41ENbLs2
         M6cvkjh0ihySi+slQGaDTo0z6iyj6OshhZe+LLyHMa1O8GdlBchcQ+O/jflVrBDwnmVQ
         BkSd1xFUSMhppoc9DCgXPWSoea9/v9RBZmmh4O0Cxc5kMOOn++6FN5wCoi54RGrvB0+n
         1/1Ycca5gzvFtxK07otcfmiDRl53GGqOQyqtMjpJaHhGHgntMn9rhtuuRXSvweE1bozm
         /ycPiLgTfJ4e/ZAvRbtk7EQiwVXzjMgI5rTai4iWA/KqLtxz12AuYjrkoYrN6OpjEDl6
         IqXg==
X-Gm-Message-State: APjAAAXgrpxhSDOnlyJRKjjnTDR6r7mFvZFzCUFuKsUL4y/PkUYA/c1G
        nvGeN7stIRbia22oD0E1wncMRw==
X-Google-Smtp-Source: APXvYqz/asE6bReduYkbn4dEjj1nU8i0XByY0b+ilN77QOvZ5NbeVhjVmhmvtmTdQ+5p8zTwXNvdnw==
X-Received: by 2002:a65:5183:: with SMTP id h3mr36471386pgq.250.1567621661506;
        Wed, 04 Sep 2019 11:27:41 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l26sm19375624pgb.90.2019.09.04.11.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 11:27:40 -0700 (PDT)
Date:   Wed, 4 Sep 2019 11:27:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] soc: qcom: geni: Provide parameter error checking
Message-ID: <20190904182732.GE574@tuxbook-pro>
References: <20190903135052.13827-1-lee.jones@linaro.org>
 <20190904031922.GC574@tuxbook-pro>
 <20190904084554.GF26880@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904084554.GF26880@dell>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Sep 01:45 PDT 2019, Lee Jones wrote:

> On Tue, 03 Sep 2019, Bjorn Andersson wrote:
> 
> > On Tue 03 Sep 06:50 PDT 2019, Lee Jones wrote:
> > 
> > > When booting with ACPI, the Geni Serial Engine is not set as the I2C/SPI
> > > parent and thus, the wrapper (parent device) is unassigned.  This causes
> > > the kernel to crash with a null dereference error.
> > > 
> > 
> > Now I see what you did in 8bc529b25354; i.e. stubbed all the other calls
> > between the SE and wrapper.
> > 
> > Do you think it would be possible to resolve the _DEP link to QGP[01]
> > somehow?
> 
> I looked at QGP{0,1}, but did not see it represented in the current
> Device Tree implementation and thus failed to identify it.  Do you
> know what it is?  Does it have a driver in Linux already?
> 

QGP0 is the same hardware block as &qupv3_id_0, but apparently both are
only representing a smaller part - and different ones.

But conceptually both represents the wrapper...

> > For the clocks workarounds this could be resolved by us
> > representing that relationship using device_link and just rely on
> > pm_runtime to propagate the clock state.
> 
> That is not allowed when booting ACPI.  The Clock/Regulator frameworks
> are not to be used in this use-case, hence why all of the calls to
> these frameworks are "stubbed out".  If we wanted to properly
> implement power management, we would have to create a driver/subsystem
> similar to the "Windows-compatible System Power Management Controller"
> (PEP).  Without documentation for the PEP, this would be an impossible
> task.  A request for the aforementioned documentation has been put in
> to Lenovo/Qualcomm.  Hopefully something appears soon.
> 

I see, so the PEP states needs to be parsed and associated with each
device and we would use pm_runtime to toggle between the states and
device_links to ensure that _DEP nodes are powered in appropriate order.

That seems reasonable and straight forward and the reliance on
pm_runtime will make the DT case cleaner as well.

> > For the DMA operation, iiuc it's the wrapper that implements the DMA
> > engine involved, but I'm guessing the main reason for mapping buffers on
> > the wrapper is so that it ends up being associated with the iommu
> > context of the wrapper.
> 
> Judging by the code alone, the wrapper doesn't sound like it does much
> at all.  It seems to only have a single (version) register (at least
> that is the only register that's used).  The only registers it
> reads/writes are those of the calling device, whether that be I2C, SPI
> or UART.
> 
> Device Tree represents the wrapper's relationship with the I2C (and
> SPI/UART) Serial Engine (SE) devices as parent-child ones, with the
> wrapper being the parent and SE the child.  Whether this is a true
> representation of the hardware or just a tactic used for convenience
> is not clear, but the same representation does not exist in ACPI.
> 
> In the current Linux implementation, the buffer belongs to the SE
> (obtained by the child (e.g. I2C) SE by fetching the parent's
> (wrapper's) device data using the standard platform helpers) but the
> register-set used to control the DMA transactions belong to the SE
> devices.
> 

Yeah, I saw this as well. If all the SEs where the wrappers iommu domain
things should work fine by mapping it on the se->dev, regardless of the
device's being linked together.

The remaining relationship to the wrapper would then be reduced to the
read of the version to check for 1.0 or 1.1 hardware in the SPI driver,
which can be replaced by the assumption that we're on 1.1.

> > Are the SMMU contexts at all represented in the ACPI world and if so do
> > you know how the wrapper vs SEs are bound to contexts? Can we map on
> > se->dev when wrapper is NULL (or perhaps always?)?
> 
> Yes, the SMMU devices are represented in ACPI (MMU0) and (MMU1).  They
> share the same register addresses as the SMMU devices located in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 

Right but this only describes the IOMMU devices, I don't see any
information about how individual client devices relates to the various
IOMMU contexts.

> With this simple parameter checking patch, the SE falls back to using
> FIFO mode to transmit data and continues to work flawlessly.  IMHO
> this should be applied in the first instance, as it fixes a real (null
> dereference) bug which currently resides in the Mainline kernel.
> 

Per the current driver design the wrapper device is the parent of the
SE, I should have seen that 8bc529b25354 was the beginning of a game of
whac-a-mole circumventing this design. Sorry for not spotting this
earlier.

But if this is the one whack left to get the thing to boot then I think
we should merge it.

> Moving forward we can try to come up with a suitable plan to implement
> DMA in the ACPI use-case - but again, this is feature adding work
> which should be carried out against -next, where as this patch needs
> to go in via the current -rcs ASAP.
> 

Sounds good.

Regards,
Bjorn

> > > Fixes: 8bc529b25354 ("soc: qcom: geni: Add support for ACPI")
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > > Since we are already at -rc7 this patch should be processed ASAP - thank you.
> > > 
> > > drivers/soc/qcom/qcom-geni-se.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > > index d5cf953b4337..7d622ea1274e 100644
> > > --- a/drivers/soc/qcom/qcom-geni-se.c
> > > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > > @@ -630,6 +630,9 @@ int geni_se_tx_dma_prep(struct geni_se *se, void *buf, size_t len,
> > >  	struct geni_wrapper *wrapper = se->wrapper;
> > >  	u32 val;
> > >  
> > > +	if (!wrapper)
> > > +		return -EINVAL;
> > > +
> > >  	*iova = dma_map_single(wrapper->dev, buf, len, DMA_TO_DEVICE);
> > >  	if (dma_mapping_error(wrapper->dev, *iova))
> > >  		return -EIO;
> > > @@ -663,6 +666,9 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
> > >  	struct geni_wrapper *wrapper = se->wrapper;
> > >  	u32 val;
> > >  
> > > +	if (!wrapper)
> > > +		return -EINVAL;
> > > +
> > >  	*iova = dma_map_single(wrapper->dev, buf, len, DMA_FROM_DEVICE);
> > >  	if (dma_mapping_error(wrapper->dev, *iova))
> > >  		return -EIO;
> 
> -- 
> Lee Jones [?????????]
> Linaro Services Technical Lead
> Linaro.org ??? Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
