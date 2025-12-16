Return-Path: <linux-arm-msm+bounces-85408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F6CC51F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 21:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261ED303C9DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 20:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAA728CF50;
	Tue, 16 Dec 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KI02r3BX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8852727FD;
	Tue, 16 Dec 2025 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765918196; cv=none; b=DV+Hx6i6wiRWmUGP91DzyJj8IEbEDharR3lvPDFUihurNIIUw86gw0EJkHrs8DMYorvpOlnJW0cyrKBXNT7UqV0XKhnmjZuBbGqtjjZDiQcM9LcU+nDOrxxvKeqe4iPuDM2S3z00cJJYQaIkM7vuyAtKwCbFzHOOV3o2z450eO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765918196; c=relaxed/simple;
	bh=6wymaJPlQHbPudiHvSRxiQ8Pqob0S9TYPF/L2Na/Y78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFV9SAeeYYeUx6nD/o7/CdRGbUl4NOFiAAQw0uS5VfA1vAsJVmtNz3kHPI7tnYP6aFuICkr9+49IQX2RVrdcD8w9423uHhYy9qbeZrK0KFepOgIRHU1ad9xBWv1GEF8a8GRRm7cpBYxJ6YyAWMrdwTkMRGmMJqFHel6hfvLl25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KI02r3BX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A49EC4CEF1;
	Tue, 16 Dec 2025 20:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765918195;
	bh=6wymaJPlQHbPudiHvSRxiQ8Pqob0S9TYPF/L2Na/Y78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KI02r3BXxKEzcYY2hCzSsOKFYLBt5PbZH+JLUN+gAMx9ky9WYzTLKSaAWtMk3tPWJ
	 ky/9P5eZDZR7Mvr+8Xw6lLf5I7TGkonXhyqwcIStzTZ69oaQOA4RflXh2IpaS2wfKx
	 QBj8KijcFsuuppAWuYFTtUvIuRH5+dATvKg76Qc9WqHurLMffMeFHa2C/SNgMgMY/G
	 mMgx1HoheUuBsE8fIQ7w7CwGD1NIlu8sfC0MoQNtzNJ0nBMEQBPNo8j9splgbkUHro
	 96lBmfLG6rAlgQzDSM0eays9B33JL8onHkULU3ouSM4llqCfGGWTsh9kWxe+VfQYO3
	 rURgwzTvHLuDQ==
Date: Tue, 16 Dec 2025 12:57:56 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
Message-ID: <nddh2fawoofktjglouq5wrjubxhyqrlzftqz7lvx3xdfipncip@xgudpcfdo2bd>
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
> Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> bindings.

Okay, but why?

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

[..]

> ---
> base-commit: 4b31c90f86768367c84cc6e99e1deee0ec55197b
> change-id: 20251029-qcom-socinfo-d8387c7fdb1c
> prerequisite-change-id: 20251029-soc-bindings-9b0731bcdbed:v1
> prerequisite-patch-id: e4da423ddabec93bd9a64004691266f9b740e0c5
> prerequisite-patch-id: 5097ff622f8cb1d38354674cf70c1c946ac87f6c
> prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v1
> prerequisite-patch-id: 657de204912d2c5efff9898d3f4c51e52684d8e6
> prerequisite-change-id: 20251212-transmute-8ab6076700a8:v1
> prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
> prerequisite-patch-id: 01a1f3d727e549c173dd142180741f5b6a3c866e
> prerequisite-patch-id: ff801a7ae439876b1554b4d1132d94c825bbe74f

So, it doesn't work on a clean v6.19-rc1 tree?

Regards,
Bjorn

> 
> Best regards,
> -- 
> Matthew Maurer <mmaurer@google.com>
> 

