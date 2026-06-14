Return-Path: <linux-arm-msm+bounces-113036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qFbDF2phLmpFuwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:08:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DED0B6809CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:08:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OkttIHHx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113036-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113036-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5895A30039B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24BA392C3A;
	Sun, 14 Jun 2026 08:08:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728DD175A9A
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:08:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424486; cv=pass; b=iDzaVSsE7NeiXC7uB70OktrzyqOEHOnBFIOGt7/ELTQpiFBlAa7H0kFjf20SWI9m4VCA5f45O4HqJ0bimsMZXRBplLzjLnwawM3heKPpn8ZGcxduu0cG+p6Ira+jaB0sJSKT9ROxuAhaRtQ74plR3nP4YwDs4nEj0LxCjQXCWBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424486; c=relaxed/simple;
	bh=hqstU4KzKDYHzuU5dQ6Scbjj6wb65fKWO7OtTkr8nUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDikRAjBwVDd5DS8AkZRZmIrGG3mgGIn9NI/dhZfJS78cwuW/LyYVUxgw4BtGMlpT+bSQIrpC6QTV08quAzecSNElyMySU+VArKynjPm0uwYlDCt+BNPqd7Dm021i3aP0Dho3XJn2O2ZbYi9bmdXN0VCjH4diIg0cXKTo3q6xbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkttIHHx; arc=pass smtp.client-ip=209.85.217.53
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6c6507549c3so2031642137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781424484; cv=none;
        d=google.com; s=arc-20240605;
        b=JaRFf8a8hnMsS4HZjVQgLyw165krd5lBkhas9rGASHCnBjxgiynMoJ793AN+0mxyxe
         c/12rOkqpHIjXvlBQWlheDQbzBU+2UqSg3pFi0POjqVOuTH2a1hfxN8iiaTWCe+ZiM05
         9jzSrjUB7UZn3lX3ke0K43m2vQvspzl7hlI7OzsjX3QF2f1eyl068eE1KAnaPZqXRgRb
         7Z4x0fD/fYp51QNZqnrVwma7uCZKs1UznYBFnl1R8ThHz/Zd9SMg0eW103O+JFC+zQTF
         v/iEdbbAKzQAbaJeGraE9lXMStLAKfGzpqyiEBM2YnRARwQee/LuKdfchjWnmAh8ajyj
         1wEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K73UO7yVmCGXyILrJ3NzGf0OVCEiV4xp/RjyNuNRMbQ=;
        fh=ZJpF3gNm8kw5Pb7X/O2K0MQaoUVSYWTci+DZvQ3S9Rc=;
        b=V6TMZzbqqNFAfzVDA1HEmZYGdPVuNdTcuWHxaUSDK1nRtalSVkDPDPTBjDE2fmP3SG
         rjAUq0f31u4OV+Hx/vqPBUE2VONYkutCTRuTnOORbdioetwr1ucNuVeKWyAMdJQ6SkwE
         gIty+n655oZeGgRHfkJvJgev7F5B9qWli5oYWml6YoGtFRDbT3UokS+fQMBcHOMbSyr3
         vKZnUGMH77qlNqn0UPT1snbWc70w22gEaSyG/LWUEU8xn5bnZ9JrdSKg01EVRLLgh0le
         CmWdW8sb9KIWDNbQ6/XnT+0AfSIxq1Zi3vB1B5UGRx3z9vogrmA9DHiw7DFG7RrMtCNz
         B3rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781424484; x=1782029284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K73UO7yVmCGXyILrJ3NzGf0OVCEiV4xp/RjyNuNRMbQ=;
        b=OkttIHHxSMMfh+9HqlHsi22ZgPg4OX6xUneh4E2wEslwg/CUhonfmhPazY7dvtXRPx
         zxJHmqt3VyUbGxS1WcW5LhmbN/gQyGqGwgQz5YppllrU8Do4NW1/PtVpOSm7C1UFYLqF
         gFlij2BADpZ93qE7NuBIyqTJoBjhFqmNbZ2JKQ649L+gpcpwsr2DAw7BrHpn0Y51xKSa
         yLJJ1faCJdehPMZmIt41iRPqDXIA53iM/fcqmIulUBOiKaLgrjYemFQOLyRbyE2a94jI
         ZyNsVclDcFpMQW9dgrDg+SRzxjFDxx0iURqjwgD0ojJC933OR4KyV0F/PU2QJUKU9Sp/
         PJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424484; x=1782029284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K73UO7yVmCGXyILrJ3NzGf0OVCEiV4xp/RjyNuNRMbQ=;
        b=SF1ocJEQMF/Cm44Pf1QPx5LDErFn+D16/0uTiK/u9hGtYT6mGdTgU/1IJslBo/P7mE
         d9TvqvL1K5985XiddtMotJR8gmBOUycU1lmIpX9lTeM4tPBykLOWI4L7t5lNVbBLb6j1
         0ZBbDvnH3RlF9KVkq+BLjtSIm4NXhMaV/aC4KYyDnelK1N9pooLGGMtFyYDChXK5ADLk
         qyslMxwvqk7Zyb5DnYqEPtMaVi9OfR02mWCJ8mLUteXpXo8SaR7WpLKLisHU9mgChrg5
         kgiI8fmjPF9M80CpauJ7iDxpRkiJoxOlSdBBttZMKnAMu1DFN861md6Ppj+Iag5feVyc
         mbyA==
X-Forwarded-Encrypted: i=1; AFNElJ/6UIy3XBzEJKRr3pQConDx3ZQ/XYeHiISjJr+rBfaKyZ99xGQJ1BlzFwnh3R+OsLrVuHML3sshHs8Qm1ga@vger.kernel.org
X-Gm-Message-State: AOJu0YxAIg2QHUiC2idJkMBeYq4gwaxKJQpIK1iACZvUMY8HbwZYFs+f
	t0lvDi/mDvx6qCrrz0lIncHBk3bh78Xi+E0xdbF1BbaAiP+H5LtVVOXWD48DEKiWRJw1Zq2uRAU
	FA6jpC8oxl/i49l2sfqH/+WVRforq0tQ=
X-Gm-Gg: Acq92OH4twNSIeHhyqIKbMmH2y/whlUML1CIhi4bNMxIEouFKkwfsXeGah0NoIX2O1E
	H4f0MiTgl7fAdrq/o4bDBvNcAMOoUFLoQ2GE+ZQjFoL2kLueDd/fyW6J5MAC90MZpQ2pRnFVOQD
	A4RScaPSls4j6yor+SAtBRDjJvlm4KVp1p+ZeZV76njPnjO6tdwTR4WW8vYnAHxOOFW+aOo7I3f
	mTEyO8GqyXjUFSJwDOXg2bVSTX5DInuURuhwGBMU9PQKGpDncZ5fzVVTejMTdfs71YlNOuhPi27
	GmCgsuMJ4NrDMzOf9iMnBHuF+n5hNktaH24rlQs=
X-Received: by 2002:a05:6102:3578:b0:6d0:a5a0:ba23 with SMTP id
 ada2fe7eead31-71e64bd44fcmr3173429137.3.1781424484414; Sun, 14 Jun 2026
 01:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4> <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4> <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4> <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com> <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
In-Reply-To: <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 14 Jun 2026 16:06:44 +0800
X-Gm-Features: AVVi8Cc396KgRR5IizLY6o5Eb_6OMt89_a8GwDneaOLTrmVdEvRxrlGjAy8TCxk
Message-ID: <CAH2e8h4nJ=BF3Eq7xPO+ndnOMQoXkGGG0Dc14ECEoGTGg_OSVw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-113036-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,pastebin.com:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DED0B6809CF

On Sun, Jun 7, 2026 at 4:49=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 21:51 +0800=EF=BC=8CPengyu Luo=E5=
=86=99=E9=81=93=EF=BC=9A
> > On Sat, Jun 6, 2026 at 9:21=E2=80=AFPM Icenowy Zheng
> > <zhengxingda@iscas.ac.cn> wrote:
> > >
> > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:46 +0800=EF=BC=8CPengyu Luo=
=E5=86=99=E9=81=93=EF=BC=9A
> > > > On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> > > > > =E5=9C=A8 2026-06-06=E5=85=AD=E7=9A=84 17:22 +0800=EF=BC=8CPengyu=
 Luo=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > > > > >
> > > > > > The magnetic keyboard (USB HID) can't be connected somehow,
> > > > > > others
> > > > > > are
> > > > > > fine, such as the spi touchscreen (not upstream yet), which
> > > > > > utilizes
> > > > > > DMA definitely. My config is here
> > > > > > https://pastebin.com/SdjuyJYk
> > > > >
> > > > > Is this a defconfig?
> > > > >
> > > >
> > > > Yes.
> > > >
> > > > > BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too
> > > > > for
> > > > > exhibiting the problem (because there should be "public" GPI
> > > > > DMA
> > > > > consumers to trigger the stuck/reset).
> > > > >
> > > >
> > > > Is this still necessary? I checked the fedora discussion and your
> > > > GPI
> > > > DMA fix. And GPI DMA is only for the QUP-supported peripherals as
> > > > the
> > > > binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
> > >
> > > The devicetree without this fix seems to be still incorrect,
> > > because
> > > with the device tree fix even if the GPI DMA driver misbehaves the
> > > system won't be stuck (although it will iterate all GPI channels
> > > and
> > > then fail to function at all).
> > >
> >
> > Back to the start. You said some GPI interfaces aren't available to
> > HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick test,
> > and spi6 consumed it, no stuck or reset. Could you give me a
> > unavailable channel?
>
> I think channel 0b10000 of gpi_dma2 could be an example?
>
> It seems that 4 channels are tried on gpi_dma2 before hang on my
> gaokun3, but as gaokun3 has no known serial access, it's possible that
> 0b100000 or 0b1000 is problematic.
>
> (The reason gpi_dma2 is checked first is because it's the GPI DMA
> controller with the smallest address)
>

Sad to say, I cannot test gpi_dma2, only the stylus is under qup2
(spi20) which consumes gpi_dma2, but it is unsupported. So I have
tested gpi_dma0 with BIT(3)/BIT(4)/BIT(5) as you mentioned. No crash.

```
cat /sys/kernel/debug/dmaengine/summary
dma0 (800000.dma-controller): number of channels: 24

dma1 (900000.dma-controller): number of channels: 2
dma1chan0    | 998000.spi:tx
dma1chan1    | 998000.spi:rx

dma2 (a00000.dma-controller): number of channels: 24
```
Best wishes,
Pengyu

