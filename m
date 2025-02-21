Return-Path: <linux-arm-msm+bounces-48841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD06A3F039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A2F860261
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1A42054FF;
	Fri, 21 Feb 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsN6g791"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5F2054F5;
	Fri, 21 Feb 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129890; cv=none; b=KoWg6A1c0JOidkMZZX8W15FekN2gDtIbqcfw1NxAvp0vPWaiPWNvzJtAXkAKsQfoNrGcaTeYMppf/8BcyjIwAp6fCERJ3QNRmXGTWtazY3IJxIwKMMNZdEviPLBDv5aZuIRQAV0rBmZoI3qisLNBTZdF+N4jmtSJ5vpz7UN03IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129890; c=relaxed/simple;
	bh=Mkbc3qelCH/W2kHudSUh2NgnIrAudBfPrsfPgdUq7N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arD9bmPX9LWe4r8+zO4aV5H+NfbElUM191zTEY+Z7DiMvjIFj7MeztxFy+HgqI7gojalpH/PYZE7n+nP+sJiguWjQoafwJVUrsbvjoqddWa5X17AnOG1nQkhgU8GyafppTFl7eUw3x2IrGWv4+w0Clw7fhCh9h/V+7GcVPPfbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsN6g791; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04732C4CED6;
	Fri, 21 Feb 2025 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129890;
	bh=Mkbc3qelCH/W2kHudSUh2NgnIrAudBfPrsfPgdUq7N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsN6g791U2hyBrFr8h58NiXj8T6kXP9b1CLb8ZNmJPpwSUeZjXTFYJn7sZ0v7KMj7
	 S4OZWtW5tUtKTMsybK1IwvFitRHI3uwZQnGGnxFPnEqPTZaC5JlYelP6qZKtpGX32e
	 tYLHHbfeXn/MQjaKndQVEoa8lscfX2gwhHETtZTt2DTuacwF7pjKhD1t50jgAYoyB9
	 /dMLG22LhJ0oGpYm1CbCsSoJc4Jx7GQ47uNdvZQgZeaFs5DEz5zZ5WM+4YCC/jNtUZ
	 C7rLUR9jH05R4RgEoaLJh5GmZRSGcFQoYdxQ16kq4emHUPnADeqQ0lkVUnQSus9cy9
	 QZcSnF4kCuM8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tlPHI-000000003Zc-0nsl;
	Fri, 21 Feb 2025 10:25:00 +0100
Date: Fri, 21 Feb 2025 10:25:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
Message-ID: <Z7hGbEUsQU_MUL5t@hovoldconsulting.com>
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>

On Thu, Feb 20, 2025 at 07:42:29PM +0200, Abel Vesa wrote:
> Since the driver and dt-bindings have been alread merged, it has been
> agreed offline that there is no point of holding on to these DT patches
> even though there are some issues with plug/unplug during suspend in
> both pmic-glink-altmode and ucsi-glink. These issues are being worked on
> meanwhile. Merging these means that even though this will provide external DP
> and USB orientation, plug/unplug during suspend will give some splats
> and render both the USB orientation and DP broken. But then, other
> X Elite boards already have these nodes described, so lets bring the crd
> and t14s to the same level.
> 
> These patches are just a resend of the ones found in v5 and dropped in the v6
> patchset of the driver and dt-bindings.
> 
> Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (4):
>       arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
>       arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
>       arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
>       arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support

It looks like you've addressed all the comments I had on v1 (except for
a stray newline after a t14s port@2 node) and I've been running with
these patches for a long time now without any issues (other than the
glink hotplug issues mentioned above):

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

