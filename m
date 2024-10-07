Return-Path: <linux-arm-msm+bounces-33342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E0992796
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 10:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC561F22B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAAF18C32B;
	Mon,  7 Oct 2024 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kqho0iqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E521718C323;
	Mon,  7 Oct 2024 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291234; cv=none; b=YT5ixE2igbU+dcXaXAlxmHsIONM6n0ZlxWx1KN5j8LHdh3gBPUz6fEsRif2FZOGbcxFjcpNt6phdQ4irEM/7P2o6/mtQQanuSKGUwizMtjFv3k0VRH6I8x7T++obJQ+XWVRTmf5gaiqNJEP07G2wj+NBMQ+zfgsdjnj8OCj59Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291234; c=relaxed/simple;
	bh=E2I90VCXa15X8OJoy912t8r09Tnx1ElPcXygHzsZoTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnDoBbttvpGvAsVbfIInCv1YpsoTig4rg9FVkcjM6ncxBsq+oH1sqY6Tc4Ecqj5wqT9xFaoL9AwjIYvXczf0hVS6AXxa9or7RAH6NqxrSLVrKnnMxUv9l184VWjK5dTC8ne6YAq8BivKlxr9g4JMIPtc0FuDdNvm5ypZo7IQWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kqho0iqB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF99C4CEC6;
	Mon,  7 Oct 2024 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728291233;
	bh=E2I90VCXa15X8OJoy912t8r09Tnx1ElPcXygHzsZoTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kqho0iqBAIwP4ObeAIYcPtMMQsRM6NKxQgQEgmDvbeDlaFhmISv/2RwgaCJWkvrUz
	 7KKTyeoA5evF+h/wbDcXYw+5OYy1TWJXHir3ipFQVimA/Gp6yXWncEFHMjimS92UFy
	 HNJZkyw+ypfWflNhCGvvT7qishMH1qRmXu0mX4+Q=
Date: Mon, 7 Oct 2024 10:53:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <2024100729-overall-sugar-d3b8@gregkh>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>

On Mon, Oct 07, 2024 at 02:15:15PM +0530, Ekansh Gupta wrote:
> +struct fastrpc_invoke_v2 {
> +	struct fastrpc_invoke inv;
> +	__u64 crc;
> +	__u32 reserved[16];

I'm sure we have been over this before, but if you have a reserved
field, you HAVE to check that it is zero if you ever want to use it in
the future.  As you did not check it, just remove it from this structure
as obviously it can never be used for anything.

Your internal review should have caught this, if not, please go fix it
AND get some internal review and signed-off-by before submitting this
series again.

thanks,

greg k-h

