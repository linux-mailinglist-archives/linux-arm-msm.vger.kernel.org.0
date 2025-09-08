Return-Path: <linux-arm-msm+bounces-72544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C2B48939
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62F6189610A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 09:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FB82EFD8A;
	Mon,  8 Sep 2025 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXiHg55P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2D2EC555
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325436; cv=none; b=bmVLBfUMuQCH05/Q30a9EispfyC2RttzcNoMqcHuG9QkO3Va+nCCQfj0KPgUc3baURumWZsz7gKFKMQsx24JT6Wrbrw5bl9oHIlYoRK1Cs7a761UvF6ZXXz066nXXkEm6Gem6WZJUu4VMlJEGFvBZ52konZG3b1R5m/LjCX/tlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325436; c=relaxed/simple;
	bh=ykDwW2zeFPOxeLSt8zP2A70oe7r13xxaM+2jTS0GedI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+NISsw8RReJuaKpF7WFkZzO4nYUmvK4SixSSC2H5wSfgCHXb78kArqZTKPFDPqLMNKIKZ6KWlFz1L1UucLHiQrD+ZsJZ1J98e0gHgEU+8FdlKA0Ue0O0KGV5Ueu+K2fBZ/qgVSh3wlUxYPK8VU2/8RIreL7TqcEAfemP/th5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXiHg55P; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b0428b537e5so683159466b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757325433; x=1757930233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=haIepL/P0jz30Rbxjb0+O92cxvQz/NbDyzEigt7PcCU=;
        b=BXiHg55PXsd7pKl2UP/uL6qEdKOPNWomPgRlOWdq2sS0g9aXM2fTiSn0EVHCrFIjuT
         TKX9YtprnB4Zi1G7REEYpu+RoJMlguPrKiWZb0E2zUHQR3mwEpLOsglb4Fu9slNugeba
         nIH6SZJ/1aiw8pM1ZDda6ofh5RrFs1mFXsk+AdNnisyllcnx2uDngEwDQYnvsdL5AoJ8
         iSuNnVpnSSRqjnJZDo0mfPuEAOAjB6xXKuxB6oQ7WifUVnvD4ZOLH0gDpERWr1Z4uPqm
         2Bg84/j9cidiKwf/Rzk5yOUTbKt6HR4bh6oeT6Y87OoVaRR6Tin4bCS5Hbl+iYHyLTq4
         tYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325433; x=1757930233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haIepL/P0jz30Rbxjb0+O92cxvQz/NbDyzEigt7PcCU=;
        b=IblfkmMS0d0DMOOAwJK7bgIYU7MCo6tc8dzsIgCKqQO6nKb/iFqsDTyJ0nalYHpQZa
         AjFk///tAtT6Qx1YY/MbxeosNG2dfmcQjygf9rDV7rZwnY52T7LHD1KOR1B7AQndo001
         +2oQu9WrK5ftWzTSrPZ8xj/ZiSpDdIN7oQsqBjDh3RTChHQD6/UWrK2HKckDkuxQsCrV
         LP9M7BMRIY4ePmEIaTD/0LF2x2fmCySmMa03U1rm7qyMTT2P3l8XgqFZ2wjzbY4E/at0
         32qBzJm2i/k2caXksfjHa2Ip3EKyLCxZY4kPudjR+1JGEC+HbO0iSxIs34m6QCeztMKp
         9Ltg==
X-Forwarded-Encrypted: i=1; AJvYcCXPGHoM94hm4rsfkmFdQKGbbFYDTZKEJiGschqxKctJAO3Dx2OUaSk4Tkp7q7J1xuAT7EVz8nlyp1Bk9eKZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1haKJhwnq4jYNKzPjXTMEqPD6F3LArvrnfwkkRMbCJQkjQ2h2
	HqENUP7L6+sYKcNLMPPNM/x1dImWaMdRBZtc0j/sqpUMv5twEFC49m55iYd2PDnj09E=
X-Gm-Gg: ASbGncs0FjuaCdNGE/Kvw9zY5OHQU0RCQPKnXi1D9F9RTGk89M8TuelXOZd272Nz9MN
	v4sQo1ZSgQ2gxvD5p/gwsO4p7NPY3kKxGMrAuqZL4ORgHaz4dUcsz82ar3WXpxPI+N+Ezt6IlB9
	Je0kDNoow8BG5geoxMRqjlah342wu5R4uGk9+vQHKnvvljeDEhAXgJtOPhH1jO2qkpRHJshi45n
	yIweYiNTOAmMlnCBSk5r8ZH+VMGaBIe1QTRfo/7j8sRXTkZFij1JS0KtbKEHxy0mn7bTXpW+F83
	DNJe9e2xZGtdZSJiozX8mGnRU3iLj10wUsLE/m0XoAFPtfoVlTn3e0cEXjF2Su6646fGmFEyEmE
	OEXtahMI+ikt9olH3OVWt0dnGyEWjdUo/
X-Google-Smtp-Source: AGHT+IFYq6V5J5rXx5QgUvWRFIgmg8psdjbRgWhuE+b5PuhIMU45skzaKalA52LZGkVjQ1Apw2J66A==
X-Received: by 2002:a17:906:d554:b0:b04:48c5:340 with SMTP id a640c23a62f3a-b04b13cd56amr710023166b.9.1757325432564;
        Mon, 08 Sep 2025 02:57:12 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:1f60:42e1:1e1b:d240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042523ee7bsm1959154266b.109.2025.09.08.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 02:57:12 -0700 (PDT)
Date: Mon, 8 Sep 2025 11:57:07 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Message-ID: <aL6nZdJCKmnWcswB@linaro.org>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
 <aL6Vp-3er71AJPJd@linaro.org>
 <f508bf92-a513-467a-a946-17c41e1d72d1@oss.qualcomm.com>
 <aL6X-RiCyPVbHlYN@linaro.org>
 <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5178a6b1-1b5a-40d9-af40-68ee13975509@oss.qualcomm.com>

On Mon, Sep 08, 2025 at 11:49:52AM +0200, Konrad Dybcio wrote:
> On 9/8/25 10:46 AM, Stephan Gerhold wrote:
> > On Mon, Sep 08, 2025 at 10:43:50AM +0200, Konrad Dybcio wrote:
> >> On 9/8/25 10:36 AM, Stephan Gerhold wrote:
> >>> On Thu, Sep 04, 2025 at 04:31:23PM +0200, Konrad Dybcio wrote:
> >>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>>
> >>>> The CCI clock has voltage requirements, which need to be described
> >>>> through an OPP table.
> >>>>
> >>>> The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
> >>>> (which is a value common across all SoCs), since it's not possible to
> >>>> reach the required timings with the default 19.2 MHz rate.
> >>>>
> >>>> Address both issues by introducing an OPP table and using it to vote
> >>>> for the faster rate.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> Using an OPP table for a single static rate that remains the same over
> >>> the whole lifetime of the driver feels like overkill to me. Couldn't you
> >>> just put the "required-opps" directly into the device node so that it is
> >>> automatically applied when the device goes in/out of runtime suspend?
> >>>
> >>> And since you need to make DT additions anyway, couldn't you just use
> >>> "assigned-clock-rates" to avoid the need for a driver patch entirely? We
> >>> use that for e.g. USB clocks as well.
> >>
> >> This is futureproofing, in case someone invents FastMode++ with a higher
> >> dvfs requirement or for when the driver adds presets for a 19.2 MHz CCI
> >> clock which would (marginally) decrease power consumption
> >>
> > 
> > If 19.2 MHz CCI clock is feasible and has lower voltage requirements,
> > then I would expect a separate entry for 19.2 MHz in the OPP table of
> > PATCH 5/5? The DT is unrelated to what functionality you implement in
> > the driver, and that would make the OPP table look less useless. :-)
> 
> The frequency plan for 8280 does not recommend any rate != 37.5 MHz
> 
> For x1e80100 however, the lovsvs_d1 corner is recommended to be 30
> (yes, thirty) MHz, sourced from CAM_PLL8 for $reasons
> 

The 37.5 MHz rate still exists on X1E I presume, or are you saying we
need more changes to support those odd 30 MHz?

Personally, I'm not fully convinced there is ever going to be a use case
of someone using a "non-standard" frequency. Even if "FastMode++" is
invented most devices will probably want to use it. And the voltage
requirements we're currently talking about here like "low svs" during
camera use cases are kind of negligible compared to others too.

But I'm fine with either solution, just wanted to mention it. :D

Thanks,
Stephan

