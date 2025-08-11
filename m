Return-Path: <linux-arm-msm+bounces-68387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09286B20CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C644B16932E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8607A2D3750;
	Mon, 11 Aug 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnKoAciD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5746320013A;
	Mon, 11 Aug 2025 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923751; cv=none; b=E1gwm+ghCQzriuCh4eq2EeC3abKK3sxwe8ud9LtswuycEhLkaTszDtLuzGoGO3QOfNQfbfiLUOUiEoJAU+3AztBKO8VeeVYhDM5rhw586KZaO9vjWmafRCLI8+CUbZlcW7N1ktOO8yEX6qxQNWvm6/TLspXJ5fHoFEWTdkyWZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923751; c=relaxed/simple;
	bh=vCUo3epKDIn/N8ESfA2yXcc6GTKlDp2HtObAy1V8xDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kq8E8LCQHOV44qzF0kxL+gvwQ9F4rdXXR+565R/LkdS3heUzOpsCDB3xIC8b7xkRvqNTAEvsVnAnfa9TvAW0LHkKI2TonTb0V4cHuZjC9Isw6aDqszb9KIU0a1yjzNeeUu9/r5MsDnZDWM6CrscgMBzoIX2rughWgf4sEDEjplA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnKoAciD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76058C4CEED;
	Mon, 11 Aug 2025 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754923750;
	bh=vCUo3epKDIn/N8ESfA2yXcc6GTKlDp2HtObAy1V8xDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnKoAciDpZakRBMUmdVKurYTYJuRBquwDIgq7AFWg/IO4b/vrqkjXo/YvRLWsjBPL
	 5JkM78OaV1QOslfSOcLEI0texldWfFgz/pDmMqYlV34Xp3NeuEcQJM4fkrGYP4Blbr
	 LLyL+aT99B2tROI1OVgwHE/UTCF/wt5Evj3Y2S9vgJevupz/FY/pU5ZWuC1LxFokaC
	 6yyJ3m7zzawJ8ZOE6xqTc0VoDQuDBU/hxPxdLKdjAfda1IkpjzQMoLp1SFYt4QyXje
	 RThCCST8gu4WkZDzsUL1dHHSlnyDgbLPFqwBsV1IPjyQyAIA6NsGNzJuD30OMW3FGC
	 foybOIMPaK/rw==
Date: Mon, 11 Aug 2025 09:49:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Update MAX_NUM_OF_SS to 30
Message-ID: <obqkobpnuccfsqvytoltspw5wh27zyhyankt6dju2u32y73odj@3gzhuicheqd7>
References: <20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com>

On Fri, Aug 08, 2025 at 10:14:17PM +0530, Mukesh Ojha wrote:
> In the latest firmware for Qualcomm SoCs, the value of MAX_NUM_OF_SS has
> been increased to 30 to accumulate more subsystems.
> 
> Let's update so that we should not get array out of bound error when we
> test minidump on these SoCs.
> 

But this number is used to size the minidump_global_toc struct, which is
used to describe the content of the smem item - and this item didn't
grow on old platforms.

Doesn't this imply that on older platforms you've now told Linux (and
your debugger) that it's fine to write beyond the smem item?


It seems to me that it would be appropriate to check the returned size
of the qcom_smem_get() call - in particular if the size of the item
isn't fixed.

Regards,
Bjorn

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 8c8688f99f0a..dbe3bf852585 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -28,7 +28,7 @@
>  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
>  #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
>  
> -#define MAX_NUM_OF_SS           10
> +#define MAX_NUM_OF_SS           30
>  #define MAX_REGION_NAME_LENGTH  16
>  #define SBL_MINIDUMP_SMEM_ID	602
>  #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
> -- 
> 2.50.1
> 

