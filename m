Return-Path: <linux-arm-msm+bounces-91288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOISBqKVfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:27:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DEBA10E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8869730065EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A6F369980;
	Fri, 30 Jan 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eacAcz6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910A366DC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772445; cv=pass; b=U6+zG+Bhvsv2CSvXXWcnEZcSbSBWetapOAX+sWQ8UTSh8Ymg03P5c19TKBiPobBcJdhp/IHUDymI9e7DSFr3rdtPjHxOAAu+ZxlWo0ve5NbfnJ4b7Kivj4qh7NIIFqCsspwfPV5wCySiDXw8KxjnqMwGbGsKZRfukVFhQrNBtSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772445; c=relaxed/simple;
	bh=pC6EqmS+EnGYe8Q5IuSOWCmBS0Js0/5aG8PXRBQ4GlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qERPlubpzHHO2voEuFiCkypGQYxsQTqLjnXCF+6o6siCm2Cvu9o8Ei/CHiLQUGIS54anjLssF5VwBd6o8aOQI10Y0zasS2kjKgaUH9m/IhoKohb/g1eVY8p0R1J0/QjGmZIp+gjJ8UadEKvdyEOpL6Cd2vCfS71Xky/WZlM9oRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eacAcz6d; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd263bf42so2228734e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:27:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769772442; cv=none;
        d=google.com; s=arc-20240605;
        b=aPwlGX9HR35oaldAfKxT5mf5+bO/PDUDYGWmIs6HrksKnmKujhwMUwoLC/mBMAlOPS
         Im9Ly4a8TyiPooWgE6Diyz/aG2FbIFIgdDO24/7iK3fbOLFa52/JE3ymoOblXBIzP2RW
         j4bw9/w1fImMCWVI3hRH3VGFWK00w+4PWBbc3gddmFnO3gp/1OBxY6Zxyf4bl4Fq6Ke7
         EBH/scvuuVhLYRFRsnys2MuG180crpzZWJTf+5olLCw4r8NyiIEKWQokeasPOdu/YMj0
         ZZgMItefvxRg8aat5rv2urIoBzX7LrZFW/ZmA+hOwQ+WDOMIM+3YcTm8VwWM/KXRic3W
         MY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CTJuqQRZKV7ijK4EJjSamZFAm+pamffo2mFKEbOeye0=;
        fh=lyINexTYpIt7hoMh0T51CD7Ivo7ny7haw+NKwVmkDFM=;
        b=jgf0SI7FicSOJDyjEDxOKYRjg+oobTcNTuIeFqB9DUGmOhN+7O7BHwWlo4ogR1G9F3
         KYlkkiEBMabM7nFlZjastxvZi0bZDeaKgYtOSSSltiuWiRhPQpc8G6T1JT+XZaHEXbBk
         liHy5fNh7tv0mQUIAi5JSK+XNxRm3OqGK39H0Gw2B5KYDNjGGzs6x8JlXNNFzloGR/fk
         bQWYNTXVPN8Loua1XPTNUkotM5VdOvqsnVDJR/UWUEuNlq4TGDDpuiH3x4hh2UGFu+Bg
         gwZQYcjmcHv+YSjZoMlOLw8l6LUA6MJV+Ma8d1OOUSjyZgoaerqxYqUjW3xvFThM6/Hf
         m44Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769772442; x=1770377242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTJuqQRZKV7ijK4EJjSamZFAm+pamffo2mFKEbOeye0=;
        b=eacAcz6d5BiANL3HwUEFCEohpNeH5wEOJEJIPHVDsPSOtDh0XIn8arSwO1/AtKuXqE
         GmeIlTilKWKtFaC26Q4aq3vu2ysEZUt+zrHTK9jjXGtiZHw2kF1E0exK9mpziEpvU8yh
         8EWtKQicCCBPALi/wDsPxHI5H2nTuZAd3eqR6B6Y1c7raanZHLiMIfQ/yvKkuZYjS5KX
         OXnEBYUbJHZ5EuNxVV8ace6tagsUDtCmXPvxbtDM654SRpSY42+X3a6wsb/NGJqTWEUo
         WhnVW+Si6499mU0jJDT9f9bSWSscEYSLsQ9WfzLidFtcmpUcuZfrSV/DgJHgSa0/5WY5
         oPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772442; x=1770377242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTJuqQRZKV7ijK4EJjSamZFAm+pamffo2mFKEbOeye0=;
        b=Iw9XUbz1QqVtWwRkKHb+B/zEsyv/uxvR5v0eZd+rY+naTiEQJDveShESOWI4Hb1h1D
         1zrWZcIT0yXw7nx82k3erhsq+n3LHiP46/nHqV7tnQVWF3N2TEzqrPw+rM2Jn8OheZjp
         ouZPbCypG+BOaaGiExa7QT0QZZ/V+EQPwiw5mjuOsoYPb5nleMPIY4qyfetSfToswOKm
         wsjdBQ26RYhpx5S9LAYiaKTlDXvq+HxyYF1r8G/Q1GPj8WgFjpy0ynTvafsGCq0sgm1W
         vI0LyLlWQ6LDs90TxmrbGsVH7kPs3FSckvr1TU8Gi3l0Q84H77/Z00Is5dgELDvLl1Ao
         N+sw==
X-Forwarded-Encrypted: i=1; AJvYcCXPkbRSfNVACuV8N58iZ9pro/yK3TD66uLlyztbJXtV81TBnM7OEjNf+sFp1Jl1yDHdtAyozWeXUwbJE6UY@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwtf+R1p0lQH1NE09pix+e1hTxLoiXYWTUM3uU1Niy3IesxK4
	9FI9kx5kgsPWyjUcCTGu67kh7TE/mz34RfTmqt8g4vIpjjyaNlUtj9+7ZE859JUViD4kRwkquap
	2b3au76r46vMjvd50dg9ozGfQTpE+2MoQw9PbB7duwQ==
X-Gm-Gg: AZuq6aLwNe1IGYhOn0FalErJDTCTySSz3CqIMIhz8Ztv6Bj7K9sefzTrfut4X0qyV1M
	PmJ2ANrToxBQURFUE07jR9ZuKS6KzAoKzwJc4MfDw249kdpLVwoeStlHB1A55IPnov7oWQEdY3J
	DydqUVgNfyv/jaFTVMOvV5Ks22Ltb2QL+ZJwTonCidcfz6EtZWHTx9kob7yLMAcD+vyY9Bp7nWq
	RDp0r+LMglbRMOGryV74XposUB0m0b/bVcn1G9tbzwgYdVnQTKdMFREN9ZiAT4en9uk1Xw7T1MP
	XRkHe0k=
X-Received: by 2002:a05:6512:1105:b0:59d:e714:fece with SMTP id
 2adb3069b0e04-59e164051d2mr838308e87.24.1769772441507; Fri, 30 Jan 2026
 03:27:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-rework-rpmhpd-rpmpd-v2-0-a5ec4028129f@oss.qualcomm.com> <CAPDyKFpCZyseq2XiQLfL+zHWjYZpS-4Wo56=W5AkBpdhajJxrQ@mail.gmail.com>
In-Reply-To: <CAPDyKFpCZyseq2XiQLfL+zHWjYZpS-4Wo56=W5AkBpdhajJxrQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 Jan 2026 12:26:45 +0100
X-Gm-Features: AZwV_Qho2KSeqV-UA771mqMAbX-CoeazXpNaSx_w79F053JQdWzkRlNIUDFeZ6I
Message-ID: <CAPDyKFpSgRkc_cPnX9uTfxB_xrOc6=gjy0+OaQr-outr_eeX8Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pmdomain: qcom: sort out RPM power domain indices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91288-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A04DEBA10E
X-Rspamd-Action: no action

On Thu, 11 Dec 2025 at 12:41, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 11 Dec 2025 at 02:52, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > - Switch platforms to using bindings for RPM power domains controller
> >   where compatible
> >
> > - Drop now-unused binding indices for RPM platforms.
> >
> > Two last patch depend on first two patches and either should be merged
> > through the same tee, should be merged with the help of the immutable
> > branch or just merged in the next release.
>
> As soon as a couple of related changes [1] that are taken care of by
> Bjorn, has reached an 6.19-rc[n], I can pick the complete series and
> share it via an immutable branch. Let me know if you prefer another
> route.
>
> Kind regards
> Uffe

FYI, this one didn't make it for v7.0, please make a re-submit after
the merge window.

Kind regards
Uffe

>
> [1]
> https://lore.kernel.org/all/176499396490.224243.15580177530806530343.b4-ty@kernel.org/
>
>
>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Rebased on linux-next, dropping merged patches.
> > - Split RPMh bindings patch to separate series.
> > - Link to v1: https://lore.kernel.org/r/20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com
> >
> > ---
> > Dmitry Baryshkov (3):
> >       arm64: dts: qcom: dts: switch to RPMPD_* indices
> >       ARM: dts: qcom: dts: switch to RPMPD_* indices
> >       dt-bindings: power: qcom-rpmpd: drop compatibility defines
> >
> >  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi |  4 +-
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi    |  8 +--
> >  arch/arm64/boot/dts/qcom/msm8917.dtsi    | 10 ++--
> >  arch/arm64/boot/dts/qcom/msm8937.dtsi    | 12 ++---
> >  arch/arm64/boot/dts/qcom/msm8976.dtsi    |  4 +-
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi    | 16 +++---
> >  arch/arm64/boot/dts/qcom/sdm630.dtsi     | 16 +++---
> >  arch/arm64/boot/dts/qcom/sdm660.dtsi     |  2 +-
> >  arch/arm64/boot/dts/qcom/sm6125.dtsi     | 12 ++---
> >  include/dt-bindings/power/qcom-rpmpd.h   | 88 --------------------------------
> >  10 files changed, 42 insertions(+), 130 deletions(-)
> > ---
> > base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> > change-id: 20250717-rework-rpmhpd-rpmpd-13352a10cbd5
> >
> > Best regards,
> > --
> > With best wishes
> > Dmitry
> >

