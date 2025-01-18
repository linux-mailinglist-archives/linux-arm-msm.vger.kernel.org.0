Return-Path: <linux-arm-msm+bounces-45478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF84A15E6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 18:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8749916631F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 17:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655FC19CC33;
	Sat, 18 Jan 2025 17:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2KzREKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E2173;
	Sat, 18 Jan 2025 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737222906; cv=none; b=ZHOkACf+3Ry8sLfUOvUfHiWJ8ou3WhSbBhuWOogss4A6Yl4wDe7VOrwGzX7T5Ss9GEQg/WNmop16X7p3W3UpCozmKIuMDjdvnzoy5Z0UcmZq8lwVKC31X8neYodEzl0orY9+Kt8ScrC8HKmaInukKHeLoL6OE6c/AKElfk17yxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737222906; c=relaxed/simple;
	bh=p3XFn+yR7jJf+lI7IYd80f8frBv7zbx+c8ek2QZPPI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+QXYyEp6tjrme0sLSrMiGAkGwuFvfvq7vVuxiLIZetS0nAbgWVQS4r5PtRUMN3GdxqhfUj9t3yUKMjx+DikuAOf1R6SFzmCyfwc1m22Pud3GPDND+2hKA+X4kRphTEVGbyAO0v+n3SW9agBRyOfurCeLUGl7PBkkn8ai+AePYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2KzREKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB47C4CED1;
	Sat, 18 Jan 2025 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737222904;
	bh=p3XFn+yR7jJf+lI7IYd80f8frBv7zbx+c8ek2QZPPI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2KzREKbZQcE/fDtvU4qaWOZVOVq57U/rnGKdkds5VJSKvmV/UR4kSbr90KZYe68X
	 Hadzlc4JKoivp508nbOWZI7x1FDiUn0y96Wrb3seb45Xo9grgXiOjOjCIXwiZeidtz
	 OEBq6mzTdbVq50UL10IxG4spFu5qAnJYLzX38lJCF5GjHR95bNJnQHRbDDlBZk+81Y
	 gZRW3iXKY4BZ9VSRhlFFJqeHdc/59QMTJpWYNEZ+3Y/ZPrN5fGCP+AI+2YCsBZ9JVX
	 I8w02ZEJ4GNK7SFsiqbkfg2qz8um4CRL81Yto1ReJl638NfAAynenkP7f+yEUbSf71
	 srzHS9qlmxx6w==
Date: Sat, 18 Jan 2025 09:55:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: neil.armstrong@linaro.org, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
Message-ID: <20250118175502.GA66612@sol.localdomain>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
 <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org>
 <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
 <20250118080604.GA721573@sol.localdomain>
 <CAMRc=MeFMYzMY4pU9D6fEpg9bQuuzqg4rQhBU8=z_2eMU+Py-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeFMYzMY4pU9D6fEpg9bQuuzqg4rQhBU8=z_2eMU+Py-g@mail.gmail.com>

On Sat, Jan 18, 2025 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> I was testing with kcapi-speed and cryptsetup benchmark. I've never
> seen any errors.
> 
> Is this after my changes only or did it exist before? You're testing
> with the tcrypt module? How are you inserting it exactly? What params?

Those are all benchmarks, not tests.  The tests run at registration time if you
just enable the kconfig options for them:

    # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
    CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y

The test failures and KASAN error occur on mainline too, so yes they occur
before your patchset too.

> >
> > I personally still struggle to understand how this driver could plausibly be
> > useful when the software crypto has no issues, is much faster, and is much
> > better tested.  What is motivating having this driver in the kernel?
> 
> We want to use it in conjunction with the upcoming scminvoke (for
> loading TAs and invoking objects - used to program the keys into the
> QCE) to support the DRM use-case for decrypting streaming data inside
> secure buffers upstream.

Notably lacking is any claim that any of the current features of the driver are
actually useful.

- Eric

