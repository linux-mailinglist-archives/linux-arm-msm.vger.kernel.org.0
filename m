Return-Path: <linux-arm-msm+bounces-43109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59C9FACFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EC19162F63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146143D561;
	Mon, 23 Dec 2024 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gcVDgmau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F12AF1D;
	Mon, 23 Dec 2024 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734948607; cv=none; b=g3euWVXY8E1jNBKKINJFa/MZPJhhUdTBvSIch5V65XhW8PIppgAdbK59+GmuIR1ET3rPBjO+4yq6h/6ELFHdWF9qty8Ad4y/5jhbOQdV1ngd684xdHBuCrBQ2BfNNld5hwRpnuuuaVvm6+6oarihQ8vkcxXRLTFhqag+o+1ceMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734948607; c=relaxed/simple;
	bh=P+bpxQJu2PrdwHTC860KzlnArPutkjpYA2HOnkfVLa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4DFTJpWhM7CApLFHBVDqsN5Q+CFnVuiL0EzSBQ6Vm6lkD9ev9MmJP7KxDtJjPJ4RFF8B+auiuUKi75AuLaetMoU5kgtmIU4/eB3bPvq+TNSuiyXswlL3FpE4FcDUI6OT0NWHPt8aE88QEDshMNfUn5V9t71JJZerN30j6flBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gcVDgmau; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA18EC4CED3;
	Mon, 23 Dec 2024 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734948606;
	bh=P+bpxQJu2PrdwHTC860KzlnArPutkjpYA2HOnkfVLa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcVDgmaukLtfGSCVNDAcxZiwT01oqTDv1Ez6LVJhbTT/Ka9wMVPMQKoH70M+IDBYk
	 9bOqI4ofjBeMnVFTXIdLInHacD4D5Wer5bHsb7j+yz9FTUdHA1XRQwJQDnophc0tHZ
	 /opESnGfBvCfYpHIuepjJngq/mbHyxx7UD/urSAE=
Date: Mon, 23 Dec 2024 11:10:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anandu Krishnan E <quic_anane@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, stable <stable@kernel.org>
Subject: Re: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly
 in error scenarios
Message-ID: <2024122343-java-exposure-bf50@gregkh>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
 <20241223100101.29844-2-quic_anane@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223100101.29844-2-quic_anane@quicinc.com>

On Mon, Dec 23, 2024 at 03:31:00PM +0530, Anandu Krishnan E wrote:
> During fastrpc_rpmsg_probe, if secure device node registration
> succeeds but non-secure device node registration fails, the secure
> device node deregister is not called during error cleanup. Add proper
> exit paths to ensure proper cleanup in case of error.
> 
> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Shouldn't this be a stand-alone patch, not part of a series, if you wish
to have it included in 6.14-final?

thanks,

greg k-h

