Return-Path: <linux-arm-msm+bounces-45113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF691A11FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DAAB1604EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BF9248BA4;
	Wed, 15 Jan 2025 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqrVXhyC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866D6248BA2;
	Wed, 15 Jan 2025 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937484; cv=none; b=Zq/l4QpVQS4jkW9Phbw2GUJ0WWlXOR4ehrct+yKWwinPWk8Tlbx7zkR+22/GjvQktl5OGBhKjU795t6pegk6OpJQPJ5a2KbK+BA3Ksaiu3DtRJtGr+IbTXlvQbAqahMsFLcF7514JJdQBa6guCxRzRA/ZhU799Gq1947H2vspNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937484; c=relaxed/simple;
	bh=5tJ3GG+Xjhbdz976ZyCxKuJDndXqLpRUBYR7JSi4Ie0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvoiYhAWeQsDxOpgOqOMpJmSdDDlsM1k61ylG9xCxAPkgM7gV06so0trGutIkcnVDZGavAdkicxnv0b6sLo46ATNNXscds25PJdB34dbbbIH1ynFeQRqwrdWI01VDlNjDp5yFfih4nUmcnS+zfjEjjh/eGrV8YnKU50t4B1VInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqrVXhyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A63C4CEE8;
	Wed, 15 Jan 2025 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736937484;
	bh=5tJ3GG+Xjhbdz976ZyCxKuJDndXqLpRUBYR7JSi4Ie0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VqrVXhyCEmUHQXjMZmt15GhqsU74xwjNqHaJdbAlmPRFSzpca4jlMEnr2ohx5Q4b7
	 nAHgu8c3o9umvuiaqMPCmV5Tnl3N8KNKFp0U00W7r6Y/IGcH7gnSOA0Xls/mAy2+5H
	 mwn3RvKVabHdTAKDhGYeZzmYAXw5wqu6j7c8Q+Fb45rnfKMJeYXKiZ/EdoyMRFFX/U
	 VsblyM6miYhPQXb0b9il+7O0OFlWv6p1T9sqZZLwifdSZqS/xwt4CN7phyYG3vaziC
	 dtz9rsbQXs27lDkgUGmAJNJDNft84ANNPK7o1ENoHs3h032+VtLHRw03U9pks8XYHF
	 e4tnKgrMAeMnw==
Date: Wed, 15 Jan 2025 11:38:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ricky Cheung <rcheung844@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/3] arm64: dts: qcom:
 msm8916-xiaoxun-jz0145-v33: Add initial device tree
Message-ID: <euv6b7vwb6zjcjw4mennpiwu3hvqd6zvwvabmc7trzll5zowac@5jjfglfoip5w>
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>

On Tue, Jan 14, 2025 at 10:46:47PM +0800, Ricky Cheung wrote:
> 
> 	https://github.com/msm8916-mainline/linux/pull/386
> 
> Note that this is my first patch to the LKML, so if there's something I
> did wrong / the patch is missing, please point it out.

Please slow down a bit with submissions, so one patchset per 24h. You
sent three within 30 minutes, not leaving us much time to do review.

Best regards,
Krzysztof


