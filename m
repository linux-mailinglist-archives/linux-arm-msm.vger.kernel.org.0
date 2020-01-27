Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B6C149F20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 08:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgA0HLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 02:11:02 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:35144 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgA0HLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 02:11:02 -0500
Received: by mail-pj1-f67.google.com with SMTP id q39so2739490pjc.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2020 23:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qqKrSdPy25zHcvjpMggBFceNxg6/75a+o1jN+qDX4I0=;
        b=Ria3P38ts/aSCoYbFuy7ccyT9jc7KqaGgT/Hd6XhdP3kyCImT1ovndDtdNBaZ61LoL
         HMxrq8LYk7UHuAhFGeLGEGoNcNVqe0ucvgG4An2KbYsJ/38IXQKxBuqlTuN2Mw/OUWkd
         qW9E4KRyYTFqLBrDqIRshaDE9/h5zLam4E3JSUKR8f3b0obkv+CGP8U0UXgOva81kY/E
         nDCZAMIdYfwNe0VDITZGVJFmfRCbbC4RbByh+lKLQT30Hl/lMjD8kmLEvZnZfjILGeD5
         22Nx8iBkF2b/VvAzlfRGr+UYLgnHzLfzgCr8kWHc2DcZK6NAuMlTnNLQmQ6s6CBaZNpr
         GHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qqKrSdPy25zHcvjpMggBFceNxg6/75a+o1jN+qDX4I0=;
        b=W5qB47hiRvoD/B16gbsNoOiykA3+D8v0xBNf2cnaqJO5Y6DO6Am6prK//irk889ew+
         usp1EFblFcqtUk1qzdCSw+X/p7qpx12divE6dB9f85djY8N7qMD/4tc4mBf1xxK9g9MW
         UvIWWA+Hg8UWwRHdXw1Em3PA3rpGABVsmer4VJnlyWUoe3Ef/RTAyzEucCHJOYkHaqKE
         1IN+4LTRvPE3PsTYjOiu9UyRjUvnMp3W3U5JJtrXIIoBRMAi5RB9M49OhtAaJunchB0e
         ksfbAYItDbQQZpSyZcPaO7K1NxVNyNuo8ZLftAVz7yBOhs/kGL4rLtkoCxxTFgsjfSzc
         QgDw==
X-Gm-Message-State: APjAAAXQtvES/8phaNTx6E5Stws501YDZwbTbhHghpQhPK8EJFNd5vdC
        w5mBXgVN395y2izAslMyy1Zx
X-Google-Smtp-Source: APXvYqxhVAjbPOTLRCgrVLeXs8sZLi66gXo+NRUQHdJjm1AjrnsCRpjuTQqBsmO6pSnf8bf8NpM9KA==
X-Received: by 2002:a17:902:a50d:: with SMTP id s13mr15687686plq.293.1580109061891;
        Sun, 26 Jan 2020 23:11:01 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id x11sm7830074pfd.168.2020.01.26.23.10.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Jan 2020 23:11:01 -0800 (PST)
Date:   Mon, 27 Jan 2020 12:40:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, arnd@arndb.de,
        smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
Message-ID: <20200127071052.GB4768@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
 <beadf428-82db-c89f-22bc-983d7b907bb3@codeaurora.org>
 <20200125134631.GA3518689@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125134631.GA3518689@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 25, 2020 at 02:46:31PM +0100, Greg KH wrote:
> On Fri, Jan 24, 2020 at 03:51:12PM -0700, Jeffrey Hugo wrote:
> > > +struct mhi_event_ctxt {
> > > +	u32 reserved : 8;
> > > +	u32 intmodc : 8;
> > > +	u32 intmodt : 16;
> > > +	u32 ertype;
> > > +	u32 msivec;
> > > +
> > > +	u64 rbase __packed __aligned(4);
> > > +	u64 rlen __packed __aligned(4);
> > > +	u64 rp __packed __aligned(4);
> > > +	u64 wp __packed __aligned(4);
> > > +};
> > 
> > This is the struct that is shared with the device, correct?  Surely it needs
> > to be packed then?  Seems like you'd expect some padding between msivec and
> > rbase on a 64-bit system otherwise, which is probably not intended.
> > 
> > Also I strongly dislike bitfields in structures which are shared with
> > another system since the C specification doesn't define how they are
> > implemented, therefore you can run into issues where different compilers
> > decide to implement the actual backing memory differently.  I know its less
> > convinent, but I would prefer the use of bitmasks for these fields.
> 
> You have to use bitmasks in order for all endian cpus to work properly
> here, so that needs to be fixed.
> 

Okay.

> Oh, and if these values are in hardware, then the correct types also
> need to be used (i.e. __u32 and __u64).
> 

I thought the __* prefix types are only for sharing with userspace...
Could you please clarify why it is needed here?

Thanks,
Mani

> good catch!
> 
> greg k-h
