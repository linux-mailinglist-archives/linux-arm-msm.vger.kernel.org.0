Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113093AECB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 17:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFUPqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 11:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhFUPqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 11:46:40 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F756C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 08:44:26 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id u18so8589419pfk.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iLz/fFs/yg8H3xxZ5YK11XwhdR3jkeJwxgG4RwJDt1U=;
        b=xSQ+SMNshjZROfDQets3EVhlYLBlez45Wct+iuKtuI5dCdONggHP32xDvOCUYCY/i4
         SDdI3lWcT/CixWXgOG+fxyud+2qebr6nRzy0G932TLyut3uIdtLIXBhVsC0Zknqe4TMf
         GDX0A2Qufx7aoC6YpOm4Woz2vDUlHSEO7X0Pe+eYfPGNe13feTCDNDOtP9jwBVIu9VMp
         sF8NyfuP/rWZeiVZr1a+K8J025d9gwLZKDiXcE70h2xl8Ic5ds9qSUJo190+QzFPZ9bc
         MfPM91guIW+/B2h2VPBo1G5YnmZYwDR1EBvhKJanbPEDTGxdbVMVR7yNVDPLBDHnU7KR
         xvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iLz/fFs/yg8H3xxZ5YK11XwhdR3jkeJwxgG4RwJDt1U=;
        b=mPowcqW+YnIk6PrQGmDZTfAbNfVJcpEXIrO1HQoos2JE8zcMDe//fu9iN3MxcwInYb
         OpWntnlDgom/+hLLROMTHgyRcdpbdWwLn1vV7JLwbwSmzMe8Xfj2lazH916MTk50Ztsn
         BLGkMhoTm/QhJW0hiEu+4/LstyDVmTU0FOLYLVMSjkHbVAMNnj/AjOkEHttZLy2ahz2h
         A+GEZWNB0eyA/lYBhMtE+pBpR4n7eqHNJawDdGqLyqApGh5Uz+vqTFSz5ZP0Tco41cmw
         l4ty3iDNVg01V5NyzuNUJ016ayAsmt7Dd45V/jvPi7aVsXRJ1oAHFpWt2HtGi7YZWRtI
         aEjw==
X-Gm-Message-State: AOAM531R2DkFioZavPBsy6E8weIrEK6+Eu4RdLbU5/P1i4AU8Rz3pKaf
        ZbiFy1soqTLsRR8BRhENlItN
X-Google-Smtp-Source: ABdhPJzEAwXM9SYf5mfiBU6Qh55syNlpoM7HJykBkZx6KQMSryvju/w+hwiBAtOqHwhN54WRWji8tg==
X-Received: by 2002:a63:508:: with SMTP id 8mr19859685pgf.308.1624290265622;
        Mon, 21 Jun 2021 08:44:25 -0700 (PDT)
Received: from workstation ([120.138.13.116])
        by smtp.gmail.com with ESMTPSA id h21sm15048963pfv.190.2021.06.21.08.44.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 08:44:25 -0700 (PDT)
Date:   Mon, 21 Jun 2021 21:14:22 +0530
From:   "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To:     ULRICH Thomas <thomas.ulrich@thalesgroup.com>
Cc:     "hemantk@codeaurora.org" <hemantk@codeaurora.org>,
        SCHEMMEL Hans-Christoph <hans-christoph.schemmel@thalesgroup.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Add Cinterion MV31-W PCIe to MHI
Message-ID: <20210621154422.GB20545@workstation>
References: <PAZP264MB284690134DA010698E6B3BDDE60A9@PAZP264MB2846.FRAP264.PROD.OUTLOOK.COM>
 <20210621151629.GA20545@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621151629.GA20545@workstation>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 08:46:29PM +0530, manivannan.sadhasivam@linaro.org wrote:
> + linux-arm-msm
> 
> On Mon, Jun 21, 2021 at 09:04:17AM +0000, ULRICH Thomas wrote:
> > This patch adds VendorID/ProductID and MBIM Channel Definitions for M.2 Modem Card (PCIe Variant) to MHI:
> > Cinterion MV31-W (by Thales)
> > Additional information on such Modem Card (USB or PCIe variant) is e.g. available at:
> > https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high
> > 
> > Signed-off-by: Thomas Ulrich <thomas.ulrich@thalesgroup.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 

There were multiple checkpatch errors while trying to apply this patch.
But I just fixed them and applied. Please make sure to run checkpatch.pl
script for future patches.

Thanks,
Mani

> > 
> > ---
> >  drivers/bus/mhi/pci_generic.c | 37 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 56f710763e36..5e263794d4c5 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> 
> [...]
> 
> > +static const struct mhi_pci_dev_info mhi_mv31_info = {
> > +        .name = "cinterion-mv31",
> > +        .config = &modem_mv31_config,
> > +        .bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> > +        .dma_data_width = 32
> 
> As per 704d98540e55, there needs to be:
> 
> 	.sideband_wake = false,
> 
> I'll add it while applying.
> 
> Thanks,
> Mani
> 
> > +};
> > +
> >  static const struct pci_device_id mhi_pci_id_table[] = {
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
> >  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> > @@ -369,6 +403,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
> >  	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
> >  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
> >  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> > +        /* MV31-W (Cinterion) */
> > +        { PCI_DEVICE(0x1269, 0x00b3),
> > +                .driver_data = (kernel_ulong_t) &mhi_mv31_info },
> >  	{  }
> >  };
> >  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> > -- 
> > 2.20.1
> > 
