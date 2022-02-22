Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C85A4BF35D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 09:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiBVITd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 03:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiBVITc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 03:19:32 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E171533B1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 00:19:07 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id j10-20020a17090a94ca00b001bc2a9596f6so1789139pjw.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0RpgV13GqW4CH/NAM61Sb/P8WRwF6jsfgBYkU/X8494=;
        b=BtIuxxaMmQ4jUX+ROZ7gUGZWW58HHgVzJrB+OgBrXYVCPp2YtV6aLeRyXAOV13nTzR
         lAlubsr2GH6P2odnEPfZ/R9xr2Leulv4vj33Z4+XQnm0NTQlsaldrPkY+0eTxRVciqpY
         IAIWbvRiOEWbjU51Di9PDZWjG4mrY0uKaBKh8iG787xgQckWaGtvbE1X02pQ9NAksvvm
         GllzKQxdy/ef//tpZC+mcyVnPzmpISPFl6+Dp/TawR+wnOIbBu9MUBVMRrEN4vvL0oIA
         LWzpcw+da+FHlX64StmwAyt/uQTjBQv4MhrC76lS+Ah4w0e0p4xnvEnBUpBC+69hzMeD
         bwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0RpgV13GqW4CH/NAM61Sb/P8WRwF6jsfgBYkU/X8494=;
        b=wbANM9faD7U1CQ2cf+yVn8XlKsRhveau2PcgxzgVIAh5nEyA4mh9tJXWcAReqpql3f
         JqQ4qcQnM9uiW0+37P0jvgNOPNo/eDAfZ2XgOCqPM+hxXfzTgrEJeWQXr0205gdoOFAH
         sBXFhEydz25EB/kFnGzcn4mJUWK79HhnWCbbbxWJz2KHiNsVWgad+DWjOQj/5X05wmZE
         T+1Jw2Ys4ynAmrrAllkIFvMGasWhmpco6nM4ZEKjQxR/GP3p5mBH2pF2BDy/NXqRrZRC
         +FU9nou9VH2mWQ5CuCpwGV+oOrCJiP0v1nhxb7w82qWuPt34TPHBzHkO/QnFQKNqfUkc
         1QEA==
X-Gm-Message-State: AOAM531tNVp/dIzT2H4P1GdFpkQqXgx3/bsF8h8MGLABTImAPZIU3Xqw
        mugYW+5BPOA3lgVxjyPFhYeZ
X-Google-Smtp-Source: ABdhPJybsRJHlzEd7+S49/pHGp1xlz06OxOcLHQN9JsCUR67mXiwPUsgi7JH+R2/DWQC0eYR+hVo/A==
X-Received: by 2002:a17:902:be0a:b0:14d:5db0:7a14 with SMTP id r10-20020a170902be0a00b0014d5db07a14mr21895118pls.155.1645517946688;
        Tue, 22 Feb 2022 00:19:06 -0800 (PST)
Received: from thinkpad ([117.217.186.202])
        by smtp.gmail.com with ESMTPSA id d8sm15219894pfl.163.2022.02.22.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 00:19:06 -0800 (PST)
Date:   Tue, 22 Feb 2022 13:48:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
        quic_cang@quicinc.com, quic_skananth@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/25] bus: mhi: ep: Add support for processing MHI
 endpoint interrupts
Message-ID: <20220222081859.GC5029@thinkpad>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-16-manivannan.sadhasivam@linaro.org>
 <d5bf8b66-e9ec-4750-9d9d-deb55cbcee94@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5bf8b66-e9ec-4750-9d9d-deb55cbcee94@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 15, 2022 at 04:39:30PM -0600, Alex Elder wrote:
> On 2/12/22 12:21 PM, Manivannan Sadhasivam wrote:
> > Add support for processing MHI endpoint interrupts such as control
> > interrupt, command interrupt and channel interrupt from the host.
> > 
> > The interrupts will be generated in the endpoint device whenever host
> > writes to the corresponding doorbell registers. The doorbell logic
> > is handled inside the hardware internally.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Unless I'm mistaken, you have some bugs here.
> 
> Beyond that, I question whether you should be using workqueues
> for handling all interrupts.  For now, it's fine, but there
> might be room for improvement after this is accepted upstream
> (using threaded interrupt handlers, for example).
> 

Only reason I didn't use bottom halves is that the memory for TRE buffers need
to be allocated each time, so essentially the caller should not sleep.

This is currently a limitation of iATU where there are only 8 windows for
mapping the host memory and each memory region size is also limited.

> 					-Alex
> 
> > ---
> >   drivers/bus/mhi/ep/main.c | 113 +++++++++++++++++++++++++++++++++++++-
> >   include/linux/mhi_ep.h    |   2 +
> >   2 files changed, 113 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > index ccb3c2795041..072b872e735b 100644
> > --- a/drivers/bus/mhi/ep/main.c
> > +++ b/drivers/bus/mhi/ep/main.c
> > @@ -185,6 +185,56 @@ static void mhi_ep_ring_worker(struct work_struct *work)
> >   	}
> >   }
> > +static void mhi_ep_queue_channel_db(struct mhi_ep_cntrl *mhi_cntrl,
> > +				    unsigned long ch_int, u32 ch_idx)
> > +{
> > +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > +	struct mhi_ep_ring_item *item;
> > +	struct mhi_ep_ring *ring;
> > +	unsigned int i;
> 
> Why not u32 i?  And why is the ch_int argument unsigned long?  The value
> passed in is a u32.
> 

for_each_set_bit() expects the 2nd argument to be of type "unsigned long".

Thanks,
Mani
