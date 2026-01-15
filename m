Return-Path: <linux-arm-msm+bounces-89252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E909D27E97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C21308F870
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D326396B8F;
	Thu, 15 Jan 2026 18:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVH/RzFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF422D9488;
	Thu, 15 Jan 2026 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503082; cv=none; b=pFHp0qfcU3TJdd7PUBifFfDm/lUWErpTmp0L81720uxeMasawFY/tmYicgd34DTlT0+S6fKkRfHDxCD3pzusAfTBYhZH/ZVuLIm44hbqKHKcC+AqZCeXeYxi6eHSYBLl0hYVMG5tEwtwXCRvq1lnUYl6boIhQJ0LjeYpj+9gMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503082; c=relaxed/simple;
	bh=3IRRuMLcwmSQPo2/U6GNGdpGU5CpG4IMSKqJ5xKFAgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUMmJQGa8OWGRn1jnrO6Ons/J7CCX31tmCNqgnPTg5cuiWnpqtno8o8fHJbojhg6jKcEiBArvRPvWVy+vGoBBQONKNJzWzSTkA0HCkmmCxF19ZOc68a9tKv+yQCO2XHshTuJSzKh6dYH6G5+l/AK8fpxMS1Xz37djACGxU+xISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVH/RzFR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60978C116D0;
	Thu, 15 Jan 2026 18:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503081;
	bh=3IRRuMLcwmSQPo2/U6GNGdpGU5CpG4IMSKqJ5xKFAgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVH/RzFRqIJleuYmCNX4D1CBJYCcTYyWkKcBeQyGBgEDuwRUqcew7B+IKHCmGAYCO
	 T6KrUHx8bZjw185ibpOy3wrRj3UJEtilOf0lyKLZqaZrQhUD3P4BsQJs4oiJa9YKCQ
	 FBGW87NduOf84+1f2hpLLQcBgqXk78m1YGyLrItCf2JdzpCLraVnRkxfyvZB9umc5Y
	 5LITT5I656q3xd7+B0HtOemMyu0hUNG6A97lHHbqTDpPjqmfJVuEZ3/BtZqSz1dr+O
	 TkXKd/do+s1Xv9sMryLB4jCFdPPIG0/0OVato9nJaIm/OkAz4Zkra1Vgw+hIyp7Vix
	 HXFf5S5ZT6wpA==
Date: Thu, 15 Jan 2026 12:51:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH RFT 1/3] dt-bindings: usb: qcom,dwc3: Allow high-speed
 interrupt on Glymur, Hamoa and Milos
Message-ID: <176850308003.1000412.4463724450003565860.robh@kernel.org>
References: <20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com>
 <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-dts-qcom-glymur-add-usb-support-v1-1-98d6d387df01@oss.qualcomm.com>


On Tue, 13 Jan 2026 14:33:04 +0200, Abel Vesa wrote:
> Some of the controllers found of these platforms can be tied up to a
> single high-speed PHY, basically rendering them as USB 2.0 controllers.
> So in this case, the interrupt to the Synopsys DesignWare Core is coming
> from the high-speed PHY, so allow the interrupt to reflect that.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


