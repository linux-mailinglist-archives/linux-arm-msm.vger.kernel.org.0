Return-Path: <linux-arm-msm+bounces-41349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6EA9EB734
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 17:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87EBE18827C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 16:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923771BD9CB;
	Tue, 10 Dec 2024 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bw27l8ia"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2381AA7A3
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 16:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733849642; cv=none; b=eU27fmTP1alyFIla1jchBjClvf5aR2mQz/HFiHyVUBSwZW2BMhF9fPiqqsnEt9e28a10+TffhI3yP9ce4Vw4+K4PZQ0SyZeXik/jTgdTgHv+yieKMHZJb2wFfPexoS4mGMcV90qd6auDrs/ypQcI2vMkln9lrxgaI06D+rsnk34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733849642; c=relaxed/simple;
	bh=l/8HBPCwyuNycmVKwayvf4SiKQB/PKOeP06ko+JSfEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4AbVcJh8mmI53C+EJS7RYB8r+5I2LSoCtWtAaAKnuRkCK5w/ewYhDvbLaZ5eJAENZsNiqEN0D26179Ufpez8fq+hNNYI6sm6sLsV2mGbX5QzV3nea5qiMfrm4Rp9iqAEzBqZLUcpTGr2izWvjRqZaf7/c98nxvZcur8Tv+dsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bw27l8ia; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso3344036e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 08:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733849639; x=1734454439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/8HBPCwyuNycmVKwayvf4SiKQB/PKOeP06ko+JSfEI=;
        b=bw27l8iad13d4Cmi/mQWI9jGXu3i5QP02b5Qmga7NWQJcF6bInx2YO9rnsr2neI+nj
         7X/8vGlPxK8MrBl6SOsyzcYly5qzuJgWM9/bpNOVEmizHc3eZieNlS6XpRuM57KSUMdL
         muWofN2ECSremabdbtAE/U0YFbE40T9XkLp5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733849639; x=1734454439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/8HBPCwyuNycmVKwayvf4SiKQB/PKOeP06ko+JSfEI=;
        b=eVI3yQxMTrtAhWmw9l/PO3xD8oVVyRXkD+urLzs/uni2R2h69JZpznNprH7xoiJWml
         XvOOp8AXuQM9N9a1YSoWEVf4F0nMcDvAkQi7on3VjVbLjeVm3hXNn7fkzLpRXv5IFiRc
         5YyC8ybIez9WJgKD/Hijho6fyMvJgzcGaCwVh2tHuIsybdo+Y5Z0WL2UO2wtn9gr1oeH
         jKWeWirHWkKuona9/zIC68GMmU1afD++v7LtG+Vbzn4vPBI1MG5E1/BrhSkZSMmPKsuK
         8g4QN4H1Hb8MuxIpcK4lsZrNWBcDr1xMBHj5egBRtFshw035L2CWEpJVoTojSTeEVN9H
         xKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY5kC03SQ6nW2du+S4QMmrnIZmsAfMmFNOG9FO22LhhLtqoCv7r7c/HvwlFcEnpRSjfNk79Y9asBL6F7GN@vger.kernel.org
X-Gm-Message-State: AOJu0YwIF1C1O8YbpkA/Fd6Cpi3HeGLbRrRxQw/bQV0rGNrAYhOwTiCQ
	fYuG5Vza+kH/RCQC/dP2FYFMj+r5C0Ocf+c4DrjnWNJJ9h2nLnnk/vS/IF8FLg0EWHRaNI4Z1p1
	8Yg==
X-Gm-Gg: ASbGnctZbaeQmOYlALP5NlZgdxyi3ufwQKV6CAVmM0yPVFsXInTr9WCw53GBL3JcMxm
	NJc7HD6iKSQo3RLh/WpCBz8TjOLXzGBmZ2YQOJpfg4jvOSsRJ5k+9zRITE2HzhwOicFvTmn9mOt
	uT+KWOd7td0+Ho5MrHifiSfBfGWUXU9Duqbfk2SrrcKWFGb3poQF8mEgrcl+IWANVWdjAsbLqDn
	z7EIqMDGjO8yfv3I9kBs2qckH0ORGmppbbWWLB2NVnJVw4KYmdgsGPQAFWy1mUQ/wlGtzoDup5u
	U8cnHZfX9uZMWgkL0Q==
X-Google-Smtp-Source: AGHT+IGLDHvFVN6B177Q6GoLsv+H+971JMKvcuGr6f0BIH4xb5JGPnvtnxqEK4qBVxAniav7o6l0WA==
X-Received: by 2002:a05:6512:4011:b0:540:2180:da3e with SMTP id 2adb3069b0e04-540241077d0mr1834900e87.46.1733849638774;
        Tue, 10 Dec 2024 08:53:58 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54020798a43sm606690e87.12.2024.12.10.08.53.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 08:53:58 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54026562221so754671e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 08:53:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWI964LkQRBzGo6Uf7lMqV85gcrlO2bDhX8mGkOE5gA7b704IeR89LPv2RDsOnrxa7aBFy6Zgtf19mbz7dR@vger.kernel.org
X-Received: by 2002:a05:6512:318b:b0:53e:3103:b967 with SMTP id
 2adb3069b0e04-54024108256mr1868839e87.35.1733849637744; Tue, 10 Dec 2024
 08:53:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org> <20241210155604.GA15918@willie-the-truck>
In-Reply-To: <20241210155604.GA15918@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 08:53:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
X-Gm-Features: AZHOrDk7WvPRzq9z4VNazAXpYtL75nSHpExN5slME765TfN80XYGbQfqOs7VNn0
Message-ID: <CAD=FV=U5xraosVuDGXxBN5Ajo0n=s50JZqtgQGPs1C9jM3YaFw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre
 mitigation lists
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Besar Wicaksono <bwicaksono@nvidia.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-kernel@vger.kernel.org, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 10, 2024 at 7:56=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Doug,
>
> On Mon, Dec 09, 2024 at 09:43:10AM -0800, Douglas Anderson wrote:
> >
> > Since Qualcomm CPUs are all derivatives of ARM cores they all have
> > unique MIDR values. This means that the tables listing necessary
> > Spectre mitigations need special entries for them. However, those
> > entries are not present and that means that some Spectre mitigations
> > are lacking for Qualcomm CPUs.
> >
> > I've made an attempt at **GUESSING** what the right patches should be
> > to enable mitigations for Qualcomm CPUs. This is mostly me searching
> > the web to figure out what ARM cores various Qualcomm cores are based
> > off of.
> >
> > These patches get more and more sketchy as the series progresses and I
> > have noted that the later patces DON'T EVEN COMPILE. I have included
> > them to make it obvious that I think these cores are affected even if
> > I don't have all the right information to mitigate them. Hopefully
> > Qualcomm can come and fix this mess for me.
> >
> > I'll note that I am certainly no expert on Spectre. Mostly I ended up
> > here running `lscpu` on a device and noticing that it thought that it
> > wasn't affected by Spectre v2 when I thought it was.
>
> Whilst only Qualcomm can say definitively whether or not they are
> affected (and what values of 'k' are required for the loop-based
> workarounds), I can't help but wonder whether the current mitigation
> code is structured the wrong way around in this case.
>
> It looks to me like we don't have a way to identify a "vulnerable" CPU
> for Spectre-BHB; either a CPU has some sort of mitigation or it's
> unaffected. That means that there's very little incentive for vendors
> to add their CPUs to one of the lists -- if they do nothing, userspace
> is told that everything is golden and they don't pay the performance
> hit of a workaround!
>
> So I think we should consider turning this on its head and assume that
> CPUs we don't know about are vulnerable, having a list of unaffected
> cores that predate the introduction of CSV2.3 which can be queried by
> is_spectre_bhb_affected(). We can do that without the assistance of the
> CPU vendors.
>
> Does that make sense, or did I miss something?

It makes sense to me. I'm not sure I'd be the best person to actually
implement that, though. Maybe someone CCed on this thread could take a
stab at it? It seems like folks from ARM would know the most about the
various mitigations and which pre-CSV2.3 cores were safe.

-Doug

