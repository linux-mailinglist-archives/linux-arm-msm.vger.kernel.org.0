Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9500435D44B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Apr 2021 02:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239448AbhDMAGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 20:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237762AbhDMAGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 20:06:31 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF749C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 17:06:12 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 125-20020a4a1a830000b02901b6a144a417so3437691oof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 17:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8fxzT0uDrVTZBSQzxnvbCG//UD0EW3zTDTfE8VxsHrc=;
        b=hjwYNlWWZKfcv2jU4VNMOZ60EHaQpSYRZYAmnsiyFrZuBjUnjHeJSL0nOJ2VKUmjUl
         Z8riG/xcb9KBQVHI6N2Ego7tvElHpe6Njq2rgxKUS3RqOgOgjzAW4vtNRrbsimTpbkxI
         j24++xNm0Yh6dXBGNdT1lNynHNA+juSm6Jb0lO/7gxQ8cHogdfas6Sy3sL/egZ6MRJ/Y
         5aXsKHoVhwR8S5EJceL7EPQe0sEU0YsYMp5D2S0PbsbiTLn2TBmQXzUDSVTp01BaUn90
         TLeJOGVhACbUl9T7uipnvddSGQ6ym4ttDHgrRaHBfAoQlT3BNRbPqCYuOa67DQB0pizH
         fIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8fxzT0uDrVTZBSQzxnvbCG//UD0EW3zTDTfE8VxsHrc=;
        b=hybYMN0wcEIgfz9hmOFNFO6mU7AiY+DGp7m6rCATTETr9/bdMuiCJfwglvw93Aa61U
         y7T/kDJ6Zi9f7qN82OVDxDFsR+ubr4U4OnEEFmh7vHV4dZEVLlQrFhtd3eIUPHXlMQbv
         FlHE3fR+wXu5ExW7MwPGTUOqI1G9koQS6lod2stSqsGLHq47jE0Yf73j407AWPZScw8B
         jOMTKD+ot8ssDp9AgKNbruIonoKS0TrwVyRCQBUDAsvurQCZfLcxiteKUV71kMypAg9q
         Wo3i2UK55cUcCHsEfKzKj1IO1FZVxXNgdvcp4A31MJ4KCxq0/JXPDdcCl270ztay24PV
         Mg4Q==
X-Gm-Message-State: AOAM530UxBEvpyE4FCWSg64+afqxG67JzKOfwEF62+krQmT3ArjK2vC8
        1CDw9GrOKak6jy7kwQqfqXEhUw==
X-Google-Smtp-Source: ABdhPJxttMmrIFUBQ2/jJF76W75whagEnk4Y+SUZP3EtUsqpzT+YH+C6AAjdM/AtBBZ+j8G+HV9u6Q==
X-Received: by 2002:a4a:bc92:: with SMTP id m18mr1826918oop.55.1618272372130;
        Mon, 12 Apr 2021 17:06:12 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s3sm2513396ool.36.2021.04.12.17.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 17:06:11 -0700 (PDT)
Date:   Mon, 12 Apr 2021 19:06:09 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Deepak Kumar Singh <deesin@codeaurora.org>, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 1/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <20210413000609.GG1538589@yoga>
References: <1617344238-12137-1-git-send-email-deesin@codeaurora.org>
 <1617344238-12137-2-git-send-email-deesin@codeaurora.org>
 <YGn0wBkOOILgaq5w@builder.lan>
 <20210409073153.GE4376@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409073153.GE4376@work>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Apr 02:31 CDT 2021, Manivannan Sadhasivam wrote:

> On Sun, Apr 04, 2021 at 12:17:52PM -0500, Bjorn Andersson wrote:
> > On Fri 02 Apr 01:17 CDT 2021, Deepak Kumar Singh wrote:
> > 
> > > Not all upcoming usecases will have an interface to allow the aoss
> > > driver to hook onto. Expose the send api and create a get function to
> > > enable drivers to send their own messages to aoss.
> > > 
> > > Signed-off-by: Chris Lew <clew@codeaurora.org>
> > > Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> > > ---
> > >  drivers/soc/qcom/qcom_aoss.c | 36 +++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 35 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> > > index 53acb94..5c643f0 100644
> > > --- a/drivers/soc/qcom/qcom_aoss.c
> > > +++ b/drivers/soc/qcom/qcom_aoss.c
> > > @@ -8,10 +8,12 @@
> 
> [...]
> 
> > > +	pdev = of_find_device_by_node(np);
> > 
> > of_find_device_by_node() will increment the refcount of the underlying
> > struct device of pdev, so you need to platform_device_put() once you're
> > done with it.
> > 
> > As a side effect of not putting the struct device, the devm_kzalloc'ed
> > qmp pointer will remain valid. So care is needed to make sure that the
> > client doesn't end up with a dangling pointer if the qmp device is
> > removed.
> > 
> > My suggestion is that you add a "qmp_put()" function, which invokes
> > platform_device_put() and that you add some sort of tracking ("bool
> > orphan"?) to the struct qmp and make qmp_send() fail if this is set.
> > 
> 
> I think this is a duplication of what the struct device offers. Why
> can't we use the generic infrastructure for this usecase?
> 
> Like using device_initialize() in qmp_probe() along with a release
> callback for "struct device", then using get_device() in qmp_get().
> Then there should also be a qmp_put() API which calls put_device() to
> decrease the refcount.
> 
> Ideally, the final refcount should be dropped in qmp_remove() and then
> the release callback will be called automatically to free "struct qmp".
> 
> > That way if someone unbinds the aoss device, the client will still have
> > a "valid" pointer, but won't be able to qmp_send() after qmp_close() has
> > been called in the aoss remove function.
> > 
> 
> How can someone remove the qmp device if a client is holding its reference?
> 

The device could be unbound using sysfs, in which case remove() is
called and I assumed that devres wouldn't be released until the struct
device's refcount hit 0.

Apparently this does not seems to be how it works, following the unbind
path I see that devres is shot down regardless of the struct device's
refcount.

So we would need to ensure that struct qmp is refcounted on its own.
For this we don't need a separate struct device, we can simply add a
kref to the struct and avoid using devres to keep track of its lifetime.

Regards,
Bjorn

> Thanks,
> Mani
> 
> > Regards,
> > Bjorn
> > 
> > > +	if (!pdev)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	qmp = platform_get_drvdata(pdev);
> > > +	return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> > > +}
> > > +EXPORT_SYMBOL(qmp_get);
> > > +
> > >  static int qmp_probe(struct platform_device *pdev)
> > >  {
> > >  	struct resource *res;
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
