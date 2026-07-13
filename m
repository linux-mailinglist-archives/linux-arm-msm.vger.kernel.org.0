Return-Path: <linux-arm-msm+bounces-118745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h1j0HLfHVGqUSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:10:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C475774A2EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:10:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EjONWQge;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118745-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118745-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4598B3014767
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0AC384CC1;
	Mon, 13 Jul 2026 11:10:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545F381B01
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:10:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941045; cv=none; b=QuSQdjdTzcGjGOtVzB0SbxPXvNyPweSFzb4g3pP8MBjbzq8XahI6hplBwAjrixr62sats2lHK2PeFoxGElRd+rRtkxPq+CupONZFgo61jffUD6CsXeEMomCpVdu7TTqLOPI/K2jUFL+A4bm6Wr7SYexmZywI8G1CiM4wUnYBjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941045; c=relaxed/simple;
	bh=w7ElCMjLkYLkyB+bROUj878GRmag6+SaeE+dMid5A7M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avf86Gi9q2kag3G3b5zxVH2eUs/BT3YKYMu2RMvcDwVm7p55dzQ9smUazBHCwW2OgrH/1giKN6xxu1w3JaUAd8znTXnzHQjl6bSSqcIU9NLqvIF+6VAfq0xESEmChyPh36L8weTvDGoy/3SSD+t+RM4Wfc7lZ9zruJ+5wUFWZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjONWQge; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE4D1F00ACF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783941043;
	bh=euGOGq/jybJAzlTSdL+ChBakGwyhbx52kI/Gq1xLLZY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EjONWQgeikBTJ2FOQy+gyBDoYY8/FNnmBzWQa2d/vSEM1ESAzS+snz/iGdirgROU5
	 AN7zz7TgnhyYoGr1+xSNfdbJaCicZrS5GoogZXiicAuANUQO8Gk9fvbpHyyPw/15gD
	 U8ur8J6RTNJRminr6TpHK8X1ySKDbtH2cGunkFYUDUllIusnoef588jcMULzT27dl9
	 dZnGaw50eIsQFeKI110CnzssLpqQKOb7rn8Zh3W6/mbnGmYUWyq1B56YnbKB2sbC7E
	 e4Bi619ezSDIuGMutVWcpEihVEJD/j3U/6o4eLB7mrh7ZXEe6NUXMBLl3TmwUc6TKB
	 IevHr5lfsnIXw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39c908d6cb6so26166881fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:10:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrl1BaAGgd3pQywkiuq4df1y3gzphQqorpzlzdC9AIz7fmZ5ZmYu6DsP0k3lnwG6o4qF5dh0QtXxZ8knaTW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0NyLYqMbcgRc+u0pp8OPT2iVbblYrrvx0HpvI2y24ddGHCfIv
	UactmKlmn8NNqy3DHbTDkdFl+AmSTFpm5omg36qp35oKLAvxjBr5rg8GqAwGD3L7qmliZDFLChT
	GXdpuJlzBSDSXswPmHpUbSKLb6t6iSqEBLJ0ul2roQg==
X-Received: by 2002:a2e:bcc7:0:b0:39c:8f36:8104 with SMTP id
 38308e7fff4ca-39caa834fdfmr18180491fa.19.1783941042464; Mon, 13 Jul 2026
 04:10:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 04:10:41 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Jul 2026 04:10:41 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 04:10:41 -0700
X-Gmail-Original-Message-ID: <CAMRc=McqBwG8qSYvgsmvCpJvtYDy24yhW1FMRuUpdu-dqWcYwQ@mail.gmail.com>
X-Gm-Features: AVVi8Ce019xBHlwdOviPJt1Xf4Hj7OQrNGjXwrTA9vUYlWrVB9i66XRbDv2XoLc
Message-ID: <CAMRc=McqBwG8qSYvgsmvCpJvtYDy24yhW1FMRuUpdu-dqWcYwQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] crypto: qce - Fix crypto self-test failures
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118745-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:stable@vger.kernel.org,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C475774A2EB

On Mon, 6 Jul 2026 15:53:51 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> This extends the initial submission from Kuldeep.
>
> The QCE hardware crypto engine has several limitations that cause it to
> produce incorrect results or stall on certain inputs. This series fixes
> several bugs and adds workaround allowing the deiver to pass crypto
> self-tests.
>
> The failures addressed are:
>
> - HMAC self-test failures for empty messages
> - AES-XTS returning success on zero-length input (should be -EINVAL)
> - AES-CTR: partial final block causes the engine to stall, output IV
>   derivation was incorrect
> - AES-XTS with key1 == key2 is not supported by the CE
> - AES-CCM: partial final block and fragmented payload both stall the
>   engine
>
> All fixes were tested on an SM8650 QRD board with
> CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v5:
> - Dropped patch 1/8 that's already queued
> - Use the pre-allocated fallback ahash for HMAC transforms (Herbert)
> - Link to v4: https://patch.msgid.link/20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com
>
> Changes in v4:
> - Remove remaining ECB and DES3 bits
> - Pick up tags
> - Link to v3: https://patch.msgid.link/20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com
>
> Changes in v3:
> - Remove even more algorithms and dead code in patch 1/8
> - Link to v2: https://patch.msgid.link/20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com
>
> Changes in v2:
> - Add fixes for the full suite of crypto self-tests
> - Add Fixes and Cc tags
> - Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/
>
> ---
> Bartosz Golaszewski (5):
>       crypto: qce - Fix HMAC self-test failures for empty messages
>       crypto: qce - Reject empty messages for AES-XTS
>       crypto: qce - Use a fallback for AES-CTR with a partial final block
>       crypto: qce - Use a fallback for CCM with a partial final block
>       crypto: qce - Use fallback for CCM with a fragmented payload
>
> Kuldeep Singh (2):
>       crypto: qce - Fix CTR-AES for partial block requests
>       crypto: qce - Fix xts-aes-qce for weak keys
>
>  drivers/crypto/qce/aead.c     | 32 +++++++++++++++++++++++++++++-
>  drivers/crypto/qce/cipher.h   |  1 +
>  drivers/crypto/qce/sha.c      | 23 ++++++++++++++++++++++
>  drivers/crypto/qce/skcipher.c | 46 ++++++++++++++++++++++++++++++++++---------
>  4 files changed, 92 insertions(+), 10 deletions(-)
> ---
> base-commit: 86855fca1d5d84fcfd6b93dfe8bff4eab6029ad3
> change-id: 20260610-qce-fix-self-tests-492ffd2ef955
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
>

Hi Herbert,

Gentle ping, if this looks good to you now, could you please queue it for v7.2?

Thanks in advance,
Bartosz

