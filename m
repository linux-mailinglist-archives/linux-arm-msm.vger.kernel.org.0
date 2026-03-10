Return-Path: <linux-arm-msm+bounces-96665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKP9DKEisGlhgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:54:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B3882250FCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70A3531C4A95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3AE3822BC;
	Tue, 10 Mar 2026 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmakfBYR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86E84A35
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148604; cv=none; b=pJXzOXM/lM6V5tzb99lbnomWRf12oLGWpgzBCM2UOGqWH4uleMowpGv3ZHjOkeZIyUCivTbuvbKONH8zgkjt3ssmXXnxmyz/BM57gsyO8pDHS9eaSwFrzOTtAuvcyMe3ekgBKVPJV9FUIbjI3NMLq4oSD9wC6LVy5fdHLA9Eujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148604; c=relaxed/simple;
	bh=KoB46FfEreNzIXKYkRBsHB9bpvfPrYdBFafRK1zHlD0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOcFvlufhjtLSCZ/ZGbHUgu5OdLKyYKHadv73Y2GG655h/Fnh7JUCX11It+JJEx7HT+K66N6jzXRxEgM2HooFq+agB4IFaiy80KvUK55kkw7A8WIeIzgJKwEPu2+PteJFJ3zLzJ93FX3hAF2Z0q1QXQ4wNwXFBhyo43Er8IetRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmakfBYR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BAEC2BC86
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148604;
	bh=KoB46FfEreNzIXKYkRBsHB9bpvfPrYdBFafRK1zHlD0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=RmakfBYRe15zaIKA/rkUVISZw/OXDE4fkDQQBdyXF1zsRRK3XlguZLOidixULSbw5
	 ptQ9zA+3T2hL28MqxZ9t7rS4ueKVmJW7FcyOJSSmsGBNEU3rSZoAmp58xa9kknP8R8
	 JjJzq7tqPooByz2mrMiVe7mkEomPTLRNCX/CKYTQMEJ+AGKaYDr3mXjvjpm1Br4S+c
	 zPnCM56YYH2bzGPU7fKjAy/rkyO76glxnFhZh4WmrDQYUqs/aJfKFyxo0CPCCBLuEp
	 iuQXZqCqCyqHQsiznGg4U3n7Cplp64qMTCkHDTRrJ0xUiUTKJgap6l5I3o8m/GAW/M
	 odJ7nmlP/yNmg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a38ccc217so39626961fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:16:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZ2x4Qe/nwvXkiSLgzdEwVUzUdaO2HjBE9t04YPt0BlB+OBiKplMxpz2gJs62J6VetevqEW0hOiCY37u0S@vger.kernel.org
X-Gm-Message-State: AOJu0YwVTvM5E1yiVOYNvpjpb9xf/Y8Vn3u9tdMH7VA3OTo7jUOFX2J7
	c4PHAn2UEksv7MXIkgB2gAppz50Dpkz/e3UJf/mNDcW5YDkni1fRMJBgAW8PMiObx8qvfraL8St
	R6SYYalySXNJ9Th0wpv0ep0fSiuAoszYsc4TvZ/Gg7A==
X-Received: by 2002:a05:651c:2114:b0:38a:3ad8:6f32 with SMTP id
 38308e7fff4ca-38a40d9efb3mr54337311fa.30.1773148602807; Tue, 10 Mar 2026
 06:16:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 06:16:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 06:16:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh> <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh> <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com> <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
Date: Tue, 10 Mar 2026 06:16:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfxV+rBb5YGOObBZfoTcaSCbXAPjkaEUTpTD0qhLwrFnw@mail.gmail.com>
X-Gm-Features: AaiRm52yRpM3Fp2VDWrkX4ZaE9iRMXTSnxn0Svb8AF-kstJQXgU_P3bGrG8eWxw
Message-ID: <CAMRc=MfxV+rBb5YGOObBZfoTcaSCbXAPjkaEUTpTD0qhLwrFnw@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B3882250FCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96665-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 13:29:53 +0100, Bartosz Golaszewski <brgl@kernel.org> s=
aid:
>> > >
>> > > Shivendra: I rememeber there was an issue with using any proper
>> > > devices like platform or auxiliary with this but - as the series is
>> > > already at v20 - I can't find the actual discussion. Could you pleas=
e
>> > > describe what the issue with driver matching was?
>> >
>> > reboot-mode node is a property of psci which defines the reboot comman=
ds.=E2=80=8C As
>> > its not an actual device we wanted to avoid creating platform or aux d=
evice.
>> > few references here:
>> >
>> > https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoof=
pdio6cwe@innio7qvotye/
>> >
>> > Till v17, we were exposing an explicit of_node based registration in r=
eboot
>> > mode and then registering it from psci driver.
>> > Post this, Lorenzo suggested to move this outside of psci and use a fa=
ux
>> > device instead.
>>
>> As this is a "real" device that talks to hardware (i.e. you have a
>> firmware device representation), please do not use a faux device, that
>> is not what that interface is for.  Instead, as it is a firmware device,
>> just use a platform one as you already have a representation of it
>> somewhere in the system, right?
>
> While there is indeed a psci node on arm64 platforms, psci itself must
> be brought up very early - specifically in setup_arch() - so there's
> no platform device associated with it as the driver is called into
> before the driver core is initialized. It's just a function called for
> a specific compatible value.
>
> Now looking again at Shivendra's patch, the faux device in question is
> created from a device_initcall() which makes me think it's not needed
> very early. It can actually come up quite late. What I would suggest
> is to create a psci platform device (reusing the existing
> of_device_id) that would populate its child OF nodes in probe(), in
> this case: the reboot-mode driver, which could then also become a real
> platform device.
>

Actually, the cpuidle-psci-domain driver already binds to that node so it
would need something like:

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c
b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..f583156a6f41 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -165,6 +165,10 @@ static int psci_cpuidle_domain_probe(struct
platform_device *pdev)
	if (ret)
		goto remove_pd;

+       ret =3D devm_of_platform_populate(&pdev->dev);
+       if (ret)
+	       return ret;
+
	pr_info("Initialized CPU PM domain topology using %s mode\n",
		use_osi ? "OSI" : "PC");
	return 0;

Though that also depends on whether we can live with the fact that it can
be disabled in Kconfig.

Bartosz

