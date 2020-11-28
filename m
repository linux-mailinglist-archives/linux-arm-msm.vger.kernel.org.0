Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C71C2C73D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732808AbgK1Vtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgK1Sa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:30:56 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61A8C094263
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 10:30:15 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id l10so1807194ooh.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2020 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+BIfatzZ+Hyrav++/2cWh0YeRH/ED9QPAyC3RwDUEos=;
        b=d4bw5nFdsbVFVLQ0J45xz4bVho2nre5Wd+Fr2+9SHMofGu7baatvBUXOYhcaOFn3Bl
         qqtSjBzWHtsSabQL0iQq8hopcnlmJ1ajdC4/nACNXRFqwH5yBFZDr172U7njDcYvwkNg
         pkfEzM6C2gNViDjC6efXo8mXwdTZ9PgZb8cYJc0aqYAaFA4j2A5sbANyjbeH+1gFeDPO
         Q8AIXLdygHxaS55p1NQD6m7NtE6T5x197kCLyfqOMw/uG9WX0Fb5uz8lgGoWhACRTrl4
         25dpn7EnFMjebWvTwUIOIyEnyNoRef4UD4rT3f9wie07V2HYVFzcU3e+hVwZXhmymGH1
         1xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+BIfatzZ+Hyrav++/2cWh0YeRH/ED9QPAyC3RwDUEos=;
        b=ci8+gPvE+EEe/EDzqhen/xwOwTHRcaRLUjhNIZK5WnI1bTV3KHxzn3A0x7UW9LdQBX
         bJ9WtFA1+mtE5e25kXygPaLziUr3V1soZObd1SIBwW4IM5Ro4UXUcSBEuHXwH67QjYKs
         HHGlTDEnLZJ6XtavlngoOjyXd33X7jRgfrR9vpoTM8Jg1Cgw/Xz0KNRnzVbN8EFusR0s
         jWxwanwcQ6ekr11Jy7ZhxkpiFdG73D1VTWPBMAA7OSQETR2rhxncoagCTPMFbZDZGbmd
         vboEXguEZ/m7VOueIoddObATBlhylJ6utrkwrEpk/Qi/0s1lrCEpQeDlouMCQ5wJ9/jG
         lxvg==
X-Gm-Message-State: AOAM5330gyigtCw/7a6h+42c1VcewA3LKke0VNilo7/XoaiC5dVfmKht
        18ClSsmDX/003koJJ+1VOdvZZw==
X-Google-Smtp-Source: ABdhPJzxJ41W7ildotOyUVY48Y3KokD3vdd/vlBIyNab4m0S3HYxfSbZc8cZ2+B1RlhKQqWJM/Nx4A==
X-Received: by 2002:a05:6820:351:: with SMTP id m17mr2251050ooe.36.1606588213201;
        Sat, 28 Nov 2020 10:30:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 64sm6704740otu.62.2020.11.28.10.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 10:30:12 -0800 (PST)
Date:   Sat, 28 Nov 2020 12:30:10 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/9] ARM: dts: qcom-pma8084: Drop incorrect use of
 io-channel-ranges
Message-ID: <X8KXMrFg1g8OsjZj@builder.lan>
References: <20201115192951.1073632-1-jic23@kernel.org>
 <20201115192951.1073632-7-jic23@kernel.org>
 <20201128153702.7d144f68@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201128153702.7d144f68@archlinux>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 28 Nov 09:37 CST 2020, Jonathan Cameron wrote:

> On Sun, 15 Nov 2020 19:29:48 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > 
> > This property is used by io-channel consumers, not providers so should
> > not present here.  Note dt_schema will now detect this error as there
> > is a dependency between this property and io-channels.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Cc: Andy Gross <andy.gross@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> +CC Andy on an up to date email. Also added linux-arm-msm
> which I should have cc'd in the first place.
> 
> I've taken the yaml fix related to this so just a question of
> cleaning up this loose end in the dtsi
> 

Thanks Jonathan, I missed your patches earlier. The yaml change looks
correct and I've merged this for 5.11.

Regards,
Bjorn

> Thanks,
> 
> Jonathan
> 
> > ---
> >  arch/arm/boot/dts/qcom-pma8084.dtsi | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-pma8084.dtsi b/arch/arm/boot/dts/qcom-pma8084.dtsi
> > index ea1ca166165c..e921c5e93a5d 100644
> > --- a/arch/arm/boot/dts/qcom-pma8084.dtsi
> > +++ b/arch/arm/boot/dts/qcom-pma8084.dtsi
> > @@ -68,7 +68,6 @@ pma8084_vadc: vadc@3100 {
> >  			#address-cells = <1>;
> >  			#size-cells = <0>;
> >  			#io-channel-cells = <1>;
> > -			io-channel-ranges;
> >  
> >  			die_temp {
> >  				reg = <VADC_DIE_TEMP>;
> 
