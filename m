Return-Path: <linux-arm-msm+bounces-37347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819B9C2147
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 16:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478CF1C23369
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 15:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2908221B432;
	Fri,  8 Nov 2024 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1KbV+pu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA621F5820;
	Fri,  8 Nov 2024 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731081467; cv=none; b=hOuVhedP0y2NQKEDpPaIuZifoqpy2l1b/Lx46sT0f7aXQGzt7K/f66Lk9DCEiTFBjc2mJPUh5gizS5xnUzdV9WG0FfidlBXbLzYYj7AKrenV6BF4LV9DXGXgRngeqpS7T7urt7A1dTslrFBZ59G1I/hwWjGsCMc+esDwW3bi8RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731081467; c=relaxed/simple;
	bh=iljCFR+MPEEFqcxrwc+bb1ttqOuXLhJV5eEIz3l1Xlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSz2ZEhhSCfUPF6yrhTR+mKL6kQiEnCdoMLcuyqnLCcMzoUwwhsbHmV64MoyECg/mvfqHHejs1IJDYFsdnY6tFwbU1y3N/qcbDsGVsUQAWwWBE8kGOSsD9SpMursszz/3i2c4Ven31gaBOKFYRN4T9pB0A+xBG21dfLrOqAhatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1KbV+pu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827B8C4CECD;
	Fri,  8 Nov 2024 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731081466;
	bh=iljCFR+MPEEFqcxrwc+bb1ttqOuXLhJV5eEIz3l1Xlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1KbV+pu6eu1WRDxN6lY+PRZ72jCU0nblPktyVtaIpYIE4TeB+AR6aD4oUkU/YuKg
	 ZW7Lw3oWCvVd1koyqA3OaKjIl69pBtchVUZS+75EXVGELq9soV2n4HAtAk4sZn45FB
	 ge2Oa1IjckGuGNsuLO2y7/qw6iCfgQiVNjdMx1rG6HZCJL50k9vnZf9HXpi/VG53Ws
	 33dqWLjxtnv1O1UpG+NiMG8e8OKPx1drdGeL5BnyUGqamENbIXB3PKcBMkK85Yb0Dn
	 vdjeKHwyPIWO7W16XF37ywYvHiwMcSw0vB2anZozMMlm62bfT9rd7zEsUXwGoKIsIl
	 m3ZsivwuQxb9g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9RMr-000000008Vg-1sJz;
	Fri, 08 Nov 2024 16:57:49 +0100
Date: Fri, 8 Nov 2024 16:57:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogeurs@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
Message-ID: <Zy40_aLiETXFGMmR@hovoldconsulting.com>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
 <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>

On Wed, Nov 06, 2024 at 05:45:55PM +0200, Dmitry Baryshkov wrote:
> Instead of checking if any of the USB-C ports have orientation GPIO and
> thus is orientation-aware, check for the GPIO for the port being
> registered.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

