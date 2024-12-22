Return-Path: <linux-arm-msm+bounces-43065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F39269FA45C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 630281668DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702551547CC;
	Sun, 22 Dec 2024 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmnSPQL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F71C567D;
	Sun, 22 Dec 2024 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734849337; cv=none; b=DQsR6T2LxD0wZdfziugi1gP4Ql1Hen5ISqtbaV+tOijiEivhFWijQl6pAoVkxmmqWn/KkCCUxmiIYywdIb2vCtglMWUZgJLvVr5NLdq8qheEHzXsKT7bak3y0Z0KwTeu9LZEh4U9PxQH7gt1ckRAtyjjUX+9/Fs4U4+ANpwcqW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734849337; c=relaxed/simple;
	bh=3iWDVYgfiYavX8jTWOpbOUT4iZhtzJHzWiwvbtbztps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4VJW0ro+AQTteVACjjbvz2aJX7O1imolngt+6MZ//ClJvZMEcsp9pON1nByDINSFQrN0NNFqzJX2UUBFqeYHEDD6NPUDCsgPtCeHVXWzBRXqgRlnYP6gdUBAfQ+i+IWRYRocolLkA7XxoCgGAQ1A9hqjiUTo6MYuvtHtbTQGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmnSPQL/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4BCC4CECD;
	Sun, 22 Dec 2024 06:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734849336;
	bh=3iWDVYgfiYavX8jTWOpbOUT4iZhtzJHzWiwvbtbztps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmnSPQL/zv7cWxQfrb0dn90wYq0uVPvCqN0eSDVtbLcedPT/gpLdkrI1m+aDJRWXq
	 6FNi+fpRsfB1z6moL12vclgPPZ8CzAisgBuhCq0OGX4B63Jl2Flv4acT5ER/Yj5g6V
	 xWxE0hIAH5/ZmvupW+yY3WB71odNBS2Kl/cW0a17WVuxJDdc08dHjtmbDQdWrK1ytF
	 z8XOyeMGBYs5bC86yAsXhB0BS+YYIVAbUJJMvAZ31+/w9kieQiUnzTSL3CTkqUSNS9
	 iaKaDQiL2b5XP2hUQcST6GaXjHoNxiFl+ma1C2lPxJo5tgfVZedvlazDMfUEPgxVuu
	 amJ7i2tnNkbYg==
Date: Sun, 22 Dec 2024 07:35:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
Message-ID: <rcus7ib6v47vcmmz26psrvkod4uz4vncw2woile2djqg5johaj@csqyquqs3lws>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
 <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>

On Thu, Dec 19, 2024 at 08:43:16PM +0000, Bryan O'Donoghue wrote:

> > +
> > +	val = i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG);
> > +	if (val < 0) {
> > +		dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
> 
> Should an unhandled IRQ be an info or an err ?

Should be debug or ratelimit at most.

Best regards,
Krzysztof


