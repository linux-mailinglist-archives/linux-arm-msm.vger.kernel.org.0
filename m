Return-Path: <linux-arm-msm+bounces-88480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DBD1129D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88653300FD5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375FC34029C;
	Mon, 12 Jan 2026 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Q1SSQl16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115DF33F8CF;
	Mon, 12 Jan 2026 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206010; cv=none; b=JNNQYmIYg98mXNCXd0kD3VajdT+JMyDPqf57IfMsNnFwWsSpLr5X8KxGHFqg9wsDESQDLU3sC+rfhmMWiohjl7kP/c8dVrAY8emLUbK2y9LII8E8nD+gZDiJW3nKjfozZ9E+JPvweiELtbFI/2tdgmv4QXQw2l5lsOpTg99q9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206010; c=relaxed/simple;
	bh=OJIX75obaMOz/Rw970G0TtUx5AEZXgro07NB88e8eTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9oyjLZ6z/MJ1JXj67NyL2NLqIuNmaA9t+1V5XBgpHhdZC5lhPlqbpJTTSJVl6+4rKVebnRLcQTHB2zMelfsQnCk+uIyTMca7Qc1m0RvYcr5qakbjpSBQA1l3nov2t948pW9E2gUjN1/m2qKxyhx1bkScHj/6lFHCxjpt9bl+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Q1SSQl16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688E0C4AF0F;
	Mon, 12 Jan 2026 08:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768206009;
	bh=OJIX75obaMOz/Rw970G0TtUx5AEZXgro07NB88e8eTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1SSQl16ggvR8LImiJHhEXcNxEIbgYeaISUse2VIeH9oncmpdDZW/N+TDTi7IsahG
	 +pFPG6BVfSiVZVg2PsFDkBYtvXzxjnHMNK4Hyvgpc7uAQx49K/bbA5BXuYJ3J36WOT
	 bPbFfX2MovL9rNkitUm7srVuEXKmUEGOLhVupSAg=
Date: Mon, 12 Jan 2026 09:20:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: stable@vger.kernel.org, srini@kernel.org, amahesh@gti.qualcomm.com,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [BUG] misc: fastrpc: possible double-free of cctx->remote_heap
Message-ID: <2026011208-anger-jurist-a101@gregkh>
References: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK+ZN9rJypDknnR0b5UVme6x9ABx_hCVtveTyJQT-x0ROpU1vw@mail.gmail.com>

On Mon, Jan 12, 2026 at 04:15:01PM +0800, Xingjing Deng wrote:
> While reviewing drivers/misc/fastrpc.c, I noticed a potential lifetime
> issue around struct fastrpc_buf *remote_heap;
> In fastrpc_init_create_static_process(), the error path err_map: frees
> fl->cctx->remote_heap but does not clear the pointer(set to NULL).
> Later, in fastrpc_rpmsg_remove(), the code frees cctx->remote_heap
> again if it is non-NULL.
> 
> Call paths (as I understand them)
> 
> 1) First free (ioctl error path):
> 
> fastrpc_fops.unlocked_ioctl → fastrpc_device_ioctl()
> FASTRPC_IOCTL_INIT_CREATE_STATIC → fastrpc_init_create_static_process()
> err_map: → fastrpc_buf_free(fl->cctx->remote_heap) (pointer not cleared)
> 
> 2) Second free (rpmsg remove path):
> 
> rpmsg driver .remove → fastrpc_rpmsg_remove()
> if (cctx->remote_heap) fastrpc_buf_free(cctx->remote_heap);
> 

Hi,

Please note, stable@vger is not the email address to be asking about
this, it is only for stable kernel release stuff.

Andn do you have a potential patch to resolve this issue?  That's the
simplest way to get it fixed up and to show what you are discussing.

thanks,

greg k-h

