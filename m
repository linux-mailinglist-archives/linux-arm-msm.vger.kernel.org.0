Return-Path: <linux-arm-msm+bounces-38242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFDC9D128D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B83B282863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E143E19C560;
	Mon, 18 Nov 2024 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ALHrdlvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A881E505;
	Mon, 18 Nov 2024 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731938361; cv=none; b=q+vP0sMrh2mre/l2iWr/FD1Mk4z/J5XGTW48E7Ciz9jiWr5su84WiFzJkY7DEzVi95CwADZeKra7Cin2A2ClZ3dxPwbFrRqkSE+qO0VfXiibaU3VNoBMJ7J2Pl6w3/FAlKghxInOJw2MbW2fxVf3ky6H2EjvRxexycFcZNkrweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731938361; c=relaxed/simple;
	bh=1hOX32bzljIUN/nbRPe/kkvdOtpNeSIZs7HWshfNYfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAPa+PkVhbJOlFLNfZJAW2Q/sCQkSV3rvVDZLbgCjE/jep+Syj7gNOjLuGFwCVBGuYbUC0cbwfD7ZCFO1Za+y3yZN4zcQn8xbmgsqnol9C641wZfKGppW/lvKe4NffnzskdHHGJAg4aTNgZCpU2vFUyghCT6f+fl7sl8zIAZ59M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ALHrdlvp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616B8C4CECC;
	Mon, 18 Nov 2024 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731938360;
	bh=1hOX32bzljIUN/nbRPe/kkvdOtpNeSIZs7HWshfNYfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALHrdlvp+GKKKIx3lZ2w6q7k0bgfA0vAZd9LKVd46KYtJN/GfeYU3hVlmodz5tFiW
	 2C/39WmPYS19Qw6HZNVN3OIVByPIWWOsuGVkWrI78aUeRepLhUU3Phm5UiBR4aSBxR
	 C5c6X7BebqGt9b+b1PavWw2Sl7Enw4JhDp0vguCI=
Date: Mon, 18 Nov 2024 14:58:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 3/4] misc: fastrpc: Introduce fastrpc_shared.h header
Message-ID: <2024111832-sprinkled-boastful-8fba@gregkh>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-4-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118084046.3201290-4-quic_ekangupt@quicinc.com>

On Mon, Nov 18, 2024 at 02:10:45PM +0530, Ekansh Gupta wrote:
> Move fastrpc structures and MACRO definitions to a new header file.
> These definitions are consumed by other upcoming features like
> debugfs, PDR support etc.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc/fastrpc_main.c   | 136 +---------------------
>  drivers/misc/fastrpc/fastrpc_shared.h | 155 ++++++++++++++++++++++++++

Again, why not just "fastrpc.h"?  No need for the huge prefix here,
right?

thanks,

greg k-h

