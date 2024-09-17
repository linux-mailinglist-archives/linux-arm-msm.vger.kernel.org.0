Return-Path: <linux-arm-msm+bounces-31889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A36D97AC36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 09:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14A96282471
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 07:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36E2C1494AD;
	Tue, 17 Sep 2024 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iW6sMtNT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1294213E022
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726558470; cv=none; b=MWyL1TfHF8qScuetf5fgK5JOs4KsQlXOUyr8pRqideWdOW0f1nXqC1ZYkPVSP9dVgcJa0hIypVuVQ9rV5dAY9+PiLnbSId3DHcCeVHGX4dV87cVWgWysdFfCjfR1i+dTiq7Q1U61eoI6ZZfFOVXdjBabK0LrN7RkJgMxKWq2Qgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726558470; c=relaxed/simple;
	bh=8/OnupM/wMW1ju7EIEU0hK4uO117d3c9EXnD5zGMFpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPI5mqbBRvVXs6Ct4eLnmgxYaHBusLpkfTf480nFPxKyny73+6XFz1HDgeNfK/Duy24IPSMddQ0qOiM5MR6EvHJgq3dNN38zw0TLRXZkv5DM5zK1Ir230KOCJaoQOafyzwEcYEG9cbKxTxFZTYkFARQ1W+LPoQORAVdVWboLUOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iW6sMtNT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926ACC4CEC7;
	Tue, 17 Sep 2024 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726558469;
	bh=8/OnupM/wMW1ju7EIEU0hK4uO117d3c9EXnD5zGMFpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iW6sMtNT4z0KOGZbRlJwHTrtyZ83HeCFR+H26cLvsSPl9zins7/y8lY2+uUZDlBvd
	 PdK7eVdL+b3rfNeuo8SNNZIP92OnD1tc/iovm5nN02AlyBbjfkH9WMK1et7vfR9HdQ
	 GK7QxrnnKJOauTzESndtPoysZGzzprzF63rLC8L5a1PjXVgFNAvZTqimvmJPCqjJCL
	 7LZnuwQLmxRgoBetRuZ9vqWJT1ANYTF9Hma0twR8F+csPQomlS5zhFOT4jcPedBnR1
	 kQGRDNnjvxCUtn9HLEcufazzPfls9JAh3bVe6RS5wGeW8ehmTfEgUGjizlRTS4sw46
	 ysyrhJsdVQ/CA==
Date: Tue, 17 Sep 2024 00:34:28 -0700
From: Kees Cook <kees@kernel.org>
To: Maxwell Bland <mbland@motorola.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	Andrew Wheeler <awheeler@motorola.com>,
	Sammy BS2 Que | =?utf-8?B?6ZiZ5paM55Sf?= <quebs2@motorola.com>,
	Neill Kapron <nkapron@google.com>, Todd Kjos <tkjos@google.com>,
	Viktor Martensson <vmartensson@google.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	kernel-team <kernel-team@android.com>
Subject: Re: [RFC] Proposal: Static SECCOMP Policies
Message-ID: <202409170005.60410C0A4B@keescook>
References: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR03MB6786D45BE387F2B378E71A84B4642@SEZPR03MB6786.apcprd03.prod.outlook.com>

On Thu, Sep 12, 2024 at 04:02:53PM +0000, Maxwell Bland wrote:
> operated on around 0.1188 MB). But most importantly, third, without some degree
> of provenance, I have no way of telling if someone has injected malicious code
> into the kernel, and unfortunately even knowing the correct bytes is still
> "iffy", as in order to prevent JIT spray attacks, each of these filters is
> offset by some random number of uint32_t's, making every 4-byte shift of the
> filter a "valid" codepage to be loaded at runtime.

I wanted to focus this thread on the problem, rather than potential
solutions. I think we risk losing sight of getting a complete description
of what is needed if we dive into solutions too quickly.

So, let's start here. What I've seen from the thread is that there isn't
a way to verify that a given JIT matches the cBPF. Is validating the
cBPF itself also needed?

This reminds me of two related topics, which might help either better
define the problem or help find some other folks with similar needs.

- The IMA subsystem has wanted a way to measure (and validate) seccomp
  filters. We could get more details from them for defining this need
  more clearly.

- The JIT needs to be verified against the cBPF that it was generated
  from. We currently do only a single pass and don't validate it once
  the region has been set read-only. We have a standing feature request
  for improving this: https://github.com/KSPP/linux/issues/154

For solutions, I didn't see much discussion around the "orig_prog"
copy of the cBPF. Under CHECKPOINT_RESTORE, the original cBPF remains
associated with the JIT. struct seccomp_filter's struct bpf_prog prog's
orig_prog member. If it has value outside of CHECKPOINT_RESTORE, then
we could do it for those conditions too.

-Kees

-- 
Kees Cook

