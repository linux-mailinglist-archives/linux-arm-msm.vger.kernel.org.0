Return-Path: <linux-arm-msm+bounces-25265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B993927415
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2DC0B20E09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C76C1AAE13;
	Thu,  4 Jul 2024 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dyzjxpkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8141D696;
	Thu,  4 Jul 2024 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720089062; cv=none; b=pA3TOPxUBJOET9uRPlYnAdKqnQBYN2C/4VHl/3vXuDiQC28QMWJlFZ61V48dP55d3B6AMEUfpvFHVXFEFuyQz+PHxRTSePo2VMWQGY1SKlDxlLNUu7DJJEHIoag2UQwrQTbmwbBOcwSEqdrcduLF5R/DfuT6IEDuiIvdClTht98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720089062; c=relaxed/simple;
	bh=C8l38Gau8MC6t9TrWA/cf7KkjWdft7GxiSnUje0MZW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjiFZBIX2X+7yTnAxY1eoV3xJ89Pw/HsGkbjVINSXwb/Iki45CQ03blVzbWoKXip5+60YyFxus+5VbdnBlUNghmtLL1/fu7kKOFscanfDNovlnuZ9jO3Mcr0hwsfuC/dgBiHWIOIBFcqfPTQL/wnDhl0V5yR69jFlVpuXVVhPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dyzjxpkb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F72BC3277B;
	Thu,  4 Jul 2024 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720089061;
	bh=C8l38Gau8MC6t9TrWA/cf7KkjWdft7GxiSnUje0MZW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyzjxpkbLC7wh+rNOHntimlXCJht/KWfO+hfnLPJfiFyf4+hfwEm+2ofCltS8HoEQ
	 qCSySe5HOw380GXe1Cde8eeSb+Gfv+bUXvqYKM4xSDfThb7SdD9atIEZ8JIDJ2qcsK
	 6RcYAc9MWL7CTk9Z+q8u5EEBdHNsBIvk+VrYHmv8=
Date: Thu, 4 Jul 2024 12:30:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] serial: qcom-geni: fix lockups
Message-ID: <2024070445-stunner-scrawny-1b03@gregkh>
References: <20240704101805.30612-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704101805.30612-1-johan+linaro@kernel.org>

On Thu, Jul 04, 2024 at 12:18:02PM +0200, Johan Hovold wrote:
> Since 6.10-rc1, Qualcomm machines with a serial port can easily lock up
> hard, for example, when stopping a getty on reboot.
> 
> This was triggered by the kfifo conversion, which turned an existing bug
> that caused the driver to print discarded characters after a buffer
> flush into a hard lockup.
> 
> This series fixes the regression and a related soft lockup issue that
> can be triggered on software flow control and on suspend.
> 
> Doug has posted an alternative series of fixes here that depends on
> reworking the driver a fair bit here:
> 
> 	https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/
> 
> This rework has a significant impact on performance on some platforms,
> but fortunately it seems such a rework can be avoided.
> 
> There are further bugs in the console code (e.g. that can lead to lost
> characters) that this series does not address, but those can be fixed
> separately (and I've started working on that).

I'll take these now, thanks!

greg k-h

