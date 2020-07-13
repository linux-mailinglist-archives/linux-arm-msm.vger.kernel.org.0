Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48DB21E003
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 20:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgGMSok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 14:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbgGMSok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 14:44:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18034C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 11:44:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so282384pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tLX8O7u4HG3oJutmzS/3ks9fr4x8cW4dpW31dsdrzm8=;
        b=vDvPVGc+HzTlKuUpgJ31Ow90USeYsR0dL2NviScR0mAwqICSYVNRAPTzB9A4PPzdpB
         kK6RWKOvY6NQxrOzD/axa9BK17sZDx5UNLOz81LTdy+ew8gWIFsAXXG1stNhTS77oLoj
         UxmmsNE029CabzEytOyy853z+YM8tjrEjlePjMiv9AwwoRiX0M4u3NYzDBlfame79vag
         zFv1nzgTHaHVwGVIW9PjeDj5VxI/5o3SHtYxcEn4tI8bYa4EQMr23lcPwCMEYMgae+rb
         FqxUjlp3LfhaIDkjwxEaymUTDtrKHblafr5O9zzIR9wY83+eG6rFneHyCUSmEPXwjLn0
         /j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tLX8O7u4HG3oJutmzS/3ks9fr4x8cW4dpW31dsdrzm8=;
        b=d2o5ndObhbySB5iw/NFcgyH/eJAweMW3sMgSEkFIcUtdpE/RDKQnmDgV9th5yqGqQ0
         EVWDnj4XZStO9rPkXHOOr0U8VNUpsksWY+QGegfKO/K1Spv/77/RRbpXWaAYUnf/aIVB
         inT9ofc1uSWoef/r7+DVgfA+hn6l0HA1SrDyWQ3msRefL9/f2JO+Ig/VKUuzyNljpNUs
         jRrRquNoaaFwCZLU4DvbJPELOTKc0nvVyplRw/xTMzXoFP72K87DO72Pqkd7/z5tgTl/
         msqOKESv4UufSJ3gW9X2CpsRopAXDcHf+gBO9zcSW90sfZ1ZYYllZi5K21CLKBWaQP5U
         X8rQ==
X-Gm-Message-State: AOAM533dNC51utqROfezYvUbeNgFBb5e85oVEvmXqefmTb3IIqjY5JWP
        Kv9QWjJxhmDK3XulZLnGT6hL8A==
X-Google-Smtp-Source: ABdhPJyRkCJPUu0eTqNQFd/kkk8ISMpy6OIWqkpqFVqukFgwI97BsvcmN4kHAC/1s2o/Fqmby9OEmw==
X-Received: by 2002:a17:90a:e60b:: with SMTP id j11mr753528pjy.189.1594665879339;
        Mon, 13 Jul 2020 11:44:39 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h15sm15371601pfo.192.2020.07.13.11.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:44:38 -0700 (PDT)
Date:   Mon, 13 Jul 2020 11:42:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Jonathan McDowell <noodles@earth.li>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom_scm: Fix legacy convention SCM accessors
Message-ID: <20200713184230.GB1218486@builder.lan>
References: <20200704172334.GA759@earth.li>
 <d38c8e7c-443c-33f0-be8d-dedd58dd4fe1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38c8e7c-443c-33f0-be8d-dedd58dd4fe1@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Jul 09:35 PDT 2020, Elliot Berman wrote:

> For the Qualcomm TrustZone firmwares which I am familiar with:
> 
> Reviewed-by: Elliot Berman <eberman@codeaurora.org>
> 

Thanks for the patch Jonathan and thanks for the review Elliot!

Applied

Regards,
Bjorn

> On 7/4/2020 10:23 AM, Jonathan McDowell wrote:
> > The move to a combined driver for the QCOM SCM hardware changed the
> > io_writel and io_readl helpers to use non-atomic calls, despite the
> > commit message saying that atomic was a better option. This breaks these
> > helpers on hardware that uses the old legacy convention (access fails
> > with a -95 return code). Switch back to using the atomic calls.
> > 
> > Observed as a failure routing GPIO interrupts to the Apps processor on
> > an IPQ8064; fix is confirmed as correctly allowing the interrupts to be
> > routed and observed.
> > 
> > Fixes: 57d3b816718c ("firmware: qcom_scm: Remove thin wrappers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jonathan McDowell <noodles@earth.li>
> > ---
> >  drivers/firmware/qcom_scm.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> > index 0e7233a20f34..d4fda210adfe 100644
> > --- a/drivers/firmware/qcom_scm.c
> > +++ b/drivers/firmware/qcom_scm.c
> > @@ -391,7 +391,7 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
> >  
> >  	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
> >  
> > -	return qcom_scm_call(__scm->dev, &desc, NULL);
> > +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
> >  }
> >  
> >  static void qcom_scm_set_download_mode(bool enable)
> > @@ -650,7 +650,7 @@ int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
> >  	int ret;
> >  
> >  
> > -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> > +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
> >  	if (ret >= 0)
> >  		*val = res.result[0];
> >  
> > @@ -669,8 +669,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
> >  		.owner = ARM_SMCCC_OWNER_SIP,
> >  	};
> >  
> > -
> > -	return qcom_scm_call(__scm->dev, &desc, NULL);
> > +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
> >  }
> >  EXPORT_SYMBOL(qcom_scm_io_writel);
> >  
> > 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
