Return-Path: <linux-arm-msm+bounces-113670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +QW5CafGMmqT5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:09:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A12269B45E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:09:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QeXpHjOZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113670-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113670-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F21BD30F8D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 16:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA9D4A33F6;
	Wed, 17 Jun 2026 16:05:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF647DFA5;
	Wed, 17 Jun 2026 16:05:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712355; cv=none; b=V/xo82ENgWg9HNZsX0T6zqIgw31tTRwAHCrl2rZtSMaGTvRIYIGfEm0mNsAVmqR0N3pT6RWenLt6AVBW8JjluJ6CTS8g53vi3s4vfG3jd2PPDVo10NZ42LvZwgeXxThIJP1+3LH81JfjELoXWz4X1W3e5EytcO7DJIFRvOeINHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712355; c=relaxed/simple;
	bh=xy5pKmpHR+8apKnOQYTmpDygAfYhxlGd9QQhURnxDB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grHmdLXBjaLp4MUk513lVLf+mcMimtND6Zgxm1OL0mj7xeN2eLT/ZvTpusAf0eNAkwQRDgdBIy8yO0V2c/MVaAWcjUzT70vcjN0+1vwswFQBp8UdFIA9IHQNGj5R/wMqRL6MDfhlpYSbflxRHQ0PWqXgaY/xtDMmZokntQ4rqTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QeXpHjOZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8EA1F00A3D;
	Wed, 17 Jun 2026 16:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712345;
	bh=Bpns6yus6XLe48Ane9Z4QuHWfQYFi/6/9PVRUaHA5qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QeXpHjOZfwNWL9KTxEQnzpY41ylIsdi+mnTMtyDNCU7IzT7h/eGyRBA++5D4ytpjF
	 7VV+hd5MKl5R1qWerv0K3Mz4UR+EFyT4g0GohxEpeOv7XClJmZr10ZTM/wTVmW/6+F
	 tAPcrEvr7gMLLOzPOmMQZcJo6qcslbEGlCT8cjO1CSakBwcnKuxwDVO79CjBW5wY29
	 Y/t8T3QU4gCrwqmfiJn5Ph67cWTAKrza/lvY5TbTq6SnucCudxXeMBomaPJbZeQ6vN
	 jMeWdX/QAdBncvPT2OjvjT6KuPIz5jrES0WmHC74pcLAzhWgtfz/YtgB9QsMvFvFt3
	 uoXA/zaZwY+8A==
Date: Wed, 17 Jun 2026 16:05:43 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	Eneas U de Queiroz <cotequeiroz@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, brgl@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/8] crypto: qce - Remove unsafe/deprecated algorithms
Message-ID: <20260617160543.GB785086@google.com>
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
 <20260617-qce-fix-self-tests-v3-1-ecc2b4dedcfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-qce-fix-self-tests-v3-1-ecc2b4dedcfd@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113670-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,vger.kernel.org,kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A12269B45E

On Wed, Jun 17, 2026 at 05:49:30PM +0200, Bartosz Golaszewski wrote:
> Remove algorithms that are either unsafe or deprecated and have no
> in-kernel users that cannot be served by the ARM CE implementations.
> 
> AES-ECB reveals plaintext patterns (identical plaintext blocks produce
> identical ciphertext blocks) and should not be exposed as a hardware-
> accelerated primitive. DES, Triple DES and HMAC-SHA1 have been
> deprecated for years.
> 
> Remove sha1, ecb(aes), ecb(des), cbc(des), ecb(des3_ede), cbc(des3_ede),
> hmac(sha1) and all AEAD variants built on these primitives as well as
> authenc(hmac(sha256),cbc(des)). Also clean up the - now dead - code,
> flags and constants.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Eric Biggers <ebiggers@kernel.org>

Looks pretty comprehensive, but I did notice a few leftovers: a comment
still mentions DES3_EDE_BLOCK_SIZE, and there's still some ECB-related
code (grep for ENCR_MODE_ECB, QCE_MODE_ECB, and IS_ECB).

- Eric

