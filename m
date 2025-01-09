Return-Path: <linux-arm-msm+bounces-44584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC0A0777A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2F73A7F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3E7218AD5;
	Thu,  9 Jan 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9zJK7l6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33830218AC6
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429385; cv=none; b=M4RYrONSe/1e88rVOZ2kSHFSYAQXhUr+j1p8UwUOCDgHSflQNmfwD4S1f5vrBSp8hDhMVxFuicuHvY7QNScXecVcJTKowkQgBBq8RuF/i3k/P1FDljJXdqLIDHzDV/irD3Cnb+4e5rGPxorVoMeFGEiDFjlILKXo4/9z3Dm/Klk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429385; c=relaxed/simple;
	bh=8rSBoPoWgYw8GMcczoRWMMy4LnGGJTErpNLaqkb7AD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oO/Npw6ahBgphc2YLGDTqTURT2Mf2BXbYK9QIULrqkajMYba1Z7Q7YU6VYP23g5uGFl24M6zkvNeS7dwkoZyX/IF0ueXWnVeib/se+ge7XJDo1BwuD0KvMgy+nqTK4OIF2dDLoGVNilaRR/5RfJVKOjNIV21lcujIM0XOmpRWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9zJK7l6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d8c1950da7so1450941a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736429378; x=1737034178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fajyQwiVg0bVHBQztObwTfCvnjgOz4VRKV2sqAloBqo=;
        b=m9zJK7l66XCEklF1FlgV+q8B4DIV8mJsSW6WNPVZAV/vFL2Nm/LRehW5F1vEkGGtEG
         9DUWMJ4OSFLMNfRUF8v2mTqA2FoTnLexx5GbG7GZuoOAiPWWLkCVc3HnXKK+tIUZNzHv
         0vmryeHT7JGvOaGJC0zbR0KTlhvuF2SinR5b3YHwJxCcy06EE+SFWgFbE74uhhxoT5HV
         fjp17SuIPiI70jSRuEkK9ChCIIY7v8CaZrJGrB7OoUH2t4lhzhPWdMiy4pTysJ+uTt+2
         BIkqXU+OwkJMl8wlH+kiIa7nLbWsO1B8lwhCqaKm2JIAXoL54EZ3SOJNawzEGCX0otg7
         QXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429378; x=1737034178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fajyQwiVg0bVHBQztObwTfCvnjgOz4VRKV2sqAloBqo=;
        b=xK+cFAdd6DVY3bN48RRpCs4aZypqQv6WP245vAqheeaRLn4mRMGT9e1p0idqF0KnYB
         Bb7C9fqGhT8vNvN+qrdJ3wF8IHUX+KvKHXMCrdbxS+47vWls38eonxr2Nu/LLxETbtjw
         Yj4nE52eDnALbwptqVz/fRf1YGcUDcTPE6ybOQBTE0NBlFCTUPtdwgiPVqSzwvVkomjD
         wopdwsFoKDq+xDtm8+Cmgg6WV6AeSaMoVju1mvbniQtlxy60nenNJ6j2u3yr9veyrSLo
         qc3JZomvvKh6tSAZC8aNHu67o+Sbq+SKL5Q+mbzlFU+2zQYud1ijszexUoTG8FMtD28I
         LdFg==
X-Forwarded-Encrypted: i=1; AJvYcCVRrcEJkkXnLTommjH7UHxWA+CYyg4dRYXHp7bsVJI8U/6KicSon69HzJWbO7UdRBHbgxq8iD06KBgagJob@vger.kernel.org
X-Gm-Message-State: AOJu0YzKNYbn2vRQpLriKZCn5yuvlYJX+gLRKjf5GvmF1qDp35oix3I7
	yojlrpAkCIHEis1TodkFuRP/CTv35UXFeVw1zDu+UycZ7cN+VTXYhMrayiWBt8Y=
X-Gm-Gg: ASbGncsr757agojkCi2HUDbO5tyRj59K1KMbvciVzZP6IBVl5mvRvTrig5pZMcMRyvV
	ZxQUhFAJHch36I8JrMQgFdwqvA0TsBMCjMaJY6lnkvjQdktqXsj74H4J6kHt6PyBWMEyjffm3of
	zUua4Wv2WmkrRqqpDA/brKE2TN9kd+3ODWYYU+E4drtrNSZRx7PFIc1Fzkbmia/O8CNHOToXAr9
	vUYk4Ih6USowXYPykzUKKJ2fgIlrxtkGVXctdX0I/2cn2tjdRKTOByPC6EttMj8L79J
X-Google-Smtp-Source: AGHT+IEFes9axgrHAFPFaU+53c5yDyInEuXS9Nfpvc/FG4NRcFYXnFr3fQp6r1KVwEPD3nweimDy4w==
X-Received: by 2002:a05:6402:354b:b0:5cf:d19c:e21c with SMTP id 4fb4d7f45d1cf-5d972e149e8mr6029099a12.20.1736429378415;
        Thu, 09 Jan 2025 05:29:38 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:32eb:2ece:5e7f:f59b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2fffsm628444a12.43.2025.01.09.05.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:29:37 -0800 (PST)
Date: Thu, 9 Jan 2025 14:29:32 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
Message-ID: <Z3_PPOwPNOPkZPkz@linaro.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
 <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
 <Z1H1BHAeO-0832Ea@linaro.org>
 <6vfrlwir6sfommhn3met6wnjm76lnnxw4rdwzq75b7lzcy4jep@2cbcfvb3tvr2>
 <Z3-XoDgUgdS7DDvm@linaro.org>
 <0f9e456b-cd54-4496-a2d2-795aae744385@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f9e456b-cd54-4496-a2d2-795aae744385@oss.qualcomm.com>

On Thu, Jan 09, 2025 at 01:57:17PM +0100, Konrad Dybcio wrote:
> On 9.01.2025 10:32 AM, Stephan Gerhold wrote:
> > On Wed, Jan 08, 2025 at 05:07:47PM -0600, Bjorn Andersson wrote:
> >> On Thu, Dec 05, 2024 at 07:46:28PM +0100, Stephan Gerhold wrote:
> >>> On Thu, Dec 05, 2024 at 06:11:47PM +0100, Konrad Dybcio wrote:
> >>>> On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
> >>>>> On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
> >>>>>> On 03/12/2024 18:44, Stephan Gerhold wrote:
> >>>>>>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
> >>>>>>>
> >>>>>>>  - "MIC BIASn" enables an internal regulator to generate the output
> >>>>>>>    with a configurable voltage (qcom,micbiasN-microvolt).
> >>>>>>>
> >>>>>>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
> >>>>>>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
> >>>>>>>    This is intended for low-power VA (voice activation) use cases.
> >>>>>>>
> >>>>>>> The audio-routing setup for the X1E80100 CRD currently specifies both
> >>>>>>> as power supplies for the DMICs, but only one of them can be active
> >>>>>>> at the same time. In practice, only the internal regulator is used
> >>>>>>> with the current setup because the driver prefers it over pull-up mode.
> >>>>>>>
> >>>>>>> Make this more clear by dropping the redundant routes to the pull-up
> >>>>>>> "VA MIC BIASn" supply. There is no functional difference except that we
> >>>>>>> skip briefly switching to pull-up mode when shutting down the microphone.
> >>>>>>>
> >>>>>>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
> >>>>>>
> >>>>>> If there is no functional difference and this is just redundant, then
> >>>>>> there is nothing to fix, so drop the tag. But the point is that users
> >>>>>> might want the low-power VA. You claim they don't want... sure, I am
> >>>>>> fine with that but there is nothing to fix in such case.
> >>>>>>
> >>>>>
> >>>>> The fix here is that two mutually exclusive power supplies for the DMIC
> >>>>> are specified in the device tree. You can only have one of them active
> >>>>> at the same time. The Linux driver handles that gracefully, but the
> >>>>> device tree is still wrong and IMO deserves a fixes tag.
> >>>>>
> >>>>> The functional difference is that we skip briefly switching to pull-up
> >>>>> mode when shutting down the microphone. Users won't notice that, but
> >>>>> it's not the intended behavior.
> >>>>>
> >>>>> I don't claim that users don't want to switch to the low-power pull-up
> >>>>> mode (VA MIC BIASn). However, we would need a different mechanism to
> >>>>> give them the option to switch at runtime. "audio-routing" just
> >>>>> specifies static routes, so the current description does not allow
> >>>>> switching between the two modes either.
> >>>>
> >>>> Is there no existing mechanism to alter this at runtime?
> >>>>
> >>>
> >>> I don't think so... Since it's currently exposed as two separate DAPM
> >>> supplies (instead of a mux or similar) you can only choose between one
> >>> of them in the static routes specified by "audio-routing" in the DT.
> >>>
> >>> I tried looking at how downstream handles this, but this left me even
> >>> more confused than I was before. :-) On CRD we currently have the
> >>> following routes in DT:
> >>>
> >>> 	"VA DMIC0", "MIC BIAS3",
> >>> 	"VA DMIC1", "MIC BIAS3",
> >>> 	"VA DMIC2", "MIC BIAS1",
> >>> 	"VA DMIC3", "MIC BIAS1",
> >>> 	"VA DMIC0", "VA MIC BIAS3",
> >>> 	"VA DMIC1", "VA MIC BIAS3",
> >>> 	"VA DMIC2", "VA MIC BIAS1",
> >>> 	"VA DMIC3", "VA MIC BIAS1",
> >>>
> >>> MIC BIAS and VA MIC BIAS are mutually exclusive, so this is not correct.
> >>> But if you look at e.g. SM8550 downstream they have:
> >>>
> >>> 	"TX DMIC0", "MIC BIAS3",
> >>> 	"TX DMIC1", "MIC BIAS3",
> >>> 	"TX DMIC2", "MIC BIAS1",
> >>> 	"TX DMIC3", "MIC BIAS1",
> >>> 	"VA DMIC0", "VA MIC BIAS3",
> >>> 	"VA DMIC1", "VA MIC BIAS3",
> >>> 	"VA DMIC2", "VA MIC BIAS1",
> >>> 	"VA DMIC3", "VA MIC BIAS1";
> >>>
> >>> Note the TX DMIC vs VA DMIC. So they specify one of the supplies for the
> >>> TX macro DMIC, and the low-power one for the VA macro DMIC. That would
> >>> be fine.
> >>>
> >>> Now the question is: If we can use the DMIC through both the TX and the
> >>> VA macro, and we're not doing voice activation, why are we using the VA
> >>> macro in the first place?
> >>>
> >>> @Srini: Do you remember why?
> >>>
> >>
> >> What's the verdict regarding this?
> >>
> > 
> > We started discussing this, but did not come to a conclusion yet if we
> > should be recording from the DMICs using the TX macro instead of the VA
> > macro.
> > 
> > The patch I submitted is still valid though, independent of that
> > question. Since we're not doing voice activation we want to have the
> > "full quality" MIC BIAS supply, not the low-power one.
> 
> Can/should we discuss a new sound API to make this toggleable?
> 
> Do these microphones physically connect to muxable inputs, or does this
> depend on board wiring?
> 

The WCD938x codec has 4 MIC_BIAS output pins that are typically used as
power supply for microphones. Inside the codec there is an option to
drive these output pins in one of two modes:

 1. Internal regulator to generate the output with a configurable
    voltage (qcom,micbiasN-microvolt). Exposed as "MIC BIASn" supply in
    the Linux driver.

 2. "Pull-up mode" that bypasses the internal regulator and directly
    outputs fixed 1.8V from the VDD_PX pin. Exposed as "VA MIC BIASn"
    supply in the Linux driver.

The board-specific part here is only which microphone is wired to which
MIC BIAS pin (e.g. DMIC0 -> MIC BIAS3, DMIC2 -> MIC BIAS1 etc). 

Both options will work if the microphone can operate at 1.8V. In that
case, I think generally we want (1) for normal audio use cases and (2)
for low-power use cases (like "voice activation").

Apparently the same applies for the "macro" to use. TX macro should be
used for normal audio, and VA macro only for low-power use cases. With
that there is a clear mapping:

 - TX macro DMICs -> full power "MIC BIAS" supply
 - VA macro DMICs -> low-power "VA MIC BIAS" supply

I don't see why someone would want to change this mapping, so I don't
think it's worth making this user configurable.

Given that we're currently using the VA macro for normal audio, we
should describe VA macro DMICs -> full power "MIC BIAS" supply for now
and ideally migrate to using the TX macro later.

Thanks,
Stephan

