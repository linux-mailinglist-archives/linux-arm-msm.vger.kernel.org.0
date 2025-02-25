Return-Path: <linux-arm-msm+bounces-49340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 158CDA44803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 18:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BABB9883426
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073FA18EFDE;
	Tue, 25 Feb 2025 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXhoR4mV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02811A23BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740503528; cv=none; b=lkfwhCMnccmIXdN1urAgwwbDtj8osY4qc+Ezzgqng/EMOa/so11GKJiUdnuxvlW+hRxbArj6zFPx2Jnw8yGcFQdV4AZRimGNu2Rm6yYU3qcDIFexAd4/J6HwN6SfOqAd+fL79qVj4L4uyI/WMS1GDepz+tLnHuOREoh5Kngf4Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740503528; c=relaxed/simple;
	bh=2zg94zRdzEnHDUsDqBlnHbB5z/wxZTZgB3MXLtUgDE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cu92azY0KxO8IjF4k0Wm5IbpGllCmo7LDWIa15FCTFkYa6alx0rN0QXQLa2PjSqPguaHHLXSAKd5eBpqk8QIsdcK3tqRufy6XwXXaaw5O28gs+umqTvIuK/iOjhgq3qVD3dLIg0wdtibjuAXyDXPVk9m8fmsIo27XW7gnfgfzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXhoR4mV; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5461f2ca386so5026250e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740503525; x=1741108325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3VRt++PNXgAYze1wuBL06koGD/kVHXK+2ZFMicsw94=;
        b=AXhoR4mV6ZoHDnjTxtV9x7kIR/keTuhGvOuiXAUdjZtWcWR8tIiF8iPmKeuzIcg15v
         9zB25SWgA+AGuoiNlUxFXdfeGi189iu2VTnS6Jk4bf7SWeh7H0q+I8rA0wOAPLkFoEYN
         woXIc1i20fxRDvPBVKI9gIErwqHeVvQxDzppsuj4p0UGA3LlRWH8U1xKuGrJDLXpKcWh
         DTBokB2Uawvv7+BGQPqVTZXVoQIFSCEi6Tuh0nBQUiIde8Y/I+6sAYcFtuRThzZXQjYV
         tB+nkl7DhbUYOBJ22xbQKdQad1Y3oK1Z2/qCroW8opC2bcRPXb+2itOIRaK/5bDLrF/7
         Jo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503525; x=1741108325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3VRt++PNXgAYze1wuBL06koGD/kVHXK+2ZFMicsw94=;
        b=nWS3Kr7M+5oHucMpjR1KRhNJn33i02mEFyLPEl+0cJe3n+ORPLSUdyR9ME4WmTwcBN
         DJ6HC6w1hjxzlpXZgWC7wbmZ1lsc25LytJij7ufuIq+vWyGAA5xPdtfLBFxDwAcf97MH
         fkQYkPVRdln/kgAyB4lNeb8seAM95GUvPWk30Vj33seoE+IUGUbkYYYn0KKwbCJA7Uyl
         3JN6o0n/Up+6diCWf8u2cPN6jos9gzs94Xu7Hv5QTPt5Tt/qfLvaV3sagGKNAsYdG9pw
         ZBfpdY3b5JgXUvR8uqjA2TRW6uW99k0/0DZJqRire+g3ihnvMz4IK+jd3bIYgYDDqnV+
         FGZw==
X-Forwarded-Encrypted: i=1; AJvYcCVNGY2yQCebpgaBt1U9MD+fpW8IQPiAx/V+xD6RJ0Bo0h4PLob3jYU7thmfxpThv99Vxwp7+EwuTr0qMJ7C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy03N3EK1rH2fbhgsWsBHq4iBq6+kk80THvFBxO8ktkCrui9MQ+
	+VXzPhTYVitFDqRM/blaSQqc12Ox7L4HzSd91fXZDyLuzhoQb9thS5Dl+ctTabU=
X-Gm-Gg: ASbGnctRO4xqNKNKfLnQs4QyFl7/pRx93aS63cAk+sht5eG88Lq/GZyHHlKh60/zihL
	QzZW+j8w6qoEPJuADqY++8GjWHK3iUIH9IziGMs7Ckav5260uvKk8jM/Po45FRC3u6CbGygcwaU
	+V15F+St7kd1lWycfsOz5+S+iBVPJc+6rdkGQP8ozem2BnEjJqLVjOPZbHpLM0ooEAq1w2Dx1QX
	GbbkLc1nKhBwCA50NohJmUOZKAJQEWT+2MB/5tUfCBZp03wnEGbXbXcjcOY9N3Ix4wRg1NssmvW
	JrHqTp1FLuNK665gsaZlHmA37aUxi2PHZaqB1yEHeuV3LlGueQFia85XGSQrQ4iIY9XVmHfqIhB
	3HgUg5w==
X-Google-Smtp-Source: AGHT+IE6btY7yaSP+3y3DG+F1MNX01iR19BAywx69SlKvGbptKvY2IMq2suxBQapk7jTaUAQROgZ+Q==
X-Received: by 2002:a05:6512:1309:b0:545:aa5:d455 with SMTP id 2adb3069b0e04-5483913f943mr8455012e87.15.1740503524979;
        Tue, 25 Feb 2025 09:12:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f4c98sm221415e87.185.2025.02.25.09.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:12:03 -0800 (PST)
Date: Tue, 25 Feb 2025 19:12:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
Message-ID: <ymjjzpzmlmpjv4biipfnpojybk7ifrbey26vutlnufixakcfh3@kyinst3ku5ap>
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
 <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
 <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
 <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21ad3381-4d65-4c68-892d-9f485bf13735@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 08:44:57AM -0800, Jeff Johnson wrote:
> On 2/25/2025 4:14 AM, Krzysztof Kozlowski wrote:
> > On 25/02/2025 12:45, Dmitry Baryshkov wrote:
> >> On Tue, Feb 25, 2025 at 11:22:25AM +0100, Krzysztof Kozlowski wrote:
> >>> On 25/02/2025 10:50, Dmitry Baryshkov wrote:
> >>>> On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
> >>>>> There is no such property as qcom,ath12k-calibration-variant: neither in
> >>>>> the bindings nor in the driver.  See dtbs_check:
> >>>>>
> >>>>>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
> >>>>>
> >>>>
> >>>> Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
> >>>> calibration variant in case it is not running on the ACPI system? I see
> >>>> that it uses dmi_walk. Does it work in the non-ACPI case?
> >>>
> >>>
> >>> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
> >>> git grep), so how would driver use it?
> >>
> >> That's what I'm asking: is the property redundant or is it correct and
> >> it is a driver that needs to be fixed?
> > 
> > I assume driver will need something like that property, but that's not a
> > reason to accept incorrect one in DTS. One cannot add properties to DTS
> > without bindings, so bypassing bindings review, and then claim "but my
> > driver needs them". Send proper patches for driver first which will get
> > a review.
> 
> We definitely need a calibration variant entry.
> I've pinged the development team to get the driver patch.

I think we need a confirmation from sobody using Slim7x if the driver
can read info from DMI or if it can not. In the end, DMI != ACPI.

> 
> I'm also verifying internally that there are no issues with your renaming
> proposal: qcom,ath1*k-calibration-variant => qcom,calibration-variant
> https://msgid.link/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org
> 
> /jeff

-- 
With best wishes
Dmitry

