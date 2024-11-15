Return-Path: <linux-arm-msm+bounces-37952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB9D9CD718
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1051F22373
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2FE18873E;
	Fri, 15 Nov 2024 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nm6tlNze"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EED188015
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652175; cv=none; b=lMhz7M4upP8aKj5h5pkXoEuK4dXBjBQuUUDwHfHQcdBfnO0QDgp6PhT8dYqMijh82m4NfUCoj+0ICNhK5n596LXC7No3nz0vAY6gtENiNzycxf+DP7oBn/7UUbsKWhQ4pddF9lkHVf/VonlDgGoEuyW2BPUoG4jQeT0hOvKPEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652175; c=relaxed/simple;
	bh=7lut310HhPch7yHLBDvFuhFDjs3W6c+xKnwc8hJfXnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIXcftx9uu7rbTq55YI6x0xD/yEU/r+FAJJua6+TOoG6Ztl+0iP3+UxntRgU7cDAC6qN26pGm4xhe+aQTg10ftc4cnaJ8BTgkKanrhZylFqk4IUPWuFVqvbHxpCsW42l6OZo5tTl6ZTDSFaM/OvK9sgOCESNL8wKMcloN+Q4Wps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nm6tlNze; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso1170425b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 22:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731652173; x=1732256973; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LAe/9vyquMdCBhByhmO/XPb3+AC0FRNm60dHRdsUA0k=;
        b=Nm6tlNze+X+9F9uaykd7XmCAeOhFbfkLs1as54LBYvWZuY3axYLA9wzJt5XDJon3Sb
         1QPjJSOXp3kMNzfbukczx57YsCGlmWg3Ki1pervuZ/8pmaKrMASLyqY76BsgSBPBAYQz
         C5WwendQKKW1FS2axsaTxnXTb0vVA8Yrtp+UINuKC/Xhz4OqYhsyAt6Oym04fJtl5lhF
         FGxBB+kOwg9FGl9oAQaH13tJV1ar8iBmsI5ZYh5gaZ9pLeJ9eb0z5ysvKwaZ/UrtOvPJ
         LzNu5cDx5qcATTRjMXFTpfRgeb9wT3MSfxzRmlcMql2/y81EUwff8V2yRrhsdDQ4sTF8
         8BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731652173; x=1732256973;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LAe/9vyquMdCBhByhmO/XPb3+AC0FRNm60dHRdsUA0k=;
        b=mB9NhYNh6zvSdO3AfOMbUwAeLszO5RE3AESyjP8LFJHQ8yzru62MrSq+VJarw0wF0d
         rGiLQBYOB4PMEWvQH1aXFDlhDwQStgYQtLBVLKPA+Wwo7DayCFMpzzZbaa/MsrW5Qq5m
         3XFMqHuWb6r0aF9cZ7R+QScHW3/ewmxKCYnB+hbeFRgFWyZ5DEBJBbrJKb0TqstevRcW
         h8OPQMDvH+EEW8dYehOUoPl43iC5SR0ZZqBOU+QSE/de0Q4+TMCGweuz+Py5ezZNKrv6
         7pYXxouIjbAHZnXKVF6hzgk8I4MWxBh28GBFYYyhhPiMenhi/k14KGhK0pi4FSxBRmP2
         I7+w==
X-Forwarded-Encrypted: i=1; AJvYcCWoDTwV3nRwKNXLWdXZVJJCGCwamLZOpuUxYKMQL/4Caz2f7A9oAOo3HN2FGYeaWf8StHdv+WQULSm2Sa1U@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp2V+v5h93DQDzHNnF+V62+5KzGM5MkQaW89OkJdZOiCpkRgD7
	blo9ijjhUmb5ItuUHhckbMRqRVw6O0LQdAGo7sJqLEOSaH2Yw+Vc6THZPzFwqA==
X-Google-Smtp-Source: AGHT+IFTHBUtXrdQ+eigXtiosvUhCPGu8P0GD6HEmTLFrUEv4hE86FppOeovnfYq2mBU9cj8n0bajQ==
X-Received: by 2002:a05:6a00:2e27:b0:71e:e3:608 with SMTP id d2e1a72fcca58-72476cfcbccmr2044429b3a.26.1731652172623;
        Thu, 14 Nov 2024 22:29:32 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247720120fsm637787b3a.193.2024.11.14.22.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:29:32 -0800 (PST)
Date: Fri, 15 Nov 2024 11:59:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_mrana@quicinc.com,
	quic_vbadigan@quicinc.com
Subject: Re: [PATCH v3 1/3] PCI: dwc: Skip waiting for link up if vendor
 drivers can detect Link up event
Message-ID: <20241115062925.kuclg4w5wnticyvd@thinkpad>
References: <20241101-remove_wait-v3-0-7accf27f7202@quicinc.com>
 <20241101-remove_wait-v3-1-7accf27f7202@quicinc.com>
 <ywuqtydbapfumelfu66237h65q2xb3rmvjtstiwvd24whn7rju@bcxldl2l4bv2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ywuqtydbapfumelfu66237h65q2xb3rmvjtstiwvd24whn7rju@bcxldl2l4bv2>

On Fri, Nov 01, 2024 at 10:26:38AM -0500, Bjorn Andersson wrote:
> On Fri, Nov 01, 2024 at 05:04:12PM GMT, Krishna chaitanya chundru wrote:
> > If the vendor drivers can detect the Link up event using mechanisms
> > such as Link up IRQ and can the driver can enumerate downstream devices
> > instead of waiting here, then waiting for Link up during probe is not
> > needed here, which optimizes the boot time.
> > 
> > So skip waiting for link to be up if the driver supports 'linkup_irq'.
> > 
> > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++++++--
> >  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 3e41865c7290..26418873ce14 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -530,8 +530,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
> >  			goto err_remove_edma;
> >  	}
> >  
> > -	/* Ignore errors, the link may come up later */
> > -	dw_pcie_wait_for_link(pci);
> > +	/*
> > +	 * Note: The link up delay is skipped only when a link up IRQ is present.
> > +	 * This flag should not be used to bypass the link up delay for arbitrary
> > +	 * reasons.
> 
> Perhaps by improving the naming of the variable, you don't need 3 lines
> of comment describing the conditional.
> 
> > +	 */
> > +	if (!pp->linkup_irq)
> > +		/* Ignore errors, the link may come up later */
> 
> Does this mean that we will be able to start handling these errors?
> 
> > +		dw_pcie_wait_for_link(pci);
> >  
> >  	bridge->sysdata = pp;
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > index 347ab74ac35a..539c6d106bb0 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > @@ -379,6 +379,7 @@ struct dw_pcie_rp {
> >  	bool			use_atu_msg;
> >  	int			msg_atu_index;
> >  	struct resource		*msg_res;
> > +	bool			linkup_irq;
> 
> Please name this for what it is, rather than some property from which
> some other decision should be derived. (And then you need a comment to
> describe how people should interpret and use it)
> 
> Also, "linkup_irq" sound like an int carrying the interrupt number, not
> a boolean.
> 
> 
> Please call it "use_async_linkup", "use_linkup_irq" or something.
> 

"use_linkup_irq" sounds good to me. But I do like to keep the note above as
there were incidents that people tried to avoid this delay as a "workaround" to
unrelated problems.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

