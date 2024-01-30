Return-Path: <linux-arm-msm+bounces-8974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E0841DED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 09:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D301F2A622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F11A5789A;
	Tue, 30 Jan 2024 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yaD2gA2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8EC5645F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706603784; cv=none; b=LY8KAJcaV0kPpcZERVY19YoKqq0TUIXV2h7IzsB/GpbZX41OnR9jADiNXELgCH5RG4P2OoSYV7n0vtfryKAMGhuUx77IQxz7VgxqJ03eU+2OgncrMQ50+p5KaO5I0+jkovpQgRwyLgR056pS0UayHhZoYFSunMy3seMgxT3aTeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706603784; c=relaxed/simple;
	bh=W2phQou49lKvGekMFOEmUIYvVZIwwYsj7+ZcSxC74uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFB6FZA9WBVqZKnu3S0obZYQSDCCOvM6fVQTsjMwORt+rDKg8w+Jet+ISWavH2f+BpXVoJPCPdIQd93jcavIlH9HXTq13FUV8kIThcfpaEV6hpSjlelOr76dH9sRUTt590fibi7QG6pCEVbvSRWLUHNps+dbwmDqv87HyGAGUvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yaD2gA2w; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso3073582a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 00:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706603782; x=1707208582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mmIzNb+ZOgY76eDyBMiKyZqTgdwPkCE2yLFSyht3p4=;
        b=yaD2gA2wltkrJIgjeAcnDTJmAat9O1TI5V5ipjZCbV96HlxcPAO/6l30aP2msDKhJi
         /teqLF7q29kNE8Xxlhxe9JjfRTyMs5yGbbGYiEqppv8besLphdNbfzNuGsIK63sujOCl
         5650jLX1rIV2UMzBCP9mvifiml+zkyj5HXdf46hZ9FnrdNGOrEX60QCIySTEpW9XGZk2
         kTS1Bp1HGYiD8NEdEzGx/bE1qI0Vh62Nt0OqZN16z2g1rHNpfoY/HtB8qvCmKfJIDine
         sY7F1wLGSj20z1SIg4spakl3fIPXgKcMudz27yc/MYo2n5WAEVqLbWYMQ906K31+Ou3L
         Q2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706603782; x=1707208582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mmIzNb+ZOgY76eDyBMiKyZqTgdwPkCE2yLFSyht3p4=;
        b=ZrBBfYJxKEZsM5KQwccbOGpQwSyd2EcuCetzlt1OeA/sq9pPeRm2CO/iHWw4Cgu3yg
         dr+jLSEhvk2FwuivH1q3S2z+7GWnssPzVn7hHMhzpIZkCE5AAcUziZ3f0ditnSs9fGR/
         kB+GDPl0EvMLn1QVZacvKoBuijmylz1UNLUFLCAXcVONhEJPRvB/TOGYtv/PLN3cyUUW
         96fGun7qV88QiOFwYJMiVdOD99/YkXMnBq/pxdkLq+j4DWkpUayvPFPA0qDScjmBu3j1
         CfCNa2NQ8V77tlGx14AB1/91Qx/4LwGXt1kYErfKQIO1str6nunLD6YyBh9Otn4ufWZ4
         08DQ==
X-Gm-Message-State: AOJu0YxIOBdu1KNtTc/7j4Nz0b450IOCrlUBBCwpPQdz2nSiqVhR6GYM
	wNHE5MCSSl4t3hlG3Sih0rMLdftJv4tPBco1LZhSfV0gtBKDAlX9OL5Fhq97DAw=
X-Google-Smtp-Source: AGHT+IH5nN3jXk0A0JNSewuPlPgp7Cq5GPebH23Ul6WL9faSXldnL8F94mIwgC1tfTDNZFnhfeR7TQ==
X-Received: by 2002:a05:6a20:bb0:b0:19c:8ec5:71bb with SMTP id i48-20020a056a200bb000b0019c8ec571bbmr6622372pzh.8.1706603781780;
        Tue, 30 Jan 2024 00:36:21 -0800 (PST)
Received: from localhost ([122.172.83.95])
        by smtp.gmail.com with ESMTPSA id r24-20020a170902be1800b001d7233dc459sm6604139pls.76.2024.01.30.00.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 00:36:21 -0800 (PST)
Date: Tue, 30 Jan 2024 14:06:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
	vireshk@kernel.org, quic_vbadigan@quicinc.com,
	quic_skananth@quicinc.com, quic_nitegupt@quicinc.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: sm8450: Add opp table support
 to PCIe
Message-ID: <20240130083619.lqbj47fl7aa5j3k5@vireshk-i7>
References: <20240112-opp_support-v6-0-77bbf7d0cc37@quicinc.com>
 <20240112-opp_support-v6-5-77bbf7d0cc37@quicinc.com>
 <20240129160420.GA27739@thinkpad>
 <20240130061111.eeo2fzaltpbh35sj@vireshk-i7>
 <20240130071449.GG32821@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130071449.GG32821@thinkpad>

On 30-01-24, 12:44, Manivannan Sadhasivam wrote:
> On Tue, Jan 30, 2024 at 11:41:11AM +0530, Viresh Kumar wrote:
> > I don't have any issues with a new callback for bw. But, AFAIU, the DT
> > is required to represent the hardware irrespective of what any OS
> > would do with it. So DT should ideally have these values here, right ?
> > 
> 
> Not necessarily. Because, right now the bandwidth values of the all peripherals
> are encoded within the drivers. Only OPP has the requirement to define the
> values in DT.

I have a bit different argument here. I am saying that it doesn't
matter if we have OPP framework or something else using these values.
The hardware must be represented properly by the DT, so Linux or any
other firmware/OS can program the device. So DT should have bandwidth
values anyway. And that's the way we have designed things in Linux
now.

> > Also, the driver has already moved away from using those macros now
> > and depend on the OPP core to do the right thing. It only uses the
> > macro for the cases where the DT OPP table isn't available. And as
> > said by few others as well already, the driver really should try to
> > add OPPs dynamically in that case to avoid multiple code paths and
> > stick to a single OPP based solution.
> > 
> 
> Still I prefer to use OPP for bandwidth control because both the voltage and
> bandwidth values need to be updated at the same time. My only point here is, if
> OPP exposes a callback for bw, then we can keep the DT behavior consistent.

Feels like we are going a bit backward on this. The current view, as
per me, is that driver shouldn't need to micromanage all these
configurations and the OPP core should be able to handle them. That's
why we want to handle all configurations from there.

This also means that the DT needs to contain all this information and
drivers shouldn't use special math functions to calculate these
values. Drivers need to move away from them, instead of getting more
of those.

I don't see how a callback would be helpful here, if the driver relies
on DT values only. Or am I confusing things here ??

-- 
viresh

