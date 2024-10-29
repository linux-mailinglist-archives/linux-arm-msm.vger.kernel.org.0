Return-Path: <linux-arm-msm+bounces-36247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F29B406F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 03:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83D121F22E66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 02:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B271DC1BF;
	Tue, 29 Oct 2024 02:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YWnQ2jN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807FEEC5;
	Tue, 29 Oct 2024 02:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730169051; cv=none; b=DMqNCsPo7FLYkpLzlLR7TNjJncieHCDlKOFs9UCNVjCYJxtTmTBVagHtrH2udUAxwzquNZek4tRxdoB8+cOrou95OpxlK6tqiFiI/LjUNBsL5GQkyvErAmH7d3HY5MANLNLDrgvttsrInkKx6wI3ejiMfQaF2vVlBZEcFPoS15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730169051; c=relaxed/simple;
	bh=1kmTNFnha+cuoLiKpSVYFt8MLtaGK8hGfImP5zTdy4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=or1fIGihUZSNNBNxZqr557AIRKQjDvpUqegzQIOfXg8X/P5HJyMmnz85BUSAAhoNVSqq53uxLJRcOw/dUVKtiriW0bukVsfLOP5t4QXqySgwacFwaxB0gytGgSUuR8bBdHHtnO0MJFaHGj0uK8GdMdjNYOFx0/lSUa8zbc+99IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YWnQ2jN1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA916C4CEC3;
	Tue, 29 Oct 2024 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730169050;
	bh=1kmTNFnha+cuoLiKpSVYFt8MLtaGK8hGfImP5zTdy4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWnQ2jN10Bc6MRI2Z+gtH4OXgjXgryXTrLN1EOe2flM6tviQQjWeXCNjGkKTyH427
	 wCrTJEjPNtFdhwJLrbgvlAByLaeayPopDiseGeIO6eUk6C1RK3F9ghtNhEV3hQJKoy
	 Zd8P2rJCSpVWgoVClI6E4PWRuACljrSzDzXT/gVQ=
Date: Tue, 29 Oct 2024 03:30:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Subject: Re: [PATCH] usb: typec: qcom-pmic: fix uninitialized value hdr_len
 and txbuf_len
Message-ID: <2024102927-colossal-shore-0f46@gregkh>
References: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029021823.1978-1-rex.nie@jaguarmicro.com>

On Tue, Oct 29, 2024 at 10:18:23AM +0800, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. It makes no sense to print message header
> and payload. It is also not safe to print uninitialized length of ram.
> 
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>

What commit id does this fix?

thanks,

greg k-h

