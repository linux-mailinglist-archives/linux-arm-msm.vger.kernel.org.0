Return-Path: <linux-arm-msm+bounces-76740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E47BCACCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D4764E4AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB8D26F2B8;
	Thu,  9 Oct 2025 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgahMkn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F949265623;
	Thu,  9 Oct 2025 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041578; cv=none; b=VDR5BfNrLN/Ch0FywkB+aSlBscFwoWnK1mAdKaV3ZeXY3KiEf7J1KfBC5Ld6PFQfKJfYgi/4T/AKcBIH1SsMsQWBvYnWTKEEJ8v313BM1kVuBF1xirHHhDm1MS0y6n0wdlJppH7T320Xc5biaGlz87I6h9ihog/S9vI3M7t1lGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041578; c=relaxed/simple;
	bh=gaPC9IOcFFDMH77ioeI300u2Daq6lSY6TRXYvKtrd84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQZvg89f3hmPLl5F39beNy0/0EVgYlyfs7rCbbJTS9lZlBXXGgK57c3qmuQqIl7kWvnPNElr9SG2zWV7Mh8XCNuUCd+AL8h2zqIXvb4zSFBACPvSTkjygXVZComq6anK2AjoclspnCQfX+zK1qGtaI/8Aa1MkZx20B9w69SZwzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgahMkn0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA45BC4CEE7;
	Thu,  9 Oct 2025 20:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760041578;
	bh=gaPC9IOcFFDMH77ioeI300u2Daq6lSY6TRXYvKtrd84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgahMkn0CslWjZDiZXIskbKvsNyM1l6xHBFflwmqM3OfgmSJOw6GXSdOpvYlMCnPh
	 h3pyPpSyTzTPDjxPRAic24st2/pAYGoMrGjX1jK/laPCkHaDOc8H/iXpNZ9TsLy/2+
	 o4KM56mp/Jm8VvzNkrXZZlwHFHDoWybk8dZfcKnSQHzCjmRsa8edB6Riap6wXnVh01
	 psOns8dnHu/cEoyGQvSZNk+kCFMmPOoGF2I2vgUdBtr4+8ivqJFOYRQfBWnI360kde
	 mxgqa81r/gkLiVgcOB/kZbXCCLdvAjzHVcWPM5CMqRbic4Xq89Ku/3DjVzbjM77HOo
	 HqewFHDGZH62A==
Date: Thu, 9 Oct 2025 15:26:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xilin Wu <sophon@radxa.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Message-ID: <176004157616.3295945.3989144090466748168.robh@kernel.org>
References: <20251006-topic-x1e80100-hdmi-v5-0-c006311d59d7@linaro.org>
 <20251006-topic-x1e80100-hdmi-v5-1-c006311d59d7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-topic-x1e80100-hdmi-v5-1-c006311d59d7@linaro.org>


On Mon, 06 Oct 2025 15:55:03 +0200, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> The layout of the lanes was designed to be mapped and swapped
> related to the USB-C Power Delivery negociation, so it supports
> a finite set of mappings inherited by the USB-C Altmode layouts.
> 
> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
> connector, DP->HDMI bridge, USB3 A Connector, etc... without
> an USB-C connector and no PD events.
> 
> Document the data-lanes on numbered port@0 out endpoints,
> allowing us to document the lanes mapping to DisplayPort
> and/or USB3 connectors/peripherals.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 69 +++++++++++++++++++++-
>  1 file changed, 68 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


