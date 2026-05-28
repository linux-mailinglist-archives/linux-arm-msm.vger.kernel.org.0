Return-Path: <linux-arm-msm+bounces-110117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOjjBPlAGGrfhwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:19:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF85F29F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A185C30547E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F383F1AAC;
	Thu, 28 May 2026 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiTh9UT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEACE3EDADA
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974008; cv=none; b=jTM/2VJcT3E7aKA2Hf/tOPoG5qSpduo282roGK6hecfYEOD8WMZ8eypo2m9rqTCUzvfdwTBAnI/6eLnyJqwMt8ChVs78Hi0c6uq6f7/jESwCbZ3smHaJyIhoQxBvSZuL8lmspPy3bDUSTXfmTtDrrkD30vJoxjUQxhReBMShHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974008; c=relaxed/simple;
	bh=mspoBZCTwb041Rjt8oeTx8IwYnHSbpHh6IFT1g7Opw4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoHE9nTdbUQke9QWGvTFQH87N78EOLtOgI9TMiB8K3TkwXt5axS4qEf9rR44S16659v93JZGTRq1oUPLgAuhTgkM7Ddx16iHI6sqsSTcTf5JDSnZY5IkERWm/aTzD7JZdgNE3sQh0JhQ0c+GwEbOZ1lAst4bY3w2tXScLgzNMRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiTh9UT7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6711F01558
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974007;
	bh=YYpeafvMhAx0qgEhbKf7QJbwzvvyekLX4+tpZsjO+/w=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=jiTh9UT76ucrnHoIIcGjrEgFVOoq/Gplzt/6ZT0GCZAcP6hYf26P9I/MIJIWEYi02
	 TFjLFmfJTq7tRzdS2MNdxsYmQhhrflyF0QIJVa6NcKEXPQ9CJNB+bKqDiKC4rQDkF/
	 egHGRL40QiPLA0JEglCVBpT9TtQSTDL8czczL2goDfalbmGjVO1DpSC6IG4k5fSaxs
	 6u3qFdbaTebDHJypUaNQp3dfmVhkh1DWU3B6/wfhnYLTjcDhUb7NsBgNWImB7Jzhqm
	 JoYm8ulAgxhACvXS+7QHRWlg/wh5qeGRKh965SiLNcpHkmF+jI9aBPtq5mnLshYVgN
	 nEdy1dgbxGJXg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so113218791fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/9A11vXtCi5cGWCHsijTxkRsCfYfdOa4VZQ2PK49yjpFWTcKGCyEZcZeTgDk91kP0Wi9IpSpIzY0UCfGAt@vger.kernel.org
X-Gm-Message-State: AOJu0YxcILdxcRGvBT2gCoFBCd8df9akOabt34Rp61DK+noj0YmS7K/f
	2by2Xjs3Q63yTU7A0yEHwY3xqDHGnjJwRLnhZ4HcaeKQgSwg7Y7fCxG2NhYoYDg7XdR3EO/d9wB
	jEwOD5dklxkyYORnVk2L6nLIIsmQrC4WRSCLNHaKoSA==
X-Received: by 2002:a05:651c:212a:b0:393:aea6:857e with SMTP id
 38308e7fff4ca-395d89085f4mr89644911fa.10.1779974006225; Thu, 28 May 2026
 06:13:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 09:13:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 May 2026 09:13:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260514194735.GA1939213@google.com> <d4d35e17-84fa-4c95-9bfb-abfd25ea7f4a@oss.qualcomm.com>
 <20260522024912.GC5937@quark> <c1697372-54ec-4f57-85d9-ad375ff1a44d@oss.qualcomm.com>
 <20260525142843.GA2018@quark> <e49c4a45-6455-47f3-a91f-c32c1a0b99be@oss.qualcomm.com>
Date: Thu, 28 May 2026 09:13:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
X-Gm-Features: AVHnY4LugvRYZll4BPMcuUQeZJsNVmlPyEMrJTl0DoRxI9a9LoB78G8ub57WLMA
Message-ID: <CAMRc=MfC6CEwOXYttsav3mwqyJ2F4sburBj+zNJ25qMoweyL-Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for qcrypto on shikra
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110117-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68EF85F29F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 13:54:51 +0200, Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> said:
>>> +Bartosz, Gaurav, Neeraj
>>>
>>> Hi Eric,
>>>
>>> GPCE is relevant in terms of providing hardware security.
>>> There are multiple usecases coming up for example to handle DRM/secure
>>> buffer usecases to improve overall throughput for secure content.
>>>
>>> Regarding performance, it's currently slower compared to arm CE but
>>> provides an edge by giving hardware security which is considered more
>>> secure.
>>>
>>> Btw, there's been performance improvement with new targets and we are
>>> expecting to achieve far more better performance with new SoCs family.
>>> Pakala:    GPCE - 550MBps, ARMv8 - 8GBps
>>> Kaanapali: GPCE - 3GBps,   ARMv8 - 10GBps
>>>
>>> Please note, there's almost 5x improvement in kaanapali compared to
>>> pakala. Though overall is still slower compared to arm but as mentioned,
>>> expecting better performance with hardware improvements as we progress.
>>>
>>> Also, currently qce driver exhibit stability issues and that's what we
>>> are putting effort in stabilizing the software on immediate basis.
>>>
>>> There's parallel effort ongoing by Bartosz to introduce baseline for
>>> secure buffer usecases.
>>> https://lore.kernel.org/lkml/20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com/
>>> There's active development ongoing and i believe lowering cra_priority
>>> for qce is fine as of now and can scale values once qce becomes
>>> performance efficient.
>>>
>>> Please share your thoughts. Thanks!
>>
>> ARMv8 Crypto Extensions are "hardware" as well, just in the CPU.  They
>> provide constant-time execution, for example.
>>
>> Granted, they don't protect from power analysis and electromagnetic
>> emanation attacks.  Does QCE actually provide those protections, though?
>
> QCE doesn't provide these protections currently.
> What i wanted to highlight was there are certain security usecases which
> are possible via dedicated crypto engine only and not via arm cpu.
>> Either way, it doesn't really matter in this case.  There are multiple
>> aspects to security, and before even considering these advanced
>> protections, the basics of security need to be absolutely solid.  That
>> is, the driver needs to always compute the crypto algorithms correctly,
>> and it needs to be completely robust when fuzzed by unprivileged
>> userspace (because it can accessed in that way).
>  > Yet, this driver "exhibits stability issues", fails the self-tests, and
>> doesn't even have exclusive access to the hardware!  These are all
>> security bugs.  That very much defeats the claimed point.  (Plus, due to
>> the performance issues no one wants to use it in Linux anyway.)
>
> Sure, we are analyzing self-tests failures and are committed to fix any
> hung/stability issue in any aspect but i do feel it should not be a
> blocker to add new soc id support.
>
> Also, could you please elaborate more on "exclusive access to hardware"?
> Do you mean the hardware can be accessed by multiple execution
> environment like TEE and Linux?
> --
> Regards
> Kuldeep
>
>

Eric: FYI I do plan - and have been allowed to by Qualcomm - to work on this
driver further to refactor and improve it. However, the BAM locking series[1]
needs to be queued first as it significantly changes the way the driver works.
Any help with reviewing and getting these patches merged is appreciated. I
don't want to start sending more patches before the 14 commit series gets queued
first.

Vinod: the series has been reviewed and tested. The NAND team at qualcomm is
telling me they're using it internally already to fix a race between the modem
firmware and linux. Can we get it queued for v7.2 please? This will make further
refactoring easier.

I know about the self-tests etc., I will address them next.

Bart

[1] https://lore.kernel.org/all/20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com/

