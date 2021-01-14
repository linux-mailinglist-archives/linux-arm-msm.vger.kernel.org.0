Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBC62F5FCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 12:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbhANL0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 06:26:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbhANL0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 06:26:01 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C31C061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 03:25:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id ce17so757125pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZF5HVg1QQAlqqKzpmV/toIXKyBXTgyTFJetYRdgQg9E=;
        b=l5ckSdeKC4XMS7dz2j/ma4mrZ0uTKtOZdorSSg1Bfs1DYaWTiWvXlIpifutRmXWnHi
         DZLJy2Pk2c5EMHLLBZWR0nIZx+7hw4jPrqzL1XhsfHFzBjmSfwUf1n4dwVsUGeLuGb0/
         KuLWVVr70pNkKXfcwSj7RxJGfqNMWUH8emoNWixIdU/OLFnRkKTEWGjvycIdSTOaPdbc
         l9rxkjfYonpPq5dKxX2hLhblzfZRHOj0864JVNrQs0Pd0tE5aow76gQlNpQL2m1af+hS
         ixONtLJ90TNdMVAsJUQwfEyMraVU2dvyyRfwqjnzsRyukh2nush/Ln27pPd8JIJ/43Hh
         Bs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZF5HVg1QQAlqqKzpmV/toIXKyBXTgyTFJetYRdgQg9E=;
        b=Q1enJqDTvMr4wi2RxP9fQyUl6lz5ErCRbBWTC46X6vfb9XUTNxsRea1xsq3FlwhUot
         4brEJZMo3tfIP9ZtbmPk8CG7S8vvqiBtP5hf8dvKN1yaBDnr9ibmbEEdnUTH/ZFFhe82
         l7rmQ6k3V5vXzICQC4HxT50+VA99tnnb6sIdESWhcAZKhKCPjRYsddeZAy4g1/igJTQ2
         Ed7Sw+5uhdfcildRdFTFacNWix7vwRkgGzp/ileL22HlTuWK5jH6uJBo3leuMk5xNc4z
         0GeLNan6OeCw9j8GAhrt43s6qM9t2F/m/CvAmdSU2JxuwUe85rmBdvUF4K/dMhvOZdTx
         2Sng==
X-Gm-Message-State: AOAM533cYuBr3EY/N4CrJWsBPcHH9uF60OC2VlIkxlMv89Z4LVs9EQR+
        As4wySXRMivFV1x8p+chIOP0dEB1BPR0rQ==
X-Google-Smtp-Source: ABdhPJxg9bWNBHr8O2dZutX7Re9cllAZzpTJ/fsy3dSuLilSZVIrmmClmBqXiE4MoN5PrUgKmxBJ1Q==
X-Received: by 2002:a17:90a:5b06:: with SMTP id o6mr4576116pji.49.1610623521223;
        Thu, 14 Jan 2021 03:25:21 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id u126sm4897808pfu.113.2021.01.14.03.25.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 03:25:20 -0800 (PST)
Date:   Thu, 14 Jan 2021 19:25:15 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: geni: shield ICC calls for ACPI boot
Message-ID: <20210114112514.GB24107@dragon>
References: <20201228135625.4971-1-shawn.guo@linaro.org>
 <X//Ew1EvY47UgTf9@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X//Ew1EvY47UgTf9@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 13, 2021 at 10:12:51PM -0600, Bjorn Andersson wrote:
> On Mon 28 Dec 07:56 CST 2020, Shawn Guo wrote:
> 
> > Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
> > if interconnect support is enabled.  That's because interconnect driver
> > only supports DT right now.  As interconnect is not necessarily required
> > for basic function of GENI devices, let's shield those ICC calls to get
> > GENI devices probe for ACPI boot.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/soc/qcom/qcom-geni-se.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > index f42954e2c98e..9feb1d78a5df 100644
> > --- a/drivers/soc/qcom/qcom-geni-se.c
> > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > @@ -760,6 +760,9 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
> >  	int i, err;
> >  	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> >  
> > +	if (has_acpi_companion(se->dev))
> > +		return 0;
> > +
> >  	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> >  		if (!icc_names[i])
> >  			continue;
> > @@ -785,6 +788,9 @@ int geni_icc_set_bw(struct geni_se *se)
> >  {
> >  	int i, ret;
> >  
> > +	if (has_acpi_companion(se->dev))
> 
> Can't we simply rely on the fact that icc_set_bw(), icc_enable() and
> icc_disable() all return successfully when passed a path of NULL?

Yes, we can.  Thanks for the tip!

I will send v2 shortly.

Shawn
