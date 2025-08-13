Return-Path: <linux-arm-msm+bounces-69040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0F5B2530B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 20:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3369A5C013D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 18:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EFB2E5B3B;
	Wed, 13 Aug 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlN2WNIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7AC2D8DC5;
	Wed, 13 Aug 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109728; cv=none; b=lg0tsRXuOMlkx5g4gtMJECNQx+PhJcvEfSBn0/4yjGYIdWsfgj7VvqxWWy4IWaQEYxrAYCrnL50bkbr4jar3JbTZu8O3VZkx9wobEssKiCkaLHNiP0R6RQF2+54uF2/TEpQOtDbpkvP13v0/7sOW8pHdjnZVXwqO0doA+Cc/4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109728; c=relaxed/simple;
	bh=0pN6zJ59cUFTkBcTA4HOwUYW7xgiGd+cBDcCJZwybjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyy9LDw+ruolcX0/fZ+GGlfuiWdHTUvAelNfEm6lH8pfBY7C2wxNXgp6vwPLv89nvsZ7gKKVynEwMD65OzTXB8PiBE499lXVGhq1HXoczKdBDbUEFh4K+aRJc1/czIdIyrNofnjIVMyMzHa7EE7QLgnRolELkP9r/Gt7yr3Gqu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlN2WNIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343D4C4CEEB;
	Wed, 13 Aug 2025 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755109728;
	bh=0pN6zJ59cUFTkBcTA4HOwUYW7xgiGd+cBDcCJZwybjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UlN2WNIYYKJuoL8/IXKr4g1U+grYS5lonEZyikuUaHmIdXzNGdM34HJsM50vVj5cx
	 7S+UJrVXihtv+HBtZEwauN4OxSQQAkDgKA/Bh4CO82PTFNhJYexSxjNAnqcCuBiQV0
	 8YGcnr/S8Hr+/IC51bdROFQUydjGaDB7+7AIG45RY6fhp0+YbExwk3vWeu0lbesCRY
	 Ink/X0/zpSUWbibj1C99CsEHdFkMB+9SaD+6wmUPZ4ImA+ZSLZydjGLiQHbfZYfWki
	 YKZso2jB35Z6W8nsMHFd4NQ/G2atFwu6d3A33CXoTt3LfzPl/q6PwPZUIIDuf47P/f
	 ZSk/BscUcN2UQ==
Date: Wed, 13 Aug 2025 11:28:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Icenowy Zheng <uwu@icenowy.me>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 16/21] reset: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aJzZXvSjoAVa8kjF@x1>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-17-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-17-wsa+renesas@sang-engineering.com>

On Wed, Aug 13, 2025 at 06:15:02PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/reset/reset-intel-gw.c | 1 -
>  drivers/reset/reset-qcom-pdc.c | 1 -
>  drivers/reset/reset-th1520.c   | 1 -
>  3 files changed, 3 deletions(-)
[snip]
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> index 7874f0693e1b..3ec22ae1fac1 100644
> --- a/drivers/reset/reset-th1520.c
> +++ b/drivers/reset/reset-th1520.c
> @@ -78,7 +78,6 @@ static const struct regmap_config th1520_reset_regmap_config = {
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> -	.fast_io = true,
>  };
>  
>  static int th1520_reset_probe(struct platform_device *pdev)
> -- 
> 2.47.2

Acked-by: Drew Fustini <fustini@kernel.org> # for reset-th1520.c

