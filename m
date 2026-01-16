Return-Path: <linux-arm-msm+bounces-89419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195AD3304B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA1F130F44A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B2123E342;
	Fri, 16 Jan 2026 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qy/vePDy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB9F23EA85;
	Fri, 16 Jan 2026 14:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574951; cv=none; b=dJNpnmo090JHNP9GxaCOXZNFDyV/nxHCQLPTev2GmQulp/q+NSEtTm6EJJZqBMqPw4j1AOaHsvkEsXeUvC9QMpNy2U4HwckVV9X+wQBEqrwKNuYU2yJxdMrsor0X0kuy3sf/aQ1TUwDvqrKb59W79I0SZbTwdqcZaAAL6hVax1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574951; c=relaxed/simple;
	bh=csX8809TxlEacL4NqwLmTvuhRR/3P1BsmTcEtKkSVxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s99D/MxNorLqWWJV39D1N1Oi/DWM9R36G71gwygYkgXwvTQuQJQABENey7OxvyrM1IMLT0Xh9fKFf/N5YA2zPOGstRWOXP7qRueT7Pa9L5m6cthscQ/1LMiK20bbp61XYYtuH1xtZ8TUFL9TCOx6S1ID4dyC8wAtrqj8Y3qcPPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qy/vePDy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89637C116C6;
	Fri, 16 Jan 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768574950;
	bh=csX8809TxlEacL4NqwLmTvuhRR/3P1BsmTcEtKkSVxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qy/vePDyjSo9d8DBb/EOVPHaVZQe1tQKzz7m2B9pBWsQw2yAyyAXkuyxdaWict8sO
	 5/EKRJH3DMlyC+sfvVFbuIHSf//xXJbAcb0tMv1A6sTI7UxaNXJhooazahfnugllxh
	 +Jm/MuXQQKB/EbRrPU1fCFWVJ84AUihnpQ9Cxw6A=
Date: Fri, 16 Jan 2026 15:49:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	linux-arm-msm@vger.kernel.org,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	thierry.escande@linaro.org, abelvesa@kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <2026011621-fang-moneywise-d6b2@gregkh>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-2-jianping.li@oss.qualcomm.com>

On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.

What caller passes in NULL here?  I did a quick look, and see where the
callers check this properly if it could be NULL, otherwise it all looks
sane to me.  What in-kernel user is causing a crash here?  Why not fix
the caller up instead?

thanks,

greg k-h

