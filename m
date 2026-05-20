Return-Path: <linux-arm-msm+bounces-108617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPxmCB4dDWrZtQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 04:31:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 260ED586DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 04:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21C5A301EA9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 02:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EC130BBBF;
	Wed, 20 May 2026 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB9KLif2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF73093A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244311; cv=pass; b=p8jIZGCEH1b7G3WSr7xS0onyfjobzohRMBqYINII0wVCXn2alT3pkquAgW+NBSyeFwKN8C/KjLJ7LL7DBKJ+c0KXzmBdSv060xOt7RQlOtWOOzZV4jeE/ueCXygt2tiFOQKgbBOXgj5t8DWm82uxmsGJpXY69lrfKJ0uWc2AnvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244311; c=relaxed/simple;
	bh=1WPnCXVijfHC5H5f/Ma0Ogk8m5Y8rDwOElq+000H1SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ux7DAXqnPZ5/PLCpJQuoceD5+U3wp04TxAJ3gFaYsgo3fLkANwlFU3ywexkt0mUjtN25YlszVbuFWILYyUDAkmkeDvQe9xcyRqYbQSP0HtH/9TJkm1AEUkChqaGAnDSTcjmhk3hHY3WpgSSpJExtiUGoNov4889WZvC0rnUUjtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB9KLif2; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-65c21049dafso3787578d50.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 19:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779244309; cv=none;
        d=google.com; s=arc-20240605;
        b=lTEWvgVQQUgn/VjtmWf49AqyHH1wGOafuNq9vYL3vvTT6NWz4tfsZWLLcEG+6r5iL/
         L9EvNvV96YxkydebRW4r8A7UR+lD3IRHs4iMGDUvU7PBzgB7hCPXEsTQdHV308R62DSA
         0Cn77zQAcq85Y+Bn+bEqKKxbFRNufxNle64r6w/reecz3tykz5Fo458kfrhDknJnEijm
         XmMuV/N94p6bpuVTDtdHDA/sdtSVBrHFywtKySmERV5OhQ0T+E/vuK6dJpaoV2ifpCQ1
         Xg8srZWR/poWs/1NeRqb/CaapdCs2CpEs/Hz/9VGYcNzOBlAFxXyTSFztavZo7T4mcp3
         LL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qx5mfJbpIgRnw4qAKMbmotbNhbk+521TWh0CiXkM9ZY=;
        fh=S7JWTrj+E1d4j7tqm2L2MbAVi/0k0eXseRXt8UaMerw=;
        b=efBkGqBT5OTerHKnwcD6cRDCuof8OyB2A+PdJCblkrjhX3EafHHjjQeVHzg2Decw3+
         R+h7jbcf9qnMiCXvQPFvT/fYGqwC5NK8Gh/JFDrBujtUyqrycAB73FvutS8pEO4zeQX/
         OF/RFfeHWnltxeEQwEw4ZsBfycYani8WiKuaMl4kNtbiG1o6mCS4FmXTMqVabkN4V/ZP
         2J1IRUYb7urFefLU3Q/CbizrAuM92k5b6XotSxYsrGDOh/K/ZK64RbtCmA3iRv+CaILM
         ErASHFDJ/xjqkk6C3ksm3/4Rhy99vtDstSbp5G89m7IRfSRlbIFJtsfIFBHU7tXdRcqu
         uOOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779244309; x=1779849109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx5mfJbpIgRnw4qAKMbmotbNhbk+521TWh0CiXkM9ZY=;
        b=JB9KLif2kGm4EW2W/R6nWGFi1VbeEqTL37GWhbD+/+338PXGpJSxuWOeExzDlQU7Zw
         tXiR3RD/qFuVJw50cm+G1jM1j3Wa/bLGd7Brh4m04KSAtWbCX9//5VZZAXAAm9tlAGKV
         qQrFXUExE8omDTEx8DBa8Sqyf085+xfH6DIRjCQTQ9Lc83FmJtDL8dOcL5IvdBIGZz1s
         e4da4emvyqivK4rDwBd6rKsTPa//DRnnaGFAiogmGDTwADpBF8rFGfxZJ6BpPD46QJTt
         a78x+DZgpl+WOqPPF9yY6IBoPbtEAxAWGKqLr+Bh/4BaZGe6Ev0SKo7i1McE5yhgY00/
         Qmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779244309; x=1779849109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qx5mfJbpIgRnw4qAKMbmotbNhbk+521TWh0CiXkM9ZY=;
        b=kcvFhSHGRZhAT+XlT1M535xI2shu2hQLn0N73XNBVEsT8oGfeEO/df4uwZK0SdVUhm
         QB2ObAvjbswMWX2M4F8JVslfbLE0AEDH64p7H0vBKICVCZcxDjsuABX/LoM2y40AcxfX
         FgRZP62mMivNwXAyQDJcGP1oTXMs+alaRenCwyJmfcN6jyQapCeENVPQgfO3muf1NoIT
         rd9CRRbC4kfZHi1sg9QVu9KzsuXXrPoraMxtOWOQjhxevqyEwxASUMY10fSDD/ck9fwG
         tIy9Y3sw2D/k6Akdqk7Io2L64H2AzMbTgB3nYgDN4Xf7K8lQXlfqGm70H3hWmAgOg6CB
         C4Ew==
X-Forwarded-Encrypted: i=1; AFNElJ8KOb+glFBCS2umAOk4TaXwpRNWl98MyHVaYLJcWPJN1YsdtkNrIwdlSWaJ71NSXA1I+TIpBHolQSpb0uyQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmlyip7rAKB3JE1ztrqsaQXXqBPR0DVsi/MN4lvBJXcL0xTRME
	EPFRxAi7Rw5ikBLeaNFRuyvrm1MU4mO9/1ljafRl8kHzTgx7ejuASArRDPFpCv+F9HKufknrjJ1
	5YKhy5Knv1tZlHBkesqFQcBoxOtY8DKo=
X-Gm-Gg: Acq92OFmEXePW4YY/k2eG4yn2M8T2MyDoVPgneoDzAIYZDIRsGzeEjSlEfk/rGewsc0
	LE7E1zsz7hcP6Cw+pYDaBd2K3kHBLMOcyJesfVWMv9ni7okR1oA6bw8zgkqlNt38YsKXnOWhrhF
	k1swikmk1vUanqiKzHvVKCEsTdZyavYc7+PcI5/poXcCz3pQRWxtmbk3L8iPZmO7GChDWDm2WhN
	sPqiriILi3C+HTCkn7zdKTJHTf5oJRULgkQMVOlY349YVTzajuQFNiTqROiF8IIfdjbTvtbNf9A
	NbmtIAYB
X-Received: by 2002:a05:690e:169e:b0:650:36e6:2ace with SMTP id
 956f58d0204a3-65e227cffebmr22544599d50.31.1779244308690; Tue, 19 May 2026
 19:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
 <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org> <ZdheLnLujnIRGAGLFiz1lwSwxaUCArec6sbk_VkixDGjsuPYnMT4_YCSMTbwBWI5-b62G90Qia9lQ90pyFvjBA==@protonmail.internalid>
 <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com> <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org>
In-Reply-To: <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 10:31:33 +0800
X-Gm-Features: AVHnY4IKjQnljjpGsUQoQWZv1Y2n6uDHs4zZhfcFPqUV4dLPUHv3Pm8y929Ral4
Message-ID: <CANUHTR9OX4KC6djn=wdkwAhiB0zqFEHFu3jtJ-+LdixgbB-OUw@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-108617-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 260ED586DA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026 at 00:34, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 19/05/2026 15:58, Guangshuo Li wrote:
> > Hi Bryan,
> >
> > On Tue, 19 May 2026 at 21:20, Bryan O'Donoghue <bod@kernel.org> wrote:
> >>
> >> Yes I take your point.
> >>
> >> So what you are describing is an error in the software contract from
> >> video_register_device() - if we look throughout the usage of that
> >> function we see either the pattern we already have - not checking for
> >> NULL or checking for NULL - not the double free case you are addressin=
g.
> >>
> >> So really the fix - the place to litigate this is not in Venus or Iris
> >> but in video_register_device's cleanup path.
> >>
> >> ---
> >> bod
> >
> > Thanks, I agree.
> >
> > This should probably be handled in the video_register_device() failure
> > path rather than in each individual driver.
> >
> > I do not have a good idea yet for how to fix that cleanly in the v4l2
> > core. Do you have any suggestion?
>
> So if we look at how video_register_device() is used by drivers we have
> two different behaviours.
>
> 1. Trap the error and release the device
> 2. Trip the error - check for NULL and release the device
>
> Either way the _users_ of video_register_device() right now expect to
> have to call video_device_release().
>
> So... it seems to me video_register_device() also calling
> video_release() on some but not all of its error path is not the
> expected software contract.
>
> So I suggest two things.
>
> 1. Audit all users of video_register_device() and confirm the hypothesis
>     That is callers expect to own vdev and currently everybody tries
>     to clean it up.
>
> 2. If 1 is true then fix video_register_device() to not call
>     video_device_release()
>
> It either needs to be that or fully delegate ownership of vdev to
> video_device_register() _and_ update all of the callers.
>
> It may be that < 100% of callers if that is low single digits then
> worthwhile updating those drivers to match the new semantic.
>
> =E2=82=AC0.02
>
> ---
> bod

Thanks, I agree with your suggestion.

I initially considered that some callers might not follow this ownership
semantic, so I tried to fix the issues reported by my static analysis tool
driver by driver first.

I will audit the users of video_register_device() to check the common
caller expectation, and then look into fixing the core error path if that
is the right direction.

Thanks,
Guangshuo

