Return-Path: <linux-arm-msm+bounces-9497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6B846B52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 118BDB29DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 08:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B6C60867;
	Fri,  2 Feb 2024 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQVha+XI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412AD604DC
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706864134; cv=none; b=hLVOTYtD8Z9p1t1K3i5S1d/SgZMAMBfkdTRiJHi2hXDSV3Hhmz+dXnHdWqT2Fqb7xiH26VU8PvyNYhlT3Pl4gXQVzMGgQrJjUbuq/F05uffXOV1ZQ87fw1cJx/0nzHJmuKYtnfgdhOVYs43zHaQl8Gp6XgDTevrYpuOCmu2Jfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706864134; c=relaxed/simple;
	bh=k6BF/q2AUq9fet7l2bvyEg/64CUFxjGNt72Xjm2UEvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgbJWSf2Z7+f3ShK99gyCkSInYZj5uffzqd8Q4H+Ufvq67p5lljfbhoFmboplyZNcicWexiD8EEljctF/y8pWe0ubXn871jG12uNAuy2+8OPoGVCpeb7pk5MQLJ6/AORMSUlEi2zkibSiErjfZEV2RXNIi3XAw1vQCAMvse3+cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQVha+XI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3604697d63so282341866b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 00:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706864130; x=1707468930; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3fiin9xT95xmjaBWj39CSHW+K1rE7OpA6eoBA4kS3YI=;
        b=XQVha+XIpWelasWeO6GH/tsGHtFiHEl76r5XSXNc1tp61aLzt2rupgw3ZHDmNZx2D8
         4bVH9aSRxsWqY2IjhM4i1gIoijBlGBhg95/21IagAV0L7IRUxPvGqO9PMc0WU+UNRUrM
         W+uuA+rkLOq3BllBrw+LTBsjTCSQcUlDJeXaOtP7U3tg6bXfcsNsxeTAohXzuZx7xmYB
         FAClz8JLxXckw9DjSI8lvgkmCKzLUNaaSpJ2EVZG0vkcYbBmNMjpEbDlfha4/OVJOS97
         ic0IFBMW5RS2/i42jGjgi3eKWNRXFQ5R294qzW9jlYZFKCqNgr+sP30wuvrT2SIFERu9
         DXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706864130; x=1707468930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3fiin9xT95xmjaBWj39CSHW+K1rE7OpA6eoBA4kS3YI=;
        b=Ot+m+8zKfe29SX6kjybzaBpU2aDY02P9xmcQ1geITSV5VPxBGhxtXshnDJRtfJ12nF
         GJtzquLg+UIrGh4KBpHyrTiIcP/7fcaFDpKcUeBifTiBQiqSiRVG3fhCLGHSpcLnjaPb
         RBXMMWi4UnQqawMy4s7FcEdsXuKZoL9JLJJ27qTEGz+QkMdDivDgCwzphhGkP4UyjWgL
         bD0QUYOPunjv5HFC9V7oBjTKja670fNrXvUK56psfpnEc0MatShpKKDjRSwp8qZNOY1d
         pS7RDq3UgYMd5Ya9FmHnxiPX6Afvlx77TdCLrLhhp/gRRKHD4a/E82Q33hoSUNPeFQ8a
         DfZw==
X-Gm-Message-State: AOJu0YxJ6eOYW01JfwtaJ3AC8uqwBkKz2HfeSdNYo47C3quJApKiLDRa
	i9MyMswf5XgnYWw4YcJd7CR+f62TMLyBbvlCqWcVDAT4Td5D/kY4+kxLUsYc32+fDKfbfMaQDn7
	i
X-Google-Smtp-Source: AGHT+IH7WUTM7Tr4j7ap3Ccz9tzPdcldjtlakQgc7YxtH+BZ0fjWO+3Q6wdm9rI1txYNOLBjYQsLDQ==
X-Received: by 2002:a17:906:5943:b0:a34:d426:1c0a with SMTP id g3-20020a170906594300b00a34d4261c0amr4824837ejr.24.1706864130412;
        Fri, 02 Feb 2024 00:55:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXtKT7tGmKSZBXztNYa5HLg/nU10SEJnDpChKo7QwnMd9ENx3wKBYBz8SnOtUgGHlzrBNBAlGE4hv64gL+IeLNYLmphZi7HpWWjwegPBWniNPjDeypYyf9eN1GLHsgMHOhckj1iO01RV5IXIE6R5/nlubOoLQ/J956fbj3vXqwYlI66ipgnYvgiDtmnQ55uXBSD0NRtn1OrMAKJGdE0sAcacyIvVwvy/crUG1Ag6v6qsfpb92ssbf5+LyL6z0f7poAEzUlT1UUj6e8XOTcu+yFk0DMnTLT1irnrS4yM90qr+LGt1rK41GM=
Received: from linaro.org ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id y19-20020a170906071300b00a26d20a48dasm656755ejb.125.2024.02.02.00.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:55:30 -0800 (PST)
Date: Fri, 2 Feb 2024 10:55:28 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Message-ID: <ZbyuANz7Jza7lzZS@linaro.org>
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
 <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
 <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
 <Zbyqn5wnH7yCe38P@linaro.org>
 <20240202084806.GF2961@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240202084806.GF2961@thinkpad>

On 24-02-02 14:18:06, Manivannan Sadhasivam wrote:
> On Fri, Feb 02, 2024 at 10:41:03AM +0200, Abel Vesa wrote:
> > On 24-02-01 20:20:40, Konrad Dybcio wrote:
> > > On 29.01.2024 12:10, Abel Vesa wrote:
> > > > Add the compatible and the driver data for X1E80100.
> > > > 
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index 10f2d0bb86be..2a6000e457bc 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
> > > >  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
> > > >  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
> > > >  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> > > > +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> > > 
> > > I swear I'm not delaying everything related to x1 on purpose..
> > > 
> > 
> > No worries.
> > 
> > > But..
> > > 
> > > Would a "qcom,pcie-v1.9.0" generic match string be a good idea?
> > 
> > Sure. So that means this would be fallback compatible for all the following platforms:
> > 
> > - sa8540p
> > - sa8775p
> > - sc7280
> > - sc8180x
> > - sc8280xp
> > - sdx55
> > - sm8150
> > - sm8250
> > - sm8350
> > - sm8450-pcie0
> > - sm8450-pcie1
> > - sm8550
> > - x1e80100
> > 
> > Will prepare a patchset.
> > 
> 
> NO. Fallback should be based on the base SoC for this platform.

Right, so since the SM8250 is the one that has the core version 1.9.0,
should we just the sm8550 compatible as fallback for all other ones.

Yes, I know that there is SM8150, which has core version 1.5.0, but it
is still 1.9.0 compatible.

Or maybe we should rename the config to 1_5_0 and have the sm8150
compatible as fallback for all these platforms.

> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

