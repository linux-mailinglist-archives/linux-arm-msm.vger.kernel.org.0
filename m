Return-Path: <linux-arm-msm+bounces-9515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B36846CEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 10:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E041F26841
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 09:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E9177F14;
	Fri,  2 Feb 2024 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zyYhOuUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED2482FB
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706867310; cv=none; b=aYvBixUYE1sJ73e+l8g3AAc+I5x7jwSGzj5If9HFKT0cBjUbn4XBodTvCod0dRu3hQLtqY0oZXfwgs8i4d4iawkBvrgyTP/URBQlEq94MeDpKGzEYXf8rvLWg3J2gl6FShPOFTV04ltdlABslTc4kTKSijuje+RDmRwFPx/T7w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706867310; c=relaxed/simple;
	bh=kzPaULzFvPF3PMCdaeoG/nw2+KHJM6ciXwfij0rgIrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D64K9NI5o+M6nl+NbXY+D+GTWzKtZw0QgETa0CxIdY7uBWNucZkFUkFbfHRkuPUpGN3VIYaJSKnOE0K96rHL2VnmosKXdOh7AKR7iDl8d2kMdyEz6RcfncomOz7/ekdQ9l5+JRSAXq+i1lPwVVur15+nOQivt0rE00XDd0kHJyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zyYhOuUI; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bb9d54575cso1232247b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 01:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706867307; x=1707472107; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oLfN6KoWDp7SJJDtG51IU5F3us3n4E7e6QFVHVgsnuY=;
        b=zyYhOuUIfg4SYrYPE96gcl5STc37IHaThYkZiqNFg+Dqd5JzhSQPKepEFhcJZBDIoN
         D+sFuHqJQHfNYiquayOiF1Sg9M6A8VrmOppSoq8vXUmtfnawR7UMJ5q0FSva+dF0sxAk
         Yeb3pKR30MU8EXqQO8T2jD9aWimtzldXF59sQUmx+lYZPjvvxiJpQFtplBO+kz7udth1
         0PGuwOQde2L07p/9StfQQacmGqwMU0zO5R2odHGwbi8ZjexwaiLmxb3zSdUEbnv2cHqV
         H5C5CGHIG+5THdmkFBijOgHg1/7+m5u4QYhXybMz/65ee0jQk+oZ0KGNYys6Qot0YXpF
         iwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706867307; x=1707472107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLfN6KoWDp7SJJDtG51IU5F3us3n4E7e6QFVHVgsnuY=;
        b=YyKxsqLs3a5Z2kIKXapOScgGTySQFs5o1xwv3nCYyLtZCBkc56eaeIPTLCR4aKNTnG
         bj/ep94wEsbv4GH/2qViMBmgShnOlK8wRduImYM0l86aRsxyPDRUpHvwI9cKfNYNVEC4
         pROPdPsp4MIV5zooDJAk/BitM9Z9v0/rl8oV+v8HS1tqpbj93Xusdgw78rSXZQSrHqNq
         3uP/QwuQUmVFVKXbsWbYCIpX4SEOpZSSpnjfsuJl5Dvs5JfaHlglnG/PnRIgeTx3sC5V
         Za7MRJTBM8eLqVhzyvECZGe+Em00lTT8Tg8vYyPm4zOMNQQq+q9pZu1ZaT3fihMPpjRH
         ld4A==
X-Gm-Message-State: AOJu0Yw+T6szdUqPlDYiAt7GAUvX8+dkNsevntg4/oR86UefYzYJ0O+t
	OEXQAsZShcAqs8QGGN+iMS0aF+4PlSsZQHxlpTRp6jJPSXF0gaOOR98QyRYq+Q==
X-Google-Smtp-Source: AGHT+IFfLwK+9BXpOchg1FqvYhCKmgFQNu67uOS5ROmN2r6iI2847Kbamt6KVkKnR0trFIZgrIZE8A==
X-Received: by 2002:a05:6808:23d1:b0:3bf:c37e:c781 with SMTP id bq17-20020a05680823d100b003bfc37ec781mr503171oib.4.1706867305593;
        Fri, 02 Feb 2024 01:48:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVvCIbeHADoIhg8Tj5FXRQdduW2c/1/rso5VvJ20Cf6fzW2VgAr7yFE8PSYVZ+uxHjOk5ziT9qoqsKqtkV32Hql+Z2pffTMqLAP01Z4Q6T3qVJ05O5S/eqhQQZQkPT5R04GuRduEJjhM4HYFMb5vacrf6B4TWoc4+gAJOU4esRMzTNPpTaFvNZ7wl8Up5NhtSH2FvvJwmM8Z5SEiR5ZtDpyVFI9QnJgM2/CrVtK6JXjQw6VX1Jc8FQ5XjocWVBcnPMQFc79PSCxAsxFGKKfz5rwE231hB+Y0SzYoGXgMQPPFqkAa5CX/0Y=
Received: from thinkpad ([120.56.198.122])
        by smtp.gmail.com with ESMTPSA id d9-20020a056a0010c900b006ddb77d443asm1174306pfu.209.2024.02.02.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 01:48:25 -0800 (PST)
Date: Fri, 2 Feb 2024 15:18:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Message-ID: <20240202094820.GA8020@thinkpad>
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
 <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
 <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
 <Zbyqn5wnH7yCe38P@linaro.org>
 <20240202084806.GF2961@thinkpad>
 <ZbyuANz7Jza7lzZS@linaro.org>
 <Zby2hp2vH4TRv+xV@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zby2hp2vH4TRv+xV@linaro.org>

On Fri, Feb 02, 2024 at 11:31:50AM +0200, Abel Vesa wrote:
> On 24-02-02 10:55:28, Abel Vesa wrote:
> > On 24-02-02 14:18:06, Manivannan Sadhasivam wrote:
> > > On Fri, Feb 02, 2024 at 10:41:03AM +0200, Abel Vesa wrote:
> > > > On 24-02-01 20:20:40, Konrad Dybcio wrote:
> > > > > On 29.01.2024 12:10, Abel Vesa wrote:
> > > > > > Add the compatible and the driver data for X1E80100.
> > > > > > 
> > > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > > ---
> > > > > >  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > > 
> > > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > index 10f2d0bb86be..2a6000e457bc 100644
> > > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > > @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
> > > > > >  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
> > > > > >  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
> > > > > >  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> > > > > > +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> > > > > 
> > > > > I swear I'm not delaying everything related to x1 on purpose..
> > > > > 
> > > > 
> > > > No worries.
> > > > 
> > > > > But..
> > > > > 
> > > > > Would a "qcom,pcie-v1.9.0" generic match string be a good idea?
> > > > 
> > > > Sure. So that means this would be fallback compatible for all the following platforms:
> > > > 
> > > > - sa8540p
> > > > - sa8775p
> > > > - sc7280
> > > > - sc8180x
> > > > - sc8280xp
> > > > - sdx55
> > > > - sm8150
> > > > - sm8250
> > > > - sm8350
> > > > - sm8450-pcie0
> > > > - sm8450-pcie1
> > > > - sm8550
> > > > - x1e80100
> > > > 
> > > > Will prepare a patchset.
> > > > 
> > > 
> > > NO. Fallback should be based on the base SoC for this platform.
> > 
> > Right, so since the SM8250 is the one that has the core version 1.9.0,
> > should we just the sm8550 compatible as fallback for all other ones.
> > 
> > Yes, I know that there is SM8150, which has core version 1.5.0, but it
> > is still 1.9.0 compatible.
> > 
> > Or maybe we should rename the config to 1_5_0 and have the sm8150
> > compatible as fallback for all these platforms.
> > 
> 
> Actually no, that's a bad idea. I would break DT backwards compatibility.
> 

Yes!

> I'll just drop the compatible from driver and add fallback in DT for
> X1E80100.
> 

Sounds good.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

