Return-Path: <linux-arm-msm+bounces-27373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B7094094E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 09:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA5BC282E0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 07:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD82042AA5;
	Tue, 30 Jul 2024 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JILJ8j1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5D638B;
	Tue, 30 Jul 2024 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323812; cv=none; b=Zo4NiBHb3M3yeFiBgV2Ue1cBhkszF4LVCbN0kGVfAsNd2FSqYyTohM+B14vr9io9LKMyrwkkAfzADQVMka/2YPhOo2CRfuj8hKgwg+IAa5RKlMD3+Ifp8ea1w8H3qaJBVNm9WWtZ2SzSUGOjd61Z7s8X0zzfZY2HsxiKPfZeSKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323812; c=relaxed/simple;
	bh=pKfR2aAxJhtBTjH4mpIuTlU+Nn+oYS61uadCT8BtRa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChN14TtOKSUcdBW+lHXS+XbBkouUmsU8w9W6t3LVjMDZVkPfq7N6q4qGkPibV1sifgtHTYG02YNicP05DgmKmDRzGSwQfjYET7vQpsSt/fzvmLLETKj3KxMYsE+X3S9hDthibpFR1xEdrT443SP87m36WVZF3TetsxPg2DW1rO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JILJ8j1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED3CC4AF0E;
	Tue, 30 Jul 2024 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722323812;
	bh=pKfR2aAxJhtBTjH4mpIuTlU+Nn+oYS61uadCT8BtRa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JILJ8j1luojhCnPGJ7x+Hei/Htq0+AehkP336uLgs0y0eGbngKUPjT2OsaiJmhW4U
	 IQFlF5xfDEeC5c3AzRCYHzSfJhQJk5TFe5nkkKlM/zUm5OIUlUQl9SuhLAbdHV+fuI
	 tXcm2cy5eZksXfAI/x68Ts0fyq9P3q/LsNmnPE7o=
Date: Tue, 30 Jul 2024 09:16:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Singh <quic_abhishes@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_ktadakam@quicinc.com, quic_chennak@quicinc.com,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] misc: fastrpc: Trigger a panic using BUG_ON in device
 release
Message-ID: <2024073007-nickname-payee-20c8@gregkh>
References: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730070945.4174823-1-quic_abhishes@quicinc.com>

On Tue, Jul 30, 2024 at 12:39:45PM +0530, Abhishek Singh wrote:
> The user process on ARM closes the device node while closing the
> session, triggers a remote call to terminate the PD running on the
> DSP. If the DSP is in an unstable state and cannot process the remote
> request from the HLOS, glink fails to deliver the kill request to the
> DSP, resulting in a timeout error. Currently, this error is ignored,
> and the session is closed, causing all the SMMU mappings associated
> with that specific PD to be removed. However, since the PD is still
> operational on the DSP, any attempt to access these SMMU mappings
> results in an SMMU fault, leading to a panic.  As the SMMU mappings
> have already been removed, there is no available information on the
> DSP to determine the root cause of its unresponsiveness to remote
> calls. As the DSP is unresponsive to all process remote calls, use
> BUG_ON to prevent the removal of SMMU mappings and to properly
> identify the root cause of the DSP’s unresponsiveness to the remote
> calls.
> 
> Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..bac9c749564c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -97,6 +97,7 @@
>  #define FASTRPC_RMID_INIT_CREATE_STATIC	8
>  #define FASTRPC_RMID_INIT_MEM_MAP      10
>  #define FASTRPC_RMID_INIT_MEM_UNMAP    11
> +#define PROCESS_KILL_SC 0x01010000
>  
>  /* Protection Domain(PD) ids */
>  #define ROOT_PD		(0)
> @@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	fastrpc_context_get(ctx);
>  
>  	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
> +	/* trigger panic if glink communication is broken and the message is for PD kill */
> +	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
> +			(ctx->sc == PROCESS_KILL_SC));

You just crashed the machine completely, sorry, but no, properly handle
the issue and clean up if you can detect it, do not break systems.

greg k-h

