Return-Path: <linux-arm-msm+bounces-86980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82BCE9CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA6043002D21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC477261E;
	Tue, 30 Dec 2025 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="urZZMvpE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769AA59;
	Tue, 30 Dec 2025 13:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102461; cv=none; b=Oc5ZZVgFSmyNovPeLYyaflWXlbcNcXAcN/xCd60+q19lyAhj3vjtzTCvYF34zVHhP2c7iQ2G1NNFdaZTOAASa6Aoe6iHfCy19k6U0K1u+glussyUXDUgy1Du5TOgdOa4C/ST95e49MUzQVeQzSKfEOmjbkygl4UpZq0IgxZbaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102461; c=relaxed/simple;
	bh=mxDJL33Kc3e8V4Z31xSzx67G9tUidMS7fxK0LryWXf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4ZyyCbiYp0+FNo9Rr6zn6HuhUrMhZsPGx8gf89H1Nd+8XiL99Hkn5uE2cOkTkekefw4j2BrEIxEdOR+BYQqxUtHSYQs83xOa9/W+PUXopQMaGwArsQLILPYvwH0GkdELN9ChaMVrSe2/4yV9u5Cbq+3gAW25SCcr56rEFMmmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=urZZMvpE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82647C4CEFB;
	Tue, 30 Dec 2025 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767102461;
	bh=mxDJL33Kc3e8V4Z31xSzx67G9tUidMS7fxK0LryWXf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urZZMvpEbsvSCTaFN3l0LsYj9kzUAbfEvnJDH4KpMfc2p7Sxn9H9CHyJZNKTyWnVE
	 IPrK1TXbZSD6+NAVyBIsW27rrd+C7dHt9Vs7qREyG149aP+coMpnZpO6MGzDjTfbe9
	 yvFVT+LN2CDDHiPQQiE/vUeJu66LXTtlyJ2ed7ps=
Date: Tue, 30 Dec 2025 14:47:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	dri-devel@lists.freedesktop.org, arnd@arndb.de,
	dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH v3 1/3] misc: fastrpc: Sanitize address logging and
 remove tabs
Message-ID: <2025123003-ecologist-foothill-09b8@gregkh>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
 <a8c6b4d9-83b6-45b5-9432-134023e2eadd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c6b4d9-83b6-45b5-9432-134023e2eadd@oss.qualcomm.com>

On Tue, Dec 30, 2025 at 02:23:55PM +0100, Konrad Dybcio wrote:
> On 12/30/25 12:02 PM, Ekansh Gupta wrote:
> > Avoid printing raw addresses in driver logs by using %p for remote
> > buffer addresses. This reduces the risk of information leaks and
> > conforms to kernel logging guidelines. Remove tabs in dev_*
> > messages.
> > 
> > Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")
> > Cc: stable@kernel.org
> > Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > ---
> >  drivers/misc/fastrpc.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index ee652ef01534..408fe47e9db7 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -1830,13 +1830,13 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
> >  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> >  				      &args[0]);
> >  	if (!err) {
> > -		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> > +		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);
> 
> Would it be easier if we did away with the uintptr_t, since the protocol
> seems to assume all addresses are u64s anyway?

Why is a pointer being printed at all?  That shouldn't be needed and is,
as always, a potential information leak.

thanks,

greg k-h

