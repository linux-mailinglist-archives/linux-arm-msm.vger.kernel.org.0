Return-Path: <linux-arm-msm+bounces-60714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B06B6AD2EB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875033A4EB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 07:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19D427A92F;
	Tue, 10 Jun 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChwgSYmk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1A21B8F8;
	Tue, 10 Jun 2025 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540710; cv=none; b=TRo5gSFC3xzHC7kQ5FQSVtbzYaFpalHmPLk1brMrMv9kdNefAnISlt8GwPhRK3GaCUJtNrRAeE+BJxLxKqxHkBpj4l3V9E5GFGDgLRLbroLi4KIC9JkuqRkmPBoQ8nDEqxYcWJRIMNu8n9WteX4BAaHMLHQaSuAV3R/Mbm9hPQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540710; c=relaxed/simple;
	bh=iR2vQrDHdkl1KFcMSrsPENkuxkcESc+evrbedHigiAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7AHVAZvkZM3z2HDmu1y4OUkCPoxSGNOiYbtckAE2SyUukJVKKQvJsAoprnMpHQbJEVslQN0uzDXdHjsIINs5rBiT5/+f/3lN4w5w3jF0pdhdmahr6FO+Y1jHjWtxCQONxTifL2cTmDL0Yezl2yqehQ4d5MaW7dgPpCj2GbY1sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChwgSYmk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E27C4CEEF;
	Tue, 10 Jun 2025 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749540710;
	bh=iR2vQrDHdkl1KFcMSrsPENkuxkcESc+evrbedHigiAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ChwgSYmktP6WfLNZH6vaxPWOHJMdO3I405K9JApjtyBfDmF4tNgNccgTRNddLXbFP
	 hjFLJhhpgdnzbyyaAwlODk7giTmhZZVXXYH9oCDNuJPQ78QUn658kCt4TAAjYYjIYe
	 bzVHL1/5D2/xMrDjfGekgsQAn2sSUbPfZRmOuQhIH0wystZ/HjtAMPSxjYaIXDXjDH
	 HszkrSNaepqcC48mrhbPXa/qerGTg5g0vkWeGjqnUxNcW/QbC35KRQL6sWWiQiCgAN
	 S0WDsCXltdGKY4XMLZf4zqo88L/4EvVtuuuratfnJFEnIADGOTQh09HE3YgWSU2hkR
	 42Y7F/jYcVMlQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uOtST-000000001kc-2cCF;
	Tue, 10 Jun 2025 09:31:46 +0200
Date: Tue, 10 Jun 2025 09:31:45 +0200
From: Johan Hovold <johan@kernel.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
Message-ID: <aEffYQND8eUgJbua@hovoldconsulting.com>
References: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>

On Tue, Jun 10, 2025 at 07:04:46AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The usb0 port didn't switch to dp altmode, investigation into DSDT
> UCS0 device resulted in GPIO 165.

DP alt mode works on both ports of the X13s and "resulted in
gpio165" makes little sense so this commit message would need to be
extended.

> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> This patch amends the enable gpio for the usb0-sbu-mux to the one
> found in the DSDT file for this laptop. UCS0 shows a list of GPIOs in 
> a certain order, and it has 2 buffers with slightly different length. 
> At the place where one would expect the GPIO for the select pin of USB0 
> (by pattern application from USB1) is a deviating value (165 instead of 
> 101). This value is the same in both buffers. The GPIO previously used
> is also there, but at the end of the UCS0 buffer structure. Changing it
> resulted in a working dp altmode functionality on usb0.

GPIO 101 *is* the OE_N pin, while GPIO 165 is not even connected
according to the schematics. The mux may still work after this change,
but you'd be relying on it having been enabled by the boot firmware.

> Since the X13s dt looks derived from the SC8280XP CRD, it is likely that
> the change also needs to be done there. 

To some degree that's true, but we have schematics for both machines and
they are not identical.

> This debug effort is a result of work / testing of the 4-lanes patch
> [1] on all available devices. Independent of it, it enables dp 
> altmode on usb0, and with it, also 4 lanes, making it even more useful.
> 
> [1]: https://lore.kernel.org/all/20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com/

NAK

Johan

