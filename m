Return-Path: <linux-arm-msm+bounces-92160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJZYBqCKiGliqwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 14:07:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A9108B47
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 14:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E80E300291C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 13:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E396B274B4A;
	Sun,  8 Feb 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0NUKINy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5359261388
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770556056; cv=pass; b=eoXV1oigIVcyuliaaU7VAtlJmVGwP8lLfRdiNn1rRQYw4nI3Y0bXCZzUJtR0zRax60beCYL8Bh/pDXpd+SnIxx03soxYcTHsNgL2GgA8YAIipzpllAkau5d8oNi5zfmwtHrsiZkXOSQLacnJwKtD9OIV9nTQip0LaAoAkxqSFgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770556056; c=relaxed/simple;
	bh=JEZSUGs6dtogoyDkkerCUuPGkbv4ffGcBn+1XzwKLDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKJoSq3FAKUKMLj8TxV1eCVLrkHED+/8GcU91VJQViWlEHkPYjAZDtZM/TZh9u7gahGYsikUE8g1Xbrh43GJYTBV5kKEyNZPwvTPo0O/jm2l83zyQqQWSmEhIBj3RFKxVBik+OgO87Q9KDiGoSfPK10OZ63K1DDHyuaEXuxpB1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0NUKINy; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35480b0827bso2163392a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 05:07:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770556056; cv=none;
        d=google.com; s=arc-20240605;
        b=hOPtcnaavsonB15bzd7j52/gV7w+JoxglBm3zUkRGgwKHXqu5PxMcv31sIoNQ+GKfw
         SHyYoSMpRh+PZ8qX52ayktM+lv8gvI3+MVuvKXHBl8MUDVNvoIJhBpRo072LsMJFCToQ
         ubNUiH3uLCjjA89BY1eBBgZLI5nRPTykEII4Fn+jc3t1KUsoj46yYemt08qpUwDIPI/K
         8EfTpXlQTatA1O4IzkrqEN+vXLkOmmWAei+CDjO2k0ECsf5pEE/z+5o6mBdq7xm9gYJW
         imoJAZ1cc5Cu7h6aYUmJzpwmtQ84JlzCvba7qbrr/rFux7rUXs/qyRSpHbrsQ+mxilpV
         nmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/R2MsgwI8PqFomROPzzWvoh8wrSW/x6lKChxsX/vvA0=;
        fh=rB7BWFXkQjFS5dzQBGWJDcLXC9kfxTIr+hRHVRtFpGo=;
        b=NCVY24ciwKXsFrm4KpaFcI84+gFCeZTzLMqcAkbg867gA8wYbGYWtYwXC/0g4gf8To
         xGCIsaxOZXEiUnNUf2KGvyUFewKmktygrTUOWJn+BWJkzI/6p3SM2A5V9bi8bUpc4p9r
         KsPqRCxt4O6PaqwlyZYPW6rJJ7xCkHg4WgOpQBWuTJRwnp07UoTdnL+1aja50jJeSE7x
         +Dalgw5oFUF1Hisg6dS7T28OkpOw1hbhjzHas/Ilt2qmNerC4VG8aBVYgzPv3X2RTtQG
         vZwwSsTEQJbXM8L3Erf4MHf99PRyCA3bwkn/DApxz9UCUKN55b/0rfwUlY2SU+/dJqtk
         x0RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770556056; x=1771160856; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R2MsgwI8PqFomROPzzWvoh8wrSW/x6lKChxsX/vvA0=;
        b=T0NUKINyEQTrjdqCzPibmJxhvCrUU6OyW2KjFwU72EYuP0MdyzZxv2ISVI1uT1+pfi
         cKN+SWd213MR7yYDweQmn+qfZLnMbLyGfLqlZT49IqxfiJYk7xjev5AVskR+QE/nwaGw
         02dh1rrGdnSnD/ubk38zKaIMAhie57dC3rqk0geSwLRv9ZxW4mXTy0zPo2ch+iIh9cF5
         weu7e8NoqJPgP1aoTzvglkWtwua0NRYF9612Pj7pphVkeqiNuOKNS+q+J3+dweyz794I
         plM6srmeT7oefcaW4+QW5ccDTGJpFnqSMw1F/L9VvGSpw+lKDFYGy7M/5Rb6zUxJ5Xs9
         GwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770556056; x=1771160856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/R2MsgwI8PqFomROPzzWvoh8wrSW/x6lKChxsX/vvA0=;
        b=xCxX2C1xC+EtdRfokN7IMcqB1YpjvP7zJLgAVdIZ8CEEv1yFgoaV71suKfNRp3iqzb
         ZbUBIhmpqqZnZveKZ4mEAvyG6CChN6Sfst5Psv1WtEZlyYngjeo/0HQk4fxhlB5j0s68
         kiE5hTOcAtcAwULJGQdHeYekl5hnd5Fgfn4Nngz3YkEY044XP7L1KBB1UkV/UtpRTYt+
         mGMZYoEBIe1HcIeraFsNWraKb4ZPfzZ0NU+slgRr1OuAJOAag8qreJQaiD0zCaaNGl5X
         4voeCh+/Mla/WfuTfcFe+JBZGwwiR3Ha3Gggbwg/G0ix29hBX9TZyFynf5vkmC7daoIf
         5p5A==
X-Forwarded-Encrypted: i=1; AJvYcCUlq7NjNFMEhXsXWyJ82pQIU3i1Xw/n85+OVyrhNZrvdVor7gzA4moIbs/sff9/K1ZJdVUNdZIhDbgojfgH@vger.kernel.org
X-Gm-Message-State: AOJu0YwCiZ806TlBqCPPt2nN09u9HU+CcRJvudK9Fc+UQtunSVWVWGR8
	sdEDsICU6vy+VC30lOMxGRlB2VWGgNSAEoBylZlRrTP8clTV4i7XXw7YSkk+TMYVYVg7H5VVDho
	A80kBztlNQabzoVKJqeTfzsGVr0Jy5Gs=
X-Gm-Gg: AZuq6aIxUxnXBxlnQ3wicdgDj1yzRTB/7e+NTS6horJ346puCpvfBDcGAQd01GfL/7E
	0dK1VpPbbo17u+azsUA5G0AXIOT4WLeaQKCAiDAJ9Qd6NlNeS9rfe6GAkAYoFP9bINZLhxNx19q
	jRAAirHyQ1eOy5xMhW3/zcuXXn6D8z5OSG5nE+uss1M2DT1tfFoZyJmNwF4++jyGtx2u0iz6M8+
	JjcfHlW78jvObo4DFTIX1XqVDM2kulBjsZy0TwHG22FCFGlAV0wqHvJ9CydYeH/5F1JrDQfp5OG
	jQzyDw5qDNDD0zr0w8QqLxd/dEFP
X-Received: by 2002:a17:90b:510a:b0:34a:c671:50df with SMTP id
 98e67ed59e1d1-3549bc3bcd2mr10925655a91.17.1770556055853; Sun, 08 Feb 2026
 05:07:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127190211.14312-1-bjsaikiran@gmail.com> <20260127190211.14312-2-bjsaikiran@gmail.com>
 <20260129174829.GA1324020-robh@kernel.org> <355213ef-106c-4383-88e7-9b40f5b1c1ef@sirena.org.uk>
 <fa760b2f-4b8c-46d5-90b9-2ad9e69ebf04@oss.qualcomm.com> <20260203162005.ui7sl4t5m32jwas6@hu-kamalw-hyd.qualcomm.com>
 <7da1e3e3-18d7-45f8-9168-481ce8e4493c@sirena.org.uk> <20260206161952.ctmzghln5tkqzvn6@hu-kamalw-hyd.qualcomm.com>
In-Reply-To: <20260206161952.ctmzghln5tkqzvn6@hu-kamalw-hyd.qualcomm.com>
From: Saikiran B <bjsaikiran@gmail.com>
Date: Sun, 8 Feb 2026 18:37:24 +0530
X-Gm-Features: AZwV_QiS149joGC4BZb4ts57VcaO3JhacdnCnCjG3one66EpifBwh4UIkCciaxk
Message-ID: <CAAFDt1uiWq-adPtXiD+i1swavK_GS+SB__+46NN5jtwOopz9Lw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, lgirdwood@gmail.com, 
	andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92160-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 209A9108B47
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 9:50=E2=80=AFPM Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> On Tue, Feb 03, 2026 at 04:30:27PM +0000, Mark Brown wrote:
> > On Tue, Feb 03, 2026 at 09:50:05PM +0530, Kamal Wadhwa wrote:
> >
> > > But I'm wondering if this is really a 'slow discharge' issue, because=
 if the

Hi Kamal,

Thanks for checking the internal register defaults.

I can confirm it is definitely related to the power-cycling state. While I
haven't probed the pads, I validated this with two software tests:

1. The Always On Test: I modified the driver to keep the regulators
   permanently enabled (never turning off). In this state, the camera works
   100% of the time, even with rapid open/close cycles. This proves the
   crash is triggered specifically by the power-down event.

2. The Timing Threshold: Through iterative testing, I found that reopening
   the camera fails consistently if the off-time is <2.0s, but succeeds if
   the off-time is >2.3s. This 2.3s window matches the calculated RC time
   constant for a passive discharge on these rails.

If the Strong Pull Down were effectively active, the rails should drain in
milliseconds. The fact that it requires 2.3s suggests that on this unit,
the PD is either effectively disabled or too weak for the bulk capacitance
present.

As I mentioned to Mark, I have withdrawn this specific delay patch to
investigate if I can manually enforce Active Discharge (via direct RPMh
commands) to solve this at the source. But now, your note that these settin=
gs
might be locked is concerning.

> > > caps discharge slowly.. shouldn't the rails be turning back ON faster
> > > compared to when they are completely discharged (fast discharge case =
without
> > > bulk caps)?
> >
> > The issue is that some of the supplies fall to a level where they cause
> > disruption to the devices using them but not far enough to put them bac=
k
> > into a power on reset state, the device browns out somehow (I'm guessin=
g
> > some retained state is corrupted).  Ideally they'd have POR circuits
> > that handle this case well but apparently that's not the case.
>
> I have checked:
> - ALL the pm8010 regulators have the PD enabled in OFF state by default.
> - From kernel enable/disable of regulator PD settings is not allowed. Its=
 set
>   from the boot and stays as-is later.
>
> But since its already enabled with strong PD, i guess it would not be nee=
ded
> anyway.
>
> Regards,
> Kamal
>

Regards,
Saikiran

