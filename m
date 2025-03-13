Return-Path: <linux-arm-msm+bounces-51331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E9A6050C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 00:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49B1417E78B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 23:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A41F76D3;
	Thu, 13 Mar 2025 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsAZIMeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52C018DB0B;
	Thu, 13 Mar 2025 23:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741907208; cv=none; b=o7RvKkVMOpkH0OD1TuvL6cvJIf3IPlcbDTo7ovdywxauyTgzpq4/Dcqa/Ttbr2HUvIVb/OJ3GEQAJIZ4i6ZxHwAkOWGq+qwHRzDkiaEyttM4i6n2CKmmj9OX/9YFPvS008/rtAZpGeWRhIzDn+PFKbN70oKLUOgu1alpE0AsB9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741907208; c=relaxed/simple;
	bh=0UAgLw6E5fMxghBPUcUr1YC5wDKAXkzRKCvdfBrEOek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duOAElX2MTIXLeDUPdTICukBjDHJNy3WE0LRbg2KewdQheX+Sb/pBilUSrpvoLLGmD8UPFij0oWeGsAclXGM2rR6AxGWcun4q9vC+A1om/rJBfxM7NjD9ZAfaa9Y7767z2UI83Q7wmX57anZD/xDb0Pf9Q8dW8LxoqO1i6rIyjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsAZIMeS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70AC4CEDD;
	Thu, 13 Mar 2025 23:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907208;
	bh=0UAgLw6E5fMxghBPUcUr1YC5wDKAXkzRKCvdfBrEOek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsAZIMeSVGH0xxnfm6a7NU3amHURgBKewUUqNu1qMyXa446UZnn/Vzg7IZdXEX76u
	 b/pDggX2dzAk3Gzr7actRGVnbUC/eqpy9M6toa1fA2nSiODlwxVxB+Mvv1sP8UZ//X
	 +5QIIiMJ/8kVL4cZBqXdPobuafnVQoQlY4cQrpiYcy4H9eJJups5TzGPhoxvMuaNnm
	 kl5O1TKLdmkY3SqHergV/5svibmF1fcVKjGKM4xoOpfy6bQAWczQotzzRoN2blbwjH
	 gIqRDj1shL8Tjc/NUbENFCdrp3bJKf9pap2y9YHLvMNTcrDj7SgAgJPEM9dUGYpzfo
	 Xd1hAyU5HFXjg==
Date: Thu, 13 Mar 2025 18:06:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: x1e78100-t14s: Rework
 devicetree for LCD and OLED SKUs
Message-ID: <t7jqjgkvnu2lynwchyermonuhcrh7ixgw6g65o6ag2lkgi6dwi@rd3vv3j5paws>
References: <20250310141504.3008517-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310141504.3008517-1-abel.vesa@linaro.org>

On Mon, Mar 10, 2025 at 04:15:01PM +0200, Abel Vesa wrote:
> The Lenovo Thinkpad T14s Gen6 comes in different SKUs when it comes to
> panels. The only difference that is important is whether it is an OLED
> or an LCD. The way that backlight is handled in devicetree between OLED
> and LCD forces the need of two separate DTBs.
> 
> So create a common T14s dtsi that describes everything except the
> backlight handling, by renaming the existent dts to dtsi. Then make the
> legacy dts the LCD version, while adding a prepended oled dts. Both
> include the generic T14s dtsi.
> 
> For the OLED version, I do not have HW to test it on, so OLED specific
> bits will come at a later stage. Still, add the OLED dts in order to set
> the stage for it.
> 
> Had to format it using "git format-patch" since b4 doesn't currently
> support -B when formatting the patch, and the renaming of the dts into
> dtsi (plus the panel properties being dropped) would've not been visible
> enough for reviewers.
> 
> Changes in v2:
>  - rebased on next-20250307

Sorry, but as requested I seem to have picked the DP enablement (at
least) since then. Can you please have another rebase?

Regards,
Bjorn

>  - Dropped the RFC, as it seems to be agreed upon already
>  - Added dt-bindings patch to document the new oled and lcd compatibles
>  - Added panel variant compatible strings to each dts and included the
>    the panel type into model string as well
>  - Changed backlight PWM period to 4266537 to match exact period the
>    PMIC can do.
>  - Link to v1 (RFC):
>    https://lore.kernel.org/r/20250306090503.724390-1-abel.vesa@linaro.org/
> 
> Abel Vesa (3):
>   dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and
>     OLED
>   arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight
>     support
>   arm64: dts: qcom: x1e78100-t14s: Add OLED variant
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    4 +-
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../x1e78100-lenovo-thinkpad-t14s-oled.dts    |   12 +
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dts    | 1194 +----------------
>  ...dts => x1e78100-lenovo-thinkpad-t14s.dtsi} |    6 +-
>  5 files changed, 77 insertions(+), 1140 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
>  rewrite arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts (98%)
>  copy arch/arm64/boot/dts/qcom/{x1e78100-lenovo-thinkpad-t14s.dts => x1e78100-lenovo-thinkpad-t14s.dtsi} (99%)
> 
> -- 
> 2.34.1
> 

