Return-Path: <linux-arm-msm+bounces-38241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A379D1285
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:58:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1011F230EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C84E19D087;
	Mon, 18 Nov 2024 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Lu2hxGnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48F11E505;
	Mon, 18 Nov 2024 13:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731938322; cv=none; b=riwfbdv+foQf4AZkl67uN0sQPcVorlcxPdSz/vYukbs1FG6y9e8rX6bhGsXWXTbTcNsHiM6F3aEXFZrxUUnvZ84qOmteOtCGcehEBMVT8JOkaDzGU02BlSZ2zbM0dHF0RAUBORR7JA14PT2QZo8owZOm+hbDNReDUdyPE3NhkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731938322; c=relaxed/simple;
	bh=Ln772x+8XbbWv8tq9JOMbr/rUEqekRWvei2su2sXB6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2gyVdT/RidcZD5d9fDhdXe8x2O/A0feEMZXRqR+kJsKl4IIlDBEsCjYc1VTVe8GSIGvIr3ycamuIP5m2DkUiR0VCH46sVZszjeHimz0BwiCt5/d4dgZhhPR3yuQoF1dTQX2ToG6qlIDxlhKbE22RlctR35G+DNu5smEi3qz6KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Lu2hxGnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEDDC4CECC;
	Mon, 18 Nov 2024 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731938322;
	bh=Ln772x+8XbbWv8tq9JOMbr/rUEqekRWvei2su2sXB6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lu2hxGnr1E+QPhP+nctrw6peXRjd8Tfe/PR+8nTVEpm347kARkhncxB7p6eVVyEg1
	 eE6/xVj+PkoG6DEo+2pcYwkd9zecglrJzIoRUMZTqUQf9DukNkofNwUVTNKVXfon1t
	 GS4urqcp/U1VK9s8tcmgrcsv/84qDqaW3ki46Am0=
Date: Mon, 18 Nov 2024 14:58:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 2/4] misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
Message-ID: <2024111841-egotistic-unranked-ad4a@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084046.3201290-3-quic_ekangupt@quicinc.com>

On Mon, Nov 18, 2024 at 02:10:44PM +0530, Ekansh Gupta wrote:
> Rename the main fastrpc source file to accomodate new files to be
> compiled in the same kernel object.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc/Makefile                      | 1 +
>  drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} | 0
>  2 files changed, 1 insertion(+)
>  rename drivers/misc/fastrpc/{fastrpc.c => fastrpc_main.c} (100%)
> 
> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> index 77fd2b763b6b..020d30789a80 100644
> --- a/drivers/misc/fastrpc/Makefile
> +++ b/drivers/misc/fastrpc/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
> +fastrpc-objs	:= fastrpc_main.o
> \ No newline at end of file
> diff --git a/drivers/misc/fastrpc/fastrpc.c b/drivers/misc/fastrpc/fastrpc_main.c
> similarity index 100%
> rename from drivers/misc/fastrpc/fastrpc.c
> rename to drivers/misc/fastrpc/fastrpc_main.c

Why not just "main.c"?  You are in your own subdir, no need for the
fastrpc_* prefix anymore, right?

thanks,

greg "naming is hard" k-h

