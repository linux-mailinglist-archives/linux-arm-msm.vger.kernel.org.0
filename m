Return-Path: <linux-arm-msm+bounces-109908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uA+GLyHbFWpzdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:40:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD75DAD53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7C0A301475C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF3C41C2FB;
	Tue, 26 May 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egJ1lzeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BB40DFD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817242; cv=pass; b=I1pYDA1h492PvU8eiXl8lEscYnVZjPN85WVoD7w7VHKt21x2ed3FMuhCaiLD4FlCbFDoNeG4Vf/BAIP4HNhDMX8IHKsz099S5IFpeA15vOosZebPSocyvBvbE82vmcYCB+QToDbDhcjbGd+/bBDzM7iFM9bgT1NmRETaB/MpJ6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817242; c=relaxed/simple;
	bh=K+HL82sdn8WpJwBs+rWv0fMtNuA2tpi9GtQEa2+Vvik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+QbsB/cxaIiOP8KMBB7crURQUKBjqdW0xpoQKwj9/61YSzazyo2ml4DU3CnYgxp/48vDBzBbdKKsFKAeO0+CxRV9fWiCuf/04kPMIXgBV7LWVfgB1apNI0J66w3f+rc1VPHxpKGukzPafUaNcS02WjEV2eSjovXc3/mGpAxLXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egJ1lzeo; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-956948531a1so2866995241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817239; cv=none;
        d=google.com; s=arc-20240605;
        b=UgYSjhB2tnNrtHKTgbjTnrW9/Kvo7xPwT6rhOdZcZ+tzTJsovrbD6VwUFQGHwXy07p
         vXUYbx7TmJRQ+9OxWjo+2lKRzKr6Pk6IMJ7YcyVDLmnqETIKdoY8oV0taCP/UA5GitVl
         5p4tPpCOywul1hgpE3xH8WwCguhO5SoBDh0yEhsxbLNlQRblBAXsZApzmOF7zUc18frh
         mlR8P/ScEb4glVlBQ1VFpqpMDkh+DdTrMtAN8WRA1CDd/zyGHDvnQzmcQJDxt57KBWM2
         rGjAbZ2RBZa+qHedCWPAnD/YZq4dge3sUoxvk0WQ8x3SMA+PT6rjTMM9Pyjm4xmDZy+W
         uh1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        fh=xEmqCf08GgeG522ucE70jRwVJyHMjbFlYk3LW0Ocv6E=;
        b=DajEtuOyi1RTEht/1JzNh3n4ckMqj1nb7zIjK9h7uKwRyL81+fXh+ofCHXWjNGivFo
         ee2Zyv3GoyDg/Rz8dC4mYYE33LxigyaGbp9zPUfp3GZrXaHb164vbm8qfT4kfu6C+DKK
         tjIViR/EU79fMBTX5x/wikiHJMy5lrJrTUHYpfD1DymfjMltLQT3dDRrlX6PamXT/EQl
         4UbjkK5iZcjb0240VR9a1zstFOJ2Q9sCIIZpunlszMWAM2UilKTbjcqb4dvy2qeURHMx
         46aDsROIZwgmEoDtmM8QK3VH7XT22hcqLQ7csduA+eDIPOw9IklDgYfmOM6uzMUKYoMl
         CD8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817239; x=1780422039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        b=egJ1lzeoNWvx94uz2pPQUlvgZCVM8BuzuhO+mpRzrcyOsvtFCk6NF/wDV00pS0SkWU
         n9y7ZptvmqSC+43bkhqnMDwTEkyiuugVX6X4H5hYrHJ799WnMG4dC2tcRvl8eg3vCpa3
         7hjpJPmnjasmZGRPcWUy73RFT/Md66Hoitdn36PRc87hcsEstW9pKcFKG3h+aY0xdPb8
         FHP9vsflbF70+nsV6l6ekPof6kx3nuGYU+drdbicZWcs9a/+TSYtO18xrDg6EpnXEL7/
         liEdr1W8nmi29PgkvY9BPWb0XrSObXhHGtzanYgvZr6Z4N36a0139YzfunFqH1khi54C
         /90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817239; x=1780422039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sB+mjSu/pqVnN5kPDqiN9QaioGX3lZ6RIksWWTXTj0o=;
        b=NtuNaM3n4voBLoSFVwchHwLQ4ghzhjPVceY6fCluoEpEvrJ5MaGTlP3YEyciADfZm0
         dM6lemGnvLHBipCy1g/zhD5TuP9R6HkaklQc8xltRM3Fg16xCD3i4I9r2ehJlmOwwPzH
         6eiTDM1jovYFWcWVU2zJ7Hx5PIGr27G/KYDmbU/jwMuIEmNGt9Ea0RSWVyhBWEnJsGE2
         JHYFdFZ4ta9LgHy925Cg3AhDm6tPzVAQgkedddTzeo1q40s6Bkz7tHnCr3r1Jlm4YaD0
         jT30+Vgb9ryRsjm7LjC4Dv3LYHh8rqwFNStZ/9oNvZwZVpmAByM0325JQKaoQJqi2RTu
         ei6g==
X-Forwarded-Encrypted: i=1; AFNElJ/7NIAgs9GPRMYzILJK/Wz15YfGdpHxscMZVB7diNFxi7kxukRTsSy2T2up4s/Bn976Qb7/xCMgs6Ijr8LQ@vger.kernel.org
X-Gm-Message-State: AOJu0YycgrvOoVbKHgCYP7wIv8SGhmQXKktS6scKP74ggDd+34qceJiH
	1UxVOA2Lag3Z4eUtb1uokFAdsKC1q6fJF9HLs+C57LLi0J+iY5JulnEdmHv0D2lquelvV9q9fiA
	LlP2cBHXxLF2PK57OgLfXEDCGg1Mw3BY=
X-Gm-Gg: Acq92OGiLEBpa+hIzKUlXXNqCULH0isAfAfveoqoDr+8Jdh/P0ReRXhPF1MisEgA4JW
	PEX7VftkpQyD3JF4pmvyDi9tI+Y+1h1ybfnmzL+9pVqrgL108O7DRn5zIVn0Cn4TBp9BTRDtd9i
	tcX7JZ0GTI2WpD6l0Bijp5GFRh3w4wdp5dzNDow1fjBv2rnyFNfjrAcGW06Any6cxJzRDt0fG3E
	J1+sa81ER1bfxmYEpVP6Z4igRTsy+VeJjJwpYs8LUDQYQdflaX2EAiqlJk0EeM7iuYCPDaQ4alc
	cADl5jo=
X-Received: by 2002:a05:6102:3f86:b0:602:8c16:b24c with SMTP id
 ada2fe7eead31-67c7c0765aemr9185857137.19.1779817239074; Tue, 26 May 2026
 10:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
 <177818605997.73000.9692910497119100760.b4-ty@kernel.org> <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
In-Reply-To: <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Tue, 26 May 2026 20:40:27 +0300
X-Gm-Features: AVHnY4K0YHv_VhlqTQcjH1BYoi9vYxYTC8vhg9AZJCVfVLC71VCaUv3jbXuBfa8
Message-ID: <CAHuF_ZoirJ7PdLxQcY2NC-Gay6wv=m=eVZBDLFXrRYnszo8Wew@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI
 and M1906F9 display panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109908-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org,lists.sr.ht,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 68DD75DAD53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Bjorn, just a reminder about this, I don't want the wrong
compatible getting into a release

On Wed, 13 May 2026 at 15:09, Yedaya Katsman <yedaya.ka@gmail.com> wrote:
>
> On Thu, 7 May 2026 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> >
> > On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> > > This adds a driver to support the Samsung S6E8FCO DSI controller with the
> > > M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> > > generated using linux-mdss-dsi-panel-driver-generator[0].
> > >
> > > The mdss reset dependency makes the screen work more reliably.
> > >
> > > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
> >       commit: 493cb869874cd301c370adf9a3f9577942c4f0f1
>
> Thanks for applying, but notice that this is an old version, the last
> version is v7:
> https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
> The compatible string was fixed in v5, and other patches in the series
> were applied with the new version.
>
> The difference is in the compatible, 's6e8fc0' with a zero instead of an O.
>
> > Best regards,
> > --
> > Bjorn Andersson <andersson@kernel.org>

