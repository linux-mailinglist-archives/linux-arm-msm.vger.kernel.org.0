Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC6FA84259
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 04:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbfHGCSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Aug 2019 22:18:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36592 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728772AbfHGCSm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Aug 2019 22:18:42 -0400
Received: by mail-pg1-f195.google.com with SMTP id l21so42593270pgm.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2019 19:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UHZy5nJsksJEcPtr5L7F2iEN0udwduLxq7fwXL+vH/4=;
        b=e5KWOZoHXgR5rR84Aj4RJbMiTvbOaTgc1/UvC8lGLTUL4a6BSCoyDyHpbwaHLEd4RG
         2jVQpJknJvKXhZ0ewXvPbFeDFCuhqygS8POMPEef1ofE2+vD19OFdRbdvgWWV0rBv6iL
         v+9lolTyzc+QoeNlxBgIBl4glae31ADxENbiKJZDK3vwrPLUVpE+xlL7CW+epI0/AWFU
         OMxJF63YvR0rvsMDCjLv9bLyuxLm8NXDjGhq1BK4Fid2voEEzhHOXdFrEwjIfN1PYc4d
         M3wix0cPmR4j2hjf144PArB+uornjOPJyaBlJw1LmZ9JY9btUUsHHAAezdoZdV7FWox1
         AjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UHZy5nJsksJEcPtr5L7F2iEN0udwduLxq7fwXL+vH/4=;
        b=ObsLHvyWkQIUbS2Ty3PkXiiIfPMrxnhvkM23A4u30aV5OvD997J7a25/sZeAE9Kot9
         SuQqQ4vmknwEZhgKioGJgsjDkZHw25FST26uGZol3W3o4nr/Vun7j3bvU08u3+Wt/jIZ
         rWvfeAnTrBNJ8hBA1OukBv9IjXu2kWmts+WVzNQM6qFpps03WCrFOawstPUttleLRJl1
         mrMNJpaI3v42X/ml0G/Qr99KHOiGfZB/sAj+feD7EyT5J4Wt90JGGJjPMYVYTpheJDPd
         gddPJSL1BWMbDStmV1mZ3KbGrajbY8V3EoAJJxPBjin1dFDkPLwn+lSDTaNuIm4JAof+
         Sa9w==
X-Gm-Message-State: APjAAAV5UKplQjKN/ZmUNIdSnXll9eelvPayNj8xxGl//d11T3NtT9oB
        rrG9xQ7weiMhb7PB+4gnKcevqLyaZvk=
X-Google-Smtp-Source: APXvYqz/rfhUPSQwiLYSlyou57kBJEt+Y1RYLdnML5Bhn+AFjOeIW4sZ66YFBsRKbaDFflmwd4879Q==
X-Received: by 2002:a17:90a:c20e:: with SMTP id e14mr6436454pjt.0.1565144321621;
        Tue, 06 Aug 2019 19:18:41 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 65sm97278838pgf.30.2019.08.06.19.18.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 19:18:40 -0700 (PDT)
Date:   Tue, 6 Aug 2019 19:18:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: socinfo: Annotate switch cases with fall
 through
Message-ID: <20190807021838.GI30636@minitux>
References: <20190807100803.63007737@canb.auug.org.au>
 <20190807012457.16820-1-bjorn.andersson@linaro.org>
 <20190807115043.2ff429c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807115043.2ff429c1@canb.auug.org.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 06 Aug 18:50 PDT 2019, Stephen Rothwell wrote:

> Hi Bjorn,
> 
> On Tue,  6 Aug 2019 18:24:57 -0700 Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> >  				   qcom_socinfo->dbg_root,
> >  				   &qcom_socinfo->info.raw_device_num);
> > +		/* Fall through */
> >  	case SOCINFO_VERSION(0, 11):
> > +		/* Fall through */
> >  	case SOCINFO_VERSION(0, 10):
> > +		/* Fall through */
> >  	case SOCINFO_VERSION(0, 9):
> 
> I don't think you need the comment between consecutive "case"s - just
> where there is actual code.
> 

You're right, will respin the patch.

Thanks,
Bjorn
