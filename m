Return-Path: <linux-arm-msm+bounces-85128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84400CBA378
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 03:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6045300E162
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 02:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EC02ECEA3;
	Sat, 13 Dec 2025 02:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQW2BK+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DC23E340;
	Sat, 13 Dec 2025 02:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765594226; cv=none; b=g2DjsC2FvPp7N6nIS10qwso3DrHoh3Cw0DankM9nn5CKNcpfJmvVt57LP0ir6Fu+FST5bzTfNNAru7Nuq3yycHHmX35qJ+bgQfpVeoIiYp/XFcCH/THCEbBEThT8fbuPSRx+hu0iXHFqmhQ9WXsBRCbNbF97aRPpKyU+bEz2BPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765594226; c=relaxed/simple;
	bh=YQQdPUu71vHE/NyQbqoTdLRdxJ3H57o8I5NmAQ9zLbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDhpS3KtDZl169t7tGakNjLHeVAzjFPp//qOHTR2wIO9lINR6yzd1hta6c8w1kwggHwC0+CXQQV6gP8MM2dDGrRtiG3lnS0ohmpOtYuwEL0Y2iAZOwqXwiJqg+FUdHIYR794Zyj5GdmoyvXtSl4aZptKimYnthcs2rH9bV3UrPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQW2BK+p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F15C4CEF1;
	Sat, 13 Dec 2025 02:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765594226;
	bh=YQQdPUu71vHE/NyQbqoTdLRdxJ3H57o8I5NmAQ9zLbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gQW2BK+pHkVR5NP7PbAyM2oZzn4UFEe3ClONGRKiVUAoZc2FIAyCFDzpH6XQVwpDT
	 dlV7Kk4gYqTLFr9xCsUod6xsd2OYNsmvxG2HD6cvynZHg0SkhzlhBwz25t0oWaF43k
	 vy7FoaQ0GMw2yKyvKVrgYYA9EaYoEA96WhO53fFjbF04y5KP0zJB8ztFJ7jWMZlbNK
	 FTCvmojNhJQpSQYPL+Vn+81UeXFDQ0PIrJ2LW6VgkDNKebst7IXgqY3futqZDoFcV/
	 ufNAg62bQbjwUTkv9hUjIuCp3aiqLrnPvkCR8O7akAtYCluEILLS6O8Uy1kCNdTbMh
	 0MaHw05bnDJbw==
Message-ID: <5fbecf9c-b8bc-4027-ae30-d7c49212bc56@kernel.org>
Date: Sat, 13 Dec 2025 02:50:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Matthew Maurer <mmaurer@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Satya Durga Srinivasu Prabhala <satyap@quicinc.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <x2HszWYqUaRfzLW8I1wOegJRSBRXVUzqafU9O_QLG1E-OjqkyUPQKn-jM9dzhvsgMW_M0NGXvrgEkN0p9mV7ww==@protonmail.internalid>
 <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2025 00:36, Matthew Maurer wrote:

> +//! Re-implementation of Qualcomm's Socinfo driver in Rust
> +use core::fmt;
> +use core::fmt::Formatter;
> +use kernel::debugfs::{Scope, ScopedDir};
> +use kernel::device::Core;
> +use kernel::module_platform_driver;
> +use kernel::platform::{self, Device};
> +use kernel::prelude::{fmt, pin_data, Error, PinInit, Result};
> +use kernel::soc;
> +use kernel::str::{CStr, CStrExt, CString};
> +use kernel::transmute::FromBytes;
> +use kernel::{c_str, pr_warn, try_pin_init};
> +use pin_init::pin_init_scope;

Probably learning more from your patch than being in a position to 
review - thanks for that.

One thing I notice is that, in C we alphabetise the includes.

What is the normative coding standard for rust stuff I'm not sure. Is 
there any technical reason not to do the same as C includes alphabetising ?

You appear to sort these kernel:: use statements earlier on in the patch.

---
bod

