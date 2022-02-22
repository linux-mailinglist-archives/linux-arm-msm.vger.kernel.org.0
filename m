Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988004BF463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 10:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiBVJIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 04:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiBVJIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 04:08:50 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821A7149BB1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 01:08:24 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id m1-20020a17090a668100b001bc023c6f34so1767522pjj.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=af9x/iegOnzu5T2S6phAlZvFgtZ2vic5jnoB8poxuNA=;
        b=uttqi5ZtIkEXO03MMiUYjXfqkAjqzO0eww1Znl2a8Q06a9qnXJRIvUyNAqvDBtKB/B
         KI0ahffuMQOCgTctB2BbGp7F4Z6K9okSgtkzVo1n7avVTKNIu03MjdNRDtSEpzfhOG7U
         UllAM5Q7aAmk+9W5N8pP/hmmPRbXT1RltgGGeRmMFKp10QsvgnVeKf0lULSPbDLGZCbB
         StT+ZDFSyxtSBDvrO3iljCpcEZu1eANBCcOSxjtT3voBCrSc9dVYWk+C+vB9V6+BK507
         2ge0BE6HSNhCtLzoyPjJt8A3yKIn82B6Pd5EX5Q4xhdPjQgSn/56vKWknuK2jrYDWKzg
         u4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=af9x/iegOnzu5T2S6phAlZvFgtZ2vic5jnoB8poxuNA=;
        b=TDWa5hNae3CIc321FNWoHxZPKyLX7vLOVrRCzgfY5UMlCK+yXe6xpcejp0sKWxPsYt
         0XDHDARjWVHYTz3zxgPxzamnFV5WqfODoMgfkW1hK8SrfFiKHz+elLBFUHymfX6CMdjZ
         ZR4CVE+Me+ssaeRpueB0bUwUp7UgwPrGmXNGvk/Us3V5++Zpv6bUV+aknq1IYprYbh5B
         qMr04nu/tnWY5JV9fq+AP0Lylh1JaYBxX93wdvA1Dd0D4KG85C03Hi+/pY2IFe+nEruC
         9LB1k5NtOt856+lUfTYxokWU+xDGUQlKhejVGKuL1rTHg7te1RTLCmgUOIrDCaBVvUla
         BNug==
X-Gm-Message-State: AOAM532ASTSqbx5CCD+qZjCJU27ruUCZH6aj+oQ+GX8Yod7i4OeCfcvN
        nHhofHoeaBMJJJW9zaDi5VP9
X-Google-Smtp-Source: ABdhPJzcuwVH2RJUO8mXSf6vNqztfRVbk2nH2oB8Nt+hqfXKApKQnjzMsXNWHWnhnRqK8+jaNbVd5Q==
X-Received: by 2002:a17:902:9898:b0:14f:18b7:f04a with SMTP id s24-20020a170902989800b0014f18b7f04amr22208787plp.127.1645520904007;
        Tue, 22 Feb 2022 01:08:24 -0800 (PST)
Received: from thinkpad ([117.217.186.202])
        by smtp.gmail.com with ESMTPSA id b6sm16543351pfv.5.2022.02.22.01.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 01:08:23 -0800 (PST)
Date:   Tue, 22 Feb 2022 14:38:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
        quic_cang@quicinc.com, quic_skananth@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/25] bus: mhi: ep: Add support for powering up the
 MHI endpoint stack
Message-ID: <20220222090816.GD5029@thinkpad>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-17-manivannan.sadhasivam@linaro.org>
 <10240bc5-ef9f-7555-402e-57ca2b0b0a14@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10240bc5-ef9f-7555-402e-57ca2b0b0a14@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 15, 2022 at 04:39:37PM -0600, Alex Elder wrote:
> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
> > Add support for MHI endpoint power_up that includes initializing the MMIO
> > and rings, caching the host MHI registers, and setting the MHI state to M0.
> > After registering the MHI EP controller, the stack has to be powered up
> > for usage.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Very little to say on this one.		-Alex
> 
> > ---
> >   drivers/bus/mhi/ep/internal.h |   6 +
> >   drivers/bus/mhi/ep/main.c     | 229 ++++++++++++++++++++++++++++++++++
> >   include/linux/mhi_ep.h        |  22 ++++
> >   3 files changed, 257 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/ep/internal.h b/drivers/bus/mhi/ep/internal.h
> > index e4e8f06c2898..ee8c5974f0c0 100644
> > --- a/drivers/bus/mhi/ep/internal.h
> > +++ b/drivers/bus/mhi/ep/internal.h
> > @@ -242,4 +242,10 @@ int mhi_ep_set_m0_state(struct mhi_ep_cntrl *mhi_cntrl);
> >   int mhi_ep_set_m3_state(struct mhi_ep_cntrl *mhi_cntrl);
> >   int mhi_ep_set_ready_state(struct mhi_ep_cntrl *mhi_cntrl);
> > +/* MHI EP memory management functions */
> > +int mhi_ep_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, size_t size,
> > +		     phys_addr_t *phys_ptr, void __iomem **virt);
> > +void mhi_ep_unmap_free(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr, phys_addr_t phys,
> > +		       void __iomem *virt, size_t size);
> > +
> >   #endif
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c

[...]

> > +
> > +static void mhi_ep_enable_int(struct mhi_ep_cntrl *mhi_cntrl)
> > +{
> 
> Are channel doorbell interrupts enabled separately now?
> (There was previously an enable_chdb_interrupts() call.)
> 

Doorbell interrupts are enabled when the corresponding channel gets started.
Enabling all interrupts here triggers spurious irqs as some of the interrupts
associated with hw channels always get triggered.

Thanks,
Mani
