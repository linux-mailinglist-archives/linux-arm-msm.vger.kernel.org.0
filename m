Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B61052A5AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 17:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbiEQPJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 11:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349624AbiEQPJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 11:09:20 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3957B3B56C
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 08:09:19 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id f10so5724609pjs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c37zykIbAvjFJYeekhN1tO9l8rsyfkhDhDABYYW7ubQ=;
        b=IyKFIEv664GQuHoUUrx8MniZCSQahLCVahex0zoQ5/eIc3vMbL1OFDDhDNKk1nYTxn
         swUcZfWl4f7dml8rPzm9rxDkHB2h/REMY9zKXWzgbt30Pn9TdQ1KvwE0MpnxhpWIQ0vC
         CZXwCKrOF3OJ/FGH4HVr3rOP8poNBCFgCok4/hef7l9NZz04lX7KEMEjtKQcM7ByFP4L
         LsM5wrJE6BVsKID61tcU/8ogohaf5IAPbnMb9dRSkXDgoFXl26LvfPoTsi8lsOd1gTB5
         bLAuCEPBZU9JFDjRnDlqDau87RI48xnsfZGr7EP7ghv54bBagq8QHmp26XUkKtAdqOpW
         B4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c37zykIbAvjFJYeekhN1tO9l8rsyfkhDhDABYYW7ubQ=;
        b=QVBdmIS+vhgmgbsvdubdaVgpdwfJl7nmIj+cSrwgBcfZPsxAi3cNJUctfS1fW7CFeZ
         pQMZL2hd/PrGFErv5QdNR5+p1QPxzBsA+X5531reGR7/myqjVi7P+5rN57UL6/ZG7h/q
         fs7paHXIyHCSyh8z9MobilAYoXvhJmH5HLJ9bJOMXPh/Rlb9zkKej6CKo/xF/rGftpBo
         ymBE+HJyHCPHMohooL9Mf7lajbJKPMVjfRGSNJYNMIITAaWpDkOmUUys6Pt1uYLrOyqn
         1daxx69lBaEe7nucpxeWPG3Bo9zv7h3M7nFMUVBVtjqtxRQFEVUJ9HNo4C6nXEZQfft8
         LMNw==
X-Gm-Message-State: AOAM53111NV+fF4bam/qHke71gIFlLEMybwV4vkxk6tma7VhhXBbvmKX
        UYMOwfaJniOZIM1bArn1oqoZ
X-Google-Smtp-Source: ABdhPJwXpnFf4RpEJB6ZM9C6d1HomdLU+ojRr/GSDmdjVh21K4qNzcEPWLJs85sZ4veBB/fpoL88ZA==
X-Received: by 2002:a17:90b:3a86:b0:1dc:2343:2429 with SMTP id om6-20020a17090b3a8600b001dc23432429mr25390497pjb.206.1652800158569;
        Tue, 17 May 2022 08:09:18 -0700 (PDT)
Received: from thinkpad ([117.207.31.8])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902c2cc00b0015e8d4eb1ebsm9230630pla.53.2022.05.17.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:09:18 -0700 (PDT)
Date:   Tue, 17 May 2022 20:39:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     bhelgaas@google.com, lorenzo.pieralisi@arm.com, kbusch@kernel.org,
        hch@lst.de, linux-nvme@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, svarbanov@mm-sol.com,
        bjorn.andersson@linaro.org, axboe@fb.com,
        quic_vbadigan@quicinc.com, quic_krichai@quicinc.com,
        quic_nitirawa@quicinc.com, vidyas@nvidia.com, sagi@grimberg.me
Subject: Re: [PATCH 1/3] PCI: Add a flag to notify PCI drivers about
 powerdown during suspend
Message-ID: <20220517150908.GA4528@thinkpad>
References: <20220513110027.31015-2-manivannan.sadhasivam@linaro.org>
 <20220516201817.GA1047280@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516201817.GA1047280@bhelgaas>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 16, 2022 at 03:18:17PM -0500, Bjorn Helgaas wrote:
> On Fri, May 13, 2022 at 04:30:25PM +0530, Manivannan Sadhasivam wrote:
> > On some systems like Chromebooks based on Qcom chipsets, the OS may
> > powerdown all PCIe devices during system suspend for aggressive
> > powersaving. In that case, the PCI host controller drivers need to notify
> > the PCI device drivers that the power will be taken off during system
> > suspend so that the drivers can prepare the devices accordingly.
> 
> "The OS may powerdown all PCIe devices ..." makes it sound like this
> is an OS policy decision.  Where exactly (what function) is that?
> 
> Or if it's not an OS policy decision, but rather some property of the
> hardware, say that specifically.
> 

On SC7280, it is the Resource Power Manager(RPMh) that's powering the devices
down by cutting off the PCIe voltage domain. But the SC7280 RC driver itself
may put the PCIe devices into D3cold state during system suspend.
https://lore.kernel.org/lkml/CAE-0n53ho2DX2rqQMvvKAuDCfsWW62TceTaNPzv5Mn_NQ-U6dA@mail.gmail.com/T/

So to cover both cases (one is a hardware independent of SoC and another one is
the device driver), and to be generic, I've used the term "OS" after looking at
the previous flags.

Thanks,
Mani

> > One prime example is the PCI NVMe driver. This flag can be used by the
> > driver to shutdown the NVMe device during suspend and recover it during
> > resume.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  include/linux/pci.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 60adf42460ab..069caf1fe88d 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -578,6 +578,7 @@ struct pci_host_bridge {
> >  	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
> >  	unsigned int	size_windows:1;		/* Enable root bus sizing */
> >  	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
> > +	unsigned int	suspend_poweroff:1;	/* OS may poweroff devices during system suspend */
> >  
> >  	/* Resource alignment requirements */
> >  	resource_size_t (*align_resource)(struct pci_dev *dev,
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
