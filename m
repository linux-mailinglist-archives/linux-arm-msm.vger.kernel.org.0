Return-Path: <linux-arm-msm+bounces-65660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF1B0A4A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 341BA5630D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4C82D9EC9;
	Fri, 18 Jul 2025 12:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXJMzzal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DC42DAFC3
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752843479; cv=none; b=g3mNftLSyOiQ46E0yvLKpJfGAJRlJaI0sR2VFpRwbXo9aTNTVVcPXOj0fSHqX19zpfhn7kxzL9Z8xzWYhiRWiFzXLmNP4/q+/iQusBC9gCf3+guLEQS4fO3ZLxhK91sAwgnAwoEmgbulelXVgNE0UmQzupMDNIQHcMg6uaQMzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752843479; c=relaxed/simple;
	bh=2oVBNLLjRvI/epA6VfcF0SznFLcvvWnbecTGR/uJYlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZhpot47r4o9R/9FLVDt//AiM7+twld9d2TKsjtW3ngJcnkQaKdCUPMLBFaK/mwD+B51b1Nut1rvF4CCjYh/xRS+lM/THMT3DFScUFEtxq8LhOtx28u3c/vf38ncTKoePQs0lgZWep9NiuvL/Vxjf+HzxKc/9g/VTHw3GoKvX7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXJMzzal; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8d70c65ad5so1452614276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752843477; x=1753448277; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2oVBNLLjRvI/epA6VfcF0SznFLcvvWnbecTGR/uJYlY=;
        b=zXJMzzalaAoPcKA+89aZpl0UashlLYsa0MR/RDy6zqcDmK4fLyf8JCLNEzL3tD2Lcc
         KILWK54tiV8Qd5gykDDMuefBGu0ZTSOpi7gXxNS0to95Gx/+gWHiTJBCcTcMkJc9gwhJ
         vVbpQ0KM64EHUnBq44XmkVAKLwXKZ1zL35MeN+b12laD+dXfNxYDRgIfPUdpj9h98FMu
         eu7zTiSbN2PXg6xpKfuUwdrs/24HkA/fMgZ8s2Gb3NTEyEzTz96gSIPTx8nbSPV3Cl95
         Baven60FkdLZNDgZF+AQpyf8qv3jiRs/ci8uTOUAmRwY2KW+VJ6ZM47xYhYVvzTqKbmb
         AXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843477; x=1753448277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oVBNLLjRvI/epA6VfcF0SznFLcvvWnbecTGR/uJYlY=;
        b=FKMppXhBr1+ihod0PDY14dbLW9JyUys1LMl87VdRmJIzxhg3UKOwyk4S9p9Vi76iEk
         95fT6nrx+YS9d6WGiXcKg0+Pk9cVSlwf/hl2GCfDZOvTKJu6XM1C3vkkeLqwCsRl1ch8
         TAWerT2IGfXyQ2FEnqwAcpptZLHs27ggX40UWmbO/ahUCgtDKirht13R8J4q3Svfcrgk
         KBTsrS3+g0jEF3/OzHRTtQuuEAn4El+xz0lcbEwMJNXliQzBvx8olOVH10fIPzGkZ2qL
         9riPNWnp5NA4Z5yzaO3wBMWj+ZC7jKrId1S64xi2a4dx8EC0JUBhmL4DmvpxlzQa7Y4Y
         x11g==
X-Forwarded-Encrypted: i=1; AJvYcCVnZ4E08TlO5fOlhOpKuMftSZRACohkIJE3Ss+aOP4Ml4laAg4/YZ0nRMsikWyKMz9LXZ+YaV3UUhJHQlpf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7S9AP/y8373Xo7nxUapHyei02klE2FhxJdabGtKdSeGSq845e
	5T2A4WZasTGR2/AMlOBAt09dPlIV4FmyYS03oCx480EMIbkqWFiPZw6wY38c10THEpgYQp3/I8h
	z03gH/mJSXs4cO6KVE0Y6rj54PwVVlW3HM/tadsTXeQ==
X-Gm-Gg: ASbGncsulgC4tyifDudrXbQRTZVvq1W4ErBIrxfpG8nAaSrBZcKVvweMSp562HUKA5b
	FQlBDbY3XS4ikk5aC6saZp8Pi9j+urg2Rw36FeHXz8aOuRjUduclx3C/qNfDUecM2IfX9A63kG6
	ogxG8eHKXfgU+txJmokL+t3EdJhuD6uWJ6MRxWuRG+LVp+rVAqgzSNpK7pA3s4JQtdXrnBsMKPD
	dlSzUbG
X-Google-Smtp-Source: AGHT+IGL8vq79uRPv+7EgtB0w1khGf/ZZ/t0fKcCIca47IxCbP1gdAWP0LAznLmxVN6tPjXDjywCkYz53fSv6LPH66I=
X-Received: by 2002:a05:690c:fcc:b0:719:5337:59ef with SMTP id
 00721157ae682-71953378ed6mr28884307b3.27.1752843476741; Fri, 18 Jul 2025
 05:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250718110217.1929526-1-quic_dmukhopa@quicinc.com> <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
In-Reply-To: <a569a2c3-2fb2-4a40-8d54-898e7c36f4b3@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 18 Jul 2025 14:57:21 +0200
X-Gm-Features: Ac12FXwr-Fm6lencmYiNXXyaB3FhAUaboLaEzLqBOtQ2Ce15n_VvqzG4MtGWFZw
Message-ID: <CAPDyKFqgo4ewJxPOUmY-GE+CG2XUVGQvEqgTQnvo0MfryMemGw@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, kernel@quicinc.com, 
	Neeraj Soni <quic_neersoni@quicinc.com>, Ram Prakash Gupta <quic_rampraka@quicinc.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, Sachin Gupta <quic_sachgupt@quicinc.com>, 
	Bhaskar Valaboju <quic_bhaskarv@quicinc.com>, Gaurav Kashyap <quic_gaurkash@quicinc.com>, 
	Sarthak Garg <quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jul 2025 at 14:05, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/18/25 1:02 PM, Debraj Mukhopadhyay wrote:
> > Crypto reprogram all keys is called for each MMC runtime
> > suspend/resume in current upstream design. If this is implemented
> > as a non-interruptible call to TEE for security, the cpu core is
> > blocked for execution while this call executes although the crypto
> > engine already has the keys. For example, glitches in audio/video
> > streaming applications have been observed due to this. Add the flag
> > MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
> > keys to crypto engine for socs which dont require this feature.
> >
> > Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> > Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> > Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> > Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> >
> > ---
>
> Let's take a step back - do we need to ever program this more than
> once on QC? What about other devices (e.g. the generic cqhci-crypto)?
> Do they also lose the crypto context over a runtime pm cycle?

I agree!

I also think it's important to also understand what runtime PM cycle
we are discussing here. It's a bit blurry for me currently, can we
please clarify this.

A runtime PM cycle of the card, means that the eMMC card is
power-cycled and re-initialized (assuming MMC_CAP_AGGRESSIVE_PM is
set, which I guess is a downstream patch as the upstream sdhci-msm
driver doesn't have this bit set, at least not yet). The mmc host is
probably also runtime PM power-cycled when the card is, but it's
orthogonal to the runtime PM cycle of the card - that's a really
important point here, I think.

As I understand it, the crypto context is not tied to the card, but to
the mmc host. What happens with the crypto context when the mmc host
is runtime PM cycled? Is the context preserved? I assume so, or?

>
> If our hardware is fine with set-it-and-forget-it approach, maybe
> we could limit this to a small if-condition sdhci-msm.c

Yes, maybe. Let's see.

[...]

Kind regards
Uffe

