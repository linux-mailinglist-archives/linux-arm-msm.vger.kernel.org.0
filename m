Return-Path: <linux-arm-msm+bounces-47042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B4AA2AA87
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 14:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FB357A293E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C591C6FF6;
	Thu,  6 Feb 2025 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OatzRcim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC21C6FED
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850366; cv=none; b=bi0biL393y6w/hYOymmmVe1wfJwufys7UY1IDS5eT8VdAoGBWT8WrgrfVsDcZTvZNsCHvMGTYXLR2bziVYdrASzi426R7aWRjDlB5HAY51jC5BKHxPQ3qSEq1BOWBMgKv5Lt/Wf+bSs3Cubc0OE4ja74ycLmIFKOgA/OTjsUGLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850366; c=relaxed/simple;
	bh=5fteU1gF781gid+8eh5MjlcPKwLt80L36gWbaB+12iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6Iu0KUSx9+DueE0rvXAFhsNo4p6Ch9o0T2nQ5R7pWkxBeNs2+k6vTSWhchwJvKRgtF0uOOkkodmNcjpuM1KN5NVDQFHk1sVy54+BLYVTGZakq1rksekhnvjfRinXrTES82gNF2EES3Dte8gpXC2Ninn3K7+v0ZJ3SIWHqdrA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OatzRcim; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso6606955e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738850363; x=1739455163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiwqOK4FVjPPZWydFoWK7z8lcOGoGBb2vdMSdzrBdU8=;
        b=OatzRcimDGdLls//YoBjw+3AT/P3yBXg7j2nABbUhb30Ny3IIz4uvLLrJlAXxgygnY
         z7Ubvhwe4C7+G9jvIONILzFbZolANH3Y5Q5EVzs8qjngkq0eh5NUrEP2oY3SrBC0QBgd
         Ew5jqfHp6fHDS/oiXdjVdeYYOh4fnIwInMSrmaSM9PIwMSTYD7XyB3FC+LSnzgVkkD7f
         HL5SVa2N3UKZNT8cSD/g8RN40OMJK9sJD2B5lLgBGjjWTjyNTvFHUmuZV/6GuEP8/Mip
         cbVf3v8BZ3ZYOgac8af/oWZytR/seG0REYDeFMGgVe1ICBN8BjcILU40nA9rAUsRXBfM
         ggug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738850363; x=1739455163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiwqOK4FVjPPZWydFoWK7z8lcOGoGBb2vdMSdzrBdU8=;
        b=okEvRrgyleBIrHSRBODuzTLCrRBkgYp3u8bLpEIzHgPqYWEq0AIoPqO8XilZeRZs6T
         wxN0pIXjj17zKOJI67FJzmzy0vA2bC2+1TnrxAdFgLZRczxLf9aKRcZmg7h+1KWapcm6
         PXjWnQwWwQ7Jo9JVOUuvHdpZQvgnvH3WDuCmM8Nyo7poPqMIpD6sjBFgaw7cGJnAh8y6
         NhtXPv1qW24bfVmOfM9X5bvpHEwTldA9vNj6ztNvPVXu1R6ZSMVyEFVcWNtn9zLgU8Ky
         IVzkJMLomGGK3tOnyORVfipei3Ko9aM82+p4ieNg/Z6449UvyJhDgsUB/Kc988Dh/Txu
         aX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6zNVfmpJJQRga1cev7Es77vTbHIoQtrKXJIwLjAXoazesW+En85pB2epKnuWzhflY/hQ50dh6NootLwFM@vger.kernel.org
X-Gm-Message-State: AOJu0YxYD1rXLjp9HbCX1qrjFYozQ7Sxfrauaqwi8Cw3Uzqu6muFAmQO
	gJ8Pk3mEmYGb6kga/IVPsCn88M8wXEWf6/L5XM0dKWpB6Azcb9mAXWIL9so+L5c=
X-Gm-Gg: ASbGncsMv+kyd07P3LCMPsJfhY7LaLGNgUlp56qkhTEq5OwlGyjCDi6DMvK7nR7R2Ym
	u3MxnL8jcceCY+DkusrBjM+xNxVjXz2A0cLwVs+mvenh5F1pz4iMbhFf33NNdGslnD8ByElqgdU
	/L6Ezd5YQ605UwDTBXY2zX+vJrloel51/2YuySmYiVVVxcpK7DY7O9eos2S2czD48jAhN6hkwPv
	XUy+3EcXjO4DJW90JECX4GGwz2jn/H901C2oStrKtzsCH91JmEGAANpAVF1Q7vdg2uZWIIHmisW
	40N1rLsbDTxiEw==
X-Google-Smtp-Source: AGHT+IEQ/bjSZV+56yIOq5wwNb3seJyTMrV6PD6QY8xe23aPssG7mgZFZVTL2HkADa9VSfJyXBrBsw==
X-Received: by 2002:a05:600c:4f8e:b0:438:ad4d:cf01 with SMTP id 5b1f17b1804b1-4390d433b21mr58938875e9.7.1738850362808;
        Thu, 06 Feb 2025 05:59:22 -0800 (PST)
Received: from linaro.org ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965a6sm20583685e9.6.2025.02.06.05.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:59:22 -0800 (PST)
Date: Thu, 6 Feb 2025 15:59:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add the watchdog device
Message-ID: <Z6TAOPhYpl2M+SZc@linaro.org>
References: <20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org>
 <Z6SSgmoUPFv3vDDY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SSgmoUPFv3vDDY@hovoldconsulting.com>

On 25-02-06 11:44:18, Johan Hovold wrote:
> On Thu, Feb 06, 2025 at 12:37:13PM +0200, Abel Vesa wrote:
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > The X Elite implements Server Base System Architecture (SBSA) specification
> > compliant generic watchdog.
> > 
> > Describe it.
> > 
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index 9d38436763432892ceef95daf0335d4cf446357c..007815699e4b9137c3b5cf72263c9dd3a64e6bb3 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3708,6 +3708,13 @@ pcie4_phy: phy@1c0e000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		watchdog@1c840000 {
> 
> Please keep the nodes sorted by unit address. Looks like this ones goes
> much further down.

Oups. Yes, you are right. Will move and respin.

> 
> > +			compatible = "arm,sbsa-gwdt";
> > +			reg = <0 0x1c840000 0 0x1000>,
> > +			      <0 0x1c850000 0 0x1000>;
> > +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> > +
> >  		tcsr_mutex: hwlock@1f40000 {
> >  			compatible = "qcom,tcsr-mutex";
> >  			reg = <0 0x01f40000 0 0x20000>;
> 
> Johan

Thanks for reviewing,

Abel

