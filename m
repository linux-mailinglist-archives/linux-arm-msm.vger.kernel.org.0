Return-Path: <linux-arm-msm+bounces-42223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FBA9F1DCE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 10:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61510188BE99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 09:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F8D158DD9;
	Sat, 14 Dec 2024 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="h6esVUWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73A15383B;
	Sat, 14 Dec 2024 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734168485; cv=none; b=mMLvLgwcXb8L+EZCb5a8d6Wdj6CJZRIGn9VcPFI57xOp0bwXxWPmG9CZ001WGK6jHkm4Pz4OdGoG8SQl7Oa3dJQpjSQ5jtCuHfnXYxtyq/PZJGrxH67JmCvd0Loplu206aZl3AcL4rTnd50Et4A5j8OmbfsrWeXCUGUgfmqZ3is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734168485; c=relaxed/simple;
	bh=mh+BIbqYBJMiK8OqQSuZPMPQqV0f0lR/gPwFn6N2M1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COEhNuswZaFH9fhUfp+YMoDsPJxYkRKhqCsCP9zZCga6ydRtlqbt1Dj+7QM+Ong+m4dqlyHGNA8x7cGyh9CsTtIS2nIMSNa8b+cXnj8dxSmBVUfImnwMAGu3GrePaye8mkc8DF+chqJniLK7rGb2YoKg0FOF5lroyjr8xTzz6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=h6esVUWt; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jSrh8S/vrTiZu29RpJyXI7IV5JHm4F+0sjUohrNbfB8=; b=h6esVUWtKyXiNBDhh6atOa5lyS
	Ltg1tg48P7P+vLY3a2kGclExV986m/fvdnzPciLgdE2zbilmN+RqA7sv5MXCYQnNMphGUwLaL23An
	MjI3uKkHy5HAeF3ytkrcMc9YvGQJTxJhpALcQyz6PX1YNiN8uWwd9nGiLfLSX8bM1GuFoZJ1k/Asg
	THHc9ugVFoYxh2vueH12RXdGNGjTTQvap7NlOsYeTJsTInFZ7pRBZoEaqKOJAbL6SdpkVIWkIHVCu
	hxCIy8HTaH1PpvSzjZVuGFfPZ13CEnG0WCjCPaWxd73KxYdxyNz0FWqXjBtMinj3p33gp5URavXVd
	l+Lu5sVg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tMOEJ-001TK9-1r;
	Sat, 14 Dec 2024 17:27:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 14 Dec 2024 17:27:52 +0800
Date: Sat, 14 Dec 2024 17:27:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/9] crypto: qce - refactor the driver
Message-ID: <Z11PmHSJFFbJ9DtE@gondor.apana.org.au>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>

On Tue, Dec 03, 2024 at 10:19:28AM +0100, Bartosz Golaszewski wrote:
> This driver will soon be getting more features so show it some 
> refactoring love in the meantime. Switching to using a workqueue and 
> sleeping locks improves cryptsetup benchmark results for AES encryption.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (9):
>       crypto: qce - fix goto jump in error path
>       crypto: qce - unregister previously registered algos in error path
>       crypto: qce - remove unneeded call to icc_set_bw() in error path
>       crypto: qce - shrink code with devres clk helpers
>       crypto: qce - convert qce_dma_request() to use devres
>       crypto: qce - make qce_register_algs() a managed interface
>       crypto: qce - use __free() for a buffer that's always freed
>       crypto: qce - convert tasklet to workqueue
>       crypto: qce - switch to using a mutex
> 
>  drivers/crypto/qce/core.c | 131 ++++++++++++++++------------------------------
>  drivers/crypto/qce/core.h |   9 ++--
>  drivers/crypto/qce/dma.c  |  22 ++++----
>  drivers/crypto/qce/dma.h  |   3 +-
>  drivers/crypto/qce/sha.c  |   6 +--
>  5 files changed, 68 insertions(+), 103 deletions(-)
> ---
> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
> change-id: 20241128-crypto-qce-refactor-ab58869eec34

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

