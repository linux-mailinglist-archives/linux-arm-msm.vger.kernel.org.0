Return-Path: <linux-arm-msm+bounces-35571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27F9AC1A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44E41C234DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6AC155A4E;
	Wed, 23 Oct 2024 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THOYipYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA8561FF2;
	Wed, 23 Oct 2024 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729672276; cv=none; b=Jj5Icuf+y4Jd9O/WNp4hC5jueJYv6pY4oBIBZM8BhzLxxZJs5PH7CZKM4BbFQ7EfEunD4RcTNMn8r3HgNeYtlYJoeR3IGdOLFXqaHujdtel3UqqioZ8gjtdLeZUyJgkIycJ7qX5j9LCOtFkiZD+2K5AqPW7sBTtEjlNErnYim2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729672276; c=relaxed/simple;
	bh=kR3bWf4Z2Vz3d9n0rFtndHo2V/O3bz7NHTRRCDQ3cGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/QlK2JFb60idu8sG4acuNMfVzF/3LFHC442GFp6K/31d/hMIMCEY0LBlXbz4Fygqm8TipfmDkRhCGQ69m0+Ueler4lo9kFH7VUwqkq5uiBhyAS+la57dm90CvuUeCwSk8HqFZPgXIQKJPbV1ye3RfmAZH0oYVMj5/sRk++Pjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THOYipYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44041C4CEC6;
	Wed, 23 Oct 2024 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672275;
	bh=kR3bWf4Z2Vz3d9n0rFtndHo2V/O3bz7NHTRRCDQ3cGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THOYipYqdos5j/KiJyBtT91zwu7o6vBpkad2ZBVKCDIMwUK7tZWNl8G/C+SaC/FD5
	 NbHO1BhMlu2kYcwQ7EBecEIVgd8RiMVvAMvnYU3V8hMUBssAe5AFJy9r5zEpvHmlRJ
	 OUtmd0dQW41+utx2W1o9Vc3/VMh7ZRHcTyp5cb+UCaiJFsklv1DIww2qRb0GQcImvI
	 lzR2el6Q7IzzwgpMYmkhs2l/92+PNZ3mQifzMVu5oOaKQDZxUvwMZ3oJWAFq4MrE/p
	 STY1GeRhL1aJ6o3dLcuWszRWu8/zGinlJwE1Y/tU2VUpvibun89xaTDT82aElr2B2r
	 /MA1HTSBZSX9g==
Date: Wed, 23 Oct 2024 10:31:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable SM8750 SoC base configs
Message-ID: <wr37evy46vcwm5c5ab6bxppuwzk7dqp5gh447dzsuzvq4s3oju@igltn7wkhjxl>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-6-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-6-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:21:14PM -0700, Melody Olvera wrote:
> Enable GCC, TCSRCC, Pinctrl and Interconnect configs for Qualcomm's
> SM8750 SoC which is required to boot SM8750 MTP/QRD boards to a
> console shell. The configs are required to be marked as builtin
> and not modules due to the console driver dependencies.
> 
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


