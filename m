Return-Path: <linux-arm-msm+bounces-13441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55A8730EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C7128538E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8FD199DC;
	Wed,  6 Mar 2024 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hptdLoP1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96F5D730
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709714374; cv=none; b=LxFus1O9KpbvJHyKrfqdlXAJVfVaGPlx/DkDLAbPLIx0GeGONDMs6j1JpDSbMj1N5Pvxbj1LYfk+uR5VYLZ0cyJKuQhnG7Tx93Jamr+nhBDC/2r/MBxQ4B/c7KURqWUGh/hGBYrh7oWPssxHQXUxckpkayr0hZkBJBMKprFwnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709714374; c=relaxed/simple;
	bh=QlH3Wow2rZzvmp6ckeHeqUHMD2Vdr13Mh65ALOXij+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhTAyIRwIMJ6EYg/3vrUCTZC+sBwZtuy1Y7eR+QF5lBATeoU6qzm490PgXm9RPgzMT9+jOGnq1m9uJj1DRvtqdSJw3wFCrmMgpinoofHMpXI+dzGLbGiVZ/YfctXpAtXiEQxZbkIEcxCVR+GnzDPDrCmINsTdrN2BAaLHYaX7Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hptdLoP1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc96f64c10so60203575ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709714372; x=1710319172; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OLL4vtiaVuob8hMTl3EPZBu7b8uDGWEMU5ByLQSiHn4=;
        b=hptdLoP1UShB2ofMJ7Gz6+WeW+nuQOGGp0XiOF9jsDU2i9pH+z/tkz4d5E+YkwRqAu
         b9fTWJ0xwHBff+HbJakf29RuyBMq21vyO82o9iEMK1kz/t555NUjlVWAjrf/2OT/FIJj
         xbv/2XtmkJZXsdndDd1Ji23JEyZQH1IqroTh4ktT9cU+n2cbZBOrKdZB7SK4Jc9Vcmyf
         DYKeDCx6YQeyKdevF8Blf/wwbFxd9LbwQcLOBz0jNp1zWPN8nnkdlSVGlgeJxbP95mar
         W0ksywNPNg2YAwPjYA0gnNFK5e0CnqDySogH1D6dWttVNCGaCgpZZl1UszNN/DrUoN1W
         tLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709714372; x=1710319172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLL4vtiaVuob8hMTl3EPZBu7b8uDGWEMU5ByLQSiHn4=;
        b=Wzw4KJCP32oVTmOVsWpwaNX5q6lrd1/pb3wynvO4CZf7giRVRVqY6pDsgEcsdcXD4w
         IN+lqdCHIP8+e4KcLzX/GGxqFXqcEv9rMNwvwlnh2sadWPl1ItCpUuQ4jlJRhtTbiCpV
         d6rGfEaf6c3zA8uKd+wmf7SvjYGTR4J0p53RghD72cbH5fdxm7KMEUU6oEkcnitf4YqE
         5vqXxX3/55q7+4DnnrtQIOLCgSm8OefCzWqLYCeImvkFsYNzUEi4mqrLULuhOp7qekxG
         oqW1SnNaCIuBivFgweN/wv/nY1G1XIsRcqcSNRxfYmv/+u8nsecOq+0rYvMnugEci1c6
         aATw==
X-Forwarded-Encrypted: i=1; AJvYcCW4MfYbVuDwTUocPvAYyr7esLYtF0D4Hi30GmXD2cQafqXUM9pCJF1azmiRT+1zIcOp0XNkFn/7kAuX1hpdgCLm8KyL7fbJrG4GHIotyw==
X-Gm-Message-State: AOJu0YyUZR3afNNNUztW/EUktFf4awqOi1ljN6A0oZVm7ffWtT9FWYqn
	8M+LxnYuqSTkgYo1yhFluUUxc9lfkoCZn+latiiHwIXNEmXajALqsnu2DyiCmA==
X-Google-Smtp-Source: AGHT+IEKcpq6WpONUJLlWmUdwNrA2CS8okOHDA4GD4M4FYuHGBHkQTrblblynQVMeIuI6ij6U423FQ==
X-Received: by 2002:a17:902:7845:b0:1dc:b382:da8d with SMTP id e5-20020a170902784500b001dcb382da8dmr3856250pln.38.1709714371623;
        Wed, 06 Mar 2024 00:39:31 -0800 (PST)
Received: from thinkpad ([117.248.1.194])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902e80900b001d9a42f6183sm11962904plg.45.2024.03.06.00.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 00:39:31 -0800 (PST)
Date: Wed, 6 Mar 2024 14:09:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/10] arm64: dts: qcom: sc8280xp: PCIe fixes and
 GICv3 ITS enable
Message-ID: <20240306083925.GB4129@thinkpad>
References: <20240305081105.11912-1-johan+linaro@kernel.org>
 <20240306063302.GA4129@thinkpad>
 <ZegZMNWxCnLbHDxP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZegZMNWxCnLbHDxP@hovoldconsulting.com>

On Wed, Mar 06, 2024 at 08:20:16AM +0100, Johan Hovold wrote:
> On Wed, Mar 06, 2024 at 12:03:02PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Mar 05, 2024 at 09:10:55AM +0100, Johan Hovold wrote:
> > > This series addresses a few problems with the sc8280xp PCIe
> > > implementation.
> > > 
> > > The DWC PCIe controller can either use its internal MSI controller or an
> > > external one such as the GICv3 ITS. Enabling the latter allows for
> > > assigning affinity to individual interrupts, but results in a large
> > > amount of Correctable Errors being logged on both the Lenovo ThinkPad
> > > X13s and the sc8280xp-crd reference design.
> > > 
> > > It turns out that these errors are always generated, but for some yet to
> > > be determined reason, the AER interrupts are never received when using
> > > the internal MSI controller, which makes the link errors harder to
> > > notice.
> 
> > > Enabling AER error reporting on sc8280xp could similarly also reveal
> > > existing problems with the related sa8295p and sa8540p platforms as they
> > > share the base dtsi.
> > > 
> > > After discussing this with Bjorn Andersson at Qualcomm we have decided
> > > to go ahead and disable L0s for all controllers on the CRD and the
> > > X13s.
>  
> > Just received confirmation from Qcom that L0s is not supported for any of the
> > PCIe instances in sc8280xp (and its derivatives). Please move the property to
> > SoC dtsi.
> 
> Ok, thanks for confirming. But then the devicetree property is not the
> right way to handle this, and we should disable L0s based on the
> compatible string instead.
> 

Hmm. I checked further and got the info that there is no change in the IP, but
the PHY sequence is not tuned correctly for L0s (as I suspected earlier). So
there will be AERs when L0s is enabled on any controller instance. And there
will be no updated PHY sequence in the future also for this chipset.

So yeah, let's disable it in the driver instead.

> > > As we are now at 6.8-rc7, I've rebased this series on the Qualcomm PCIe
> > > binding rework in linux-next so that the whole series can be merged for
> > > 6.9 (the 'aspm-no-l0s' support and devicetree fixes are all marked for
> > > stable backport anyway).
> 
> I'll respin the series. Looks like we've already missed the chance to
> enable ITS in 6.9 anyway.
> 

Sounds good, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

