Return-Path: <linux-arm-msm+bounces-9571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC56847554
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 17:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDAA9B25AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 16:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407D01487F2;
	Fri,  2 Feb 2024 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZtYT1DD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CFF1487D7;
	Fri,  2 Feb 2024 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706892522; cv=none; b=ks41j6Q1tOs6M0U4ytknJiyx/ilePndxrYQD6VVNZwFcLoHjXfO3KfQTL0266rfTYmoHeePTfBAatTMjDntTQvD6c+0vWzdh0/6Er4RAn6ihn2rfvAPScAZpNzmjHSoTXyW/tM6dd/ZxE9cKrxO2lnAdB5qKIMD4afW6X2Gbf0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706892522; c=relaxed/simple;
	bh=EbkrZHamoryIveu/uQcUGTpGf6Y+jVk7X50IxXDLBUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMgp97fkxpuc+0sR50JrrSuwPXcy+JW7U86oBmanBVyY+W1tr3u3C+8HMVQubtPMTVjmAbroC3M1Ev82ankQy0xDjHir36OdzFRwc+SqeaCB9+7DMSFCZNv0r5hYTjqU3u8CeTFZtQDAwyKfxt6SCFymiw730UIHq5mUZUqsI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZtYT1DD/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56767C433C7;
	Fri,  2 Feb 2024 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706892521;
	bh=EbkrZHamoryIveu/uQcUGTpGf6Y+jVk7X50IxXDLBUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtYT1DD/lnVBol4DtgDfUCQMqjVjNi163R6zdvZF6g8B8lE8fyGXhBlaUmDQRe+UM
	 GyrUv+JO11UDHBpa8vxJUTyiiDtS6RAEq9RL2x191+iFLj9/ijXFO0lwwV58bX04lE
	 l12jQ1IZ05Hg8BZjyoV44Ofah3/W4j1ewt4UzFpo=
Date: Fri, 2 Feb 2024 08:48:40 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: corbet@lwn.net, carlos.bilbao@amd.com, avadhut.naik@amd.com,
	alexs@kernel.org, iyanteng@loongson.cn, 2023002089@link.tyut.edu.cn,
	quic_bjorande@quicinc.com, quic_tsoni@quicinc.com,
	linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Fix
 Trilok's email
Message-ID: <2024020223-eskimo-armoire-a517@gregkh>
References: <20240202164119.4090703-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202164119.4090703-1-quic_jhugo@quicinc.com>

On Fri, Feb 02, 2024 at 09:41:19AM -0700, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain have long been retired and any
> messages addressed to @codeaurora will bounce.
> 
> Trilok has an entry in .mailmap, but the raw documentation files still
> list an old @codeaurora address.  Update the address in the
> documentation files for anyone reading them.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/process/embargoed-hardware-issues.rst             | 2 +-
>  .../translations/sp_SP/process/embargoed-hardware-issues.rst    | 2 +-
>  .../translations/zh_CN/process/embargoed-hardware-issues.rst    | 2 +-
>  .../translations/zh_TW/process/embargoed-hardware-issues.rst    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

I think we need an ack from Trilok for this :)

thanks,

greg k-h

