Return-Path: <linux-arm-msm+bounces-117175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xEFdJ1OzTGqBoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:05:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD254718DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=N7LxVKxh;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117175-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117175-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAEE8306EC44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986572DF717;
	Tue,  7 Jul 2026 08:02:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6C2D94B0
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:02:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411349; cv=none; b=Mwjr/JqoelQMXZ0K6tp/HBPH12bWkOOIlwWICfkUFwzCnzu2N2iDHf/8Q98uqgo6Hb1fBUQ1WzUedg8nyxep/ueZzWU1zBxQ+YUnTH9hhkaHwjSMFLWJ7FycAzz04lBW8KHGUrmIoIZQke44HY31hRny0xseWQsKVHhDyOLCI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411349; c=relaxed/simple;
	bh=RNOqw8Ps1o+BrY3YPEei+ER/o21TPawJoWd6c2rChTk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oq0R7pa2jiZogMwhMP9ndvJIRMh8nmS1E7f2DzREzw7PQzVlwv3wnLqY22BEdiPZ6Fh541fCXszW74L4RIJfwpE3Esijk+cCC2fylBCvwx7DJcBBmQ1iZaCi6t3Gm5MWCcFhOArtQRNbM1Jn3+2Mwba55mIyuMQixCxvei/NHvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7LxVKxh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 223FC1F01559
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411348;
	bh=RNOqw8Ps1o+BrY3YPEei+ER/o21TPawJoWd6c2rChTk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=N7LxVKxhNMCf/JmgsMtOHQtV4GE/RmJOj8WppTHyY/6+1QLLfUw61gnwm7zyCKog9
	 Lw+RDbxgRW3n5FKEBo4Rz5je0Uw6TTkxvWuqwvPdJ5e5a9h93qEOEXx48d0Q27Ej8K
	 9By4fQND28zppra1RWemleqfWsP45i77h0egBlRcaGCrI8u8ifoq0dxQi9GY7yVcjs
	 BpfcLtXGPiEc/H7hUkXEdhdGYaNGfhlEYiNQS1E20/GIVB9Frnz4pguzPTUzkERGxn
	 prje/NW/1vhCjUXNRDxqDlQBEsAOm53Y209Z4vBA77f+UNUKag5zmqz3jJNgSBSXG6
	 MhbL+nWE2qgsg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b3027009fso31530271fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:02:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpvo7u0trB+kGywodS/bDu3PfOpf65GwAcKfw5NnxshfX2K6vN904XaqdBWbCAEDxM1EXXSqJcyuFw3oi+d@vger.kernel.org
X-Gm-Message-State: AOJu0YyDU2M4laKQUSgNcbXiWjC0c9aqjiAEUQBahsWOXRVka5PefTsK
	v3xLB8vibSzm5ZMaABIGe9nDUnm4mL9nUcVkW8nWKkOp0cssQTUoV9YNPSFS093VMdqR0KA9ctW
	p1rlUr4o29fTqW4ro1PNjCnefVbNim0VP8tI1g+ef6A==
X-Received: by 2002:a2e:a584:0:b0:39c:6d1f:2f13 with SMTP id
 38308e7fff4ca-39c6d1f3fedmr2151241fa.13.1783411346782; Tue, 07 Jul 2026
 01:02:26 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:02:25 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:02:25 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <549ff994-6b6d-49c3-a764-4c1e134a4a14@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com>
 <b693a9d2-4f1d-4c17-8a63-99c7ac79ed41@oss.qualcomm.com> <20260706-busy-grumpy-limpet-c59789@quoll>
 <CAMRc=Mcg-6XajFJCjTDgGACQ7YLGggw5TEtHv4QMEA=dFLOhTg@mail.gmail.com> <549ff994-6b6d-49c3-a764-4c1e134a4a14@kernel.org>
Date: Tue, 7 Jul 2026 01:02:25 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdi=DYPhCw2N1=9ta29BqA0PuS5umT6K5OguRiPomshFA@mail.gmail.com>
X-Gm-Features: AVVi8Ce31WTWFijLWnEr5GnAdn4iakMt2Frqq6sDI66tuX_5i8eBs1dJEw0B1UI
Message-ID: <CAMRc=Mdi=DYPhCw2N1=9ta29BqA0PuS5umT6K5OguRiPomshFA@mail.gmail.com>
Subject: Re: [PATCH RESEND] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,qualcomm.com:server fail,tor.lore.kernel.org:server fail,mail.gmail.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117175-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:brgl@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD254718DEF

On Mon, 6 Jul 2026 19:33:37 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
> On 06/07/2026 19:13, Bartosz Golaszewski wrote:
>> On Mon, 6 Jul 2026 08:54:22 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
>>> On Sun, Jul 05, 2026 at 11:15:45PM +0530, Kuldeep Singh wrote:
>>>> On 04-07-2026 06:14, Shawn Guo wrote:
>>>>> Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC.
>>>>>
>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> With below patch, we don't need nord entry here.
>>>> https://lore.kernel.org/lkml/20260702-b4-shikra_crypto_changse-v2-1-66173f2f28b3@qti.qualcomm.com/
>>>
>>> Patch has conflict. This (Nord) should go after above one, with this
>>> fixed.
>>>
>>
>> The other series still hasn't made its way upstream. This one's simple, can we
>> queue it now and rebase the other one?
>
> This is not point of rebase, but conflicting work.
>

I'm not following. This applies fine on top of current linux-next. Whatever
ongoing work conflicts with it, will have to be rebased when this patch makes
its way into next. Am I missing something?

Bart

