Return-Path: <linux-arm-msm+bounces-40138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B89E2A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 19:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA98166289
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D6D1FAC5C;
	Tue,  3 Dec 2024 18:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwMSjLQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F11F8901;
	Tue,  3 Dec 2024 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733249301; cv=none; b=iQy8zg95vuS9Xeo5wqotBQIfyZxBgF6gOH7mNyKLp+JiaHI5Yug8LRlgOP+3mpy1kFohe+StrMK14YmXLpixT37MAEjsRdi8OxWr7pCdxtfoNufN+fxL7Y7CxuOtsSHX0ELg0lbWJ1P2PzqSoeb8ygfgGlGHhV8dum9JnALppg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733249301; c=relaxed/simple;
	bh=WJoqX1NO/Gct9p68VE9wO2kLxgZ2AQznPaJni8DDZBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npyA4S2LrnMYP6GlHh90grOxSfH24mG0xX4tBXSDg+CzDt0AcR7tHiZgaBdgSbbefhzem2kYAVW653spJYjKY5TkDFVsxQTHwY3nydf0ItRwgP4DGK7IImpxg6Yk8pBg/nKFCqTgDjjfHxbU79CkfDgYqooqtDM5wrbl1xwXvlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwMSjLQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C5DC4CECF;
	Tue,  3 Dec 2024 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733249300;
	bh=WJoqX1NO/Gct9p68VE9wO2kLxgZ2AQznPaJni8DDZBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwMSjLQL13OsOW1sjTdMdx9OvDayA+yraedzZZvF95w5ldzv8dhZ6D+d4U/l6BNJw
	 apMPiWcPHIfOk3wuXmxyLwMYAEno1S0gbjCvqIfkCabKhtSIjQwCaig3uWiaGbI3I5
	 o6IrJAzysgS/f43BUMNkd8b4Ej4VwOxVRwiUtX+ig0Q5DL/LT+M5KtrqNis+sDcDpT
	 15m94H94OnONg4ODrK/z4zev2UoGpeachiaUgM9x40EsovoCIewH9fmjXqcTxtLQyo
	 +5lO2WP5EKPkmxXd4a2lIJQwZdyJf+2KwwXhBmAElJ6bdjdnRaUYjHAJYa2KhMYoZw
	 Hbr4+GM0A8fNQ==
Date: Tue, 3 Dec 2024 10:08:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/9] crypto: qce - refactor the driver
Message-ID: <20241203180819.GB1510@sol.localdomain>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203173503.GA1510@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173503.GA1510@sol.localdomain>

On Tue, Dec 03, 2024 at 09:35:03AM -0800, Eric Biggers wrote:
> On Tue, Dec 03, 2024 at 10:19:28AM +0100, Bartosz Golaszewski wrote:
> > This driver will soon be getting more features so show it some 
> > refactoring love in the meantime. Switching to using a workqueue and 
> > sleeping locks improves cryptsetup benchmark results for AES encryption.
> 
> What is motivating this work?  I thought this driver is useless because ARMv8 CE
> is an order of magnitude faster.
> 

I see what might be happening.  This driver registers its algorithms with too
high of a priority, which makes it get used when it shouldn't be.  I've sent out
a patch to fix that.

- Eric

