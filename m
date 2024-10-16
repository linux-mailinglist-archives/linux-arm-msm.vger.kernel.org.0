Return-Path: <linux-arm-msm+bounces-34575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A99A06D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A021C21B70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CC0206075;
	Wed, 16 Oct 2024 10:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuTJrw2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AF206050
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073673; cv=none; b=ml2CUWsRXKFxpIBHLWpJshoOnOYOLROwsvb50u0rPGGufM7S833JosVCy9aKpfnmtR70zrSTTb9dOj8L3jfrUlChPXpJdvADbW1b8zQGzWeSKL9cPOeuHJiCIy3Zx/FQC3/3Q1WyzIesEh4G4IKuIXKOYnWgE+S+T2nMaHY44Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073673; c=relaxed/simple;
	bh=Jy/4YRGjM5uU9fBaBkoJwFVJOY3w+JZVrcjpicoQrtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2KvMUz9Ys8pGrPIuRuu8uyGVYREtlayIueITYiTs0YVXe5ilz4Ymg7Z7T9lATss3+9zTPim8QKL87jcGjEmYZifF7tDo9dYM1yzlrABedB84VgbUEYVmsWWS/JSh9y/Mi7XP68llQCykYGzRW2qbM7EE3R/t2E7a46/THBNrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LuTJrw2h; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c913aso3637955e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729073670; x=1729678470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lM65E4+Eo8QstTSX4BkH0aaP4WZN36AHY5LgVC065Sc=;
        b=LuTJrw2h+1zJFD47KiuOy9sITM/ibaMvS0mEubNW7eq8LTaAy2FqQWEUOmeOMhanPI
         2gaIu858CiHrkDf16zGBzX21VfVE1YGZvwVLbSVtM+mLVglcXlULvijv6lEXVAQ7V7oH
         Ofy60aDOBEUplCVgtgWVLutolDyMZnO02uIDXnjUfA4YRfQGy+hk2GjZlIgP6XFPv7Bi
         LI7uvy2RuMlAkqI8VIeggwN+SPMn7N7nr9lCh05/yRezO770Giefc53NhALZdxZekcEy
         n0jvIGN1iucJEp3vPh0KxELU7gF3jchfERHbmHROzetFSQSuw0LMDMDyG0E7sbjfx5y7
         p/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073670; x=1729678470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM65E4+Eo8QstTSX4BkH0aaP4WZN36AHY5LgVC065Sc=;
        b=aalfcfpd9Yn5FYE1tXTsTG2LjkBtMPIM0qp7z7sWbE6Nwp/8ddOtJeCw51fioC1zjQ
         0R93IBanReyMGsxoboinV9dmqXo3tEXgNoknKls+zu5nHvLL+bf8Pn9kRPI+9zW2oVWM
         QE+H6whC+oJ6aBjFR48WCIk08XJ29Pb1xSvFMQVIhCzfRTHMGRYee46fpoE6626sIFvv
         WnkvqW5fOr4uvCo4VBUJcNsrQFUql0hYczJYiIfar0n5VCctQAkqQbxOK1BjP9VtNoGx
         sLBVGku51JGHyPv1ThLJrPBQjyfeNuCW9OCIy/EunYgRzxOlxhUC7MzpXE5K2QycMj5t
         1FEA==
X-Forwarded-Encrypted: i=1; AJvYcCWQFWPjxNGohFgL8VUjm81pwNeqQ3xQg+sLyWo5GcjJf0aiDENIHuREvxVrC3UPA8c7jhkW3SndygAHyy2+@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/ItXDP9DJdLc7r5ToTPfQBmG8xXGHbhkNAzQQw9QqPDGo+bs
	n7fM+EcuX0VwDQs6qNWN3KfWA2C+2Gs9i+0le/evuB6EKiQ9DVCqawcMSAJlJQM=
X-Google-Smtp-Source: AGHT+IEFRXiKZjGcstJy+MKY385TLFHcYZD3pT8PlWoFfPmx83LlhFdNsBRJBrkU1Avk5D/mqxOMUA==
X-Received: by 2002:a05:6512:398d:b0:539:f995:5b00 with SMTP id 2adb3069b0e04-53a03f0c0e6mr2137629e87.7.1729073669885;
        Wed, 16 Oct 2024 03:14:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffb1ebesm408714e87.105.2024.10.16.03.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:14:28 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:14:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
Message-ID: <utfifivkqt2mgejmycnyrw4aoy6rbxkifgaxajdbb7lgq76p25@i2zzpeksbwja>
References: <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
 <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
 <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>
 <20241001085105.iglzp3art5ysli2d@thinkpad>
 <b1d982c1-f800-97eb-1be3-e77e04a8e81d@quicinc.com>
 <20241006180146.m6xvpwbvkiy7obpx@thinkpad>
 <20241015135114.kbiyvymng4e6dmvb@thinkpad>
 <CAA8EJpombwmYimszNoQ51m+cfcNs9x+TQ39+-6kXXp+Ziq=d7Q@mail.gmail.com>
 <20241015152736.exon6q77jathhp55@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015152736.exon6q77jathhp55@thinkpad>

On Tue, Oct 15, 2024 at 08:57:36PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 15, 2024 at 04:57:45PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 15 Oct 2024 at 16:51, Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > On Sun, Oct 06, 2024 at 11:31:52PM +0530, Manivannan Sadhasivam wrote:
> > > > On Sun, Oct 06, 2024 at 12:33:21AM +0530, Sibi Sankar wrote:
> > > > >
> > > > >
> > > > > On 10/1/24 14:21, Manivannan Sadhasivam wrote:
> > > > > > On Tue, Oct 01, 2024 at 09:56:30AM +0300, Dmitry Baryshkov wrote:
> > > > > > > On October 1, 2024 5:42:35 AM GMT+03:00, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > > > > > On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
> > > > > > > > > On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
> > > > > > > > [..]
> > > > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > > > > > > > [..]
> > > > > > > > > > +
> > > > > > > > > > +&pcie5 {
> > > > > > > > > > + perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> > > > > > > > > > + wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> > > > > > > > > > +
> > > > > > > > > > + vddpe-3v3-supply = <&vreg_wwan>;
> > > > > > > > >
> > > > > > > > > Please use pwrseq instead.
> > > > > > > > >
> > > > > > > >
> > > > > > > > What benefit is there to wrap a single 3.3V regulator in pwrseq driver?
> > > > > > >
> > > > > > > First of all, is it really just a 3.3V? Second, is it actually powering up the host controller (as expressed in the device tree? Is it a power supply to the slot (in this case, I think, it should be expressed differently)? Or is it a power supply to the card itself?
> > > > > > >
> > > > > >
> > > > > > Yeah, we should get into the details here. We were not paying attention till
> > > > > > now, but with the advent of pwrseq, we should describe the power supply properly
> > > > > > in DT.
> > > > > >
> > > > > > Here I believe the supply is to the PCIe Mini Card connector where a modem is
> > > > > > connected. In that case, 3.3v supply should be connected to 3.3Vaux of the
> > > > > > connector and we should have a generic pwrseq driver for the mini cards.
> > > > > >
> > > > >
> > > > > Hey Mani, Dmitry,
> > > > >
> > > > > The schematics are identical to that of the X1E CRD with
> > > > > the exception of the pcie daughter card having the rtl8125g
> > > > > on it. Yes, the 3.3V supply is connected to the card as well.
> > > > >
> > > >
> > > > Is this connected to the 3.3vaux of the card? Please specify the actual rail
> > > > name as the 'PCI Express Mini Card Electromechanical Specification' specifies
> > > > only 3.3Vaux and 1.5v supplies.
> > > >
> > > > > Doesn't this mean all other x1e boards out there needs to be
> > > > > updated with pwrseq as well? Anway will get that addressed in
> > > > > v3.
> > > > >
> > > >
> > > > pwrseq is the kernel driver abstraction, nothing to do with DT. But for making
> > > > use of pwrseq, the supplies need to be described in the proper place. In this
> > > > case most likely under a separate node of PCIe bridge. Then you'd need a
> > > > separate pwrseq driver in kernel to parse the supply and take care of it.
> > > >
> > > > I'm currently writing a pwrseq driver for standard slots (x8 for X1E) and should
> > > > be able to post it early next week. So you or someone could use it as a
> > > > reference to add a new driver for m-pcie cards.
> > > >
> > > > If no one picks it up, I may just do it.
> > > >
> > >
> > > Hi,
> > >
> > > The slot driver is taking more time than anticipated due to the pwrctl rework.
> > > So please go ahead with the current binding and we would switch to pwrseq
> > > later once the driver is available.
> > 
> > I assume this applies only to the case of the actual 3.3V being used
> > to power up the PCIe slot? Or to all existing pending items using
> > vddpe-3v3-supply?
> > 
> 
> What do you mean by 'pending items using vddpe-3v3-supply'? I was referring to
> the slot supplies only.

As we've checked offline, it seems to be just a controlled 3.3V supply
for both NVMe and WWAN. I'm fine with using vddpe-3v3-supply.

-- 
With best wishes
Dmitry

