Return-Path: <linux-arm-msm+bounces-48789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D046A3EB1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 04:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E21D19C5F7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 03:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69F11E1A32;
	Fri, 21 Feb 2025 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFDagafo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CBC1E0DBA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740107435; cv=none; b=V0lOt+y7LsC5jRItt4R0vQALT/21JhqipY4ddjzbWRhHg09T+dHyTmMoJEjYilcVYSlKRuorthEBQqHXXOmFT7D5EZUwzLy8IadhZ4AAAigEKM3sB/3yiuEvxDzTOYfPob6xzTVp/2lTmYC3sPYXtsHeqHnCDvxOPMlNCw0lFeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740107435; c=relaxed/simple;
	bh=Oq1X5TNC2tWMxrSbGulpzxocpjGNFsSObQBCaMkillk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/z+Mr3YPEoSxMVRJQRy45WE81GRonqfz0D3MczctY8BYyWl+rGyoWgVr2t2cLR+oc9VLlBgTnmskk3atVRDZCf7MWBcNVk7ickijZlHrgLAXYAsKtmz2ci5TSSdqEGlWXSSa3hLw1BE6fir6Dvi8CAL9QlHan1vL6xxrgsRnaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFDagafo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AECC4CEE2;
	Fri, 21 Feb 2025 03:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740107435;
	bh=Oq1X5TNC2tWMxrSbGulpzxocpjGNFsSObQBCaMkillk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFDagafou7PhexlxWZhuXdvPDLL6bFX4N3BQgpMhHL2C1RXcjgLGkUzdvcvslmmQ/
	 /L8gT3+0dIB3ay+rShwnpTg5cqkkHQ4lDS/md1XkbzO7nJLvnr9T4s7YzGoag+BH8q
	 qj+l84vSD1RWrUq62goAdPGghHffRulNDGNYIoiG4V6Hg4HrqdecrKvrZ1d9x+4eci
	 o53AHHNA0h6BZCCmR+Ga3NTK/1nc1oqq3qcriVH+BufZclZ+/g/dVBfM3gsgFsvUZ3
	 hAGQcwxgY6AVU6Zahao3GoOkhGHM2DmGPDqsYf+UG0x9eYzYqgWWKNvWgzgQwT9Go1
	 7HbHFpHxwungw==
Date: Thu, 20 Feb 2025 21:10:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update my email address
Message-ID: <x5rkidwwklcqspbukzhkx26vldjhnohff6lshezgondltibvwx@e4jadrlop52i>
References: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>

On Wed, Feb 19, 2025 at 02:41:12PM -0700, Jeff Hugo wrote:
> Qualcomm is migrating away from quicinc.com email addresses towards ones
> with *.qualcomm.com.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .mailmap    | 3 ++-
>  MAINTAINERS | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index ae0adc499f4a..f4b927e48ad1 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -320,7 +320,8 @@ Jeff Garzik <jgarzik@pretzel.yyz.us>
>  Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
>  Jeff Layton <jlayton@kernel.org> <jlayton@primarydata.com>
>  Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
> -Jeffrey Hugo <quic_jhugo@quicinc.com> <jhugo@codeaurora.org>
> +Jeff Hugo <jeff.hugo@oss.qualcomm.com> <jhugo@codeaurora.org>
> +Jeff Hugo <jeff.hugo@oss.qualcomm.com> <quic_jhugo@quicinc.com>
>  Jens Axboe <axboe@kernel.dk> <axboe@suse.de>
>  Jens Axboe <axboe@kernel.dk> <jens.axboe@oracle.com>
>  Jens Axboe <axboe@kernel.dk> <axboe@fb.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 950e8b7c0805..815a28c7e6fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19426,7 +19426,7 @@ F:	drivers/clk/qcom/
>  F:	include/dt-bindings/clock/qcom,*
>  
>  QUALCOMM CLOUD AI (QAIC) DRIVER
> -M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +M:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>  R:	Carl Vanderlip <quic_carlv@quicinc.com>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	dri-devel@lists.freedesktop.org
> -- 
> 2.34.1
> 
> 

