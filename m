Return-Path: <linux-arm-msm+bounces-42823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB29F835B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 19:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1155169D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6EE1A2C11;
	Thu, 19 Dec 2024 18:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TYF2lhUY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1BF1A264A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633397; cv=none; b=FXTLVaM9i8dCx8kyu7t0CqJGn5oeM36VhDw8oaBCGRoMtxxnzVjGp0p0Kc03MvdB6AFql8lmxsyJO1vJ9x4RmRQf07hmThkwSkPbhJq56jns1KX2lYS+TlK4TsL4yMHsGjKBLrDIQi+qPhjxO+I3yNfD0fOhdVfcnYFfPGnky9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633397; c=relaxed/simple;
	bh=rGd7ObbG8am+yMUo8jY97Hpu/e58CJlvRLs1UHv0j9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvkHXcwX2gXU22xsQKcaw7MBjrPpghpY2gHAkNxs03NDoYeyAAGZ2xaRF0yH2nOBn5cLeMgDwb4C422PgySkXmGhh8dq3d21B5IjaZBOpZ92gBYnOsjsTNGWD/Ood4rUtDMpZp5u0/u5yD0rWuqXPKYJEPMZnWuJLV/bvd1AnsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TYF2lhUY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54026562221so996366e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 10:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734633391; x=1735238191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGd7ObbG8am+yMUo8jY97Hpu/e58CJlvRLs1UHv0j9A=;
        b=TYF2lhUYWAh7Cc/w9bVABVAUTTxs8SomO3jUun5FnVyTMSVl54LY6qADc5UxJRtpOk
         7RIv43b1AbgJi0nvEwO75SqW9THE88EOUhvTkFckUt8Yd9WfuUpb6LQUtp0/3SbD93Rt
         I8HWIgEwbITZKmmzt2Tu/60gW2UHpqJGF5qGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633391; x=1735238191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGd7ObbG8am+yMUo8jY97Hpu/e58CJlvRLs1UHv0j9A=;
        b=pCLI83uuvuZDJ1qLwDZbGPfaNEviQoCrxelMbYeO6ELNwJtl9CNLKvc+4IUZAu/ui2
         7f8MZICF8Y4wphEvpVI52rjHguOzjOt2K8M8cCCx+G5CNVwPX6N53I8tSKrkYRRR8VwT
         e8Xpr3Veo4/pv/C8lIrJ+vXr68S7Lbi1a8iiOiK/7Pk4AJt867FA+dOoZ2bmF4YA2pOG
         OQW0yQpzpNGSz7rVP/8+LJ+xo8fCCiKsDeeGmhEiL/IOyuupVsFJINA0SY/u+96HsWNc
         6qWFuqeN9WYuA6X+bFj67Wo6RiGiom4nrLsfY8FcD7XMKYwK3qFVPJ0rAhlBR3h01duM
         QVxw==
X-Forwarded-Encrypted: i=1; AJvYcCWYpVHY5ADfTDoIfDES9oKlbBAA78P7m4TOOEfttJsoCxQmAv/STLOxFVnb352/4jIB0SZUrCEHJHrkYjaG@vger.kernel.org
X-Gm-Message-State: AOJu0YwKtGU38tZAxuGKIvwHi4KIJqY/N+Xx7MXBZ+Jwv0v/bsCAJvSK
	6bikSwgWBIz9KXy0fIXAUhs7uRICzFnoeSRghDI0ejPIQ/jP0YmQeSRenTFN8vuBIMFyZ3jF8ai
	2Fw==
X-Gm-Gg: ASbGncs1Ng0t3vDPmWB5tiCEqedj5zue8AZPU6GPSv5ZWGPWeMFpuUY8SOxcpmV0vog
	eOKCWlyd+jPnWwr05V0tLJdq9qoQM+6bzl/jsjQFvoDP22s1/aP/HJwtIMaTcEA79bnu5RiS2Pt
	QRkw5TujW6LEzmvoChHgDSlgK99K4R3h1HmKJUX0dAn8yov/poy+2GRPuP9gFQ0K8m/MctPG9QP
	b6AHj2s+ap6g0P+vWfzuBXVA0AYotS4HydyA39mwsn96rcIvgvmK4wG7cVZ4IqI/ZRHtyA70Btc
	ByIWyU9aSrxCK99QUyHN+T3s
X-Google-Smtp-Source: AGHT+IEwJWw5Gfw++bc952u8BQCXtlyiRa8y6GWGIoJO67e+rfk0fv0+PMZJdbfc7eLooA/nSMSXRQ==
X-Received: by 2002:a05:6512:1042:b0:542:249c:2156 with SMTP id 2adb3069b0e04-542249c21afmr937996e87.15.1734633390815;
        Thu, 19 Dec 2024 10:36:30 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f66bdsm240848e87.16.2024.12.19.10.36.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 10:36:30 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30229d5b21cso12018271fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 10:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKDn3jwJsP0yLDX+MImqpf77706HLVNpkacvsBzhttz+w/cryljUyc5V75sNB3xeSRi6+uFPRIDavsoMVw@vger.kernel.org
X-Received: by 2002:a05:6512:1320:b0:540:1fcd:1d9a with SMTP id
 2adb3069b0e04-5422102f5cbmr1448494e87.48.1734633388364; Thu, 19 Dec 2024
 10:36:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid> <20241219175128.GA25477@willie-the-truck>
In-Reply-To: <20241219175128.GA25477@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Dec 2024 10:36:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WnbMegiKDuV1HeWrGyQx42+bPZjwKQ09Q++b-fFBm7gg@mail.gmail.com>
X-Gm-Features: AbW1kvYHski0KpEwR6JI2rs7ZczsyhWkjzlkYCDe4FZwiR8jg7mutRjD544Tlw8
Message-ID: <CAD=FV=WnbMegiKDuV1HeWrGyQx42+bPZjwKQ09Q++b-fFBm7gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Roxana Bradescu <roxabee@google.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 19, 2024 at 9:51=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Dec 13, 2024 at 04:52:02PM -0800, Douglas Anderson wrote:
> > The code for detecting CPUs that are vulnerable to Spectre BHB was
> > based on a hardcoded list of CPU IDs that were known to be affected.
> > Unfortunately, the list mostly only contained the IDs of standard ARM
> > cores. The IDs for many cores that are minor variants of the standard
> > ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> > code to assume that those variants were not affected.
> >
> > Flip the code on its head and instead list CPU IDs for cores that are
> > known to be _not_ affected. Now CPUs will be assumed vulnerable until
> > added to the list saying that they're safe.
> >
> > As of right now, the only CPU IDs added to the "unaffected" list are
> > ARM Cortex A35, A53, and A55. This list was created by looking at
> > older cores listed in cputype.h that weren't listed in the "affected"
> > list previously.
>
> There's a list of affected CPUs from Arm here:
>
> https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
>
> (obviously only covers their own designs).
>
> So it looks like A510 and A520 should be unaffected too, although I
> didn't check exhaustively. It also looks like A715 is affected but the
> whitepaper doesn't tell you what version of 'k' to use...
>
> > Unfortunately, while this solution is better than what we had before,
> > it's still an imperfect solution. Specifically there are two ways to
> > mitigate Spectre BHB and one of those ways is parameterized with a "k"
> > value indicating how many loops are needed to mitigate. If we have an
> > unknown CPU ID then we've got to guess about how to mitigate it. Since
> > more cores seem to be mitigated by looping (and because it's unlikely
> > that the needed FW code will be in place for FW mitigation for unknown
> > cores), we'll choose looping for unknown CPUs and choose the highest
> > "k" value of 32.
>
> I don't think we should guess. Just say vulnerable.

Ah, I see. So the series won't actually _fix_ anyone, it will just
properly report that we're vulnerable. I guess that works.


> > The downside of our guessing is that some CPUs may now report as
> > "mitigated" when in reality they should need a firmware mitigation.
> > We'll choose to put a WARN_ON splat in the logs in this case any time
> > we had to make a guess since guessing the right mitigation is pretty
> > awful. Hopefully this will encourage CPU vendors to add their CPU IDs
> > to the list.
>
> Hmm. We shouldn't have to guess here as the firmware mitigation is
> discoverable. So if it's unavailable and we're running an a CPU which
> needs it, then we're vulnerable.

Sure.

-Doug

