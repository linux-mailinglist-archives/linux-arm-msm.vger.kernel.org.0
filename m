Return-Path: <linux-arm-msm+bounces-85153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D21CBB03A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 14:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD89D301EF04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 13:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A66220C029;
	Sat, 13 Dec 2025 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vRSvoBGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240DC72627;
	Sat, 13 Dec 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765634247; cv=none; b=ROxuj4deHSGkc1Gw8lNHhBgsUP9NZCrGUpG3LvVBEJ6R3W2yL2zxkuS0jvGBLvoBQq4Iv3xRoLux82QXUG+ASfArQ1HZBzopzzHCDKHBs0xgFThpzcPGT0/cQp2U8zHSOxjRxoKstyTlTqHDZOUDmmHNjEID9/gA0MUR2Y821F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765634247; c=relaxed/simple;
	bh=Io5huw5drv5uRuB1bYPQezJ2mtuCFgnaWSOURAvlUkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGeKgX3sRrBcoAZfd4fb00dneWD5S2muU9XST2lWOJQYvGRWkPwFhgLFXgtyVzEiyzZIamhaxk5mZWE7DcrW7Qf9XHgLrg+mfeFxGTMQ3dhMBbfzz+dbnFexyqa0eC5bqertjLWC3E5pMLGGjp2pkPp/BLSYNg4ZYrXOqaWdBto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vRSvoBGQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164CEC4CEF7;
	Sat, 13 Dec 2025 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765634246;
	bh=Io5huw5drv5uRuB1bYPQezJ2mtuCFgnaWSOURAvlUkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRSvoBGQ+63EV1g0MtaKWpRxmd38Y7L6I+V+ekbS5isNvGcBZqnzr1erOoyINJ2x7
	 t/arm7hZXNnN+tmWFoQPJ9g56vvDC4jc5gBQiYLIcZBlVtoQsc8qSql2BdLEY+E7dB
	 QJ8pHQQpidNEB74w8PynyHgD2LJL2O0inz5nsbT4=
Date: Sat, 13 Dec 2025 14:57:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <2025121303-railing-fountain-bebf@gregkh>
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>

On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
>  drivers/soc/qcom/Kconfig             |   1 +
>  drivers/soc/qcom/Makefile            |   2 +-
>  drivers/soc/qcom/socinfo.c           | 931 -----------------------------------
>  drivers/soc/qcom/socinfo/Makefile    |   2 +
>  drivers/soc/qcom/socinfo/bindings.rs |  59 +++
>  drivers/soc/qcom/socinfo/data.rs     | 424 ++++++++++++++++
>  drivers/soc/qcom/socinfo/socinfo.rs  | 362 ++++++++++++++

Shouldn't this all just be in 1 .rs file?  By not doing that, you have a
number of public symbols (that are very generic), that will "pollute"
the global namespace of the kernel symbol table (unless rust does this
somehow differently?)

But putting this all in 1 file should solve all of that, and remove all
global symbols.  Especially for just a small and simple driver like
this, no need to split it up at all.

thanks,

greg k-h

