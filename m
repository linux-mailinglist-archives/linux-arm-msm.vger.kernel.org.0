Return-Path: <linux-arm-msm+bounces-86891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E5CE8495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 23:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8C13025147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 22:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616182765C4;
	Mon, 29 Dec 2025 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcrEK56f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331BD32C8B;
	Mon, 29 Dec 2025 22:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767047142; cv=none; b=fNQVt5Rx+jGIng6Pxc/DBnvEXFl1mp2+rmMXTtXtgnruVwdvA48uEdKu/o67H9+2BnkiObDgyJF8rO3YOjMTkeSpbopliZ7JWQubjztDhEvxvF0sGCS1jWJ9gZOueUg45uXv60wpNEYeFKtiJzBARXfjJNdSVe9qBXP4Z8ZLKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767047142; c=relaxed/simple;
	bh=DF/ovIEIpw8uEcx7QoYLBL5JXEZhIzafNtwz+ReCewA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgucB4fWEYC5CD479KjCAWoMqyTVvCi+p6HO+dxLqp9pf2M27FNt7VjVnNqREKWmhPbHBX0hU4/+NNKb25kZ8wHcMAjo1h5CNTZN5bW+BLysi7lKD6zF0GRUJMtuJ2BOAz//D9r8J6buvFBTgQY8UGleOkGkuHgk8o/BjqdegTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcrEK56f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7392AC4CEF7;
	Mon, 29 Dec 2025 22:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767047141;
	bh=DF/ovIEIpw8uEcx7QoYLBL5JXEZhIzafNtwz+ReCewA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcrEK56fRuN8R7J7aPGWeNBqj8ytx540Eg6mYyZ2bAMeX0xJUqa3oDZJQhTm7lol5
	 M7/RhESapFF/2pLs7lQ/2XREmpP2+fpjZG4h21M5DDqKPrzOJ0IOhMiHrDwhnkJsVe
	 4GVJs/0WaMaz4LnifPK6MVE5vcLscczsksJRFyL9h1Dx5vV/5J20dt37eVvbK0XzYn
	 NKlKccVlnIXkW6j0Pz10+We0jtdXNgpzAAUzXzfMpBBugluYN1TDfqeQIKZRlsov+k
	 aL/mVOWC8bXa3MMivrFUN2creUUuIVxnbt9P+jjyRjSufXTVvupzYexuu05my4E2wT
	 gs39jrSZnivjA==
Date: Mon, 29 Dec 2025 14:25:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, abel.vesa@linaro.org,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3] mmc: host: sdhci-msm: Add support for wrapped keys
Message-ID: <20251229222528.GA4684@sol>
References: <20251229070507.3322149-1-neeraj.soni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229070507.3322149-1-neeraj.soni@oss.qualcomm.com>

On Mon, Dec 29, 2025 at 12:35:07PM +0530, Neeraj Soni wrote:
> Add the wrapped key support for sdhci-msm by implementing the needed
> methods in struct blk_crypto_ll_ops and setting the appropriate flag in
> blk_crypto_profile::key_types_supported.
> 
> Tested on SC7280 eMMC variant.
> 
> How to test:
> 
> Use the "wip-wrapped-keys-2024-12-09" tag from https://github.com/ebiggers/fscryptctl
> and build fscryptctl that supports generating wrapped keys.

Use the official release of fscryptctl from
https://github.com/google/fscryptctl instead.  v1.3.0 has wrapped key
support.

Note that the tag you linked to was for an older version of the wrapped
key patches that wasn't compatible with the upstreamed version.  So it
isn't plausible that it still works.  I'll assume you actually tested a
different version and then just listed the wrong tag in your commit
message.  To avoid confusion, I've deleted that old tag.

> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Otherwise this patch looks good.

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

