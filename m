Return-Path: <linux-arm-msm+bounces-29245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803A95ADFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A8D281667
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 06:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE635139D05;
	Thu, 22 Aug 2024 06:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tH/e7n+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158A3B290;
	Thu, 22 Aug 2024 06:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309382; cv=none; b=eyimPxNTxMiWYAsbJyrzxcm6nI+aPowtJ3ZxMh+i7eRDskcb+GRCX3age6mQGnUH6QjyQFZdzL2RBq7f2T/5sFgQ7VlZUWp6sULbZQCvT2L/2Y5tdlUizdL7LosHCgFJ8BIUeIPAs3OwbK/8yj6apH0u/Td7jE+5t42rgu/j7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309382; c=relaxed/simple;
	bh=GaeE+vHB9FpTDdnRoHEB3IZqWE5qQS6LAnO0ppG8Pc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjZBb15Bsj3wvOntv3AGo2sqtd5M4T4DCDPOyf/Vp0py72msR7nWug+0xlttwXREMivsz1KiI9sBHUlftagQVUCcpdq0LO3WEqVDB2Bp+0VZWuPdRaoCXI9buM6EzvDrT4g4LOl3eaCvmlECwUzz27En4sHfSLCRMmSJTnCKW1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tH/e7n+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E26C4AF09;
	Thu, 22 Aug 2024 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724309381;
	bh=GaeE+vHB9FpTDdnRoHEB3IZqWE5qQS6LAnO0ppG8Pc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tH/e7n+2tGWq/zhOSNu63p3SRduTj4pV0iwSPzr5KYoZa0jPEXRuKDIJmEZkQ06AB
	 DyKih1kf5TWOzrHqBnV5KrUdcq/6qfkuB4sEjc2S1XbK1CDET/iqc2KBNE/yzJeb8G
	 2hE0a13eU9n6iTIfSxLRWR1YHul8UStKTxKkMLcwih70yuKIoGma937CvH46/wW50F
	 uAs6n9LTI/mROjs86jIr26m8FsZ2R7AMyM8lv0jQX+ghNNUkoYH6LvEwLPS3ZMNfnD
	 P31RUMT6WsZ6Ie4vk913AcIjxVKcRobSaPq5E09eBiuFu85d3ru9PVzCkRSyIoS+p3
	 dtyyWfij8s4Bw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sh1dg-000000004q3-2HHb;
	Thu, 22 Aug 2024 08:49:44 +0200
Date: Thu, 22 Aug 2024 08:49:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x4
Message-ID: <ZsbfiMGP4aLmfwkv@hovoldconsulting.com>
References: <20240821-x1e80100-phy-add-gen4x4-v2-0-c34db42230e9@linaro.org>
 <20240821-x1e80100-phy-add-gen4x4-v2-1-c34db42230e9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821-x1e80100-phy-add-gen4x4-v2-1-c34db42230e9@linaro.org>

On Wed, Aug 21, 2024 at 11:39:00AM +0300, Abel Vesa wrote:
> The sixth PCIe instance on X1E80100 can be used in either 4-lane mode or
> 2-lane mode. Document the 4-lane mode as a separate compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

