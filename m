Return-Path: <linux-arm-msm+bounces-54154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE43A87894
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805B716C5CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0333C257AED;
	Mon, 14 Apr 2025 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCxRpoo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CBB158DA3;
	Mon, 14 Apr 2025 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615151; cv=none; b=NwUTInwW2zbFMakawh/uPwlchF1z1I2hszACcPhh1QtM4EMB5sGGZ+B6barLnATRb0/ENVXEbuYCVUuANpk/HrpcKIpp9tGgA7tpCCx2X1Rzmki7K7tnjMICORrlRqv/1cqTmtV7gb1SCDDVxxiM8FqJXArgRyvveX1G2iGnkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615151; c=relaxed/simple;
	bh=5XAwYqPF/VcumK0eqoVgJ7WMHjerh75+AgOEX07/FYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIVHCsRS77suNPJBUf43PQIusvCjeHzqKkQCZU/Qj6nPif/glwmWAxDWXlGd3BB5dzVdQnO6+sAv50l23fUr/6MWWve5sOYxfqSTgs/gEohPLoSseEXWHPsWsKFIg0f9OH6ft74o7ckW343lzBePIwxUw1WQz4luV2FbUgDpbPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCxRpoo5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC602C4CEE2;
	Mon, 14 Apr 2025 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615151;
	bh=5XAwYqPF/VcumK0eqoVgJ7WMHjerh75+AgOEX07/FYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCxRpoo5tBeIdkv6YPps3K58/RgIF8jkAbi3crSrltPrby0+rAINAv/jYbrLiu4J9
	 eKKnKRj8rVIytyAEtadMBcsYrNzBw93UPb01ZYTd/w6vcLGzaPw7szlvAL5glU+R81
	 Xk2a/9+wdFcpMvqpGEjWKzrTsCqfETOsIRhfcWW2FughmX9XcbiBVpBLEsdpWyWTOe
	 uEQbD9AL7AuDl8RQtgiDdxQuj9eUPyPpSSA2ien2vZYrBnscjcnIFLOMiMN8NrF9qv
	 jpC6p7PwHpPp6Xqxef7L2dz3jP7IXfoV5+POEPEv0J1lxx9A5Jr8uQJXVkC9FUavHz
	 wMuyZXe9FMeGw==
Date: Mon, 14 Apr 2025 09:19:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos2200 support
Message-ID: <20250414-mottled-divergent-swift-666aaf@shite>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
 <20250412202620.738150-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250412202620.738150-3-ivo.ivanov.ivanov1@gmail.com>

On Sat, Apr 12, 2025 at 11:26:12PM GMT, Ivaylo Ivanov wrote:
> Document support for Exynos2200. As the USBDRD 3.2 4nm controller
> consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
> be handled by external drivers, define only the bus clocked used
> by the link controller.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


