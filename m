Return-Path: <linux-arm-msm+bounces-89420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 200DBD32DC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E03E13002171
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6909B2D7DDE;
	Fri, 16 Jan 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="izZuqtvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4C2D592F;
	Fri, 16 Jan 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575029; cv=none; b=Et8+3eO90JGWrciar3ciZebO/NB4Kgq1bNenZTY6uZpGxcdKIW6w4uaX7GuxmxxovqflwlS8UcVUS3VFZyLUn5w9x6b5DD8O9LBOGWaHbN/uYSh5948bhPydmEOZlbMVjC8brLBLqXazeA/7nQgAysU10wDNBpR1tyQL8DIBvrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575029; c=relaxed/simple;
	bh=uaRfJwf4Okxb8bFSYq8c8NyU75TtxbDLW6QHjymVgnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrwMtQS5E0O/Ex1PegK1cGOkCQyYIMhuPT8g0QaIxSMN2rHkhG4G6GTFSnuC5cl3HPvfaIK3vPIbxPLIKf/qMNZtveRNafz7msZ1APO01Tufo3V2+rQLVGfng25a+p18S4xlrf3SuHfdqhIdOssbIzQfR8zKC2fXBTcTMLSdORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=izZuqtvr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7907AC116C6;
	Fri, 16 Jan 2026 14:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768575028;
	bh=uaRfJwf4Okxb8bFSYq8c8NyU75TtxbDLW6QHjymVgnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izZuqtvr86IymwQB4XunOwmYnLYAK0NiuvpkzbeWBAh1VYm/2e88UJkCstxAJQ7YY
	 IsvIetPqpxKanxvN9f3NxnHcI4J1cd6vWfhBe3tdu+RuEpHoco0PB3qIhFOggtcxQt
	 Po+lIuBeC/FndI3ixKo1M/roSp14/JS8PRaj8y8w=
Date: Fri, 16 Jan 2026 15:50:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: possible double-free of
 cctx->remote_heap
Message-ID: <2026011650-gravitate-happily-5d0c@gregkh>
References: <20260112123249.3523369-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112123249.3523369-1-xjdeng@buaa.edu.cn>

On Mon, Jan 12, 2026 at 08:32:49PM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@vger.kernel.org # 6.2+
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> 
> v2 changes:
> Add Fixes: and Cc: stable@vger.kernel.org.
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)

The version changes goes below the --- line, otherwise it ends up in the
changelog commit.

Can you fix that up and resend a v3?

thanks,

greg k-h

