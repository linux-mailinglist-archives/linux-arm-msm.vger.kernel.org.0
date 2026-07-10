Return-Path: <linux-arm-msm+bounces-118221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wT5oHkzBUGpU4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:54:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A655739493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:54:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="Ip/hqoeG";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 820E4300B9F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0391C3FB05C;
	Fri, 10 Jul 2026 09:54:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFFB3FB7E9
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:54:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677258; cv=none; b=GiwRR48Je7mj/eIjy6ZWI1eUxj+0VhjEqmZoLA71uwe1hVRvnjrjeSRYOpzXbwDg7jj3NgqZW1ppyjtc+2AwzyHXyx32jRfxBFLcF+zpqjFIlFaybGsvAy4b3TwFhG7AWnYYbxmHdX3m/WoXw9Hi72Ntn/O/qq3W4W39hfv/jTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677258; c=relaxed/simple;
	bh=v8P2Uf45mI/biqxnOxHWfgXQmu+JaXEwT05r7bGVu80=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sX73GxiJsnaNZxT0HXFCr33WWCXcPTnAXO3hR0/ftWQm6/j9imdPdVW7pnM6hOJAykero4l2LCgIx1HKyExsUZ7QJz3NQOqwUm6m/o5qvakspRnKu8Ms2So7hTFkeZt1PDdC9KpHk07ywMzZLe8ou7nUasNUBhq0FPX5VWiXVeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ip/hqoeG; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso405713f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783677252; x=1784282052; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v8P2Uf45mI/biqxnOxHWfgXQmu+JaXEwT05r7bGVu80=;
        b=Ip/hqoeGAr/myjEmeIAVuqq/vHDGOW82Jij0v9V7U9rEvPVd9xIOWYyooT6BVXBmQX
         oQtmGVl0uMY1ruyFgsmEHUkL4uUGHUyVEIfFDGOZQIlD95I00sEkYCvvLbsUVaCRcdE/
         21l9ux9MUb0iFF5oP9hKQH6roO+9UKLSfUNsGIWQFMT0Tc948Tjponv4UABojt2vCMnC
         gLTlIF36tLwLlPnNOmJ3i9z8rMMq3NEiQtkOpsuomare+m7yXnB+/mZ0F6cQEI72XISf
         Mm8Wpf/L6vFfce6tR71mQY2uUfqusyRMIGEgWKU19OdDbVQgTfvp33yjhc0PQ3Zo1D9L
         hSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677252; x=1784282052;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8P2Uf45mI/biqxnOxHWfgXQmu+JaXEwT05r7bGVu80=;
        b=ihf8tGUmmXd+E3+kfC+aJtC3HApiINOt5l7B4WDnBhkmb6KDbs7K5OGGC24v1mWla2
         KqNadojBtaiONP2YOJSJIJLGBN/+jhEvdHHLuHJykodET3vWJd2jt78lUj0wJuus1ZIH
         S7pXjoR6ve2RPYt5Tb/6DGmJyqYmdHZch95xUOXSMBsjWrgH5txtVXaRlx2auMnUgc8u
         l3BptdfNAV1/kIb/A/ASJeQsDsoQ7dI37zv2lNyRGJ2ROBoUfCDGoWrxjfa4ArBIljBF
         T5WlHxW2pStKF27/AbHMPK9m+RYUonVdJDspo7pCFRZu4a70jv/5H70HQR7FTgER7j/m
         DPFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrM1odXbLZDRQwCyd1R2tda+qobxDANYGG3JzOFEGRZYMuMMnhsILDavtse6AQAjSIR9gjzcKiQf8S9zv3o@vger.kernel.org
X-Gm-Message-State: AOJu0YyQSpWzF9VnprW99OhfDKvF8U14FCL0ZoG/hSwqL+2sx3tuxAOk
	UMpSV+7vx2BiXEjchn0/g/mFk3+Da9IKcTyMUU7mHnKauAcn3m2Ht/HJWqp5efrHi0M=
X-Gm-Gg: AfdE7cnDYTPP2B2suOJoGmbDnPQSSEoub/Jn75aks8eEM2mT7G4x84zVp8fGLnNIy7A
	1O6Pi6+iNBaC5t0gFGFFQC8EzHrb+vsW9m/TW+7ZvEI3/WJUUJela0MbJN2AzxHSW3H/9scBdB5
	hiW8uNL+2nKLUmUuY8fJ4PitrV2XAOyspT+ZyLOzBGIG+a29Qr8P7T5my76xqUdZ2ksuHawWbNi
	iIzJwsxe8jhP4L6O1WNmV8YLSVwIo06f4LFKkGtb/3jpMh6wKm0KLdUs0vCH0Il/H/k6MXsIkPR
	rdNAeDBh4BlT4KhwUEosZolHxgpmFK4gOdJRxqMiviE69Q7TrR10zcbMQ0BAsB0IMYXBG7lT+h8
	7tcXPV3YIP4iMLQZi13rgFVu/82g5o8iBF2eR4zfcE/9OcdMUaS9wUkvB9XvymnwKfbZOqwfsB9
	ZTM+GQ7pj+T4mGFDudoBl3ew6f
X-Received: by 2002:a05:6000:27d4:b0:47d:f441:5f93 with SMTP id ffacd0b85a97d-47df4416019mr6854730f8f.25.1783677252374;
        Fri, 10 Jul 2026 02:54:12 -0700 (PDT)
Received: from [192.168.219.26] ([212.129.74.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm55993210f8f.23.2026.07.10.02.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:54:12 -0700 (PDT)
Message-ID: <a4003ac352f382fa4ff329acdfa561eb06e77289.camel@linaro.org>
Subject: Re: [RFC] Significant Random I/O Performance Regression in Linux
 Kernel 6.18 (Up to 27.7%) Likely Caused by Commit 3c7ac40d7322
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: =?UTF-8?Q?=E5=AD=99=E9=AD=81?= "(Kui Sun)" <kui.sun@unisoc.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Bart Van Assche
 <bvanassche@acm.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "\"Martin K. Petersen\""	
 <martin.petersen@oracle.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam	 <mani@kernel.org>, "kernel-team@android.com"
 <kernel-team@android.com>,  "linux-samsung-soc@vger.kernel.org"	
 <linux-samsung-soc@vger.kernel.org>, "linux-scsi@vger.kernel.org"	
 <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"	
 <stable@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"	
 <linux-arm-msm@vger.kernel.org>, =?UTF-8?Q?=E5=BC=A0=E5=A6=82=E6=B3=89?=
 "(Rain Zhang)" <Rain.Zhang@unisoc.com>, "cixi.geng@linux.dev"
 <cixi.geng@linux.dev>,  =?UTF-8?Q?=E5=94=90=E6=9C=88=E6=9E=97?= "(Yuelin
 Tang)"	 <yuelin.tang@unisoc.com>, =?UTF-8?Q?=E9=99=88=E6=96=87=E8=B6=85?=
 "(Wenchao Chen)" <Wenchao.Chen@unisoc.com>
Date: Fri, 10 Jul 2026 10:54:19 +0100
In-Reply-To: <12a8417dc8644a71b9cb25c53c93805a@zeshmbx08.spreadtrum.com>
References: <12a8417dc8644a71b9cb25c53c93805a@zeshmbx08.spreadtrum.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118221-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kui.sun@unisoc.com,m:neil.armstrong@linaro.org,m:bvanassche@acm.org,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:peter.griffin@linaro.org,m:tudor.ambarus@linaro.org,m:willmcvicker@google.com,m:mani@kernel.org,m:kernel-team@android.com,m:linux-samsung-soc@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Rain.Zhang@unisoc.com,m:cixi.geng@linux.dev,m:yuelin.tang@unisoc.com,m:Wenchao.Chen@unisoc.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[linaro.org:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A655739493

Hi,

On Fri, 2026-07-10 at 07:17 +0000, =E5=AD=99=E9=AD=81 (Kui Sun) wrote:
> Dear Kernel Maintainers,
>=20
> During our upgrade from Linux kernel 5.15 to Linux kernel 6.18, we observ=
ed a significant performance regression in random I/O
> workloads=E2=80=94with a maximum degradation of 27.7%.

[...]

> This issue is particularly pronounced in single-threaded, small-block I/O=
 scenarios=E3=80=82
>=20
> To illustrate the impact, we conducted benchmark tests using AnTuTu on Un=
isoc T615 devices.
> The results are summarized below:

[...]


> Root Cause Identification
>=20
> Through investigation, we identified that upstream commit 3c7ac40d732232f=
ec0ba31d0a5e3cc9c112fc2e7, merged in April 2025, is likely
> responsible for this performance drop.
> After locally reverting this commit on kernel 6.18, performance fully rec=
overed:
>=20
> Table 4=EF=BC=9AMixed Random Read/Write Speed Scores=EF=BC=88After Revert=
=EF=BC=89
> Device=C2=A0 Kernel Version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Test1=C2=A0=C2=A0=
 Test2=C2=A0=C2=A0 Test3=C2=A0=C2=A0 Average
> T615=C2=A0=C2=A0=C2=A0 5.15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 18604=C2=A0=C2=A0 18314=C2=A0=C2=A0 17732=C2=A0=C2=A0 18216=
.67
> T615=C2=A0=C2=A0=C2=A0 6.18=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13372=C2=A0=C2=A0 13081=C2=A0=C2=
=A0 13081=C2=A0=C2=A0 13178.00=EF=BC=88=E2=86=9327.66%=EF=BC=89
> T615=C2=A0=C2=A0=C2=A0 6.18=EF=BC=88reverted 3c7ac40)=C2=A0 18314=C2=A0=
=C2=A0 18604=C2=A0=C2=A0 18604=C2=A0=C2=A0 18507.33
>=20

Thank you for your above analysis. Your numbers match up well with my own
observations at the time in
https://lore.kernel.org/all/88d31a258feb36425ad73d0323077972f85f8341.camel@=
linaro.org/

[...]

> Request and Recommendations
>=20
> Given the tangible impact on mobile user experience, we kindly request th=
e community to:
> 1.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Consider reverting commit 3c7ac40d732232=
fec0ba31d0a5e3cc9c112fc2e7, or
> 2.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Re-evaluate the proposed change in light=
 of its effect on low-concurrency I/O paths, as discussed here:
> https://lore.kernel.org/lkml/88d31a258feb36425ad73d0323077972f85f8341.cam=
el@linaro.org/

While originally I was trying to find a solution that doesn't regress exist=
ing
platforms and still works for the newly added platform, I can only second t=
he request
for revert, given how important UFS is for mobile.

Mani was also in favour of reverting:
https://lore.kernel.org/all/4enen7mopxtx4ijl5qyrd2gnxvv3kygtlnhxpr64egckpvk=
ja4@hjli25ndhxwc/


Cheers,
Andre'

