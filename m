Return-Path: <linux-arm-msm+bounces-85152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D3CBB001
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 14:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6BF530B4C50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Dec 2025 13:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286C12F6592;
	Sat, 13 Dec 2025 13:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="k1/TchzD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P9FhzUXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA122E719E;
	Sat, 13 Dec 2025 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632485; cv=none; b=lkVoL82LvyKPx8egicCAK1MzcHP7zRUvn7D7nmQpqGscr1rJqGivD1BsdfxvfrOLwpG2f6Iit6vKTuLXAmM+FlcNv39vLtH/02BeDX/nGtTcBxtjgjTiCRLJpXJTtWA3yrxIrtnTurh/w7J9wWXNtxNQPXNA3twmUN3kwS8eQ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632485; c=relaxed/simple;
	bh=0nItJ2tflBzUj2hfhb5/Mwu6qDxOWrbsd2aWYrMcD1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKYI8W3f1VyexRjITrvfBzCXmEe2b2WL2T4Zn0IkX1ptsFvyP6YyDDN+pqQ1YM0TJfdb7XE2SYIFlHRS/DuACknYvYjdQ/z2vC3HAOGgrTkqxhE/79sImqMx/ISkXsIozacLZ3sRnvgGhX/xSDUrGku+vcIv85HKj0LzVgEmIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=k1/TchzD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P9FhzUXo; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8509314000B0;
	Sat, 13 Dec 2025 08:28:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 13 Dec 2025 08:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1765632481; x=1765718881; bh=RfsvA9jls4
	L5nSQQgY2Swf89SobjyalV+wQrNrGDX2s=; b=k1/TchzDLBOnTVK7vENdwEZeLr
	+ws4n2aD21pN8UDxWjJrquKV7QPzFhF5i4f7cg08eaEBdqaUXiNBnmyGCMj0iE/7
	lgPlZL7ZZf4C3z2gmOAWeNMALCFf50qPNx0JvcZ8m5mBXuOjjVdoCQ9wd9kQRmev
	Pw7eIXf3t4RbY15CvU259kjtuxRSr8y6MtPRNvQFqorIdBdkcf8oxt6N7XdRNboq
	1Eq3D3L7pCDXTlIcc88Yl2Q8lzWrTmv7pt9bmV7fNpZjh81t2YgHy8qAqAs0P9jn
	dhxCEfw/Z9GD6shKPLOBbEfzVvYLkJpPU7KJg5S4ykwGZN6Fb/IDvtlCiOcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765632481; x=1765718881; bh=RfsvA9jls4L5nSQQgY2Swf89SobjyalV+wQ
	rNrGDX2s=; b=P9FhzUXoiKSeMrBx1A2R7HLRH4dYMvBVK8TFoYQYvwgQYUJ4sjg
	FPElwpPwaGStu6KLTRLFLUpi20qyXhCzSHgqIMI4+hKSs2RKB+fyjxnoVnUSmZ0Z
	fnqapUmILLg9d4VQKFAtdjjlFs3TJCqMYkcxWSbip6Z3QDUww8KhoYA/XlCAK/LI
	Wu7LBGBlEvq8iv8ICCnF8v0I7PMlaAnH4fSlnwS6Y1BQQ8pkyr5HBDBe9HaZrEBK
	sw9gfKbuEsC1kpxl9A8Plb0MRrUHJsELCjlbpSk+7GLc01jCit/jX1zbiXDqqII8
	pVEkGmBl7JjjnRW6syNyX0HWbSNByi4/tiQ==
X-ME-Sender: <xms:4Wk9aUqsujxyuiCzTEJjU0FDR-QbUgsYLgu-hCbEIxaNW7pJ_ff51w>
    <xme:4Wk9aWwiXJ1FLoaP8BmYJtC44VAw4pTQ6wS3txRU9aw-kvUDAS9y3SbW_J6Fl4xSj
    JHcJ-OZZSmQU5U1nxzH3MDu1pIllu1Oq_rbmAzfvCRkw41k_Q>
X-ME-Received: <xmr:4Wk9aSfMDOjEyrjKHk6JazxsupAMIKQEQMxDtHl8AdAMih8m73-zS35CS_l4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepfeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehmmhgruhhrvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrnhguvghrshhsoh
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrhgrugihsggtihhosehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehsrghthigrphesqhhuihgtihhntgdrtghomhdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhn
    rdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtgho
    mhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4Wk9aa9btaZkbnrRdb1ViG9lJcUndcYW20kx5wr1ibrCY_vf7-lkCg>
    <xmx:4Wk9aYE6a4nLhmbTXUk7tZQoG3KfPch5IEgisOG21OZBMvsjVRhQ1w>
    <xmx:4Wk9acDDBXtlx6I0qS7oAs9bGYxoX8LcaM19XVknJykdq3TqdnPExA>
    <xmx:4Wk9aWJbHSZmQFEnmJSep2ba3qOEEf_pmXN8x6V8m3qkkFdBOjexhA>
    <xmx:4Wk9ab7ZyDMmvq-yvS1nrf2fvMYukFzC6BOaPhh9CNnVvH15oyK8wKOV>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Dec 2025 08:28:00 -0500 (EST)
Date: Sat, 13 Dec 2025 14:27:57 +0100
From: Greg KH <greg@kroah.com>
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
Message-ID: <2025121339-giggle-throat-3ef5@gregkh>
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
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> This patch converts the QC socinfo driver to Rust, intended to be the
> first Rust driver in Android that is owned by a vendor rather than the
> platform.

Um, shouldn't you have a signed-off-by from the maintainers of the .c
file here?  You are deleting it, and then not adding anything to the
MAINTAINERS file to take ownership of this new file, which I thought
checkpatch would have warned about.

thanks,

greg k-h

