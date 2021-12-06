Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2CE469068
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 07:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237742AbhLFGjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 01:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237741AbhLFGjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 01:39:10 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3516C061354
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Dec 2021 22:35:42 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id o14so6422480plg.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Dec 2021 22:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KPdiesTGFrti81pgW4AEjO6kQFUIykLCsbuWcjx17rA=;
        b=rZli6EDigXFG27bzDSZQq52FY8dmCj96XtbZHhJMK74MibdPrQXPvjYM8IFIBeoy7G
         ELX67VAl1IhSwAsJyvpaDrK25ZagcRg/4EErvPzXoDyP3q8bHb+wOynD31OSykroYOxK
         lfYN9OpzObX20WGnZ0F7+PByA1iBsyVA5L4kibkq/tGhd6M2RxeaBYS+76I0dFOtvdpD
         h5LNbaGbq35rqy+8HlU/SDFPrMTE+nwU1OR/bCCwQOhBJoTEDHMbz+OUao0axYCtwLJn
         cDmwfjgwj7ycRs0s49eqjcj8hGM8UtTAeYQ9Mkru3davaUViOj/92KLqpyRC61IrMbiN
         rNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KPdiesTGFrti81pgW4AEjO6kQFUIykLCsbuWcjx17rA=;
        b=rAyIFa/N0WfiZsrERP0zYUH7DiF5qKIR3Zt6Ev0cxKoK6d800UYJpwgcm2aUQOIz15
         I78yVQaj7O8wSh/kFVij/OlXJwLp1rACvJpOL4xR7poHuWsIXBkZYBTVSReb8VdWWvEB
         CME3bkZOyEvrMAbsdB/Ah6DfWm9Y1xUAOnK7rtzTtDCwEXXSqVcvoPIj9j/QZ7mPqxWo
         MB+1/bVk6Cwe5G7LPNlwK8tBoQd5g8WFH/4OzJJafyntiznCKJEaePfbT/Gitj8p1sb5
         qC4V73KECdG+0HpAd8PguIf+lmwrNi1XnISWig69pu1FnfoI5lZIfD/iX3tvhuFuBNeE
         c7AQ==
X-Gm-Message-State: AOAM531VGdZtOgDcvON/ijYrbBg1puYS3oCwhfpUabOHO5h8jw99bhgL
        PTReSwmjDaAKTsjR0PnhDOpP4+U3GJ0uiOmP
X-Google-Smtp-Source: ABdhPJxIn+T1ulljaVquO7/zIEGGcd3t1MxTGYPJTWFTd/hcSgAywdj9YmAB95HC9kupiqItPilxxQ==
X-Received: by 2002:a17:90b:155:: with SMTP id em21mr35817743pjb.12.1638772542189;
        Sun, 05 Dec 2021 22:35:42 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k2sm11945931pfc.53.2021.12.05.22.35.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Dec 2021 22:35:41 -0800 (PST)
Date:   Mon, 6 Dec 2021 14:35:35 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/3] irqchip: Pass platform_device pointer to init_cb
Message-ID: <20211206063534.GK10105@dragon>
References: <20211202122122.23548-1-shawn.guo@linaro.org>
 <20211202122122.23548-2-shawn.guo@linaro.org>
 <b221fec0-43d0-537d-d78e-84da10a9c2d7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b221fec0-43d0-537d-d78e-84da10a9c2d7@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 02, 2021 at 09:52:55AM -0800, Florian Fainelli wrote:
> On 12/2/21 4:21 AM, Shawn Guo wrote:
> > It makes sense to just pass device_node for callback in IRQCHIP_DECLARE
> > case, but not so much for IRQCHIP_PLATFORM_DRIVER one, because
> > platform_driver probe/init usually needs device pointer for various
> > purposes, e.g. resource allocation, service request, device prefixed
> > message output, etc.  Create a new callback type irqchip_init_cb_t which
> > takes platform_device pointer as parameter, and update the existing
> > IRQCHIP_PLATFORM_DRIVER users accordingly.
> > 
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Could you copy all recipients on all 3 patches plus your cover letter
> next time so we have the full context? Thanks!
> 
> [snip]
> 
> >  
> > -static int __init bcm7120_l2_intc_probe_7120(struct device_node *dn,
> > +static int __init bcm7120_l2_intc_probe_7120(struct platform_device *pdev,
> >  					     struct device_node *parent)
> >  {
> > -	return bcm7120_l2_intc_probe(dn, parent, bcm7120_l2_intc_iomap_7120,
> > +	return bcm7120_l2_intc_probe(pdev->dev.of_node, parent,
> > +				     bcm7120_l2_intc_iomap_7120,
> >  				     "BCM7120 L2");
> 
> If you look further into that driver, you will see that we do something
> like this in bcm7120_l2_intc_probe:
> 
>           pdev = of_find_device_by_node(dn);
>           if (!pdev) {
>                   ret = -ENODEV;
>                   goto out_free_data;
>           }
> 
> which would be completely superfluous now that we pass a platform_device
> directly. Can you rework your patch so as to eliminate that
> of_find_device_by_ndoe() (and the companion put_device call)?

Firstly, I do not see any companion put_device call in the driver.
Secondly, the existing code seems to have some problem in the "out"
order.  The out_unmap should go before out_free_l1_data, right?

@@ -329,13 +323,13 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 
 out_free_domain:
        irq_domain_remove(data->domain);
-out_free_l1_data:
-       kfree(data->l1_data);
 out_unmap:
        for (idx = 0; idx < MAX_MAPPINGS; idx++) {
                if (data->map_base[idx])
                        iounmap(data->map_base[idx]);
        }
+out_free_l1_data:
+       kfree(data->l1_data);
 out_free_data:
        kfree(data);
        return ret;

Shawn
