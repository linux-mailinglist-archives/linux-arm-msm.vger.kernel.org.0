Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0933B37F9C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 16:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234551AbhEMOim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 10:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbhEMOiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 10:38:16 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D497C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 07:37:06 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d16so1218463pfn.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 07:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sx3mr4BDLZ5xGBgeaqFkdR7vsdZbhfA/6V37sd6COZU=;
        b=J4OYINi3E6P3GAXj8Ej/4HiyuJLNiFH8vmrAf9pIK79CqUp3Q8VEJylqNDc7zA+P8K
         e+sI+ev03ixG7/mg5hwv5Uwz0LQfFvmO9MroEWL9gIc9V4hEnUQNjoo4WA98ovnBlrSl
         BMX40PsMyOmJh4VA8HrAHbh4AoJTVB9JGSI54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sx3mr4BDLZ5xGBgeaqFkdR7vsdZbhfA/6V37sd6COZU=;
        b=no7XTRtFiIKNxnaWH4JUe58dBONBc+mx2QUJpqcnyR01pqsJQkv/JDnc5e0hiC2t1n
         4fz70i8NZP3niywQ2H1uH5QTe/KcT7fP1hvYdHmpI7nlLJCexoCVqSFFas1uCtQ2aGY1
         28nNosQ5DibVc3VnBUOf+NP1YLWGGkEq3nUg2qP4pi1iH1jvYS662J1d3hS5Axn1pjEA
         ZlQQ8zfmJ8wfYmImqc2tOIJXf+voNC2pcnLu1uBCNL4YKEzi8Pb5kuxk2T5nzYribjfn
         61qmmK4I8v5So96P3X8Hz7IWOuPqkxEmXYqFo/sJ28ISSg5bj+gE4IlryI1qX9/XRFZz
         k3Cw==
X-Gm-Message-State: AOAM531U8IR7G8fFIPPOnfbQG7kaKBYY7T9a/a4PKQriKBFubXzeIFft
        7PUetqApAu7p4P1VCtQ2uiYkng==
X-Google-Smtp-Source: ABdhPJxmG+fPZJtitz0B7QDVlLmFob4tiFvpNkfl87TScbnWHX2+5LNc8HYSJ073ma2D8N+/70xCJg==
X-Received: by 2002:a17:90a:e501:: with SMTP id t1mr2397569pjy.64.1620916626097;
        Thu, 13 May 2021 07:37:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4c2:8d34:961f:de80])
        by smtp.gmail.com with UTF8SMTPSA id d26sm2229443pfq.215.2021.05.13.07.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 07:37:05 -0700 (PDT)
Date:   Thu, 13 May 2021 07:37:03 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 1/5] usb: dwc3: host: Set PHY mode during suspend
Message-ID: <YJ05j1ZQDREp4BQb@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-2-git-send-email-sanm@codeaurora.org>
 <87tunqka2e.fsf@kernel.org>
 <YJwommGqKVeMdXth@google.com>
 <87wns27nlq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wns27nlq.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 13, 2021 at 04:46:41PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Matthias Kaehlcke <mka@chromium.org> writes:
> >> > @@ -127,6 +142,50 @@ int dwc3_host_init(struct dwc3 *dwc)
> >> >  	return ret;
> >> >  }
> >> >  
> >> > +static void dwc3_set_phy_mode(struct usb_hcd *hcd)
> >> > +{
> >> > +
> >> > +	int i, num_ports;
> >> > +	u32 reg;
> >> > +	unsigned int ss_phy_mode = 0;
> >> > +	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
> >> > +	struct xhci_hcd	*xhci_hcd = hcd_to_xhci(hcd);
> >> > +
> >> > +	dwc->hs_phy_mode = 0;
> >> > +
> >> > +	reg = readl(&xhci_hcd->cap_regs->hcs_params1);
> >> > +	num_ports = HCS_MAX_PORTS(reg);
> >> 
> >> there's a big assumption here that xhci is still alive. Why isn't this
> >> quirk implemented in xhci-plat itself?
> >
> > That should work for determining which types of devices are connected to
> > the PHYs, however IIUC the xhci-plat doesn't know about the PHY topology.
> > Are you suggesting to move that info into the xhci-plat driver so that it
> > can set the corresponding PHY modes?
> 
> Yes, if xHCI needs to know about PHYs in order to properly configure the
> PHYs, so be it :-)

Thanks for the confirmation, looks like we have a path forward here then :)

