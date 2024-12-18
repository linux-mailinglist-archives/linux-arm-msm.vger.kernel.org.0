Return-Path: <linux-arm-msm+bounces-42619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D09F614C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D588C7A15A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCC41925A2;
	Wed, 18 Dec 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5hcSH8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF771547FF;
	Wed, 18 Dec 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513664; cv=none; b=XhXRG2XcLgLWQLp/nan5v/vhJVhofbf7csy/KrHHt9P2/irHH7YYE4JE71g70FAECjLPBL4SjEEe0XSVEwQKsXcYBsG/DJ8J7oHbGhvoRbliLWonF4adXH3NiRfXOoNj725ITfmLmrX9PT6+9IH/qSnX0N4+q2JgCneCupCm+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513664; c=relaxed/simple;
	bh=Joxf91zRAXiTP8nr5vRtQiFgbbbWcdv7Yamp7pB847Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+NBrZHredsFZy/y0xujR7YEOdk3bVY2r54ozwLrKAS8xpim1v3rLONFys2QE3rTbtXcx+hWWOZLFMqL3adfv5EkNOoMekLw5OyFBdwibT76HR9HMqkQkAq7ZtAWTW/ojsgIAKh3lkiazNHWiUFbYYdl3HFNOUy9iCCSFU6QdO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5hcSH8o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B80C4CECE;
	Wed, 18 Dec 2024 09:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734513664;
	bh=Joxf91zRAXiTP8nr5vRtQiFgbbbWcdv7Yamp7pB847Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5hcSH8ooPBhGZqErclxci8uP7prhV1ZdwaqcTB+bwAa8GRfLCDVFVe4n+c32yMZg
	 C1CzkV4AShBwXnis3lHCbJON9oPNXwYn2OxPwEgE8m3m5otfywd0VpmxTZbMiwOXqr
	 iySj9gFsSen2kDRuIpPknWBwniotQc+sD0Stj1tRt+21kiqTcO3xGEUODEHsrpyuJt
	 9LsjggR28XZBVM5CSAogRyADPtcTZ0tujnIVE7x5siHAz0IJljl8DwTFBU2TFeuXtk
	 2BgMnJ6h09sq9rv015mVdI91oJHu12K0a7HyVq4luK2cA8jC65V7yFEN18kFYTe4N+
	 oeOZ89RmKjenw==
Date: Wed, 18 Dec 2024 10:21:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: Add label in the coresight
 components
Message-ID: <tida22chffj2znikeotmo52aqnzvmedn3aa7a2coarz2dwjc7w@duw5fby4hexk>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
 <20241217063324.33781-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217063324.33781-2-quic_jinlmao@quicinc.com>

On Tue, Dec 17, 2024 at 02:33:23PM +0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add label to show hardware context information of each coresight
> device. There will be a sysfs node label in each device folder.
> 
> cat /sys/bus/coresight/devices/cti_sys0/label
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


