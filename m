Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541D649FDB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 17:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349948AbiA1QK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 11:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239866AbiA1QK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 11:10:57 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646D9C06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 08:10:57 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id u129so13153132oib.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 08:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2ZOiI6lazSl8B7vFlhNLXnNn9YbN5dBSdVRmogZ9Qao=;
        b=hjhdyG10JLRh3r2QbHELSXx0g9SkUM2z/Q+WCHuTANvkPtMdpLI05LySB+0s+JNeqp
         h/b/RovU8FRUhcx0nA4QiCU4Ec5haUTbAGkuQGE9WmVhGiyoGpO0AWlkitWbFTm3hNIv
         WOwq4Y8p27sqs/QAU2fe4/VBlAh6g0zYXW14P2FE0EQZttByFC2XTRxGIJeX73i4V44W
         2Ngm7qxAjRB/RtK/6RhGfNjkvIK0+bAKORcRzH3dZKXFD9zZEnLa3RJd8V5AK5acFM6l
         3ASHEH7e5S3qhR+jLkF17TNwE7Mxb3F2u8ND1rKpgD305U4kf1hbMjbHxxYSsfySId0n
         DuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ZOiI6lazSl8B7vFlhNLXnNn9YbN5dBSdVRmogZ9Qao=;
        b=jkdI6TTpBkOnFHm3BHxiN8bLMGlUrsREXEom0P89BRcMhTwLAm4ddyTCkk1axOtcl8
         mV7y7aJ0yFBr6XwOj9es5JWyADlquaTr16vivQIQkJfHGWYVmTZ7D+iAU84f1OMioCCq
         Eqr7BZrk9jyLw6ONF/iH//pyz+C0ywE5qgq9HgniKjCcMNm+1pkpLvfnvujzp3qNCEBM
         N+mMwydlfGJXsUOgQNRRwTEzSI1iE7xVD3nsmQUQvD+dvZgNrRaQC0Op7wFlwYYiRsnF
         GlTlIPXcFIca6m3Fc4j2yhX3gX6Ne4r3lGKv4jwX8QIWrJCFw4TmyzdM2sj1ERcpdhat
         jjBw==
X-Gm-Message-State: AOAM531m/gz21JFRk+FXKEDfFL/fBam/Pex6cCkxc6izS3bt/f2FifQO
        0575RIpJTbVzjQifq7qOXVxMRg==
X-Google-Smtp-Source: ABdhPJx4HXeI26gB9vJZi3St+tQAaKLaM/tjSbjPY7Npv2+r+wxlghlN1mdUz3f7ObVBR1yYvKuEHA==
X-Received: by 2002:a05:6808:f05:: with SMTP id m5mr8868453oiw.121.1643386256435;
        Fri, 28 Jan 2022 08:10:56 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id m23sm10325469oos.6.2022.01.28.08.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 08:10:55 -0800 (PST)
Date:   Fri, 28 Jan 2022 08:11:19 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, robh@kernel.org, linux-kernel@vger.kernel.org,
        quic_tsoni@quicinc.com, quic_psodagud@quicinc.com,
        quic_satyap@quicinc.com, quic_pheragu@quicinc.com,
        quic_rjendra@quicinc.com, quic_sibis@quicinc.com,
        quic_saipraka@quicinc.com
Subject: Re: [PATCH V4 3/6] soc: qcom: eud: Add driver support for Embedded
 USB Debugger(EUD)
Message-ID: <YfQVpzZ42MdJkkZW@ripper>
References: <cover.1642768837.git.quic_schowdhu@quicinc.com>
 <7ccee5ae484e6917f5838c8abde368680ec63d05.1642768837.git.quic_schowdhu@quicinc.com>
 <YfDSZTZOryQuWIlJ@builder.lan>
 <c072d162-e371-e44b-8160-d06a8a6c051c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c072d162-e371-e44b-8160-d06a8a6c051c@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 27 Jan 04:01 PST 2022, Souradeep Chowdhury wrote:

> 
> On 1/26/2022 10:17 AM, Bjorn Andersson wrote:
> > On Fri 21 Jan 07:53 CST 2022, Souradeep Chowdhury wrote:
[..]
> > > +		return PTR_ERR(chip->base);
> > > +
> > > +	chip->mode_mgr = devm_platform_ioremap_resource(pdev, 1);
> > > +	if (IS_ERR(chip->mode_mgr))
> > > +		return PTR_ERR(chip->mode_mgr);
> > > +
> > > +	chip->irq = platform_get_irq(pdev, 0);
> > > +	ret = devm_request_threaded_irq(&pdev->dev, chip->irq, handle_eud_irq,
> > > +			handle_eud_irq_thread, IRQF_ONESHOT, NULL, chip);
> > > +	if (ret)
> > > +		return dev_err_probe(chip->dev, ret, "failed to allocate irq\n");
> > > +
> > > +	enable_irq_wake(chip->irq);
> > > +
> > > +	platform_set_drvdata(pdev, chip);
> > > +
> > > +	return 0;
> > Per the updated binding, the EUD would now be a usb-role-switch as well
> > and when not enabled should simply propagate the incoming requests. So I
> > was expecting this to register as a usb_role_switch as well...
> 
> Can you please elaborate on this?
> 
> Do I need to define a separate 'usb_role_switch_desc' here and register
> using 'usb_role_switch_register'?
> 
> Also what should be the set method in this case for usb_role_switch_desc?
> 

My expectation is that in normal operation pmic_glink will provide role
switching requests and then as you enable the EUD it will force the role
to gadget.

So my suggestion was that you make eud a role-switch and as long as EUD
is disabled you just pass through the role-switch vote from pmic_glink
onto the dwc3.

Perhaps I'm misunderstanding how this is really working.

Regards,
Bjorn
