Return-Path: <linux-arm-msm+bounces-34433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DAA99EA04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D3E9B230E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5128420822B;
	Tue, 15 Oct 2024 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFFH5zVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA01D9A5F;
	Tue, 15 Oct 2024 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996081; cv=none; b=sNle53j8UIL8X6NXR1nxtALD6gKo+upLmj7pxKMNFOd4CNB/HfCi2zzjrOopvWMT1rm0Il5IKGXFPNGampFrn3PFv3dTib43qR2S18JdWpPYnsn2DpZ2Iz18F4UlyIMpRHud5XArwTYnCU8jKBkR8dc9+1hc45u9gi02m9XEC0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996081; c=relaxed/simple;
	bh=tXuMVbiuOklXX/EIEGzxkQbf3i7xHJrjf66PRhYWAY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4XiZcCMVG8uCUQCxCt6sAm9T8ALQG4GmNSFYqXdH6N7uM8AnBxsX+dlLE/OZCNztUmLD7PqfRokWeVBw2X1GqeVUHKpGNTfdQrBtSv93lUbjeYkeeNcy5SAiKdX1RjXt70okyKD3KFd80nJ+3GmC8DyK/GI3ESTBwVLP/O4YYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFFH5zVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E97C4CEC6;
	Tue, 15 Oct 2024 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728996080;
	bh=tXuMVbiuOklXX/EIEGzxkQbf3i7xHJrjf66PRhYWAY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFFH5zVAF2PovPgAB/4l3wI2VXmiolvBFpjfkxp8MbmFRGM8h6hW/K37woGkMVLbV
	 kd9kT30nnW7yl5eUCcbNNujz+CMWGrT1dl6WIjxMGELlCYDZOp5OSoRtg1ufegOO4i
	 dqGluDZLj+rFnNq9QHNYjz5bGe4RfVF+zE289BnEwYsbixZzCRA+qyDTyx3cUYLmmv
	 P/hi9Vw3kgtBLNmi/xmlekbBSBx2WNpbNbo1zuOf9ivm2xjO3lfpGNfv7xcVt1bJt/
	 sZ4eXp8k9M8roHvAwS2A+EHjhEUu5CA5oVHGzhL1hfM1pIVe7uKXAAxqkwq77NATzF
	 4lZxMU+F7YcKg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0grd-000000004XU-3NyO;
	Tue, 15 Oct 2024 14:41:25 +0200
Date: Tue, 15 Oct 2024 14:41:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: Add new driver for Parade PS8830
 Type-C Retimer
Message-ID: <Zw5i9dcSMOG4n3PW@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>

On Fri, Oct 04, 2024 at 04:57:36PM +0300, Abel Vesa wrote:
> The Parade PS8830 is a Type-C multi-protocol retimer that is controlled
> via I2C. It provides altmode and orientation handling and usually sits
> between the Type-C port and the PHY.
> 
> It is currently used alongside Qualcomm Snapdragon X Elite SoCs on quite
> a few laptops already.
> 
> This new driver adds support for the following 3 modes:
>  - DP 4lanes (pin assignments C and E)
>  - DP 2lanes + USB3 (pin assignment D)
>  - USB3
> 
> This retimer is a LTTPR (Link-Training Tunable PHY Repeater) which means
> it can support link training from source to itself. This means that the
> DP driver needs to be aware of the repeater presence and to handle
> the link training accordingly. This is currently missing from msm dp
> driver, but there is already effort going on to add it. Once done,
> full external DP will be working on all X1E laptops that make use of
> this retimer.

I was gonna ask you to include the devicetree changes that enables the
retimers as part of this series (to facilitate review and testing), but
perhaps you should indeed not post them again until LTTPR support is in
place.

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Addressed all comments from Johan and Konrad.
> - Reworked the handling of the vregs so it would be more cleaner.
>   Dropped the usage of bulk regulators API and handled them separately.
>   Also discribed all regulators according to data sheet.
> - Added all delays according to data sheet.
> - Fixed coldplug (on boot) orientation detection.

Coldplug orientation detection still does not work here with this series
applied.

I'm not entirely sure this whether worked better with v1, but with v2
my SuperSpeed ethernet device shows up as a HighSpeed device in one
orientation. It is also not disconnected an re-enumerated as SS as is
the case on the X13s (and possibly with v1):

	usb 1-1: new high-speed USB device number 2 using xhci-hcd

> - Didn't pick Krzysztof's R-b tag because the bindings changed w.r.t
>   supplies.
> - Link to v1: https://lore.kernel.org/r/20240829-x1e80100-ps8830-v1-0-bcc4790b1d45@linaro.org
> 
> ---
> Abel Vesa (2):
>       dt-bindings: usb: Add Parade PS8830 Type-C retimer bindings
>       usb: typec: Add support for Parade PS8830 Type-C Retimer

Johan

