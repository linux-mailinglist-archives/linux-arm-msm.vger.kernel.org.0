Return-Path: <linux-arm-msm+bounces-13217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028186F9F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 07:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1D32280D91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F8C2C4;
	Mon,  4 Mar 2024 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkdwZ0NJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A59BE4C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709533151; cv=none; b=of/PCocG0i0PYni0DdSwUigTn4cMxnf+aXzBSja5SHtZNhJVJ/hhHeWH0EAuQyeumRSxlZNzZi14TY93CnhiHvsvKzmB9JN+AMv834+R0AUuUmuSDGHSNehhXeI9vR+QcEU5Oyb+MM7rI4KX2vduz4m5B14aFPajk9LRSUB4rGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709533151; c=relaxed/simple;
	bh=oDnfxJ4A8v+Y+oMepOulbgQydBSN2yDgubk57DJ4nVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYR/iTDCYepEfg+1r5Cap4jktwWtDJ7ekUbJvyuysd0j61/aYKYMIQRYt+JFMjh6MLx8wWqQa2eP9pjkLcif2Hx1OgtFgfTpZkL34QmM+WGzbKcJOOzQnCmVMSXpW8lMxlx6MKx1EqFLiGTUieZwz9PVr/pzFEXN1lR7eMmEJVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkdwZ0NJ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e5c81ccfb9so1557317b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 22:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709533149; x=1710137949; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yY8EnFgYAlXlPqttQTMQ9X4CPIclgM7lc+6szk0vfN0=;
        b=UkdwZ0NJO/t+VeRQ3jJaAJWmtWtHhKKNpJDL8AnzczA5poxIkP82dlz2Nz3ZvQaA5j
         042n+WMa/w1Z1PmxEDdZ+r7jrAX6o+4erId+uuiw40c6rNLfagxqvvs3sCp7PmXk3oY+
         p7z8YX5yAkFjrnDGq4yUApovsYKc/v106gUdPYksnuaFAz978pmQUBVm484eaJhbCZN4
         Sloh50Q44CSXV5G67vSnWWKOJ4ho0R4hNbViDYrKxyBJvG+htd+UdGVJjnMNBkHMLpOf
         jJW8OKwZmqof6MZl+/eLJGjheZqCLf3+NQiWtBMgLVBw7JTZoK8fvHx7ixno2eS74MnX
         6jMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709533149; x=1710137949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY8EnFgYAlXlPqttQTMQ9X4CPIclgM7lc+6szk0vfN0=;
        b=QYO96sE344uvGHSVmuMglvCw30lj/IG8aLDsu+P8LcfTPRtuZBu62y2FmgBmCitHpm
         avRm6CNNIj0b+OlUeD1gr1I2+9kfL4yvuJdQvNIVdgoGyuUPWO68TyTqEeDZgs9Q8sk6
         0P6MswD4YE/H/ATgcAw7oka/1dMq8CzMN9ZHigSPKPoF7wv+Nns6lZIXjBb3KYS2VeH3
         OXGZDHopT01iiTUdGwhUDFr7aArMLkQdsTP+et/Z5wYFu9ojGdiM8NypqJngcwjeb5DM
         3V9rOHdMClDVfPnRj0awHdENwOa+7SRo7cXfilFnkm6oZqCmaYkOcF5OaKZlph01hvOK
         /Zyg==
X-Forwarded-Encrypted: i=1; AJvYcCWhcG7cuNnSPLX1FMsr9F9ACiGEpCWiUICCTIceQzqdZ1KVUrs56zQ86GwEZdY7U3AeLg8XisZO37CsTUw6wxIuyFzqCskqttRhUjh1jQ==
X-Gm-Message-State: AOJu0YzvRMKvMYAK1JBYPuipAFoJCKNqZ8mGUqukgbd8+r+qqk+K4qTt
	r/gldeY5OQHWFkeSMXk09a/Jw2wjt1g2KkcplblS/2v1S0Z7xoO9X/o2kGOQGvLmlphXyZJkp2s
	=
X-Google-Smtp-Source: AGHT+IEGGhWfMbQLfvF9uJtsc7Y6qkosURA49AQc9jMC4u8Vp5VihTolBAdcYaH2nlvvK6/zVXQicg==
X-Received: by 2002:a05:6a00:2e26:b0:6e4:f32a:4612 with SMTP id fc38-20020a056a002e2600b006e4f32a4612mr8718386pfb.16.1709533149188;
        Sun, 03 Mar 2024 22:19:09 -0800 (PST)
Received: from thinkpad ([117.207.30.163])
        by smtp.gmail.com with ESMTPSA id k19-20020a63ff13000000b005cfb6e7b0c7sm6825218pgi.39.2024.03.03.22.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 22:19:08 -0800 (PST)
Date: Mon, 4 Mar 2024 11:49:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 3/5] PCI: dwc: Pass the eDMA mapping format flag
 directly from glue drivers
Message-ID: <20240304061900.GF2647@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-3-cfcb8171fc24@linaro.org>
 <Zdy8lVU6r+JO6OSJ@lizhi-Precision-Tower-5810>
 <20240227074533.GH2587@thinkpad>
 <Zd4eLBXscaV1WkbV@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zd4eLBXscaV1WkbV@lizhi-Precision-Tower-5810>

On Tue, Feb 27, 2024 at 12:38:52PM -0500, Frank Li wrote:
> On Tue, Feb 27, 2024 at 01:15:33PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 11:30:13AM -0500, Frank Li wrote:
> > > On Mon, Feb 26, 2024 at 05:07:28PM +0530, Manivannan Sadhasivam wrote:
> > > > Instead of maintaining a separate capability for glue drivers that cannot
> > > > support auto detection of the eDMA mapping format, let's pass the mapping
> > > > format directly from them.
> > > 
> > > Sorry, what's mapping? is it register address layout?
> > > 
> > 
> > Memory map containing the register layout for iATU, DMA etc...
> 
> the world 'map' is too general. can you use 'register map' at least at one
> place? There are bunch 'map' related DMA, such iommu map, stream id map, 
> memory page map. The reader need go though whole thread to figure out it is
> register map. 
> 

This is what used from the start and also what "mf" corresponds to. So I had to
use the same terminology.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

