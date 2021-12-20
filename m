Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E42E47B63A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 00:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233092AbhLTXmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 18:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhLTXmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 18:42:23 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9838BC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 15:42:23 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id w5-20020a4a2745000000b002c2649b8d5fso3530320oow.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Dec 2021 15:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fXyd48HL5YcTwRMzoww9SwKMCubtA4ei6Uf/z8oQfp4=;
        b=iRt1HjN1A1nyl7nMT+kA2MTBeejr1ApoIV9IiI1uWesGK2AwYegyzKXvni9c1zB765
         nUiP77H4xmD0le8Lw2pufiiRtDMKbkAYJK6Tz20GxiDs0+8vg3zno+3TGGaLYrUS5Xpq
         CD2eu0a9FRhLF5VB6cDDttJAZMsBvIIR8A0TmmqwkaRxE+IdzYcdVI7Nbl1xvNivTIa1
         0lxlgxjIsAomn08fto5yhgQtmkRKIFuxKzD6ZcgULARZdqgVMuDMXv5e88AAgnVZ6+ik
         8VidKPbaeuidmipgousjH3UL1Y/Ts0Z4OEh3ktJUCM6YxC4EYyoUwIZOaEjaJNN8ys9r
         ydPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fXyd48HL5YcTwRMzoww9SwKMCubtA4ei6Uf/z8oQfp4=;
        b=Bl3KZ5EbbYeEwI8ZmGK7ImzL5Cp8408pz12faDSMvtuqs66y3tjyNxs3vuvYWmkBl1
         x99Eln9wN4lTqh4TpzBlEn3aiAflOnNFimp5tOtB4MavxRnpupwRnN5soS+JAJyrgvYC
         xHYVL12YablWOLIwEyRDLBflQ+d89IDNGBfy7Wc1lroJdjwn+D3ewneTO+B4JWNsyTRE
         KhT6JhdeTawCb9+uwW+zp7ewsKDM7PZbiRYQCJHjo9sI/n/Ez4QPsEkv8cZG5ukzo8c5
         XGCGwCVOcgLAe4FpXq/rqX8BF8QXfuJ5+3wq1Rfb8aYIfK9Vp60tQF7IVjveO8ZtX4Zj
         WWFQ==
X-Gm-Message-State: AOAM532l+6N5WfGBCdE00Cdb12FDl2jJr+vQjFrrweT8SfMmlfxxCqxk
        UsPBOIJr8JrU5YAgzTxuHA4THHXiM+pTgg==
X-Google-Smtp-Source: ABdhPJwRDVXCRDJMAtfGL+pL+4iUwEl3wgGD7/CYswUfCpak+pmJgKFfARFDxMz1HxTkzfZwsAFaqw==
X-Received: by 2002:a05:6820:1609:: with SMTP id bb9mr307552oob.37.1640043742930;
        Mon, 20 Dec 2021 15:42:22 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n23sm3668243oig.4.2021.12.20.15.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 15:42:22 -0800 (PST)
Date:   Mon, 20 Dec 2021 15:43:31 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: Avoid stack buffer for IRQ name
Message-ID: <YcEVIyZu/nfLSyfl@ripper>
References: <20210901084732.943248-1-ardb@kernel.org>
 <5bdf0bb1-150b-6b60-6f9d-86542b4d7695@linaro.org>
 <CAMZdPi9m_JJogxwT7k_0bzC9+gPxq9NHkuDF3T0HEj8EU-vd7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi9m_JJogxwT7k_0bzC9+gPxq9NHkuDF3T0HEj8EU-vd7w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Dec 02:12 PST 2021, Loic Poulain wrote:

> > On 9/1/21 4:47 AM, Ard Biesheuvel wrote:
> > > Registering an IRQ requires the string buffer containing the name to
> > > remain allocated, as the name is not copied into another buffer.
> > >
> > > So let's add a irq_name field to the data struct instead, which is
> > > guaranteed to have the appropriate lifetime.
> > >
> > > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Andy Gross <agross@kernel.org>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Thanks for the fix.
> >
> > Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
> 
> Seems this patch has been overlooked. Would it be possible to resubmit
> it with a 'Fixes' tag?
> 

This was resubmitted by Vladimir and Viresh replied that it's applied,
see:

https://lore.kernel.org/all/20211125065014.phkfugo2wptosrgv@vireshk-i7/

Regards,
Bjorn
