Return-Path: <linux-arm-msm+bounces-72693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCBBB4A399
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 09:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE953A5886
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 07:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46768302759;
	Tue,  9 Sep 2025 07:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVHoCJPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4E2EB87F;
	Tue,  9 Sep 2025 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403231; cv=none; b=KqtobNyEgQC1mro3/YNVkBgXkeAN8QAy2lGMmEA/1wW11ehNoqsnyKrBRubTy1Z3yCyg7hTU0CN57tCJeFzfx0CiUMPZN1sHKF0Qbl3YIF9tiKZVwZnKOeRyUZALunHcsDm68DqUaxjm/vEzWScsYms7Sexa7h22pWdlN2I/2sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403231; c=relaxed/simple;
	bh=29h+C2RAqYP6IwgLpJq+YR56gxRGczHq5a7zqDGvuYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKhTi75ZQq3nVsoM0az2Y97gHD5zTQoAd2JeFsvbYzrokXP5haCzIpRFgm6kDYuxeP8KWG8TkF+qTvkuzqvGLNLM2063sfjVxLPlYf1z3VbG4fOXBRsDW0oLaKhe+ByTrYg3noHjPPLMaitpww0WEPrKCmaVEUE0GlC1eOO6vdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVHoCJPh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389DBC4CEF4;
	Tue,  9 Sep 2025 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757403230;
	bh=29h+C2RAqYP6IwgLpJq+YR56gxRGczHq5a7zqDGvuYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVHoCJPhPOjbF0rgeVlW4WNjW0VWQwRmDxd63Gw3YKKAr43Db+qw91nG44I/xwRPC
	 eyrnIUxQ/VwPDJ4+l2LHuaBTlRrHN10itAnFnlS3xen6Z+oDgIeqjk2aq2KB0+LCdV
	 BHoVckfsz8SET7OAMF7dy6x6W85MlkiBG8J2mJ3a11Y+rLPtD99Hhdwor+28Dqmtf3
	 AhGFWjYRf20I10gNZeyZRWZtB+qBWbuK5NdCJp2FCm4tpqzsPoFc08ZIgtWIqm4KUe
	 HB0F3aCldVeK7oZF7UbOIl8T2IFTF7y8hDSGft4o87wboQCR2o4brOVBzfl52afcV/
	 2xBTOR/9Er0aA==
Date: Tue, 9 Sep 2025 09:33:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14
 UX3407QA LCD/OLED variants
Message-ID: <20250909-fragrant-meaty-bird-beb7ec@kuoka>
References: <20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com>
 <20250908-zenbook-improvements-v1-1-43ecbbf39c60@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908-zenbook-improvements-v1-1-43ecbbf39c60@vinarskis.com>

On Mon, Sep 08, 2025 at 08:45:45PM +0200, Aleksandrs Vinarskis wrote:
> X1/X1 Plus variant of the said device comes in either FHD+ OLED or FHD+
> LCD panel, and shares the same model number UX3407QA. It appears LCD
> panel's brightness adjustment is PWM backlight controlled, so a
> dedicated device-tree is required. Introduce dedicated compatibles with
> fallback to 'asus,zenbook-a14-ux3407qa' as they are otherwise the same.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


