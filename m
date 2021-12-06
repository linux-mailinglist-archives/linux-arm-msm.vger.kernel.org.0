Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBCC46906B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 07:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237772AbhLFGnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 01:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237767AbhLFGnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 01:43:40 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D2FC061354
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Dec 2021 22:40:11 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id iq11so6943177pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Dec 2021 22:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qSFiQM7fZZkVaDJle1kXPoWe9UZ/qoSibT8ivF7uePU=;
        b=nP5acA8TgI8ZxLzOGcJPChtceDtsoweWT0bZ8TjEtmhIJ/GEMsCqx1OWqbenBSSvrW
         YFpMf3bOEC7bDI4vdQq18EkupaXM7+x3M8CsrPHRCPYZ/z2mPPyYrK7UEAzHli5JAjEn
         AoBgTqS2cZ+ORWREomgnEE1voXwnc5cWt49VlO8YQu+ZEJvFAsKe5l5T03a+wR+ELaJi
         iIPmoSeNy4BC7p7erpm3F1wIj2EzC5UOU0oRuIEiy0FpCmnG9NJgqajiRQnEOQk9Hio8
         ikvk/9VNS3xPgWRiJq9E3fJV6v3S/Bya2tsWzqDZFMmlGQP2k1Bhk3dgPdlMOsy5RMBi
         lnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qSFiQM7fZZkVaDJle1kXPoWe9UZ/qoSibT8ivF7uePU=;
        b=wuAavNzruYCh/+Nc+7wpcHnlsaSFmLYwLFVZZu7VzpyHlE2zR2SP2dVTd5ctQ6/sNP
         DaIfvhWINVpnxz6t1696PmcnAqk4EFsm2QLt3rYIA/jLTt3XqiPc6hg6zl6vqcJ7BWKN
         qOhE8nAgK6KN/zXIShOcbu29PTC90ZC7uT71bhfRhoah5dIgvERsYBhJZNEKJWQbeUM6
         3HepmG/ipXdDtl9EYoE02vi6S0HfyYcLKiftbqtEQv8Pz1cZcK9iPdbrfqiO2mPsSvuX
         p1Z+Cu/S/A0TPcTMOt4+d1GVeqJyYZM2Ri0j/3ZRHh0HLPBBj4mdidN96uNCxkX6PlgH
         fqqw==
X-Gm-Message-State: AOAM531yqW1sK4ScDvq4sPDCTeSrO9Np4bwAZqHpQNLHq8z284viknfC
        tY8icyZLgh8s6CHdGsDeLlU50g==
X-Google-Smtp-Source: ABdhPJyOvgSetjbmp4/y0N2MwTsFrqcCnpZYD1sTdP1dnVJ4+I+lYNAYgOTpyLJiKIzlryfTIg99Mw==
X-Received: by 2002:a17:90b:1e4e:: with SMTP id pi14mr34940115pjb.161.1638772811314;
        Sun, 05 Dec 2021 22:40:11 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id d15sm11168626pfl.126.2021.12.05.22.40.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Dec 2021 22:40:11 -0800 (PST)
Date:   Mon, 6 Dec 2021 14:40:05 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/3] irqchip: Pass platform_device pointer to init_cb
Message-ID: <20211206064004.GL10105@dragon>
References: <20211202122122.23548-1-shawn.guo@linaro.org>
 <20211202122122.23548-2-shawn.guo@linaro.org>
 <b221fec0-43d0-537d-d78e-84da10a9c2d7@gmail.com>
 <fa6ae407c1da16e571aaf04eb424fecd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa6ae407c1da16e571aaf04eb424fecd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 02, 2021 at 07:10:04PM +0000, Marc Zyngier wrote:
> On 2021-12-02 17:52, Florian Fainelli wrote:
> > On 12/2/21 4:21 AM, Shawn Guo wrote:
> > > It makes sense to just pass device_node for callback in
> > > IRQCHIP_DECLARE
> > > case, but not so much for IRQCHIP_PLATFORM_DRIVER one, because
> > > platform_driver probe/init usually needs device pointer for various
> > > purposes, e.g. resource allocation, service request, device prefixed
> > > message output, etc.  Create a new callback type irqchip_init_cb_t
> > > which
> > > takes platform_device pointer as parameter, and update the existing
> > > IRQCHIP_PLATFORM_DRIVER users accordingly.
> > > 
> > > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > > Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > 
> > Could you copy all recipients on all 3 patches plus your cover letter
> > next time so we have the full context? Thanks!
> > 
> > [snip]
> > 
> > > 
> > > -static int __init bcm7120_l2_intc_probe_7120(struct device_node *dn,
> > > +static int __init bcm7120_l2_intc_probe_7120(struct platform_device
> > > *pdev,
> > >  					     struct device_node *parent)
> > >  {
> > > -	return bcm7120_l2_intc_probe(dn, parent, bcm7120_l2_intc_iomap_7120,
> > > +	return bcm7120_l2_intc_probe(pdev->dev.of_node, parent,
> > > +				     bcm7120_l2_intc_iomap_7120,
> > >  				     "BCM7120 L2");
> > 
> > If you look further into that driver, you will see that we do something
> > like this in bcm7120_l2_intc_probe:
> > 
> >           pdev = of_find_device_by_node(dn);
> >           if (!pdev) {
> >                   ret = -ENODEV;
> >                   goto out_free_data;
> >           }
> > 
> > which would be completely superfluous now that we pass a platform_device
> > directly. Can you rework your patch so as to eliminate that
> > of_find_device_by_ndoe() (and the companion put_device call)?
> 
> Or just adopt the same construct in the MPM driver. At this stage, drivers
> requiring a platform_device are the minority.

Marc,

I need to ensure I understand you comment.  Are you suggesting that I
keep IRQCHIP_MATCH() unchanged, and go back to the MPM driver
construction I used in v2?

Shawn
