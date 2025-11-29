Return-Path: <linux-arm-msm+bounces-83818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD92C93681
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 03:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8AF13A89C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 02:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35E119E97B;
	Sat, 29 Nov 2025 02:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRZkYE7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010731D86DC
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 02:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764382130; cv=none; b=o6NnYNLG241Zm1JeHUHSKTj/4YLaCrYfUL+YDTKyTueuXn0w4JnXPED/Vm8wGPvxm0vY5jSBJGzQToIR/MV9OZMJoRwvvr67XzUBKnhmFtfki2NzDS3h66Ltuqe1Sg4jOtss4ZIy8mIK24WoPBM+I84Ji778/F6KRogPL3PxQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764382130; c=relaxed/simple;
	bh=oBxJ2w2VOtO0+57VyHYW6cgGEruyJXK9Hau4rzbWm/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5aQcwFGeAge9HzMlVWGs4HkakHDIKQcT9AsRXQ76+p4vYbu8ITQ/emC0NBo4FM5VNb/1cJav5wlIBgOnKJ6BIoPdeGavGrkwWEtbonHKZs2oOKgn0Duk5707EJzNBor+5Ekp1IAFjCK6rptEIKj0MFTUrn0k7/76gdfwuA7K4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRZkYE7b; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee2014c228so19506731cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 18:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764382126; x=1764986926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Vai8cPq+jOaSoz/hxjTO+wFvCmSXVlGUIKlR54toc=;
        b=eRZkYE7binmHN8pBX3Gk019b9BrFLrbfz8viYkGayY4ukhe7lAy7bfAOj51SFIPvyM
         Wulan5PXWbXTwNr8ywCgZpBlMupJ2gHEa78npI9b7ttw1linYOJ5akrgZNBNeKIsWAvw
         MOjN7X1M6fMpE331WfeztmFEO3jD5gs31jINPthRg9rGjCrh32LwcuCoXKKJ5pWPVUNU
         YP+GwxsTWuer48GZLKbnV0HNUclWtreVNUynnS8uPJUDnSd3daOrz0/dngtpeeGvf2rF
         vt2OVOAudXW58VHzdfUXs9z7Q6JLw3UQJzb2M3sGy4nu8QP7HklaxQD071JJknto9JgS
         92HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764382126; x=1764986926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4Vai8cPq+jOaSoz/hxjTO+wFvCmSXVlGUIKlR54toc=;
        b=V+xZCb45cSIee9gPQUjqC8gEQMEk6GMueez9tWvWPowEYv0yilhd3VJgQ35wlRS8Qe
         v0yulCsYqLqvEc3ZCDAhdxpM4wZPfZ7Lz/uT8LK4cNaBesAfCXP6OTd0jr/MlRTxuaGE
         fP8iiaw/JmkwwuXG7f8JboNHsm3axffek6rzbds29PWevC3DSjQogNypQP9eCijxZaYg
         ZRkkJYARBOoTWs0hHHZMmGWbHB403EUU4irrN3rICnhpbA6IfxERkevhuFRXsAqC/xaM
         9me9IqJEwKbtCro25tUz+/hTngwhMYObdnCGGD6c0PDsSWvLpl0vIRyACchJJu0DkdbA
         l5/A==
X-Forwarded-Encrypted: i=1; AJvYcCXBfLj/y1M4puPd2zgvmKC8iy1ynkC543iZ4HAj4s0wVsQtj6vBsFdeR9ZJeNAUyWvWdKp2IRn+0F+ILZ4E@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtX3MN8/SJM+YVXTB8H7ouhcr7nIKFd1+9pxdhqrBNlIv27XS
	81OolInrJGytXJ0OHaD0OLooq3AH5W6qRCwyCEjFBMD5P82VnZCQVwqd
X-Gm-Gg: ASbGncvJ2J7TWQ37J4CpfOODyYDXRJtzyvdcAYUdmk1+KBMF/6bw3a4rZHoED0Hzv+p
	x+WiQtY+CXdutOBUE3p37U3N1KjSVLthw46DFzkHF8oCyBt3D8riqcGujvvPAXmWNRdvPJKMScw
	IObh2Bng8h9DD3Mo7aLqZRMmUnCDor3sSWTyYrt0UUrMZPX/8hTmcK2b+037IiQObBwtUV1QiNH
	CHkaoJLQC4yRe2iButFU9aFXBRJjp0/yGc+KvaJfKzCWxtozaLadUyJdDpC8nuG3NMaQzKY2MlP
	3uDp45Xn0FNzKVZK5cVYPJF4rFHwEv7sW3vGV9LzzUyaU8O9GZVfGeOb6joXgxnYfrJ1/G2vqFu
	a/q3eI0pSEyJklSbp4NCrRT0zLl3wilyfNMWMwKDsduT4yCel60lJLpRLXSSb5ho36amx7i8Tm8
	2wZu19/we+xmVce1QbiNP9GzN4cJ35rIm00Er05NwLean1SpweytTJtcsWZKjUSpg9lpA684GTz
	tY=
X-Google-Smtp-Source: AGHT+IEZgPEjTcttOVwQuI2zaiEzMLw7Nq+/ixHEvgh4ba7Mmdm+GtjXkVRK7MvkYpKdURpuWdRJtg==
X-Received: by 2002:a05:622a:256:b0:4ee:1527:cae0 with SMTP id d75a77b69052e-4efbd715e29mr244377011cf.0.1764382126117;
        Fri, 28 Nov 2025 18:08:46 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2fbfa6csm35209561cf.11.2025.11.28.18.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 18:08:45 -0800 (PST)
Date: Fri, 28 Nov 2025 21:09:03 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: david@ixit.cz, Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey@connolly.tech>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] arm64: dts: qcom: pmi8998: Add fuel gauge
Message-ID: <aSpVv_a6uRhr8opu@rdacayan>
References: <20251124-pmi8998_fuel_gauge-v1-0-dd3791f61478@ixit.cz>
 <20251124-pmi8998_fuel_gauge-v1-3-dd3791f61478@ixit.cz>
 <a9ba3370-ddff-4b69-b2b9-9244f759b6f0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9ba3370-ddff-4b69-b2b9-9244f759b6f0@linaro.org>

On Thu, Nov 27, 2025 at 06:53:38PM +0100, Casey Connolly wrote:
> On 24/11/2025 22:53, David Heidelberg via B4 Relay wrote:
> > From: Casey Connolly <casey.connolly@linaro.org>
> > 
> > Introduce the fuel gauge node for pmi8998.
> > 
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> > index cd3f0790fd420..ab3bc66502657 100644
> > --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> > @@ -44,6 +44,17 @@ pmi8998_rradc: adc@4500 {
> >  			reg = <0x4500>;
> >  			#io-channel-cells = <1>;
> >  		};
> > +
> > +		pmi8998_fg: fuel-gauge@4000 {
> > +			compatible = "qcom,pmi8998-fg";
> > +			reg = <0x4000>;
> > +
> > +			interrupts = <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>;
> > +			interrupt-names = "soc-delta";
> 
> I think it makes sense to add all the interrupts here, even if thr
> driver only uses one of them currently.
> 
> 			interrupts = <0x2 0x40 0x0 IRQ_TYPE_EDGE_BOTH>,
> 				     <0x2 0x40 0x1 IRQ_TYPE_EDGE_BOTH>,
> 				     <0x2 0x40 0x2 IRQ_TYPE_EDGE_RISING>,
> 				     <0x2 0x40 0x3 IRQ_TYPE_EDGE_RISING>,
> 				     <0x2 0x40 0x4 IRQ_TYPE_EDGE_BOTH>,
> 				     <0x2 0x40 0x5 IRQ_TYPE_EDGE_RISING>,
> 				     <0x2 0x40 0x6 IRQ_TYPE_EDGE_BOTH>,
> 				     <0x2 0x40 0x7 IRQ_TYPE_EDGE_BOTH>;
> 			interrupt-names = "soc-update",
> 					  "soc-ready",
> 					  "bsoc-delta",
> 					  "msoc-delta",
> 					  "msoc-low",
> 					  "msoc-empty",
> 					  "msoc-high",
> 					  "msoc-full";
> 
> https://github.com/LineageOS/android_kernel_oneplus_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/qcom/pmi8998.dtsi#L292
> 
> Not sure what the difference is between bsoc-delta and msoc-delta, maybe
> Richard or Yassine can recall? DT bindings would need updating too.

Well I don't remember, but the downstream kernel seems to reference bsoc
as battery SOC and msoc (used for the battery percentage) as
monotonic SOC. Maybe msoc is based on bsoc and scaled based on battery
health, but that's just from skimming the downstream driver.

