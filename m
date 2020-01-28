Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE5114B067
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 08:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725867AbgA1H1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 02:27:21 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38553 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725879AbgA1H1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 02:27:21 -0500
Received: by mail-pj1-f68.google.com with SMTP id m4so617449pjv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 23:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J4ysd6ZONvrJekdELS+lflS6Juecahijzrxi9ANa1zk=;
        b=fKA+/fFQ7qPq332zsF2XfZGlJykHcOpSuxmBkE3YhPAaRKVME4MH18/ew49ayqBQ6L
         7k6yukLl9hZ0z9zoqKZUg5QlTflo70PkhO9j0ZUaX257lIxB6pcDJcqPCrg+Vl2i34LP
         hxpUYbcXEJgqkFiZLnZmYHUzxlrOHMLAzeI8kpL2IfBoidoT2mCx1VF0pIQl6xf228bR
         H/GV99f45fOpOVLp2Q69+C9y99im7CtKbdYqc+Sj79BAcJHNbpRw90/wD17oTvFtwkSn
         eX6l/wkA86s235JyOx6izRC++7scd2XRbwGxMrpB90lf1ElUgUi8Kl8UcedEzwyWew2d
         z5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J4ysd6ZONvrJekdELS+lflS6Juecahijzrxi9ANa1zk=;
        b=k2VLNAJcHhJQrxmyHFgV0EYalKtVfahyUb0ANjz02MNFT4e/8WlQ7odiGsLlaA27Wz
         jyE12QFaTUCbH51MrVR1EExuP7MTAvJs3KXC7mFAxo7WetxfD75mD4dzixay+VWBiP5m
         sClaQYSoTa8mup9dwiNvllxsFffwS1ZC6QW/DfUOul5XWkty0ebOkvylxaGkwdPWQ1ZV
         M3TeQz4jGcPQrw1Na9veMZ7DcUomQwHf3CG1+zVHavdmxY7Hs774OhuROHdesYY2ZFTm
         nARxgde5UVdSUnQ2evxyaMqf2v37BeyahHcaqu+fO5MitpjUHOGObAANhf60tpSaBUkq
         sROg==
X-Gm-Message-State: APjAAAWXcfmy8q2Dd+w4A+6/uCKY1DrKNoyb9Q5MBwQ1PBdqUkpgzl3x
        RnLBFrrLDfJlzT8+/E1r51it
X-Google-Smtp-Source: APXvYqxF/o1YG/1FN9IWvc8Qyr9wyEgv6+WlfMY5+avAxYLxnnZz2I4pKbgxZObevKoML8QAwBIkCA==
X-Received: by 2002:a17:90a:7303:: with SMTP id m3mr3246741pjk.62.1580196440505;
        Mon, 27 Jan 2020 23:27:20 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:51b:fd92:c4d8:fa98:b986:266d])
        by smtp.gmail.com with ESMTPSA id n4sm18106567pgg.88.2020.01.27.23.27.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 23:27:19 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:57:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, arnd@arndb.de,
        smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200128072712.GA29071@Mani-XPS-13-9360>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <c8fdf0b0-eaec-9672-4f43-f0254d6dbf0e@codeaurora.org>
 <20200127115627.GA16569@mani>
 <c542b098-3c68-2730-87fb-1b679379f9b9@codeaurora.org>
 <20200128063757.GA27811@Mani-XPS-13-9360>
 <20200128072453.GA2103724@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128072453.GA2103724@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 08:24:53AM +0100, Greg KH wrote:
> On Tue, Jan 28, 2020 at 12:07:57PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jan 27, 2020 at 07:52:13AM -0700, Jeffrey Hugo wrote:
> > > > > MHI_EE_PBL does not appear to be defined.  Are you perhaps missing an
> > > > > include?
> > > > > 
> > > > 
> > > > It is defined in mhi.h as mhi_ee_type.
> > > 
> > > mhi.h isn't included here.  You are relying on the users of this file to
> > > have included that, in particular to have included it before this file. That
> > > tends to result in really weird errors later on.  It would be best to
> > > include mhi.h here if you need these definitions.
> > > 
> > > Although, I suspect this struct should be moved out of internal.h and into
> > > mhi.h since clients need to know this, so perhaps this issue is moot.
> > > 
> > 
> > Yep. I've moved this enum to mhi.h since it will be used by controller drivers.
> > You can find this change in next iteration.
> 
> Both of you please learn to properly trim emails, digging through 1200
> lines to try to find 2 new lines in the middle is unworkable.
> 

Oops. Sorry! Will do it for future replies.

Thanks,
Mani

> greg k-h
