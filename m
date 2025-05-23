Return-Path: <linux-arm-msm+bounces-59219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9738AC22B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 14:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B1671636D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F46D529;
	Fri, 23 May 2025 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oDO1euXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55627C8CE;
	Fri, 23 May 2025 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003610; cv=none; b=IquAqL6hOCOqv9Wfpr4ikvbTQMd1/hc4oWtbjsRrKVD6y6ncpYq1eQhsBeCcCPD9hBGPCJIEsKTjdwmg5JMv0jKJW/h6IzOKJhk2vxRFKf0ubcYnOlDLGLABi0SvrsPfE7I0shJbzrVTUASZ8FQLyrkh7z1XNiamGnJXpJ6CwxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003610; c=relaxed/simple;
	bh=K2Zf+HkM1CQYn5RZt81AqKAPdkkgrS2on+6QzG/2OCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OG86ad1HVRDmSPTyD1lbUApaa6ReJX4whcQz03IrA8jAEfsp0jhkxTHjPUQv91/xW8uV1zzeGm5nDofAPbYYBFVsfxAPaWDR88ePATO60gDfZWX530+fpQl3qQv+PZD+TVHgjzQGWCpP2pHDVIzmmALKtZ7nYlmvnwqUx1teMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oDO1euXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A02FC4CEE9;
	Fri, 23 May 2025 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748003609;
	bh=K2Zf+HkM1CQYn5RZt81AqKAPdkkgrS2on+6QzG/2OCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDO1euXuFNKK0zUY0V479/m8BfhfD0I7JzQ//PAKM4ti4u1F+p7b6yVQSvebpaHkl
	 CXw04jCU9O2elf84BQI6eDWyVOVqJOnVCvJN4K/2ESL0jeerW1gYQbI+aYx6JPKTka
	 lkdvyF28kZMLN116rTEJDwOk7kcqps1j5yrpQ2Do=
Date: Fri, 23 May 2025 14:33:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: fix compile-testing without CONFIG_OF
Message-ID: <2025052309-goofy-legal-58b5@gregkh>
References: <20250523121152.2292574-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523121152.2292574-1-arnd@kernel.org>

On Fri, May 23, 2025 at 02:11:47PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver builds cleanly only when CONFIG_OF is enabled, otherwise the
> compiler notices an unused symbol:
> 
> sound/soc/qcom/qdsp6/q6usb.c:401:34: error: 'q6usb_dai_device_id' defined but not used [-Werror=unused-const-variable=]
> 
> The driver does not support legacy board files, so the of_match_ptr()
> annotation has no use here and can be removed to avoid the warning.
> 
> Fixes: e0dd9240f13a ("ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'll take this in the USB tree as that's where the offending commit came
from.

Thanks!

greg k-h

