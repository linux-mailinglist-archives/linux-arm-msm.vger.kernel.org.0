Return-Path: <linux-arm-msm+bounces-34391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B109B99DE2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7625C28574B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 06:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E4A189BA4;
	Tue, 15 Oct 2024 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSfdC1Kz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2B189B8A;
	Tue, 15 Oct 2024 06:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973408; cv=none; b=O0OCXJBDU5RljEMEYcAY5/OnKUe5gad2b0WwXsudNXk1NQc7E4oopxn3kFyWGIJ7lDptoybKkFzCcWyQrpEOYvQ9f8zKOq06gHQ9msc7HdM3N+6hyGfB2/pMMbJEl7LcnAvGQ74hZVLg3iiRZDl+rEU1QB9MWrCWGafi6Be9jRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973408; c=relaxed/simple;
	bh=69X/Uq1A2tTUdqIb/0WrWh+7qgAKnfOmdDZTUgq8+yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9uoqZVoydYdpABa78qpkoNCOsAQnbnu0x+9kJH9vLfbJb7BYduHAvtKgPxRcqw2nWG0Qp1jrVR92C/Bkjz6i9WHa3w9WV78mWQVLkU6KxHqH/88gCKpb7zD5i7eild4dj1QCh0dF856EyyOtjukhuR+pYTZuLeCxNGU5vocLjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XSfdC1Kz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF45CC4CEC7;
	Tue, 15 Oct 2024 06:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728973406;
	bh=69X/Uq1A2tTUdqIb/0WrWh+7qgAKnfOmdDZTUgq8+yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSfdC1Kzj/bItGtCu96rR9w1XOJeXcP1m52bb94lW/QgGGqNKbF066t8D4GV/fe+8
	 RGnYE3ZH65f1hQimmSB0pgJXg7kW5V0QGpjRNDc+9amRNHQrDt436dV8qDj8M0eni2
	 7QjNPfMmhAvoUY1U5tXb118Og7d/U9UO6N0j/4nS+PLCrN8g5lQgs3Pn12dEntdXJ0
	 88/10QFvMdyEG7vDYI2gwmvirSV+Xvx8BJ5BG9qdZYxgGWIQuApYmuBCGLSqFoLHN7
	 g7IR7cNvq35aO89d/HTSE26cHy0kr4h8G7ZmVB7nshtW0SHoE0bvcwlaG55c3j3Q8H
	 vZW8NK3Hn+5EA==
Date: Tue, 15 Oct 2024 08:23:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH 2/5] dt-bindings: phy: qcom,qusb2: Add bindings for QCS615
Message-ID: <32zp2wldpqzn5wezcw6hg4cj5n5vc4xs32vl2og5mmsh2hr3fj@jkxg3bafdrd3>
References: <20241014084432.3310114-1-quic_kriskura@quicinc.com>
 <20241014084432.3310114-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014084432.3310114-3-quic_kriskura@quicinc.com>

On Mon, Oct 14, 2024 at 02:14:29PM +0530, Krishna Kurapati wrote:
> Update dt-bindings to add QCS615 to QUSB2 Phy list.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


