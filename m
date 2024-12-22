Return-Path: <linux-arm-msm+bounces-43053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4449FA3CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55FFC1886FCF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 04:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66F56BFC0;
	Sun, 22 Dec 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="BlEgm4jl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733813D0D5;
	Sun, 22 Dec 2024 04:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841224; cv=none; b=l25MMCDO3FT+QekUfmNolaRD1mKD6UEPAM84NzjKdw+O9hxgeJKvOOveosjRvlywjitcsGDIrn320UovZL3RPhzScgcZ5ZIUdkcj4GzkZkORplDfzRo4aCU8p2qQqk8fMy7fz/pexoTMG1Us9KiPFgkU595NKuA1R73MhbfLpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841224; c=relaxed/simple;
	bh=SBC2ST+0oancyUzYEiO7UG8jJgvoTf7tnOHYco9n8zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvNXqFFa4xRKnTl6AqiAKe30USyRB4/uongg9ZfjHvoaEXJVPb2wnMwhsXZ5uw0sLfjsKmV33OZvbfNJqAwZ1eWkWJ5THcBRbxxP7dMzx4FVMm4YcMqDP/6HYZCW7gcL6Cs9O99SBXXy6IXaoEuo6M60vV18YF5urFdZVH1/UTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=BlEgm4jl; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PAAd2U1Mp2pW+AoJOC/H/IFSldcHWpdu/VmyCU+eH3w=; b=BlEgm4jle0e9B/s4fVnh1aja63
	dkjJ6cIZsgYOJoLGpzYbMvLucRCumWe5WKT86eTIynhYM2cehE+E6KzMxxgTZwoWK6rKvzTjQ850m
	ocftoGJvIWtabc1KFxDKMyfgYCiREgP08y9OlIDsRhoeC6zJxFp2K4CQ8iIQjIt9c3QyxS2TqzCx0
	SDue+VWhAdRxfPaFgBTyqe+wnS9GoeQfnkEGx2jVCo9u4X6dgeNp/2WNXn7hKfIvVzqHhZP+hvz1O
	AJ23Qah8K+6MMXr1k6YA0+8Xo6WSXE8RRNnzrZaeuhEwLbaW60zRUezYMvinmqq1hT6tVkhedLuq3
	2nnvKUmw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tPDF4-002Uev-0y;
	Sun, 22 Dec 2024 12:20:20 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 22 Dec 2024 12:20:19 +0800
Date: Sun, 22 Dec 2024 12:20:19 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] crypto: qce - revert "use __free() for a buffer that's
 always freed"
Message-ID: <Z2eTg29H703vaiNc@gondor.apana.org.au>
References: <20241218-crypto-qce-sha-fix-clang-cleanup-error-v1-1-7e6c6dcca345@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-crypto-qce-sha-fix-clang-cleanup-error-v1-1-7e6c6dcca345@kernel.org>

On Wed, Dec 18, 2024 at 01:11:17PM -0700, Nathan Chancellor wrote:
> Commit ce8fd0500b74 ("crypto: qce - use __free() for a buffer that's
> always freed") introduced a buggy use of __free(), which clang
> rightfully points out:
> 
>   drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto statement to its label
>     365 |                 goto err_free_ahash;
>         |                 ^
>   drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of variable with __attribute__((cleanup))
>     373 |         u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
>         |             ^
> 
> Jumping over a variable declared with the cleanup attribute does not
> prevent the cleanup function from running; instead, the cleanup function
> is called with an uninitialized value.
> 
> Moving the declaration back to the top function with __free() and a NULL
> initialization would resolve the bug but that is really not much
> different from the original code. Since the function is so simple and
> there is no functional reason to use __free() here, just revert the
> original change to resolve the issue.
> 
> Fixes: ce8fd0500b74 ("crypto: qce - use __free() for a buffer that's always freed")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFRT=AGqmLSRA@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/crypto/qce/sha.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

