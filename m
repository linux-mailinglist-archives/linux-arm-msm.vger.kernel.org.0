Return-Path: <linux-arm-msm+bounces-60903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A64AD4987
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A0CA166D34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 03:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BFB188587;
	Wed, 11 Jun 2025 03:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzbMPoAQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFC279C4;
	Wed, 11 Jun 2025 03:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749613338; cv=none; b=OVqrccPDvUdeauwIpXGexFRWTteQTM7Um8wYTEvljX7UVOjcWkyBjPd8oAlaUlJ3GcYCx2WlqqM6VbRs3bhJo8r0vZABaKCm0gUefm2ucYQnXYaHN8H2ZssMAs3roA46SaA91SeqfVnmjjp1xt+Q6IsZ5jldEQz0alcOP8poQgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749613338; c=relaxed/simple;
	bh=uNoQLdguzPNx+xLQFyBZOY/z6kGjEQrY8f9jh6trlsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzBHfwMNxzyCLnXL6ZOsH274sphvRFd2YXofvxJsUwT6X85QsD9oAyaBuIpaX+NXfGFgYTkoIi8aQ4n9/byx0ZIvSucdLXkKhssz9Is9/LCCcomNwtle4c2IAWmnWymETiClzV1QTorgH8OHWyXtd5ageOWgkQZ5kF0Et0B3DtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzbMPoAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDE5C4CEEE;
	Wed, 11 Jun 2025 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749613335;
	bh=uNoQLdguzPNx+xLQFyBZOY/z6kGjEQrY8f9jh6trlsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzbMPoAQI5Pazfb2ExYS5UAVhxDsOTISrRMmKA54smKbPcxvRFG60j++h74hkS41e
	 Z/0n6ZbM/4KUHT3TMWIlDZiyxuDtoFs9DObElrOEGffA8ywT8tZREA8ombfozJshfz
	 zhuz2ewqrjSzpE7iAAd0h0TgkIYatGWCTNX/zIyT7BhZz2ClTU5EiTKCGf6/6IAavk
	 uI5r6YgnoLhKsanZCmScAkxTxMwgH0g2lCadk0k+fixyaCRUIxd0DPA+BHhaRfjWP5
	 r9f2wjS+0eHLNbCuuh3coU0fbm25LUa6u0YchtK/HwVy6BsrO1C4gdwi7pmRpON5b8
	 y11Edk/BQclRw==
Date: Tue, 10 Jun 2025 22:42:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
Message-ID: <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>

On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
> When USB controller enters runtime suspend while operating in host
> mode, then wakeup because of cable disconnect or a button press of
> a headset causes the following kind of errors:
> 
> Error after button press on a connected headset :
> 
> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [  355.725844] usb 1-1: device not accepting address 2, error -108
> 
> Error on removal of headset device from usb port:
> 
> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
> SID=0x0
> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
> PLVL=1]
> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> 
> Enabling retention on usb controller GDSC fixes the above issues.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> 
> Note:
> The above mentioned issues pop up after I enabled runtime suspend after
> applying [1].
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 

It makes sense that the BCR issue appears after the flattening of dwc3,
but why would the suspend issue pop up?

The change matches what we do on many other platforms, but I've been
hoping we either could drop the retention or clearly document why it's
needed - so that we know if this should be on all or none of the SoCs.

Regards,
Bjorn

>  drivers/clk/qcom/gcc-sm8450.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 65d7d52bce03..f94da4a1c921 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>  	.pd = {
>  		.name = "usb30_prim_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  };
>  
>  static struct clk_regmap *gcc_sm8450_clocks[] = {
> -- 
> 2.34.1
> 

