Return-Path: <linux-arm-msm+bounces-34172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5299AE0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 23:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74BA12812B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 21:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EEA1CDA31;
	Fri, 11 Oct 2024 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eFtmTE+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7228D1C460D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 21:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728682392; cv=none; b=AF9UaqkI09GxEDGRa1gjdG3kG2Yv0KZ+nbZMfXbwsNI+i8jhpj9BwvA94vTxmDt9MGxmbQToreMzpFEk3Cxea8p315Xx7AcpGM/Q2QwFaJLZDowwZ4rhaRD5U1FRIZK/ouPrLHYjRjcJ2POllWxj5YIOwgSXxnO/P109hKRYybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728682392; c=relaxed/simple;
	bh=90J8LFfVsA/A4QnYFiY8gVitPPnpL5v8E1zZrxt9KC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hp1BglnGvdBpIEbgEhxr96gyhTPqNe/xJAyCrwFaLx+qJPnJPyUD0Zwza4N/UPVDakUaPrnNUd2WAv3RIhwaS9+NMSyqdzU82sGBuqXLUtIsCMhOIugNK28ahhTxmc92CFzirqJVusrr5QAwMlEKacBYslyStZIZORklN8y+sYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eFtmTE+j; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e044d32bso1364817e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728682388; x=1729287188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sut4y0KMokzCD87Bq1OudFCCPPnu4h7YKTgbeZuoxME=;
        b=eFtmTE+jIfVKrQguYpbiJiv05P7w7f4/BT+recj6hKWk3Dd3fAd+OR0APOsH8tXnyc
         o8/YJ2ns2cEPL484wQ2pZlwtvz8pzO6A9MRbaiZi8Zpka9w5JXnvtFUBAhnR1d1LA13j
         TW/v4fC+Kc7VPwGMQmpg1MZWniO5IR0Bvx5VZKn5SLlfUSGaFA95jebnUVxE8Bop8taf
         /BlYzoz2ssqSQeeiVznMsEio2EN1B1KbbJ0vhuM5tuRKjygdRRfpUuMcmHsgmqFvWYAr
         5Ua7unXQj6LpDaJ8Wxfv6ufLfqkiOsiMSJlf5Nsw757o9BCtTT38x79xDSSke8SYtN9S
         1pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728682388; x=1729287188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sut4y0KMokzCD87Bq1OudFCCPPnu4h7YKTgbeZuoxME=;
        b=K89t1mhpFB+gXko0/1KmTtuuBG0Rw3sM2AGC6+CoNw1TzI0C+ZLUgNr5UqS26Eq56H
         5/xpKHfxTKYwCs2dDKBj/POE7l0hs5hwFqgad4DclNeXpgwelQnbM3e4F8rukHlQOLhW
         M7XQ3JoTMTAauigIGSBX0Idfj9+GXYFoUN4EcBqgLF3cV6UHzGLG67flWkjFVd3CQICg
         JJx//8T51oOGKyfKiFfAc2D7zlsu7qrRTsEreb6UHlgeFkaJyX0zXLlwIEs183VxdtHl
         /M5JzIdVfgxlZhP1ZVR20/1C3AY3teF71/Ni2SWFGfYHiymVa1dIXLM2ZXKzA6a7qk2+
         woiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7aDljRcPmAqH5hXRueSepVLV/awacRHjWo+ooj2KPohNkyd2lxlezjQxRaFVIeDJAL5QR9kBKBBYciN7C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0re7/bFDMpgABdzn9TsBBAlfVSW9TocMc4J9mXCq1+lMmVxZh
	bUmWFJ75xTiIY+caUxoexbGRejIB7h7AIWixelJspknfv+E33lOp8qsAzgCKJWM=
X-Google-Smtp-Source: AGHT+IHnKHPZp1TtGlSCnweK3yEkryZoL86b80ByHnhzwShCDrwy06k6dcjkFunlqHFIT6cEDtR/jA==
X-Received: by 2002:a05:6512:3d23:b0:536:568f:c5ed with SMTP id 2adb3069b0e04-539da3b41c0mr2076475e87.1.1728682388325;
        Fri, 11 Oct 2024 14:33:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c13e1sm724280e87.58.2024.10.11.14.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 14:33:06 -0700 (PDT)
Date: Sat, 12 Oct 2024 00:33:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com, 
	hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org, 
	hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v3 2/8] media: dt-bindings: Add
 qcs6490-rb3gen2-vision-mezzanine
Message-ID: <bzszh7m52o3xzeybp4odwki6bz53aqctolrbvvbqizvk4bkj2h@k7r2i2rhgyqs>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
 <20241011140932.1744124-3-quic_vikramsa@quicinc.com>
 <nsylilmzl6zzukpgih65kmeibbllek6dpgryzkso2ttpuztk2x@3q5xiujcdujo>
 <b3c1431e-9a5d-4c38-ae7d-605d4a2cf3ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3c1431e-9a5d-4c38-ae7d-605d4a2cf3ac@linaro.org>

On Fri, Oct 11, 2024 at 04:25:15PM +0100, Bryan O'Donoghue wrote:
> On 11/10/2024 15:50, Krzysztof Kozlowski wrote:
> > On Fri, Oct 11, 2024 at 07:39:26PM +0530, Vikram Sharma wrote:
> > > The qcs6490-rb3gen2-vision-mezzanine is a mezz on top of the
> > > qcs6490-rb3gen2 core kit. The vision mezzanine includes the
> > > IMX577 camera sensor.
> > > 
> > > Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> > > ---
> > >   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > index 5de6290cd063..f00851f30d3e 100644
> > > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > > @@ -390,6 +390,7 @@ properties:
> > >                 - fairphone,fp5
> > >                 - qcom,qcm6490-idp
> > >                 - qcom,qcs6490-rb3gen2
> > > +              - qcom,qcs6490-rb3gen2-vision-mezzanine
> > 
> > Shouldn't this be an overlay?
> > 
> > Best regards,
> > Krzysztof
> > 
> 
> Because of broken bootloaders which don't do overlays, we've been adding
> additional dts instead.
> 
> For preference everybody would run u-boot, grub or another reasonable
> bootloader that can apply an overlay.
> 
> Last time I checked there was no support for dtbo upstream in the kernel
> itself.

See arch/arm64/boot/dts/qcom/Makefile:

sm8650-hdk-display-card-dtbs    := sm8650-hdk.dtb sm8650-hdk-display-card.dtbo

dtb-$(CONFIG_ARCH_QCOM) += sm8650-hdk-display-card.dtb

> 
> greps
> 
> grep -r of_overlay_fdt_apply *
> 
> Hmm, does this do what I think it does ? Its news to me if there's a way to
> do this in the kernel now TBH.
> 
> Otherwise the sad situation with shipping bootloaders means we are pretty
> much stuck with the one blob which we can't apply an update to.
> 
-- 
With best wishes
Dmitry

