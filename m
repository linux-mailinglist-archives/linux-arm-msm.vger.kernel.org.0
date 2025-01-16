Return-Path: <linux-arm-msm+bounces-45274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1273A13C01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A1E17A416E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A161F37CE;
	Thu, 16 Jan 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8WXCM5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12FF1DE2B9;
	Thu, 16 Jan 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737037232; cv=none; b=tRub1a8F/59OD3pbHRSKbPJVblxnFn9A7W57c2/GQuDmImk3IzRL4uM7t8/HXpemO4TiDrIQQ15xiYInp3L7VtgLvid+M9NyDamNtoa9ZBytdaVBrBT4UGqsqZ2PI+j/NslYDYBQ1P0dPxiXmuhEyAZut0bxEfDlV5GtnmDNys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737037232; c=relaxed/simple;
	bh=mDgZ8AfPGS/Gs+LJPIvTqHUSiT9ZB3FIVOYyCsFQf/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyiQw+ixs1a++boiIr1BbQbIcV5YOuj2gJ0AGaL2ae+VKh9wlvkB+d69BeLuAhaCdXD5toRI37PqXEuYhs9RHAUm30hR4uxt8DjnC94YGuigS0bR4yOT3yyz1ui+PdN2Lj9ymGngKJeg2QsFqLeW2KTrH5iytAdotCSDLW9kEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8WXCM5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AC1C4CED6;
	Thu, 16 Jan 2025 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737037232;
	bh=mDgZ8AfPGS/Gs+LJPIvTqHUSiT9ZB3FIVOYyCsFQf/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8WXCM5VSC1D1qHHiJ+wdsAWz/tSmPaJWapX/QHXdEqhgQOw3hqpjIq+EWSZAsCG8
	 zQjp17R9ocukhEgTEDunuYFeib5tUHJAMHv6q2NAEAvAEsPBBtrVIYZMEy7tpzmr3K
	 LvurV5w7tKzeLXwu3N6ZIlGQL93WVRfpGoaDxX6ZGAwOrFFAG7/gK+darvm2Ik4C8+
	 wkKvEju4y+r2IfAmyosMhz+HY0FUDeM+0l7qtHLkjvIHOsMEbmCc+3DIvuw4oPBFwA
	 2VOFZossDJXPXYeeFzKt3Bj3dTWHSiUiMPWhDHPPS5/MDxDWIubAD+JKrKuNZUsoj7
	 frXMbmrAfEAhw==
Date: Thu, 16 Jan 2025 08:20:30 -0600
From: Rob Herring <robh@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gregkh@linuxfoundation.org,
	andersson@kernel.org, konradybcio@kernel.org,
	dmitry.baryshkov@linaro.org, mantas@8devices.com,
	manivannan.sadhasivam@linaro.org, abel.vesa@linaro.org,
	quic_kriskura@quicinc.com, quic_rohiagar@quicinc.com,
	quic_kbajaj@quicinc.com, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: usb: qcom,dwc3: Add IPQ5424 to USB
 DWC3 bindings
Message-ID: <20250116142030.GA2159147-robh@kernel.org>
References: <20241118052839.382431-1-quic_varada@quicinc.com>
 <20241118052839.382431-6-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118052839.382431-6-quic_varada@quicinc.com>

On Mon, Nov 18, 2024 at 10:58:38AM +0530, Varadarajan Narayanan wrote:
> Update dt-bindings to add IPQ5424 to USB DWC3 controller list.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add 'Acked-by: Conor Dooley'
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Looks like this was missed. Applied.

Rob

