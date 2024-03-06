Return-Path: <linux-arm-msm+bounces-13453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746438732FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 10:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9431F258A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C345FBA7;
	Wed,  6 Mar 2024 09:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aD2KGCDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70475FB95
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718354; cv=none; b=UsNlYcbdMXpAHirKlu7WgXw2cOXnc5fWFBMckrIyBhMv98qcuodBhCjmSWNe9X0mRfONylrGMUkkjEunFsFl2V/MOFU5uLnWDXLZzgCNRqwAvDM+RiHaZSqlq5LLrzxhm+l0U1F3RwxCUcTekJ87GTX/B+Ji41KFv7JufUrZLqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718354; c=relaxed/simple;
	bh=CMVF7n8dO5vESzb9IowrOlCjHiKoyt3gqfWtMoJTUa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HerEtVjJpIIMqmOq7cjKv1p85+fo5rQTrSgE1OhN6cARQOhbLluhmt+opeytC4/cE6OJnl/OxKww9SLCgOzxkdL7zGUDm5VlwRJITSvsdCkGgk7VJm/Z8NBrd0GzuFDNg/aJ00hnb+Dk+8aRlu6Ptvm5BIL60GYa15Vjb/vsoXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aD2KGCDk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc49b00bdbso60129155ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 01:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709718352; x=1710323152; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=onNOJK5dVb7dHDdyyPmx8REkXT8q/MvLJnZknRgJ6mw=;
        b=aD2KGCDkwwTN4+n3M2IQxusmQv89GQOnCb2vyldhkkZMMNc9eA92HqO2FGHB7l2V6e
         zrqHPXcSoaW2Fvdw38zLRQroKE0wwStl+DnDAmff9FWnQFi5OB9anLTz7tmueXUrQbOw
         7xfz2FsR3Ggnywtk2I5WvW5o0zV5vv1FBEkuRfkbRfH3Xg0uePSAkCZb22R323nRvOgf
         1yiGU878gTKUhEmzx/jaDjmWuUbjW+z8xXpTMjHc995u+9hwSUNuyMj5+EuvJHNGY0Yf
         ggTnMUchI7Smx26RRydFqVh4wiF4QZGldJlDA/PJT/0rM7IFCDn89owgP6kPvefCalQj
         6AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709718352; x=1710323152;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onNOJK5dVb7dHDdyyPmx8REkXT8q/MvLJnZknRgJ6mw=;
        b=pV8lhxqGWMYaqh/xdGQ41cYgyI7LcGwNyGGKYgrYmaULKkeXmu44SxqBnYtA391o/v
         hjtFuM8OR3hOG6+0Mw2aR+9PbjgX7gun9guoA/7t873QXht/foiuOZmPIg9prTALYlGx
         xYdBakLvFGfLMKW2b0esy59ZmBi+dXpLwykMC6j0UbmiERnHhEZYqgu/82+2X1TZxQF1
         WL2K/1sRobA5S3tlix48t0+atxaXCPh0SbVp53BG9FwVHW3SVv6vcs53mv3BTgD3mL8C
         5FZ9TOu70+wbSRQH29QQsEDUa+CD4yagxR4P0bsREGCtZ9fOtjfB6uyY1hJubQyWGUQ6
         rrIA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0yh1a4dmBAaQq8jykL6Az35gPG7Rfv0SqRt5t9YzMyjNwFUI2U6Ns1WKiqsETV4ElM30BWhA/TxjFVX6Bw4x/U8CvI91IXrLaBDW7w==
X-Gm-Message-State: AOJu0YxFfgXNkdYTYtl8b4PjY1hJ22qdd2f/F5wRrYVvSSFgy4Eq4ngk
	ca0kdMCFxtWphhBcElYVVXJ70HJmPHV1Z7DVB3CvJGY650YQ9OH4CTlgIg1vXA==
X-Google-Smtp-Source: AGHT+IF5LhL5XIw+P5F6Ztyfbld27LtakrR/VOK8wMDEg3ocAgkdsTAQ2fMWpd9fCfHvlu9oM0q57A==
X-Received: by 2002:a17:903:24c:b0:1dc:b531:833 with SMTP id j12-20020a170903024c00b001dcb5310833mr4833692plh.63.1709718352039;
        Wed, 06 Mar 2024 01:45:52 -0800 (PST)
Received: from thinkpad ([117.248.1.194])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001db594c9d17sm12099477plh.254.2024.03.06.01.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 01:45:51 -0800 (PST)
Date: Wed, 6 Mar 2024 15:15:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
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
Message-ID: <20240306094545.GD4129@thinkpad>
References: <20240305081105.11912-1-johan+linaro@kernel.org>
 <20240306063302.GA4129@thinkpad>
 <ZegZMNWxCnLbHDxP@hovoldconsulting.com>
 <20240306083925.GB4129@thinkpad>
 <CAA8EJppsbX=YXf1Z6Ud+YMnp2XnutN1hcb1T0KdAAWXFREVxXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJppsbX=YXf1Z6Ud+YMnp2XnutN1hcb1T0KdAAWXFREVxXg@mail.gmail.com>

On Wed, Mar 06, 2024 at 10:48:30AM +0200, Dmitry Baryshkov wrote:
> On Wed, 6 Mar 2024 at 10:39, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Wed, Mar 06, 2024 at 08:20:16AM +0100, Johan Hovold wrote:
> > > On Wed, Mar 06, 2024 at 12:03:02PM +0530, Manivannan Sadhasivam wrote:
> > > > On Tue, Mar 05, 2024 at 09:10:55AM +0100, Johan Hovold wrote:
> > > > > This series addresses a few problems with the sc8280xp PCIe
> > > > > implementation.
> > > > >
> > > > > The DWC PCIe controller can either use its internal MSI controller or an
> > > > > external one such as the GICv3 ITS. Enabling the latter allows for
> > > > > assigning affinity to individual interrupts, but results in a large
> > > > > amount of Correctable Errors being logged on both the Lenovo ThinkPad
> > > > > X13s and the sc8280xp-crd reference design.
> > > > >
> > > > > It turns out that these errors are always generated, but for some yet to
> > > > > be determined reason, the AER interrupts are never received when using
> > > > > the internal MSI controller, which makes the link errors harder to
> > > > > notice.
> > >
> > > > > Enabling AER error reporting on sc8280xp could similarly also reveal
> > > > > existing problems with the related sa8295p and sa8540p platforms as they
> > > > > share the base dtsi.
> > > > >
> > > > > After discussing this with Bjorn Andersson at Qualcomm we have decided
> > > > > to go ahead and disable L0s for all controllers on the CRD and the
> > > > > X13s.
> > >
> > > > Just received confirmation from Qcom that L0s is not supported for any of the
> > > > PCIe instances in sc8280xp (and its derivatives). Please move the property to
> > > > SoC dtsi.
> > >
> > > Ok, thanks for confirming. But then the devicetree property is not the
> > > right way to handle this, and we should disable L0s based on the
> > > compatible string instead.
> > >
> >
> > Hmm. I checked further and got the info that there is no change in the IP, but
> > the PHY sequence is not tuned correctly for L0s (as I suspected earlier). So
> > there will be AERs when L0s is enabled on any controller instance. And there
> > will be no updated PHY sequence in the future also for this chipset.
> 
> Why? If it is a bug in the PHY driver, it should be fixed there
> instead of adding workarounds.
> 

Fixing the L0s support requires the expertise of the PHY team and they will only
do if there is any real demand (like in the case of mobile chipsets). For
compute chipsets, they didn't do because most of the NVMe devices out there in
the market only support L1 and L1ss.

So we have to live with this limitation for now.

- Mani

> >
> > So yeah, let's disable it in the driver instead.
> >
> > > > > As we are now at 6.8-rc7, I've rebased this series on the Qualcomm PCIe
> > > > > binding rework in linux-next so that the whole series can be merged for
> > > > > 6.9 (the 'aspm-no-l0s' support and devicetree fixes are all marked for
> > > > > stable backport anyway).
> > >
> > > I'll respin the series. Looks like we've already missed the chance to
> > > enable ITS in 6.9 anyway.
> > >
> >
> > Sounds good, thanks!
> >
> > - Mani
> >
> > --
> > மணிவண்ணன் சதாசிவம்
> >
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்

