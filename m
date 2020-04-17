Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99EE1ADAD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 12:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgDQKT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 06:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728102AbgDQKT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 06:19:26 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8313C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 03:19:25 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x26so889580pgc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2020 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ty9TQTjWvzY6Grz85/BgM3W5FIy2Fq6407pZyTtwzbI=;
        b=q6vYtPsi279r4gZwjmK0lADCWk83Aw27TpjFuR486x9Fg/jSQQlsq/M2M5DT8I1i6A
         GP2CaI4PxrPfnJh9JKKc/O/0F74VEavRqOkopFpywlIc4bYY2CeWisrFDsZaugLcONKb
         cTM0F5iqpKJA+DvX58EfjOfUimrYmh6HTTOxVMc9ETn9ERuDhiAU3XvVrxnKJnQjxOj+
         khU8tqSMb6T+kXPhUVClXoCdJmWKtkq4sjlivMoymuKYDBi3B0AKFGYDYGaqRLqCyATS
         /4juFM6A1gSeluMNtix0QqAjV8xLmJh8aQT4ujp6BOcwFHNJRor/q0MIGWZx+C1FqY6D
         IyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ty9TQTjWvzY6Grz85/BgM3W5FIy2Fq6407pZyTtwzbI=;
        b=NMA86I7UEeRgod6Wi2+HQUBki+WJ1kIiRW0LdWDO35E1S2jPY8Nj3k9/hWDkRllvT6
         YB+aSYiUawVA4/4VVCsjdZgqEg0kzQ11etD/Px9Z6n/LzSXSubJf23p5b5QA+4xvIWxx
         LANTXTh9oYmKFHKM/Ka/ZlZGYChRec2eJUxPu79PoV5Cjwx1q0uIZ2G2oFm5qcWJN4NC
         /ZoQ8h3euizLcIzvp6KMBQSopRVfXl/5Qf/xApUhzYBIuOTPoVXtU7JcvJC0onqmWDYK
         /8kx5MIzw/PUf6bQdUagFy8MU+gktMZ0R/0Z5UxrEqqN6WYD+g/3RSHMmcAGsXCk4/LL
         CrRw==
X-Gm-Message-State: AGi0PuZTIRt9oEiBR1syzr1Z+bxqeIsYaVBA/DvOUKZyDOR0Gnbtoe5e
        re3pdYlJU2M15HxteSLdesms4oAnBg==
X-Google-Smtp-Source: APiQypLivRS+jr84KCVU43CbZvx9g2aVlPNj8F7+dQWJd7s2CaFzd1iu/pT3ZiHkUrXBKLVSSTbH4Q==
X-Received: by 2002:a63:d742:: with SMTP id w2mr2129826pgi.401.1587118765122;
        Fri, 17 Apr 2020 03:19:25 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:630d:b86f:218c:c3f8:1490:7b19])
        by smtp.gmail.com with ESMTPSA id x25sm17011580pfm.203.2020.04.17.03.19.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 03:19:24 -0700 (PDT)
Date:   Fri, 17 Apr 2020 15:49:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     jhugo@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, smohanad@codeaurora.org,
        dan.carpenter@oracle.com
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix parsing of mhi_flags
Message-ID: <20200417101918.GB10295@Mani-XPS-13-9360>
References: <20200413120741.2832-1-manivannan.sadhasivam@linaro.org>
 <73d4815e-af00-e4cd-95c5-5043d334224c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73d4815e-af00-e4cd-95c5-5043d334224c@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 16, 2020 at 12:01:30PM -0700, Hemant Kumar wrote:
> Hi Mani,
> 
> On 4/13/20 5:07 AM, Manivannan Sadhasivam wrote:
> > With the current parsing of mhi_flags, the following statement always
> > return false:
> > 
> > eob = !!(flags & MHI_EOB);
> > 
> > This is due to the fact that 'enum mhi_flags' starts with index 0 and we
> > are using direct AND operation to extract each bit. Fix this by using
> > BIT() macro to extract each bit and make the mhi_flags index start from 1.
> > 
> > Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/mhi/core/main.c | 6 +++---
> >   include/linux/mhi.h         | 2 +-
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > index eb4256b81406..4165a853c189 100644
> > --- a/drivers/bus/mhi/core/main.c
> > +++ b/drivers/bus/mhi/core/main.c
> > @@ -1090,9 +1090,9 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> >   	if (ret)
> >   		return ret;
> > -	eob = !!(flags & MHI_EOB);
> > -	eot = !!(flags & MHI_EOT);
> > -	chain = !!(flags & MHI_CHAIN);
> > +	eob = !!(flags & BIT(0));
> > +	eot = !!(flags & BIT(1));
> > +	chain = !!(flags & BIT(2));
> 
> How about setting enums  with BIT macro and still use same enums above. If
> flags is having MHI _CHAIN (enum value 3) but comparing with BIT(2) (value
> 4) will not work.
> 

Doh, you are right. Will fix it!

Thanks,
Mani

> >   	bei = !!(mhi_chan->intmod);
> >   	mhi_tre = tre_ring->wp;
> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > index ad1996001965..22185fecbbf2 100644
> > --- a/include/linux/mhi.h
> > +++ b/include/linux/mhi.h
> > @@ -53,7 +53,7 @@ enum mhi_callback {
> >    * @MHI_CHAIN: Linked transfer
> >    */
> >   enum mhi_flags {
> > -	MHI_EOB,
> > +	MHI_EOB = 1,
> >   	MHI_EOT,
> >   	MHI_CHAIN,
> >   };
> 
> enum mhi_flags {
> 
>     MHI_EOB = BIT(0),
> 
>     MHI_EOT = BIT(1),
> 
>     MHI_CHAIN = BIT(2),
> 
> }
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
