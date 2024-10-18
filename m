Return-Path: <linux-arm-msm+bounces-34915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD549A39F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B9241C20CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DF41EF0B2;
	Fri, 18 Oct 2024 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s43u2vtB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFCE1EE030;
	Fri, 18 Oct 2024 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729243500; cv=none; b=W1sgb3o4INcRDqYIHMgRlRc5pOhggp6HShU/6CyMyJe26UXAPu/vdep9AfbxeWR1+H7kMhFOOUkq2z5gLs3TqjFguabmNSoD9kqK3GuO63dKLRSJyYPI4uWrY5k0yy1T2X76ua1/m0oAdnNDCZXwisG/T3jAVuIJiEWs0imyU24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729243500; c=relaxed/simple;
	bh=2IMdaA8ul6gM8hgkv6IdrYUC/CNJrqmd/NFRkemFyM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTysTFCCEOl4VEGSyM/BxcXMK2TKkCP8jFnjq10fdIFwhdRGBAwBJZTXXYMNeCDOOiQjCdAG0KQHhEi4oxIwP6lubeekZ901OY0lMPoxUDucafUW6EKA39xF8LMtjmlbAmY2NedetlSPxQb1D4zTKarbHwmeeNC/D3kEwYn6XH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s43u2vtB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148DBC4CEC3;
	Fri, 18 Oct 2024 09:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729243500;
	bh=2IMdaA8ul6gM8hgkv6IdrYUC/CNJrqmd/NFRkemFyM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s43u2vtBzmN+A0XC9MtQq6SKKNqp1j6aPDmrkTTSeQaf3R5y+/KY6t3RU+rMnd/TD
	 6JBPLDC9WOXxdMun4Et3t6f1uttvAWBKggoVRioLSZCv0lqXy2jiuVxGph4kycIc9D
	 P6Tw/P0qtXPSy+XWdvkWXnOHPPv78YXvlWv4Vm+e4gqsnQa2GpPM8D8+FSLmKHkuTO
	 rR+MhivQ2ymx7+IOtsd4unjPmTq+Y/trUJKMgl2xGEcJYJ2RjMpGZel3GaRrFPFHDm
	 T4DHsrOBCMxGIIF5/TXGRnT0TnKwHJBU6HJrHwd8C3jw/YIu3ZRpunSZro2BGKtiNc
	 uxooaQe6Kgw5Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t1jEL-0000000028A-1p5I;
	Fri, 18 Oct 2024 11:25:09 +0200
Date: Fri, 18 Oct 2024 11:25:09 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com, tephan.gerhold@linaro.org,
	johan+linaro@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: x1e80100-dell-xps13-9345: fix
 nvme regulator boot glitch
Message-ID: <ZxIpdW16t0T2Ou8z@hovoldconsulting.com>
References: <20241016202253.9677-1-alex.vinarskis@gmail.com>
 <20241016202253.9677-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016202253.9677-3-alex.vinarskis@gmail.com>

On Wed, Oct 16, 2024 at 10:15:49PM +0200, Aleksandrs Vinarskis wrote:
> The NVMe regulator has been left enabled by the boot firmware. Mark it
> as such to avoid disabling the regulator temporarily during boot.
> 
> Based on https://lore.kernel.org/all/20241016145112.24785-1-johan+linaro@kernel.org/
> 
> Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

