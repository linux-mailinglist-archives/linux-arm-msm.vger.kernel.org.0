Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0FE4B9FA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 13:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiBQMFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 07:05:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiBQMFA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 07:05:00 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B6D6168
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 04:04:46 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id k60-20020a17090a4cc200b001b932781f3eso6214474pjh.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mpkGaHYhzDT/ywTqBANboh+oafdc1Ua2ViLPT/QoCeg=;
        b=eaq+/s/imLxDnW1yvcbqmJSkDOtbiRD9g5qyu4gLTnTKG6y22OTiQ5PEVi8uJ/iPZi
         nKNJbuG5j2sqnSldTwlrbJv1XSXNIjvx8dOydio2AYa21EvypE5oNSDqQtT4r5PkaYLd
         jpQojSfKwHlR5BwPE0G65igiyIzUXwBTsV/ky9f1opwVe17pTyqGj6gYWExRQ2b2+SVL
         kg4AZ22HB4ZLnbozYKCCI+xzdPTTmHMQiM0KOTOll8DnTNYMv/avIw4E533gOYTGLlnK
         BkFADZzt/uHWqkIkKBwIWWijHfTLpTHs0GLOjP0/GJ/5Nqu4nhKMgkV3zaGMMoy/+MHv
         2gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mpkGaHYhzDT/ywTqBANboh+oafdc1Ua2ViLPT/QoCeg=;
        b=sEeIodNhyW3OORKN+767LazVKyl3RB3M5+iWsIk5yWyRC99YRiQlB1rOHvzxeztQJA
         9B1+Oc/GDoFoItcCyv7uBF1ye0Vf39HdWKR2K1+PLiO+JDh4HkXoTs3VoKE/mUn62Eh9
         QZN0zZ4hm3H2++j9+GL5aj/0grN4g4gTP7XoFmjW63sRVs88u0+ibpk7yrgcnlZCV5Mx
         6TRxyKwKPFhm6+mlF3zgnnnSzE7p4/UQfQ+pAJ+BxsdWSYXeB+tH2sOpdNa1wY1ac4Md
         yudBk75aQZvdgtLmuzv7uznCvSzDkrCBRKwerhh+qT3jWO0a9VFwi8rLICjOlWSNOKU7
         XYwQ==
X-Gm-Message-State: AOAM531XtUneLXGAm+cuLdu4exxtVmSarTfh9TzxgSlNMXkcXT+vjA9D
        zhje51ukbxtQcqGWQhoswXfQ
X-Google-Smtp-Source: ABdhPJzcVHEw66R2MLVUG9O9nL5wzGMkOiCICyWXg/OIVTdHnj+ROhHdrr2oeqInTOgJxE2iDmBbdQ==
X-Received: by 2002:a17:902:bb89:b0:14d:85a7:6eea with SMTP id m9-20020a170902bb8900b0014d85a76eeamr2506343pls.158.1645099485450;
        Thu, 17 Feb 2022 04:04:45 -0800 (PST)
Received: from workstation ([117.193.211.41])
        by smtp.gmail.com with ESMTPSA id mv17sm1336990pjb.14.2022.02.17.04.04.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Feb 2022 04:04:44 -0800 (PST)
Date:   Thu, 17 Feb 2022 17:34:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
        quic_cang@quicinc.com, quic_skananth@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/25] bus: mhi: ep: Add support for creating and
 destroying MHI EP devices
Message-ID: <20220217120439.GC11964@workstation>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-11-manivannan.sadhasivam@linaro.org>
 <1cdd8e0c-85d7-dd91-a6f1-1390e7854350@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cdd8e0c-85d7-dd91-a6f1-1390e7854350@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 15, 2022 at 02:02:57PM -0600, Alex Elder wrote:

[...]

> > +
> > +	mhi_dev = mhi_ep_alloc_device(mhi_cntrl, MHI_DEVICE_XFER);
> > +	if (IS_ERR(mhi_dev))
> > +		return PTR_ERR(mhi_dev);
> 
> It looks like the only possible error is no memory, so you could
> just have mhi_ep_alloc_device() return NULL.
> 

I think returning the actual error is more safe as we may end up adding more
stuff into this function in the future.

> > +
> > +	/* Configure primary channel */
> > +	mhi_dev->ul_chan = mhi_chan;
> > +	get_device(&mhi_dev->dev);
> > +	mhi_chan->mhi_dev = mhi_dev;
> > +
> > +	/* Configure secondary channel as well */
> > +	mhi_chan++;
> > +	mhi_dev->dl_chan = mhi_chan;
> > +	get_device(&mhi_dev->dev);
> > +	mhi_chan->mhi_dev = mhi_dev;
> > +
> > +	/* Channel name is same for both UL and DL */
> > +	mhi_dev->name = mhi_chan->name;
> > +	dev_set_name(&mhi_dev->dev, "%s_%s",
> > +		     dev_name(&mhi_cntrl->mhi_dev->dev),
> > +		     mhi_dev->name);
> > +
> > +	ret = device_add(&mhi_dev->dev);
> > +	if (ret)
> > +		put_device(&mhi_dev->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mhi_ep_destroy_device(struct device *dev, void *data)
> > +{
> > +	struct mhi_ep_device *mhi_dev;
> > +	struct mhi_ep_cntrl *mhi_cntrl;
> > +	struct mhi_ep_chan *ul_chan, *dl_chan;
> > +
> > +	if (dev->bus != &mhi_ep_bus_type)
> > +		return 0;
> > +
> > +	mhi_dev = to_mhi_ep_device(dev);
> > +	mhi_cntrl = mhi_dev->mhi_cntrl;
> > +
> > +	/* Only destroy devices created for channels */
> > +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> > +		return 0;
> > +
> > +	ul_chan = mhi_dev->ul_chan;
> > +	dl_chan = mhi_dev->dl_chan;
> 
> Aren't they required to supply *both* channels?  Or maybe
> it's just required that there are transfer callback functions
> for both channels.  Anyway, no need to check for null, because
> the creation function guarantees they're both non-null I think.
> 

mhi_ep_destroy_device() will be called for each device separately. So we
must check for NULL.

Thanks,
Mani
