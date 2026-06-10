Return-Path: <linux-arm-msm+bounces-112529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pmq8DMKcKWqlagMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:20:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FFE66BEE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 19:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NA35RWAo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112529-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112529-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41A9631A8E7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 17:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D903B34750D;
	Wed, 10 Jun 2026 17:14:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE66346E7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 17:14:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781111699; cv=pass; b=VtJZg1SsuIo3h7gKj0JOZcgK0LhGmACR9In/ws1GL9eVZbUkXBkSJuPKDVPvaUK57aHSwpt/0581RdnQ7A/+H62r1bScu3OEBtV7cZEoGTVnbMIwF6Ugiqb0VYolZbf/3q3lJo2Lzr6fnvBRPHQBuXpJ903SEYt+7j3+XcFx+bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781111699; c=relaxed/simple;
	bh=Nvoc8y9Lk0r+Y/cgK6sK4+VybP8K1p7HAr2P3bKQpF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmhyQxFW+ioCvaZutKLKjWhEQiLWxn/puYBmDcwr60a+DyveV1bOFkwo0vhoE4YHSx+FUJwvIV+MakF+ESfGuskSwxagxeTqB1TpAeBK+miW3Ai53I61FJHjy7MtRBhJ2JN9rWyFsAiMAI21n/uPLd7qr4WBcGJZ7gMKQR1vyv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA35RWAo; arc=pass smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f1d8902so3071762b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781111698; cv=none;
        d=google.com; s=arc-20240605;
        b=k36+p92xBdTezd1jQnqvYOgTtlAEJu9phiA7AwCe+o5M+fvYvC9AZIp/ywcRnxgr1N
         Y/gKQJJQQ7bThp67ILD0kkhIqNiehd3esvMe/5/TRkA6yAfHD4QoGGVyMx8BxMFMxBX6
         xTZpt6+tCE1XLFjJI+byoefQW9/eJD2BRoeKEL9T58NxxMluvrIuSCOWD0FjmCjEMMV3
         2QIFB8MtNY8tlE7mrlsjKYZHE6TzgPEYNLqnIu77s5azen5uBM1ifd7Z3xsXVZRs0qHU
         6laqb+mCVGLrjyINCAZtJvpq5jEWlwTGhKIiyGP1t5FiwFRvN/eEa0IBhSkZxuJLXU3M
         RfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nvoc8y9Lk0r+Y/cgK6sK4+VybP8K1p7HAr2P3bKQpF8=;
        fh=SPgPB+vbWQbF8q35I9/sBm1qJxPrvOiTUChwbQuGHqI=;
        b=XijQtJMGLq3HeLnAQKwAxGc1DEgM0J/0HZ4DXuaXkH3RsfIws7jQEk4d1wlAssNFT9
         /kPddaf9CfoOUnWWeYrHT29uUUfxvQwXRYfBBlRiF8XIkfByga5BfKgFY+/+TVRZrAde
         9dMv+EGnjNc/tLiW44fwVQvOGA8sF7GhLv3JE7pAyJBROzBQMIER3axg1CjyopKqJ7oy
         5T9VA2ObqpEMZGItgepD8/8Z6iWureRGlBUEB7Zp+cSTvd5fpZc1z3OEDYPEa+BKirVQ
         jirJpueP72E3MnGufxniQP8eInUjtN3san39BwnXISFuQT9UHBYuMQenWRgB3flGrgsN
         IgEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781111698; x=1781716498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nvoc8y9Lk0r+Y/cgK6sK4+VybP8K1p7HAr2P3bKQpF8=;
        b=NA35RWAowaTuEXRaC7KWWnxvFvWlrYy7CCNCBWbeazT0e2uCof5b1LGi87ngYji3Mc
         CIPSC/6+1ZTbPz251J6SflNkOs44f0yQOFCmGqUyunEBwoZQToB+3C5UoUwIg0OSD9Pf
         U4xrMySq62WznzL/BfM1giq9D6yxfB+fwvOmxUWLaygHDzdoKonRXSpjso5NxZEp81Qn
         mZKSheD375W65NQggsok5POQv7qOU5SJGcI7WBPMdHgsksX06iR4e3vXsXRcOZklYRHI
         OsRkA+xOGX1fw4iEKOTrwJS+XEy2WL4H54zHltJPCqCVY2Uv2xSukJPo1DdfbkTvaWw+
         ypAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111698; x=1781716498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nvoc8y9Lk0r+Y/cgK6sK4+VybP8K1p7HAr2P3bKQpF8=;
        b=clwOWfV6whiO70Cd4+qhAOv3+GjMQJjFfLIFlPVdX2Kq2iKXPPjGjxsB861FPSTHpe
         eHD8l9zxGSPKKzhsBVu3A8GsS0M40/t0y4s3bENDJPlO7YQuzASKU/nQJtCIFqhekJ6w
         sNUMb0O+DNbSWA710Tw9TV/coAIV4OjybhZZJ21Jfd2l5W4N+g9EFF1vViiVg4h+Nmqq
         DxOlU/qhy50oLZMl/Zh7TpaQWp21ywUYZpRB+KKhzIyO8GbJdPBMErwaCUjqqXgp9jUY
         787i7jjE5fPTC9RtYdS5wntLIU2uGgLuaAY807m6u3X0mBGYZyfsSYJuljJZVGBtenNS
         wLaw==
X-Forwarded-Encrypted: i=1; AFNElJ9OQMeMZaMMecjtQ+TqAAJSoxwCQxnjJkyGkZuJ4M8Wvm7nvTjKmnTAxpu6la0fcbZu3RS/MsmtPJEvmZUi@vger.kernel.org
X-Gm-Message-State: AOJu0YxgQ1aZxQ2MM3fsqdJrcw2V6qPVR5ew81Co32qzCkGhZXljKC/y
	XzcvHXeQi3i24DWMt2alCPiETWpckEjC6fIsCW7rrpIKmpkFQcLOGKqZFSTgfQFicGZiIgxDU6E
	7PmecgS+sOarvsSqSSfs4Jz04kROi31N9QcLJPso=
X-Gm-Gg: Acq92OEUkJanxhXldlbSm5jyGFNsnVrZawgp3s0YR/lAoE4PTJ2/JBeWh++o4Zy1bgG
	R4AMmIEs2ckx3JlU9Vb4uPmFmJZYH3+PUGwnIezdNCwtlxsCRXTCQzATJhUYdAJAdNXqdYmnwqm
	VnXDd7c+brNACUV3MQSgpFmVBQFl8fMNCn7iWgmL3L4LIPdtZAoVNRzY/cAydOeLNRm0TKf21Fs
	XMusreRl9jM5fO1CTU8h8f+5UTTaof6QVwm9z+3tSKqj64UJGVzFJJlrRfLxsjVyFzDqNDPILjS
	Ux8JskAr+OEnjVYycU8NW2G1IQ/6balWiojfmlRBi16KszRTbA==
X-Received: by 2002:a05:6a00:2e23:b0:842:66f3:c51c with SMTP id
 d2e1a72fcca58-842b0fb6c50mr26210822b3a.40.1781111697796; Wed, 10 Jun 2026
 10:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ+nLsRXTc=3LagGVdNiAPttL38tPVub_UOKuqJq91J9U0M+9w@mail.gmail.com>
 <806c1868-1c4c-4f53-a6ab-84b336fff7c0@packett.cool>
In-Reply-To: <806c1868-1c4c-4f53-a6ab-84b336fff7c0@packett.cool>
From: Carter <carterd1016@gmail.com>
Date: Wed, 10 Jun 2026 12:14:45 -0500
X-Gm-Features: AVVi8Ce_pqd_4RrI5jAQhTBKhH0W0Tt1eYiVn4hJbRju94hiUcioFaRw_R1M4Rc
Message-ID: <CAJ+nLsQOw4YPyRupo=6WK=7t2qPtHc+_FHOUENUzjC2Zu-KGOA@mail.gmail.com>
Subject: Re: spi: geni-qcom: any planned QSPI support?
To: Val Packett <val@packett.cool>
Cc: praveen.talari@oss.qualcomm.com, broonie@kernel.org, andi.shyti@kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:andi.shyti@kernel.org,m:linux-spi@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112529-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[carterd1016@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[carterd1016@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49FFE66BEE2

On Sat, Jun 6, 2026 at 11:58=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
> On 6/5/26 1:43 AM, Carter wrote:
> > I hope I've found myself in the correct location; I haven't ever
> > officially participated in kernel shenanigans. I've been working on
> > enabling the trackpad on a Surface Laptop 7 (x1e80100, "romulus"). The
> > touchpad is an HID-over-SPI device (with a driver patched from
> > https://lore.kernel.org/all/20260402-send-upstream-v3-0-6091c458d357@ch=
romium.org/)
> > hanging off a GENI QUP serial engine (spi19 / qup2_se3), but it
> > requires QSPI transfers - the SE reports protocol 9 which is unknown
> > to the mainline spi-geni-qcom driver.
> >
> > I did find a patch for this driver online out of the linux-surface
> > community which may have even gotten it from another source. The patch
> > seems to work, however it is very low quality and I suspect it may
> > have been vibe-coded.
>
> This one, right?
>
> https://github.com/scuggo/x1e-nixos/blob/931cf9966ba3a213946329ce95b07635=
a34cd839/kernel/modules/qcom-qspi/spi-geni-qcom.patch
> https://github.com/scuggo/x1e-nixos/blob/931cf9966ba3a213946329ce95b07635=
a34cd839/kernel/modules/qcom-qspi/gpi.patch

Correct.

> I'm not sure what's "very low quality" about it tbh, and what are the
> tells to suspect it was vibe coded?

This is fair, it was a mistake to criticize so harshly. I have no real
grounds to call it vibe-coded beyond, well, my own vibes. I'll try to
be more specific below.

> > I wanted to ask: is there any active or planned
> > work to add a QSPI mode to qcom,geni-spi controllers? I was unable to
> > personally find any related patches or conversations on lore, but I
> > may not have been searching in the right places.
> >
> > If nothing exists, I'm happy to make an attempt myself. I worry about
> > getting in the way of more important matters as this would be my first
> > time submitting any patch work and I am bound to make mistakes, but I
> > will attempt it where that is welcome.
>
> I'd start with the existing series above, it looks almost ready for
> review to me?
>
> ~val

I think - and do bear in mind that I am new to this and provide no
authoritative feedback - it needs more work before it's ready for
review:

- It lacks devicetree binding documentation, which as I understand is
required for changes there.
- There are some areas that read more as guesses. The clearest is the
`msleep(10)` commented "without this the first command can hang."
Without QSPI docs I can't tell if that's a real settling requirement
or just what happened to work.
- Minor and more a personal preference: several comments restate what
the code already says.

That said, the patches do work, so if you consider them close, you may
well be right.

I do worry about the authorship and copyright aspects: as I understand
it, a patch to GPL code isn't automatically GPL itself, and
attribution is a separate matter. The only copy I can trace is in
scuggo's repo, but I can't confirm if it truly originated there.

