Return-Path: <linux-arm-msm+bounces-84012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB3C989CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 541773414F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E380E338598;
	Mon,  1 Dec 2025 17:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEOG26r8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66E338582
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764611607; cv=none; b=HHXhZ4AcR16hGa0c9WPDLUg/WE+XJLpMdNHK7Bz9IRR78KWNS7U9qkv7pkapsXnmJnmvULAVQQBt0yx03EK8dFJK5JSNud0+DH53OeeNW6rcfv2Jf4f2HMTH9kxb09XkEQlyO3WmHWE9w8w/zrh72xfPNaM9cBOR6XrZVoeCBUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764611607; c=relaxed/simple;
	bh=wOcUSoHw4L8yWr2TYz61CvWjoUMQxzmV5HexGHkE1/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2JfjkOuIPQD8KrmFfNZL3Rf0qoKOJ/U9Ukkj5qEJF6MngsoBRz/c9OWJHMiB/Rm2WzwyW5fhIyQmGpSpqycC2JixLQPgpEO9wgzwV9Egt+kg0nFXhquAL5nCYrMd0/BobwQnIJdfwohFdLt7qFPQziN/DdtN1n5crdb9n/UIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEOG26r8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E253C4AF09
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764611607;
	bh=wOcUSoHw4L8yWr2TYz61CvWjoUMQxzmV5HexGHkE1/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LEOG26r8+Ev4KCNxLNymIar0rt4RYZsf9aHnUBOh84fAZru+OKPJmIvYq2s7sLsrv
	 OLLEdcMeocBEK0JJ4CPqHcb4/7+kJOPzfS3OCGBOqOM4oAlHsouv6t7cqnwwHuApUY
	 yONr+tzbXFY+RmNpZQC1Ym81z2UDoVNfRqKWDIBBK7AwQa7KLHOVH/fXL3d3f/lRZs
	 sGH7lYfisxctnChQKILSS/3Jq9Lg/CJEvQpZSNUvg/vFWrwWQM7a3GoJ48vaReYfsP
	 dLEnv3DxHjsAY2TTdz+L8BNENgMK9XKT3in+TNYSAGmIwYdERBSFJFjtk3o7+3IFcf
	 VYvyQcRE9x8qA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959187c5a9so4038123e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:53:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0bQIOHuphHNFik7mZvvs9oQAuClrRYlblxTeFQJ7ZicD2uGi3EUySRZv9Y/06O8maTi/bVITUIqJJ2VA7@vger.kernel.org
X-Gm-Message-State: AOJu0YyK/pHo9oiZBFC/p7RCGx1hjOikuz5vbNWG2bVr81XSdjYV4/bT
	sMick7DRwmIL5u05GHWIMUP4WuP+z6sXY/ULFCKY14yN087RKQRh/mClEx/EDWP6z767T05f1wo
	lb+Vw13g68V+LP5gxyPVwfdOKCpKSGbup+l+pcvGEoQ==
X-Google-Smtp-Source: AGHT+IEsW4EO0KohCB67WRAVME17tU1t2/mw3bZxnnekDPsTNjDwb71ZLUXKANnkV+uYyxN1Aqe4aqeXWFAo+YPM4KQ=
X-Received: by 2002:a05:6512:104e:b0:595:9152:b93b with SMTP id
 2adb3069b0e04-596a3e63731mr12810420e87.0.1764611606183; Mon, 01 Dec 2025
 09:53:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
 <20251130-next-15nov_expose_sysfs-v20-2-18c80f8248dd@oss.qualcomm.com>
 <CAMRc=MeUoFhmxcxsvboKx1E3KCsqkd081d8e9PypuYCCiL1XFw@mail.gmail.com> <4f8f9217-f6d1-1321-c2be-5ee1dd807eca@oss.qualcomm.com>
In-Reply-To: <4f8f9217-f6d1-1321-c2be-5ee1dd807eca@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 1 Dec 2025 18:53:14 +0100
X-Gmail-Original-Message-ID: <CAMRc=MegAtTRvrxXRc1uQLn2F2-DMip-aFwz-q1JbOkny_8dWg@mail.gmail.com>
X-Gm-Features: AWmQ_bmBI4MDfuoty_jfxTgdkVGtoLxRv-hhIkt-aXHMqaSSJQpIt4QFgkazSKg
Message-ID: <CAMRc=MegAtTRvrxXRc1uQLn2F2-DMip-aFwz-q1JbOkny_8dWg@mail.gmail.com>
Subject: Re: [PATCH v20 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bartosz Golaszewski <bgolasze@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 6:43=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >> @@ -132,9 +186,13 @@ int reboot_mode_unregister(struct reboot_mode_dri=
ver *reboot)
> >>         struct mode_info *info;
> >>
> >>         unregister_reboot_notifier(&reboot->reboot_notifier);
> >> +       if (device_is_registered(&reboot->reboot_mode_device))
> >> +               device_unregister(&reboot->reboot_mode_device);
> >
> > If you bail out of reboot_mode_register_device(), you don't need the
> > above check anymore because the device could
>
> We wanted to continue on failure, as per reviews.
>

You're probably referring to this bit:

--
On that note, I would argue that aborting the registration of
reboot-modes, just because we failed to create the convenient "debug"
interface, doesn't make sense. I think it would be better to just
continue even when create_reboot_mode_device() returns an error.
--

Anything in sysfs is not "debug". It if is, then it should go into
debugfs instead.

Trying to register a sysfs object with the same name will result in a
WARN() splat from sysfs core. I'd say we should definitely return an
error if sysfs registration fails and just make sure it can't by
assigning a unique name.

Bartosz

