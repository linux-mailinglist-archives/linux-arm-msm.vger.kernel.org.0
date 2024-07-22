Return-Path: <linux-arm-msm+bounces-26715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB6938A39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2201C20F91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E1C5380F;
	Mon, 22 Jul 2024 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LfywjiTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05E1F943;
	Mon, 22 Jul 2024 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721633981; cv=none; b=QEvIghVZldq3h3CUzIpwzrgUf3g8mZd8h8YqBSxpshSACNDU+hyG14R4ava/zC65FKM9qWARzGhp113GsG9/lZPqF9GnvwnJZ5C8e3xMEQKuEY7ZlNuishXKC+b4crJSKmbooOWuUJgcDBduE59u5C8BrVSlF2Lxq8hzBhWFuoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721633981; c=relaxed/simple;
	bh=824pP1iK9VhmN65PhNriTvUG1w+JpngpsQe+FpwGwx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHDMZ56dhqlXgCWhEl0PgcAVQgsPzQQlDnjUtbAeF87XePAaaEkC6wxnEdOMfFAyurSbOsObtlgXJtN2TFuxE+V+C4mTE99cwtz7PXZCXoNei5WcWv00xytQNExfJwjAK7+NihyPj/DeIHDq+e/E6Z3tiCxDq8aWNgyx2RS6NPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LfywjiTh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D40C116B1;
	Mon, 22 Jul 2024 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721633980;
	bh=824pP1iK9VhmN65PhNriTvUG1w+JpngpsQe+FpwGwx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LfywjiThkIMmuOu2ytMk7TmnpAbwvnez32yMdeHyPuY//m8+VdsGqMag0uzhYZdk8
	 p7KHnlZD/ZrWTXHId21I6hUsq1xK3pSQhoXtdk4dfPIV6Z6y/aZ2amWc7kZbMVinKs
	 F102SNTVfRQJBnSEpCK8pDG8J1Hx/vLfGND2xyZg=
Date: Mon, 22 Jul 2024 09:39:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v5 1/2] misc: fastrpc: Define a new initmem size for user
 PD
Message-ID: <2024072227-purposely-swinger-86ad@gregkh>
References: <20240722055437.3467900-1-quic_ekangupt@quicinc.com>
 <20240722055437.3467900-2-quic_ekangupt@quicinc.com>
 <2024072234-slug-payer-2dec@gregkh>
 <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <607362f2-8ae5-46bd-a3a4-2d78da98b12a@quicinc.com>

On Mon, Jul 22, 2024 at 11:42:52AM +0530, Ekansh Gupta wrote:
> 
> 
> On 7/22/2024 11:28 AM, Greg KH wrote:
> > On Mon, Jul 22, 2024 at 11:24:36AM +0530, Ekansh Gupta wrote:
> >> For user PD initialization, initmem is allocated and sent to DSP for
> >> initial memory requirements like shell loading. The size of this memory
> >> is decided based on the shell size that is passed by the user space.
> >> With the current implementation, a minimum of 2MB is always allocated
> >> for initmem even if the size passed by user is less than that. For this
> >> a MACRO is being used which is intended for shell size bound check.
> >> This minimum size of 2MB is not recommended as the PD will have very
> >> less memory for heap and will have to request HLOS again for memory.
> >> Define a new macro for initmem minimum length of 3MB.
> >>
> >> Fixes: d73f71c7c6ee ("misc: fastrpc: Add support for create remote init process")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >> index a7a2bcedb37e..a3a5b745936e 100644
> >> --- a/drivers/misc/fastrpc.c
> >> +++ b/drivers/misc/fastrpc.c
> >> @@ -39,6 +39,7 @@
> >>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> >>  #define FASTRPC_CTXID_MASK (0xFF0)
> >>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
> >> +#define FASTRPC_INITLEN_MIN (3 * 1024 * 1024)
> > Meta-comment, for a future change, why not tabs to line things up?
> Sure, I'll add a comment.

I didn't say anything about comments :(

> Should I line up all the MACRO definitions? If yes, should I send it as a separate patch?

As I said, yes, for a future change.

> > How was this tested?
> This is tested with fastrpc use cases available in hexagon SDK:
> https://developer.qualcomm.com/software/hexagon-dsp-sdk/sample-apps

Do you have regression tests that attempt to check the boundry
conditions and alignment here?

thanks,

greg k-h

