Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1221CDDDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgEKO4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 10:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728090AbgEKO4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 10:56:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62272C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 07:56:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fu13so7909739pjb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wg7i0uYEgGTxcwiHe0tQv/4KUTivW4+lL3Gn+5LChkM=;
        b=uuCuGk0PBQrl6oec+v2wFB3iP06ZToVXDzjyDlK+B6UyOY9sbdCyo++EgEDPGgGKVN
         HQAKZ2QBl4LRSUGAWXhIiEuwSeRU1RT9NQsAfmK3Kb6yVBkSPXUAA83vPhxpN8t84z6I
         uGiVm/qmDLVjUt9R78FyCgvnv3LEA2/OCUg4Vm5cAdnPw6tn6SiVcpYLCvScBpkSoJqh
         K1ESIywzpTvXtrU34Cn1cEW7LZ02mb7gth0box0iQQjizAh8qKqqcB8TCm0Dezx/zWVs
         yCAA5yRhcVacTNB3Y3XcDJWheaHiQnDV6tn0mq8JiAFih1M4rxtFsgEOxQi+wDaqDmBG
         UXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wg7i0uYEgGTxcwiHe0tQv/4KUTivW4+lL3Gn+5LChkM=;
        b=aCju8/R24lsIqIT7MJSt7UJ8TNcEmtfri6Kql0CYDWkuex1mfbDJRW2elcgdXcxhsc
         QMiTbV6QbeSA2l6RkYTQ3iOQtT1Jy0Avt3a46maG8SToDMA7WNmYUSqH4DjWhdfoJHVv
         yZlHf5P3CLqAr9Ikas9rMKfo3VoZvQZllOlvy00vFDMjFaq8zgpB4C5aZOrY/IsFoFoJ
         0mg9+Cjwd96dSjC6NUYP6C+P+mAxgQGW46Y7163oztk0fvedeB0sJ2jUbmfzg1uF0pzD
         FLhA25w/G/Xwej8oXX0vj+d9/0KKE90p4KsRJjQssByDNKUS3GbPVpQoYvn7ud8R8Jtr
         vg+g==
X-Gm-Message-State: AGi0PubgMBB4Xqk8fIoYNTZdMmQu9eMfCjwypKSPATb2awJDU4Eg+d8E
        c4cznJM+FOxso6Ti5qMQMH5k
X-Google-Smtp-Source: APiQypJV5DZGOwTixJi0eBjLFq6rgoPkFiCpHGr58Je5xU4iNVih1PY/ovTG7n2alcKq2yKQ8tg0aw==
X-Received: by 2002:a17:90a:23ad:: with SMTP id g42mr24334760pje.35.1589209009724;
        Mon, 11 May 2020 07:56:49 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:28b:647d:9464:e66e:7157:1965])
        by smtp.gmail.com with ESMTPSA id b16sm9487239pfi.74.2020.05.11.07.56.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 07:56:49 -0700 (PDT)
Date:   Mon, 11 May 2020 20:26:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Walter Harms <wharms@bfs.de>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] bus: mhi: core: Fix some error return code
Message-ID: <20200511145641.GA6865@Mani-XPS-13-9360>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>
 <20200511103124.GA12753@mani>
 <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d3f7d7be1849138df7dcf9d49177b5@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 02:26:10PM +0000, Walter Harms wrote:
> Hello guys,
> some nitpicking ...
> the prefered kernalstyle is:
> 
> if (condition)
>    set error_code
>    do something
> 
> from what i can see it is
> 
>  set error_code
>       if (condition)
> 

There are multiple error paths which share the same error code. So I don't
see any benefit of setting same error code in all the paths.

The recommended style makes perfect sense for an error path which has a unique
error code but not for the above.

Thanks,
Mani

> jm2c
>  re,
>  wh
> 
> ________________________________________
> Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Gesendet: Montag, 11. Mai 2020 12:31:24
> An: Wei Yongjun
> Cc: Hemant Kumar; Jeffrey Hugo; Greg Kroah-Hartman; Sujeev Dias; Siddartha Mohanadoss; linux-arm-msm@vger.kernel.org; kernel-janitors@vger.kernel.org; Hulk Robot
> Betreff: Re: [PATCH -next] bus: mhi: core: Fix some error return code
> 
> On 0509, Wei Yongjun wrote:
> > Fix to return negative error code from the error handling case
> > instead of 0 in mhi_init_dev_ctxt() and mhi_driver_probe().
> >
> > Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
> > ---
> >  drivers/bus/mhi/core/init.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index eb2ab058a01d..1f8c82603179 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -291,6 +291,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
> >       }
> >
> >       /* Setup cmd context */
> > +     ret = -ENOMEM;
> >       mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
> >                                               sizeof(*mhi_ctxt->cmd_ctxt) *
> >                                               NR_OF_CMD_RINGS,
> > @@ -1100,6 +1101,7 @@ static int mhi_driver_probe(struct device *dev)
> >               }
> >       }
> >
> > +     ret = -EINVAL;
> >       if (dl_chan) {
> >               /*
> >                * If channel supports LPM notifications then status_cb should
> >
> >
> >
