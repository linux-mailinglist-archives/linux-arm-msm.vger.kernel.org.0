Return-Path: <linux-arm-msm+bounces-113376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7IprNFgoMWqVcwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:41:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F7868E63F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:41:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lDST57TJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113376-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113376-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 394EA3023305
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C718D42883B;
	Tue, 16 Jun 2026 10:41:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103A2D12EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:41:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606486; cv=none; b=TXKeKUfHAQ338r9rIPHUxXiCTHAcWwce7+DZIcIiUpuY7iseioSQoC9F6dwhEMoGmgAYEryAsfjAmTac5YYlmOcZrwxfymaToCDxgfUu7JE2uL7wqfx83wXqY9O/xgBwhNGPGRpeB4ORunNYwsyAxowDR+5v6qHPYLrt9uUM/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606486; c=relaxed/simple;
	bh=GiwgUDhVPuccDsHM6fcajwPeBmdY/V23LoCQ/JyqQ5w=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHJEaT4iOiTwcTVq/9itfJJmRkZ+s3picnok1A0Ygdze3y+xk9kV5ID+HqEnS5sYjS26oGEGifO0QW2BD7pv9LAvelCOslPpIjugO7pew+pV6dhM41uoaSHU1uQirvj8frlPko6geb2ri9ZNVeAMCNAmMqCpMQZnYJOU7Lm2CkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDST57TJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F0D1F01558
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781606484;
	bh=2tpmLa3dd6flsbsy+JH4P54/CMX4D7LsJ6W8CltvTok=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=lDST57TJodRceigb2VwiaQ0BBbw1vD9bcd9X+L/nZuc6pTHePvV4PTHHs537n9baA
	 67mbbjNVI3bXFnrZcPIUhGxb4fRHzSstlZPhGjb1gUDOui4i92rQevtsl4KRu5s+/j
	 2B9u0UDWiPDndFFN60XSAIdtKWCIPeoP+spHQctav/sGCBTE8KIcMW1AZtt5Ytfhjv
	 nrJn6CdUEheRPHjszM3T5wAzpxGipr4r/hjfBCCTKzppunk8tdW7OYuxo0yDYA5C72
	 RXkFbjX3cgn4dc3P9PweExe7AuoSMG7XiyGF+ZQad0sEK+YfaxLoOmf0/MV7haV9dG
	 8+XZ1+sV/eSLw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa6863327fso3764821e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98wZqk4pjoaq9cyu9sYavXJ5dGlVncgfeaaN3m+Fzt5HwYKIlgQaYeR8kfLFflL9DHCXGowtm1QriGUO7R@vger.kernel.org
X-Gm-Message-State: AOJu0YxHsIZeKtZ0BRp9I7QNYKWbqErRWSnkSRWDYFseGqP+CBPkPSiq
	FmMSe+79RFpln1rVpqxh3WPgZmb81MEAl8NX7E6VSxG30uJbsOE5anuiTLqv2qWZCPYkNUds5OA
	V4ihI8EAJuwUdem1E7f+g1xhduOZtkr0NoJjpdhg5fA==
X-Received: by 2002:a05:6512:3e17:b0:5aa:6946:6e4d with SMTP id
 2adb3069b0e04-5ad4351b594mr963896e87.19.1781606483423; Tue, 16 Jun 2026
 03:41:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 10:41:21 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 10:41:21 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260616051820.GA127019@sol>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
 <20260615-qce-fix-self-tests-v2-1-dc911f1aad42@oss.qualcomm.com> <20260616051820.GA127019@sol>
Date: Tue, 16 Jun 2026 10:41:21 +0000
X-Gmail-Original-Message-ID: <CAMRc=McmpeWY2yVbf-KoAG-uC8_cvcW6MJXFSOjnEFqpmjaoig@mail.gmail.com>
X-Gm-Features: AVVi8CfBtys2dQpRs7E2oMR0x48_wmRqAKjUTOb8b_ZnXmDQi8Ass0ebG3f0ZrY
Message-ID: <CAMRc=McmpeWY2yVbf-KoAG-uC8_cvcW6MJXFSOjnEFqpmjaoig@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] crypto: qce - Remove unsafe/deprecated algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113376-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:stable@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,vger.kernel.org,kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37F7868E63F

On Tue, 16 Jun 2026 07:18:20 +0200, Eric Biggers <ebiggers@kernel.org> said:
> On Mon, Jun 15, 2026 at 05:49:52PM +0200, Bartosz Golaszewski wrote:
>> Remove algorithms that are either unsafe or deprecated and have no
>> in-kernel users that cannot be served by the ARM CE implementations.
>>
>> AES-ECB reveals plaintext patterns (identical plaintext blocks produce
>> identical ciphertext blocks) and should not be exposed as a hardware-
>> accelerated primitive. DES, Triple DES and HMAC-SHA1 have been
>> deprecated for years.
>>
>> Remove ecb(aes), cbc(des), ecb(des3_ede), cbc(des3_ede), hmac(sha1) and
>> all AEAD variants built on these primitives. Also clean up the - now dead
>> - code, flags and constants.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> What is the rationale for still supporting the following?
>
>     sha1
>     ecb(des)
>     authenc(hmac(sha256),cbc(des))
>

No, I should have removed those too. I'll update it in v3.

Bart

