Return-Path: <linux-arm-msm+bounces-50104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A57B6A4D292
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9C11188C76E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0D21C84A8;
	Tue,  4 Mar 2025 04:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzlus/h1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2B8837;
	Tue,  4 Mar 2025 04:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741062443; cv=none; b=UzP6BR1T4GGoNvNFK8iJulssSuoelIIglPy2Mg036m9k9rxS0qGyDpYco0Qsrh0KZ59HzxufEibRCOkHHJ4qPQX8mYfj7YMk7CKUXNQnPAi1dm2iF/XGSqOHl381CMYfQcsGovcRz/xeaSUI/xRiVtN7ZZofXXX4PJcesU/f4jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741062443; c=relaxed/simple;
	bh=ef9piGlVWSgedrJTK7QTHFpE+6R0pEHHvIfsFteKGzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6IRfNkQm2z+QHzlXzNwEqX/Rs3Pb971YFX5xjM+QqRpz1OT1HNwKKspqMr4UNv4ZUhsHGPkCqK0vEA1q2dxAyNultY+E3z59S/R9T4moId2fxcCj7rMs+245XCl2J4/gofhEXn8AbyXUUlRDlqMwxmvyHwS3AD0wfUxQo4EhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzlus/h1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3DDC4CEE5;
	Tue,  4 Mar 2025 04:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741062442;
	bh=ef9piGlVWSgedrJTK7QTHFpE+6R0pEHHvIfsFteKGzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tzlus/h1sMGtNxYIk0RGC695nZdLLeTlEiftCfTle4f3jFd01foosIw1SNlhGqRjs
	 FfEbS3lB8AqsxDEAzIBgP0zYh+S9SRFMKRGUU62jOPMKailINl1AnUzxPR1BYGuziK
	 /6FGbRpSPay5S6oE6kf/AcBZuWX9tx+TwPhVY5Ze0DETYdxT4VHpkUV3dq+ChiU01m
	 qK2Yh93ub8WwxoWVKVTGkAWfdJXQkzu+F8kGTgTSsd5JX0jsRhaKWu6ckzhcGzDfwU
	 ZLLm6xp5WJf+FI292FzHsOkwzxRHJxSIySwx6i8MqLzrBoTXTprHRFg3/i5+4bp8hV
	 aKhSAiyo3W30A==
Date: Mon, 3 Mar 2025 22:27:19 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v5 0/4] arm64: dts: qcom: x1e80100: crd/t14s:
 Enable Parade Type-C retimers
Message-ID: <w2pl3edo5o33huv64ohtk52kumbiykpbdgdzqycc3vh2fyzzqc@avppwwsw575i>
References: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-v5-0-380a3e0e7edc@linaro.org>

On Thu, Feb 20, 2025 at 07:42:29PM +0200, Abel Vesa wrote:
> Since the driver and dt-bindings have been alread merged, it has been
> agreed offline that there is no point of holding on to these DT patches
> even though there are some issues with plug/unplug during suspend in
> both pmic-glink-altmode and ucsi-glink. These issues are being worked on
> meanwhile. Merging these means that even though this will provide external DP
> and USB orientation, plug/unplug during suspend will give some splats
> and render both the USB orientation and DP broken. But then, other
> X Elite boards already have these nodes described, so lets bring the crd
> and t14s to the same level.
> 
> These patches are just a resend of the ones found in v5 and dropped in the v6
> patchset of the driver and dt-bindings.
> 

Thank you, Abel. Unfortunately I merged a X1P series from Konrad, so
this no longer applies. Can you please help me rebase it onto
linux-next?

Regards,
Bjorn

> Link to v5: https://lore.kernel.org/all/20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org/
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (4):
>       arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
>       arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
>       arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
>       arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
> 
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 321 +++++++++++++-
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 474 ++++++++++++++++++++-
>  2 files changed, 785 insertions(+), 10 deletions(-)
> ---
> base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> change-id: 20250220-x1e80100-dts-crd-t14s-enable-typec-retimers-325cdb7b097d
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

