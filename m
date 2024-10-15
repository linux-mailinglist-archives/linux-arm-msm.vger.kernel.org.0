Return-Path: <linux-arm-msm+bounces-34450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D863299EE28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5869E1F23BFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239F01AF0D9;
	Tue, 15 Oct 2024 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mjF6cR7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817841AF0CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 13:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729000283; cv=none; b=Pjssm2eh5MgTwOd7NMaX1yrWhSQWUnZ8v1DepBLzzf5egmbKuJwFsE5UyR/93fLUKBPHoj3vhXRXVV0vt1azpjxRh+C3F0HP0bkg7RR0UZiix4/5KCBSg1eiWA9IXnl1+ZKN/txF+c+kc4JsWwE+lWoNOuw0ouqN+kHKA7UCZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729000283; c=relaxed/simple;
	bh=1z5v2g/M8TGfXA6gWIica8246cfTbPJR6x/M/MJlmF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvmLPPgSSVGKusf9dywZwh+zSZDMV7S70t4u3lQ2+PjhzZgFVuwO6W6D3SZNvWHL19gAsg+YNw/wPLAMM3xBO8DGUf0mO7JPjRUHRQ1QWYcBajcB6H0nwd2gbKPGjAieAjcjoOK9Xx3hBaDbr6y0lRjhP4W+8FK3MgL8aX9M3LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mjF6cR7W; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20caccadbeeso40192075ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 06:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729000281; x=1729605081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FQbfyi27tzCxQ9WkWmXe1wWLf7FoB61MNcmlSkHbiww=;
        b=mjF6cR7WsjkzLW6LOvb99VRyd0IXEnxV98OEJOgTjXIJHqgUpAJzH+1dGlAFGxKu/j
         d3TvYNIU17uDReZy90uSfi1UdtC3jqv5zXx+Iybu55LJSW2YrUJf1yaNnFj1U5s5mkTT
         9i8WeHbOibvnvH96IAuVy2BW9F5YgeDXeEU62j9oq2ekouZwhL47CCsczvU2VqAUJb8e
         DQNu98pVbzwOafTUayO0Lb1WvKuD5NZ1h93YRtM7SSM0f7PG5PicDscg0eTI1h242wB4
         V4OLmancX2L109s8XN9U1vgp3WDs+xx5iryqlYqsllaefBXFBw/IxGdgZYcRCRjK+PNe
         WQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729000281; x=1729605081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQbfyi27tzCxQ9WkWmXe1wWLf7FoB61MNcmlSkHbiww=;
        b=NJdImL2B5MIXE4gZVUX7IMjqu6QllLHBuzLzHBJoow0LU8GXedw/KycLblpp+IE/f9
         aH8buNZSi3d/uVSxqlb4kfVrOmZhwAfwesSFT8ivChjL9xtEjvp+8Un7XUQ1ExIYitK9
         F3GEIGASj0N5/0m6fWzIiBAh7zlchBeDUb1/Ghx9ra3s/6ygWGwbisXc0+moYjln3uXO
         vEp7PS9pHbgmB7Au0xjGC4x7p1PYKfyFdMlNRDR8t5k1cIfKR0BgEVr0VTqpM1Z2yYtW
         X961wVZoibDCluGlvLQJtmSYL3dXhsPajqh5SHO8CWhhAPBzn3M3DFg+k5wNh1SdX9bf
         5rTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPF45Kh4OFPxkgL+9wFv0VHtqdnB3oe+HBzWc8uGTfEKCfOTflou1kCxMdEqkOWZg5uv8kbWZsECZaFiw5@vger.kernel.org
X-Gm-Message-State: AOJu0YzHrNKiQVzA91F9av787sOOtM7HfThwF+4eug4Fgu/EEgCplomH
	Wdm6t31z6V7qjexWNHymWYylNdOcKkC2J19JfZk2Qy48q+cUzPuMd8NGAVGkSQ==
X-Google-Smtp-Source: AGHT+IHb8DRdX7nVZkVKvSzh4aB00ZRPlP2F8yO4iHAIQ/4bBM9EAsjLt6eSWDKJ/Teh6L8UAt2OKA==
X-Received: by 2002:a17:902:e541:b0:20c:d469:ba95 with SMTP id d9443c01a7336-20cd469bdaemr105114035ad.16.1729000280754;
        Tue, 15 Oct 2024 06:51:20 -0700 (PDT)
Received: from thinkpad ([220.158.156.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f84f66sm12129015ad.28.2024.10.15.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:51:20 -0700 (PDT)
Date: Tue, 15 Oct 2024 19:21:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	krzk+dt@kernel.org, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
Message-ID: <20241015135114.kbiyvymng4e6dmvb@thinkpad>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
 <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
 <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>
 <20241001085105.iglzp3art5ysli2d@thinkpad>
 <b1d982c1-f800-97eb-1be3-e77e04a8e81d@quicinc.com>
 <20241006180146.m6xvpwbvkiy7obpx@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241006180146.m6xvpwbvkiy7obpx@thinkpad>

On Sun, Oct 06, 2024 at 11:31:52PM +0530, Manivannan Sadhasivam wrote:
> On Sun, Oct 06, 2024 at 12:33:21AM +0530, Sibi Sankar wrote:
> > 
> > 
> > On 10/1/24 14:21, Manivannan Sadhasivam wrote:
> > > On Tue, Oct 01, 2024 at 09:56:30AM +0300, Dmitry Baryshkov wrote:
> > > > On October 1, 2024 5:42:35 AM GMT+03:00, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > > On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
> > > > > > On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
> > > > > [..]
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > > > > [..]
> > > > > > > +
> > > > > > > +&pcie5 {
> > > > > > > +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> > > > > > > +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> > > > > > > +
> > > > > > > +	vddpe-3v3-supply = <&vreg_wwan>;
> > > > > > 
> > > > > > Please use pwrseq instead.
> > > > > > 
> > > > > 
> > > > > What benefit is there to wrap a single 3.3V regulator in pwrseq driver?
> > > > 
> > > > First of all, is it really just a 3.3V? Second, is it actually powering up the host controller (as expressed in the device tree? Is it a power supply to the slot (in this case, I think, it should be expressed differently)? Or is it a power supply to the card itself?
> > > > 
> > > 
> > > Yeah, we should get into the details here. We were not paying attention till
> > > now, but with the advent of pwrseq, we should describe the power supply properly
> > > in DT.
> > > 
> > > Here I believe the supply is to the PCIe Mini Card connector where a modem is
> > > connected. In that case, 3.3v supply should be connected to 3.3Vaux of the
> > > connector and we should have a generic pwrseq driver for the mini cards.
> > > 
> > 
> > Hey Mani, Dmitry,
> > 
> > The schematics are identical to that of the X1E CRD with
> > the exception of the pcie daughter card having the rtl8125g
> > on it. Yes, the 3.3V supply is connected to the card as well.
> > 
> 
> Is this connected to the 3.3vaux of the card? Please specify the actual rail
> name as the 'PCI Express Mini Card Electromechanical Specification' specifies
> only 3.3Vaux and 1.5v supplies.
> 
> > Doesn't this mean all other x1e boards out there needs to be
> > updated with pwrseq as well? Anway will get that addressed in
> > v3.
> > 
> 
> pwrseq is the kernel driver abstraction, nothing to do with DT. But for making
> use of pwrseq, the supplies need to be described in the proper place. In this
> case most likely under a separate node of PCIe bridge. Then you'd need a
> separate pwrseq driver in kernel to parse the supply and take care of it.
> 
> I'm currently writing a pwrseq driver for standard slots (x8 for X1E) and should
> be able to post it early next week. So you or someone could use it as a
> reference to add a new driver for m-pcie cards.
> 
> If no one picks it up, I may just do it.
> 

Hi,

The slot driver is taking more time than anticipated due to the pwrctl rework.
So please go ahead with the current binding and we would switch to pwrseq
later once the driver is available.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

