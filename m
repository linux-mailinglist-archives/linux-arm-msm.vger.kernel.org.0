Return-Path: <linux-arm-msm+bounces-82757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA6EC768B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 23:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id D05A32A76C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 22:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CCC2C21C0;
	Thu, 20 Nov 2025 22:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4PHn/b0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEBE279DCC
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 22:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763678962; cv=none; b=NaCbZFiabRtVOpnQkmCETOVkF655teF4wruIRllPl3dd0uL3Fns9WVLBRAArpyiNyZKP0twLLPyeMT2DXQZqAWfWzLdIY7LEN9cH/gPBSmimSSEvRM9oTMKBxRonzsv1aZSALkHvmttEbZHc/8y5C4qSgEDLA1sQcfaDhh8p8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763678962; c=relaxed/simple;
	bh=Br88158eFAmnM/Fp96DF4FrOGTDLPMRgchWd3iTu0gs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXirAHLhhqpAyBJrdla55mtMNL/pxDsYPw4D/etUkLHKQKHBgGcRYN9QnUn7L5ZCb9oow/WEwnhJthIscKUWkenxvwq6oWfKb+6RR7wsvjRG4rNQvoUlZKlMaW+SgsH3UfsCkaCMCOKHQNPSlmnWnzDjJDy79pEHHqVJxM8tlCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4PHn/b0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso15372095e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 14:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763678959; x=1764283759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=92mYVJu8zVYn8oShK0O2ENKfrNo41xy/o+ZtfwrkjMw=;
        b=g4PHn/b06Lik0D1jyF9BKd6EKKdpodJciicP8kWwLEHaNY0Tpkt3PuKBIT6zX9QGv1
         g4511bVwZA8E9OHnqpNPmTtxcsgNu6yHGlKJMWqM9U+qIDimsk+9rjl1hblyl7DsAZI4
         kT2pZMKcrw+edM3+E20v8VFQk/7mAsGllgheFnA27208SGo5anFYV8vpYHju5O+wipNR
         D+8KYa+SwFRrCWu6oCXLlhIMg9IRgFcKKA1tIIbcLdMSxb6Jhc/AIRpZhevuo0LpKf3k
         Lxm4DSS4GIGcG436Hpw/kwaqTWaM2nQjwUa+oKjopferpRtMPv3CZoCELIgFeYwmFXWy
         7Uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763678959; x=1764283759;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92mYVJu8zVYn8oShK0O2ENKfrNo41xy/o+ZtfwrkjMw=;
        b=MdPVJIuJPT+XDhyMc0dSmHNl7ED0JehD+O2d7iykx6oRwJDzW4Ai20N4HbYeYoYyOv
         9KlkBizKTi5diU3kiDM/LBFeKQJQeft+PzhDwMxnxWfCJHX+/xL/YxlT8DMgEfsPm6WC
         F2cfSLisRcXQoa7qUqmj1H8ZctuAGITe2rdnTHq1ZqsnMGb3u3vAiiYBr9YVRw/xXTx0
         i3KFXl+hp8i5YZQDCN4ga2+p6y2DQuKM3Ol7F8mDkjw0iYWJrLMD8ndp4GD4TInRw2CI
         rCVej0fU36E2G4ExcCG3oM/xCk3twEPycvmSgaR1O82v5l7FJOhCx7zgClcAnLkz7Bmv
         lQDw==
X-Forwarded-Encrypted: i=1; AJvYcCX/4V8dpLDWa8+XS5jJHyeO094rVSCAsBqxwz5Rg1hJvvdbSoXtgMPFndr/qC5sccq2fM3LDeiOFGBGPvc+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd07kRCGk0VTyQ5Xy42NTTc5Ru8ipUz8A79Ruv5HX7nOZE/z4e
	DwN+t5ES67oTYmPyyAhks8UQMOs39aou2pbKSITKAnQY6O4BlvbIZN/C
X-Gm-Gg: ASbGncvZYkqqZ506plQ3SYGtemF7ppKhf2t1GoVlBx6Pm5r7lu+Cv7CB/eumNEsrquA
	89NvJ9gExCwPKjcwwHEHI2MIjGLq/fI1+JVQW8HOqxtPomwXYHHsluVeMAZ5odNfRPCBbipIXaY
	rZmeP6pPmuxjK6GQSGUx9uiY4BW1XlEjHobpLka/fcCzKLAFIkxFrIszjms8Hr9qAHgze82/oAn
	A3CcseQZToVG4fjH8aRl1Qoqit8cbqAx0Kkz0+/RMhpKvV7zKHd+vAGw9I0ufwWmb+E+xxH1DUo
	+OgbLLDpj+/5AUJdYby1FAqwgd5Hps64yRyvuMNjfA3IiOXjNMSetTL5Qs+BE6W6v/1LQ2xN+RQ
	1jmzC2qaZ90fwjvAlkNx02ySMgP0Lx+1ysuxwrUYbv3Or2LK9WDdSasY0wOtmUw9IG4ExiIxuVC
	fE2U6WHLgJJIPs2ff9DtEOdWGOVLkrHLiF+FnrXxk=
X-Google-Smtp-Source: AGHT+IHGEub+G9/ilkk7Evhx8oxfLEzAt672n2dcbFiQn5RMJjnl+9Pi1r48eK/UWsvT8B/B+uJl+Q==
X-Received: by 2002:a05:600c:4515:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-477c01ae317mr2279335e9.22.1763678958463;
        Thu, 20 Nov 2025 14:49:18 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9723a6esm76553305e9.1.2025.11.20.14.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:49:18 -0800 (PST)
Message-ID: <691f9aee.050a0220.138abd.0f33@mx.google.com>
X-Google-Original-Message-ID: <aR-a6-zCkF_KpV0Q@Ansuel-XPS.>
Date: Thu, 20 Nov 2025 23:49:15 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq8064 board variants
References: <20251120135435.12824-1-ansuelsmth@gmail.com>
 <8e75be2b-643e-4380-a018-3cb718745101@oss.qualcomm.com>
 <691f3465.050a0220.105096.7667@mx.google.com>
 <20251120174119.GA1586641-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120174119.GA1586641-robh@kernel.org>

On Thu, Nov 20, 2025 at 11:41:19AM -0600, Rob Herring wrote:
> On Thu, Nov 20, 2025 at 04:31:47PM +0100, Christian Marangi wrote:
> > On Thu, Nov 20, 2025 at 04:25:37PM +0100, Konrad Dybcio wrote:
> > > On 11/20/25 2:54 PM, Christian Marangi wrote:
> > > > Document QCOM ipq8064 board variants ipq8062, ipq8065, ipq8066,
> > > > ipq8068, ipq8069 now matched by the QCOM cpufreq nvmem driver if
> > > > socinfo can't derive the variant from SMEM.
> > > > 
> > > > Suggested-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > ---
> > > >  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > > index 18b5ed044f9f..0eb1619fede8 100644
> > > > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > > @@ -299,12 +299,32 @@ properties:
> > > >                - qcom,ipq5424-rdp466
> > > >            - const: qcom,ipq5424
> > > >  
> > > > +      - items:
> > > > +          - const: qcom,ipq8062
> > > > +          - const: qcom,ipq8064
> > > 
> > > Since 'items' requires that all items are present (and in this order),
> > > we would normally have a board name go first.. but I suppose this is
> > > some sort of a fix to the issue that sparked this (posting the link
> > > for others to have more context)
> > > 
> > > But since these SoCs do exist, I wouldn't say this is necessarily
> > > wrong..
> > >
> > 
> > Well we can see this as a ""template"" for device that might be added
> > using the ipq8062 or ipq8065 compatible.
> > 
> > When device with that variant will be added we would have to just add an
> > enum with the real device name on top of it (as first element).
> > 
> > Honestly I should have added these compatible long time ago as on
> > OpenWrt we have tons of device that are ipq8062 or ipq8065 with the
> > compatible structure
> > 
> > "device,name", "qcom,ipq8065", "qcom,ipq8064".
> 
> If you don't you have any boards yet, you can do:
> 
> items:
>   - description: ...
>   - const: qcom,ipq8065
>   - const: qcom,ipq8064
> 
> Just to prevent skipping a board compatible.
> 
> But you said you have tons of devices, so...
> 

Yes the problem is that it might take a while for the DTS to be picked
so maybe it's better to push for the description solution?

-- 
	Ansuel

